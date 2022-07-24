# Samsung NT350XCR-AD5AS Opencore
English | [Korean at x86.co.kr](https://x86.co.kr/mymac/6519428)
### OC Version
0.8.1
## Before You Download..
This EFI does not include SMBIOS values and ROM. Please fill it up before using.
## System Specification
|Specifications|Details|
|------|---|
|CPU|Intel Core i5-10210U (Comet Lake U62) |
|Graphics|Intel UHD Graphics 620|
|Memory|DDR4 2666Mhz 8GBx1|
|NVMe SSD|Samsung PM991 OEM NVMe 256GB(MZVLQ256HAJD-000)|
|SATA SSD|Micron Crucial MX500 500GB **(Does not come with laptop)**|
|Wireless|Intel® Wireless-AC 9462|
|Ethernet|Realtek RTL8111/8268|
|Audio|Realtek ALC256|
|BIOS|P00RFS|
## Supported macOS Versions
* macOS Catalina 10.15.7
* macOS Big Sur 11.6.8
* macOS Monterey 12.5
## Status
### Working
* Intel UHD 620 QE/CI Graphics Acceleration
* CPU Power Management
* ALC256 Audio (Internal Speaker, Audio Combo, Mic)
* Camera
* AC9462 Wifi / Bluetooth
* Battery Status Readout
* Intergrated Keyboard
* TrackPad
* All USBs
* HDMI Display Output
* USB Type-C DP Alt mode Display Output
* Sleep / Wake (Lid Sleep / Wake)
* Hibernation
* Brightness Adjustment (With Fn+F2,F3)
* RTL8111/8168 PCIE Ethernet
* iServices (iMessage, Facetime)
* Booting Windows
* Booting Linux
### Not Working
* DRM
### Not Tested
* Realtek Card Reader
* Continuity Features (AirDrop, SideCar, HandOff.. etc)
## Known Issues
See [issues](https://github.com/PKRN0/Samsung-NT350XCR-AD5AS-Opencore/issues).
## Used ACPI SSDT Hot Patches
|SSDT Name|ACPI Rename Needed|Comment|
|----------|:------------------:|------|
|SSDT-ADP1.aml| X | Add AC device to IORegistry |
|SSDT-ALS0.aml|	X	|Dummy Ambient Light Sensor Injection for Brightness Control|
|SSDT-AWAC.aml|	X	|RTC Fix|
|SSDT-EC-USBX.aml| X |Fake EC Injection, USB Power Management|
|SSDT-FNBL.aml|	O	|Fn Brightness Key Remapping|
|SSDT-GOST.aml|	O |Darwin OS Check Fix - Enable Lidwake|
|SSDT-GPRW.aml|	O	|GPRW Instant Wake Fix|
|SSDT-H_EC.aml|	X	|Add _PRW method to H_EC device - Enable Waking by Lid and PWRB|
|SSDT-HPET.aml|	O |IRQ Conflict Fix|
|SSDT-NVME-DISABLE.aml| X |Disable PM991 SSD|
|SSDT-OSYS.aml|	X	|Darwin OS Check Fix - Enable Lidwake and Trackpad|
|SSDT-PLUG.aml|	X	|CPU Power Management|
|SSDT-PNLF.aml|	X	|Backlight Fix|
|SSDT-SBUS-MCHC.aml|	X	|SMBUS Fix|
|SSDT-SPTP.aml|	X	|Fix Trackpad to work in GPIO Interrupt mode|
|SSDT-XSPI.aml| X | Add XSPI device to IORegistry|

## BIOS Settings
* Secure Boot Control: Off
* LAN PXE OPROM: Off

## Replacing NVMe SSD
~~Due to PM991(which comes with the device) causing kernel panic on macOS,
I disabled it with SSDT-NVME-DISABLE.aml.~~
This method is broken. NVMe does not turn off, resulting in heavy battery drain.
To use macOS with pm991 installed, follow this [link](https://github.com/tylernguyen/x1c6-hackintosh/issues/43) to add `HackrNVMeFamily.kext` and `SSDT-NVME.aml` to your EFI.

If you want to replace the NVMe drive, avoid PM981,PM991,Micron 2200S, and SK Hynix PC711.

After replacing the NVMe drive, **you should disable SSDT-NVME-DISABLE.aml in `ACPI->Add`.**

## Sleep Settings

### Necessary Config
This is required for proper sleep on macOS. Otherwise the machine will wake up automatically during sleep.

Open Terminal.app and type these in:
```
sudo pmset -a powernap 0
sudo pmset -a proximitywake 0
sudo pmset -a tcpkeepalive 0
```
### Recommended Power Config
This is the power config I use. Device will go into hibernation after 2 hours of sleep.
```
sudo pmset -a powernap 0
sudo pmset -a proximitywake 0
sudo pmset -a tcpkeepalive 0
sudo pmset -a standby 1
sudo pmset -a standbydelayhigh 7200
sudo pmset -a standbydelaylow 7200
sudo pmset -a hibernatemode 3
sudo pmset -c womp 0
```

## Set DVMT pre-allocated to 64M
This is needed to enable 4K display output.
Values below are only applicable for NT350XCR/350XCJ with BIOS version P00RFS.
**Double check your BIOS version!! Wrong offset might brick your machine!!**

|Item|Address|Configuration|Options|Default|Recommended|
|:---:|:---:|:---:|:---:|:---:|:---:|
|DVMT Pre-Allocated Video Memory|0xF5|SaSetup|0x0:0M, 0x1:32M, 0x2:64M|0x1|0x2|
|DVMT Total GFX Memory|0xF6|SaSetup|0x1:128M, 0x2:256M, 0x3:MAX|0x2|0x3|

Boot [modified GRUB](https://github.com/datasone/grub-mod-setup_var) and type following commands:
```
setup_var_cv SaSetup 0xf5 0x1 0x2
setup_var_cv SaSetup 0xf6 0x1 0x3
```

After setting DVMT to 64M, you can remove `framebuffer-unifiedmem` property from `DeviceProperties`.
