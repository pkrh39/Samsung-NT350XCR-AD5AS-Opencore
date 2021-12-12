/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLpyLsta.aml, Tue Dec  7 19:45:40 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000087 (135)
 *     Revision         0x02
 *     Checksum         0xD9
 *     OEM ID           "hack"
 *     OEM Table ID     "H_EC"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "H_EC", 0x00000000)
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

