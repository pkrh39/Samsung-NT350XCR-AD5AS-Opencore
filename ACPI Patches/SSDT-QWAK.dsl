/*
 * In config.plist->ACPI->Patch
 * 
 * Rename QWAK,1,N to ZWAK,1,N
 * Find: 5157414B01
 * Replace: 5A57414B01
 * 
 * 
 * This fixes device fully waking up after standbydelay time instead of hibernating.
 * It is caused by method QWAK in DSDT, which sets LIDS to 1 on wakeup.
 * LIDS is returned when _LID method is called.
 * 
 * After debugging it for few days, I found that LIDS is the last status of lid that reported to OS.
 * Opening/closing lid are registered via H_EC device _Q5E and _Q5F method on S0 state.
 * However, lid status change does not get registered on S3 or S4 state.
 * Lifting the lid while the machine is asleep only wakes it up without changing the LIDS value.
 * So method QWAK sets LIDS value to 1 on wakeup, makes screen turn on when wakeup.
 * 
 * The actual current status of lid is stored in LSTE.
 * So, I patched QWAK method to change LIDS value to LSTE on wakeup to correct lid status on wakeup.
 */

DefinitionBlock ("", "SSDT", 2, "PKRN", "QWAK", 0x00000000)
{
    External (_SB_.GPC0, MethodObj)    // 1 Arguments
    External (_SB_.LID0, DeviceObj)
    External (_SB_.PCI0.GFX0.CLID, UnknownObj)
    External (_SB_.PCI0.LPCB.H_EC.ACEX, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.B1AF, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BAT1, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.DCBE, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.LSTE, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TIST, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TUBI, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.TZCH, MethodObj)    // 1 Arguments
    External (_SB_.PWRB, DeviceObj)
    External (_SB_.RELT, FieldUnitObj)
    External (_SB_.SPC0, MethodObj)    // 2 Arguments
    External (BFCC, FieldUnitObj)
    External (CCRN, MethodObj)    // 0 Arguments
    External (D8XH, MethodObj)    // 2 Arguments
    External (IGDS, UnknownObj)
    External (LIDS, UnknownObj)
    External (PWRS, FieldUnitObj)
    External (SDCK, FieldUnitObj)
    External (ZWAK, MethodObj)    // 1 Arguments

    Scope (_SB)
    {
        Method (QWAK, 1, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If ((Arg0 == 0x03))
                {
                    If ((RELT == 0xBA))
                    {
                        Notify (PWRB, 0x02) // Device Wake
                    }
                }

                If ((Arg0 == 0x04))
                {
                    Notify (PWRB, 0x02) // Device Wake
                }

                If ((^PCI0.LPCB.H_EC.ACEX != PWRS))
                {
                    PWRS = ^PCI0.LPCB.H_EC.ACEX /* External reference */
                    CCRN ()
                }

                If (((Arg0 == 0x03) || (Arg0 == 0x04)))
                {
                    Local0 = ^PCI0.LPCB.H_EC.LSTE /* External reference */
                }

                If ((Local0 != LIDS))
                {
                    LIDS = Local0
                    If (IGDS)
                    {
                        If ((LIDS == Zero))
                        {
                            ^PCI0.GFX0.CLID = 0x80000000
                        }

                        If ((LIDS == One))
                        {
                            ^PCI0.GFX0.CLID = 0x80000003
                        }
                    }

                    Notify (LID0, 0x80) // Status Change
                }

                Local0 = ^PCI0.LPCB.H_EC.B1AF /* External reference */
                Local0 >>= 0x10
                Local0 &= 0xFFFF
                If ((Local0 != BFCC))
                {
                    Notify (^PCI0.LPCB.H_EC.BAT1, One) // Device Check
                    Notify (^PCI0.LPCB.H_EC.BAT1, 0x81) // Information Change
                }

                If ((SDCK != ^PCI0.LPCB.H_EC.DCBE))
                {
                    SDCK = ^PCI0.LPCB.H_EC.DCBE /* External reference */
                }

                ^PCI0.LPCB.H_EC.TUBI = Zero
                ^PCI0.LPCB.H_EC.TZCH (^PCI0.LPCB.H_EC.TIST)
                Local0 = GPC0 (0x04010004)
                Local1 = (Local0 & 0xFFFFFEFE)
                SPC0 (0x04010004, Local1)
                Sleep (0x32)
                SPC0 (0x04010004, Local0)
                D8XH (Zero, 0xAC)
            }
            Else
            {
                ZWAK (Arg0)
            }
        }
    }
}

