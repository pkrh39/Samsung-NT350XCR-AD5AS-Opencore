# ACPI SSDT Hot Patches
|SSDT Name|ACPI Rename Needed|Comment|
|----------|:------------------:|------|
|[SSDT-ADP1](/ACPI%20Patches/SSDT-ADP1.dsl)| X | Add AC device to IORegistry |
|[SSDT-ALS0](/ACPI%20Patches/SSDT-ALS0.dsl)| X |Dummy Ambient Light Sensor Injection for Brightness Control|
|[SSDT-AWAC](/ACPI%20Patches/SSDT-AWAC.dsl)| X |RTC Fix|
|[SSDT-EC-USBX](/ACPI%20Patches/SSDT-EC-USBX.dsl)| X |Fake EC Injection, USB Power Management|
|[SSDT-FNBL](/ACPI%20Patches/SSDT-FNBL.dsl)| O |Fn Brightness Key Remapping|
|[SSDT-GOST](/ACPI%20Patches/SSDT-GOST.dsl)| O |Darwin OS Check Fix - Enable Lidwake|
|[SSDT-H_EC](/ACPI%20Patches/SSDT-H_EC.dsl)| X |Add _PRW method to H_EC device - Enable Waking by Lid and PWRB|
|[SSDT-HPET](/ACPI%20Patches/SSDT-HPET.dsl)| O |IRQ Conflict Fix|
|[SSDT-NVME](/ACPI%20Patches/SSDT-NVME.dsl)| X |Spoof class code of NVMe to prevent IONVMEFamily from loading - should be paried with HackrNVMEFamily.kext|
|[SSDT-OEMA](/ACPI%20Patches/SSDT-OEMA.dsl)| X | Fix loading OEM SSDT CmlU_Rvp table|
|[SSDT-OEMD](/ACPI%20Patches/SSDT-OEMD.dsl)| X | Fix loading OEM SSDT CmlU_Rvp table|
|[SSDT-OSYS](/ACPI%20Patches/SSDT-OSYS.dsl)| X |Darwin OS Check Fix - Enable Lidwake and Trackpad|
|[SSDT-PEGP](/ACPI%20Patches/SSDT-PEGP.dsl)| X | Add missing PEGP device to solve ACPI errors|
|[SSDT-PLUG](/ACPI%20Patches/SSDT-PLUG.dsl)| X |CPU Power Management|
|[SSDT-PNLF](/ACPI%20Patches/SSDT-PNLF.dsl)| X |Backlight Fix|
|[SSDT-QWAK](/ACPI%20Patches/SSDT-QWAK.dsl)| O | Patch method QWAK to fix hibernation|
|[SSDT-SBUS-MCHC](/ACPI%20Patches/SSDT-SBUS-MCHC.dsl)| X |SMBUS Fix|
|[SSDT-SPTP](/ACPI%20Patches/SSDT-SPTP.dsl)| X |Fix Trackpad to work in GPIO Interrupt mode|
|[SSDT-TPL1](/ACPI%20Patches/SSDT-TPL1.dsl)| X | Add missing TPL1 device to solve ACPI errors|
|[SSDT-XSPI](/ACPI%20Patches/SSDT-XSPI.dsl)| X | Add XSPI device to IORegistry|
