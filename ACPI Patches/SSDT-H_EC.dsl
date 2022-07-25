/*
 * Should be paired with SSDT-OSYS, SSDT-GOST to work.
 * 
 * Enables waking from S3 with lid and power button.
 */

DefinitionBlock ("", "SSDT", 2, "PKRN", "H_EC", 0x00000000)
{
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (GPRW, MethodObj)    // 2 Arguments

    Scope (\_SB.PCI0.LPCB.H_EC)
    {
        If (_OSI ("Darwin"))
        {
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (GPRW (0x10, 0x04))
            }
        }
    }
}

