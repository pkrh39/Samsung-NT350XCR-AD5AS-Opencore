/*
 * Spoof OS as Windows 10. Pair with SSDT-GOST and remove SSDT-XOSI.
 * This is needed for enabling lidwake.
 */

DefinitionBlock ("", "SSDT", 2, "ACDT", "OSYS", 0x00000000)
{
    External (OSYS, FieldUnitObj)

    Scope (_SB)
    {
        Device (PCI1)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If (CondRefOf (\OSYS))
                {
                    OSYS = 0x07E1
                }
            }
        }
    }
}

