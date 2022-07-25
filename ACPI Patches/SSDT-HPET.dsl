/* 
 * In config.plist->ACPI-Patch
 * 
 * Rename _CRS to XCRS
 * Find: 255F435253
 * Replace: 2558435253
 * 
 * RTC IRQ 8 Patch
 * Find: 2200017900
 * Replace: 2200007900
 * 
 * TIMR IRQ 0 Patch
 * Find: 2201007900
 * Replace: 2200007900
 * 
 * 
 * Fix IRQ conflicts
 * Created with SSDTTime
 */

DefinitionBlock ("", "SSDT", 2, "CORP", "HPET", 0x00000000)
{
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.HPET, DeviceObj)

    Name (\_SB.PCI0.LPCB.HPET._CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
    {
        IRQNoFlags ()
            {0,8,11}
        Memory32Fixed (ReadWrite,
            0xFED00000,         // Address Base
            0x00000400,         // Address Length
            )
    })
}

