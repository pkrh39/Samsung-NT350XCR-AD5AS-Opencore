/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLNxc9PC.aml, Tue Dec  7 19:46:36 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000081 (129)
 *     Revision         0x02
 *     Checksum         0xE8
 *     OEM ID           "hack"
 *     OEM Table ID     "SPTP"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
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

