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
|NVMe SSD|Samsung PM991 OEM NVMe 256GB(MZVLQ256HAJD-000) - **(Cause kernel panic on macOS)**|
|SATA SSD|Micron Crucial MX500 500GB **(Does not come with laptop)**|
|Wireless|Intel® Wireless-AC 9462|
|Ethernet|Realtek RTL8111/8268|
|Audio|Realtek ALC256|
|BIOS|P00RFS|
## Supported macOS Versions
* macOS Catalina 10.15.4+
* macOS Big Sur 
* macOS Monterey
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

## BIOS Settings
* Secure Boot Control: Off
* Fast BIOS Mode: Off
* LAN PXE OPROM: Off

## Replacing NVMe SSD
Due to PM991(which comes with the device) causing kernel panic on macOS,
I disabled it with SSDT-NVME-DISABLE.aml.

If you want to replace the NVMe drive, avoid PM981,PM991,Micron 2200S, and SK Hynix PC711.

After replacing the NVMe drive, **you should disable SSDT-NVME-DISABLE.aml in `ACPI->Add`.**

## Sleep Settings
By default, device will go into hibernation when it reaches critical battery level or lower than 10%.
You can change this by adjusting `hbfx-ahbm` value in `NVRAM->Add->E09B9297-7928-4440-9AAB-D1F8536FBF0A`.
Check [HibernationFIxup Readme](https://github.com/acidanthera/HibernationFixup#boot-args) for more info.

### Necessary Config
This is required for proper sleep on macOS. Otherwise the machine will wake up automatically during sleep.

Open Terminal.app and type these in:
```
sudo pmset -a powernap 0
sudo pmset -a proximitywake 0
sudo pmset -a tcpkeepalive 0
```
### Recommended Power Config
This is the power config I use.

#### Settings for All
```
sudo pmset -a powernap 0
sudo pmset -a proximitywake 0
sudo pmset -a tcpkeepalive 0
```
#### Settings for Battery
```
sudo pmset -b standby 1
sudo pmset -b standbydelayhigh 7200
sudo pmset -b standbydelaylow 3600
sudo pmset -b hibernatemode 25
sudo pmset -b highstandbythreshold 50
```
#### Settings for AC
```
sudo pmset -c hibernatemode 0
sudo pmset -c womp 0
```
