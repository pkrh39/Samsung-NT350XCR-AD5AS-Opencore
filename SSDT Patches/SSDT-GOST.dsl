/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLiZWXkL.aml, Tue Dec  7 19:45:17 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000006B (107)
 *     Revision         0x02
 *     Checksum         0x8C
 *     OEM ID           "hack"
 *     OEM Table ID     "GOST"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "GOST", 0x00000000)
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

