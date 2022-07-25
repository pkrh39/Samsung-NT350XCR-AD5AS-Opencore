/*
 * In config.plist->ACPI->Patch
 * 
 * Rename GOST,0,N to XOST,0,N
 * Find: 474F535400
 * Replace: 584F535400
 * 
 * Spoof OS as Windows 10.
 * Should be paired with SSDT-OSYS, SSDT-H_EC.
 * This enables waking with lid or power button without SSDT-XOSI, 
 * which causes BSOD on Windows.
 */

DefinitionBlock ("", "SSDT", 2, "PKRN", "GOST", 0x00000000)
{
    External (GSSM, MethodObj)    // 2 Arguments
    External (OSTP, FieldUnitObj)
    External (XOST, MethodObj)    // 0 Arguments

    Method (GOST, 0, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            Local0 = 0x07E1
            OSTP = Local0
            GSSM (One, Local0)
        }
        Else
        {
            XOST ()
        }
    }
}

