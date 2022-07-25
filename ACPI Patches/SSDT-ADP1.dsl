// Fix AC Adapter SB.PCI0.LPCB.H_EC

DefinitionBlock ("", "SSDT", 2, "OCLT", "ADP1", 0x00000000)
{
    External (_SB_.ADP1, DeviceObj)

    Scope (\_SB.ADP1)
    {
        If (_OSI ("Darwin"))
        {
            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x18, 
                0x03
            })
        }
    }
}

