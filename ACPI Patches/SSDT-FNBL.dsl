/*
 * In config.plist->ACPI->Patch
 * 
 * Rename _Q63 to _X63
 * Find: 5F513633
 * Replace: 5F583633
 *
 * Rename _Q64 to _X64
 * Find: 5F513634
 * Replace: 5F583634
 * 
 * 
 * Patch EC Query _Q63, _Q64 
 * which is called when brightness keys (Fn+F2, F3) are pressed
 * to enable backlight control.
 * 
 * From https://github.com/wei756/NT950XCR-G58A-Hackintosh/blob/master/DSDT%26SSDT/SSDT-FNBL.dsl
 */
DefinitionBlock ("", "SSDT", 2, "WEI756", "FNKEYFIX", 0x00001000)
{
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC._X63, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC._X64, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)

    Scope (\_SB.PCI0.LPCB.H_EC)
    {
        Method (_Q63, 0, Serialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.PS2K, 0x0205)
                Notify (\_SB.PCI0.LPCB.PS2K, 0x0285)
            }
            Else
            {
                _X63 ()
            }
        }

        Method (_Q64, 0, Serialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.PS2K, 0x0206)
                Notify (\_SB.PCI0.LPCB.PS2K, 0x0286)
            }
            Else
            {
                _X64 ()
            }
        }
    }
}

