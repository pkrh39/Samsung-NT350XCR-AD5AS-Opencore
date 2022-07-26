/*
 * Spoof class code of NVMe drive to prevent IONVMeFamily.kext from loading.
 * Should be paired with HackrNVMeFamily.kext.
 * This fixes pm991 kernel panic.
 */

DefinitionBlock ("", "SSDT", 2, "hack", "NVMe-Pcc", 0x00000000)
{
    External (_SB_.PCI0.RP13.PXSX, DeviceObj)

    If (_OSI ("Darwin"))
    {
        Method (_SB.PCI0.RP13.PXSX._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (!Arg2)
            {
                Return (Buffer (One)
                {
                     0x03                                             // .
                })
            }

            Return (Package (0x02)
            {
                "class-code", 
                Buffer (0x04)
                {
                     0xFF, 0x08, 0x01, 0x00                           // ....
                }
            })
        }
    }
}

