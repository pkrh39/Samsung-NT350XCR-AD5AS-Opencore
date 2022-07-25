/*
 * Solve namespace lookup failure ACPI error.
 * This SSDT adds missing Device _SB.PCI0.RP05.PEGP.
 */
DefinitionBlock ("", "SSDT", 2, "PKRN", "PEGP", 0x00000000)
{
    External (_SB_.PCI0.RP05, DeviceObj)

    Scope (\_SB.PCI0.RP05)
    {
        If (_OSI ("Darwin"))
        {
            Device (PEGP)
            {
            }
        }
    }
}

