/*
 * Patch TrackPad to work in GPIO interrupt mode instead of polling mode.
 * 
 * Credit: lshbluesky(shl628) for making the patch.
 */
DefinitionBlock ("", "SSDT", 2, "hack", "SPTP", 0x00000000)
{
    External (_SB_.PCI0.I2C0.SPTP.MINT, IntObj)
    External (GPHD, FieldUnitObj)

    Scope (\)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin"))
            {
                GPHD = Zero
                \_SB.PCI0.I2C0.SPTP.MINT = Zero
            }
        }
    }
}

