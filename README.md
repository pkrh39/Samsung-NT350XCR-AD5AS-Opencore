# Samsung NT350XCR-AD5AS Opencore
English | [Korean at x86.co.kr](https://x86.co.kr/mymac/6519428)
### OC Version
0.7.6
## Disclaimer 
Use it as personal / non-profit use. 
If you want to download macOS, download directly from Apple using a mac.
## System Specification
|Specifications|Details|
|------|---|
|CPU|Intel Core i5-10210U (Comet Lake U62) |
|Graphics|Intel UHD Graphics 620|
|Memory|DDR4 2666Mhz 8GBx1|
|SSD1|Samsung PM991 OEM NVMe 256GB(MZVLQ256HAJD-000) - **Does Not Work Correctly with macOS**|
|SSD2|Micron Crucial MX500 500GB|
|Wireless|Intel® Wireless-AC 9462|
|Ethernet|Realtek RTL8168H|
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
* USB 3.0
* HDMI Display Output
* USB Type-C DP Alt mode Display Output
* Sleep / Wake (Lid Sleep / Wake)
* Brightness Adjutment (With Fn+F2,F3)
* RTL8168H Wired Lan
* iServices (iMessage, Facetime)
* Booting Windows
### Not Working
* DRM
### Not Tested
* Realtek Card Reader
* Continuity Features (AirDrop, SideCar, HandOff.. etc)
* USB Type-C
## Known Issues
See [issues](https://github.com/PKRN0/Samsung-NT350XCR-AD5AS-Opencore/issues).
## Used ACPI SSDT Hot Patches
|SSDT Name|ACPI Rename Needed|Comment|
|----------|:------------------:|------|
|SSDT-ALS0.aml|	X	|Dummy Ambienet Light Sensor Injection for Brightness Control|
|SSDT-AWAC.aml|	X	|RTC Fix|
|SSDT-EC-USBX.aml| X |Fake EC Injection, USB Power Management|
|SSDT-FNBL.aml|	O	|Fn Brightness Key Remapping|
|SSDT-GOST.aml|	O |Darwin OS Check Fix - Enable Lidwake|
|SSDT-GPRW.aml|	O	|GPRW Instant Wake Fix|
|SSDT-H_EC.aml|	X	|Add _PRW method to H_EC device - Enable Waking by Lid and PWRB|
|SSDT-HPET.aml|	O |IRQ Conflict Fix|
|SSDT-OSYS.aml|	X	|Darwin OS Check Fix - Enable Lidwake and Trackpad|
|SSDT-PLUG.aml|	X	|CPU Power Management|
|SSDT-PNLF.aml|	X	|Backlight Fix|
|SSDT-SBUS-MCHC.aml|	X	|SMBUS Fix|
|SSDT-SPTP.aml|	X	|Fix Trackpad to work in GPIO Interrupt mode|

## BIOS Settings
* Secure Boot Control: Off
* Fast BIOS Mode: Off
* LAN PXE OPROM: Off
## Before You Download..
This EFI does not include SMBIOS values and ROM. Please fill it up before using.
