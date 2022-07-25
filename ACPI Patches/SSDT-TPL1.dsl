/*
 * Fix ACPI error caused by missing TPL1 device.
 */
DefinitionBlock ("", "SSDT", 2, "PKRN", "TPL1", 0x00000000)
{
    External (_SB_.PCI0.I2C1, DeviceObj)

    Scope (\_SB.PCI0.I2C1)
    {
        If (_OSI ("Darwin"))
        {
            Device (TPL1)
            {
            }
        }
    }
}

