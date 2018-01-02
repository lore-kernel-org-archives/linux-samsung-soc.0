From: Anand Moon <linux.amoon@gmail.com>
Subject: [U-boot] Odroidxu3/4 -s2mps11 bind pmic failed
Date: Wed, 3 Jan 2018 01:54:57 +0530
Message-ID: <CANAwSgSrNEfy-78cYRm+HeBa_MDk1xn5P4neYJPiDW-RpfW-Gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36481 "EHLO
        mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751007AbeABUZS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Jan 2018 15:25:18 -0500
Received: by mail-oi0-f51.google.com with SMTP id j14so22762375oih.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Jan 2018 12:25:18 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Simon Glass <sjg@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, U-Boot Mailing List <u-boot@lists.denx.de>, linux-samsung-soc@vger.kernel.org
Cc: Lukasz Majewski <lukma@denx.de>, Jaehoon Chung <jh80.chung@samsung.com>

Hi All,

I would like to get the s2mps11 regulator binding for u-boot to work
on Odroid XU3/XU4
as in case of Odroid U3 we have max77686_bind function which dose the job.

what will be the correct way to reset s2mps11 control register to the
default values
in-order to support reset of some regulators.

Below is the command I tried to gather some information but it failed.

Best Regards
-Anand Moon
-----------------------------------------------------------------------------------------------------------------------------------------
U-Boot 2018.01-rc3-00060-g1314bd1 (Jan 02 2018 - 17:56:26 +0000) for
ODROID-XU3/XU4/HC1

CPU:   Exynos5422 @ 800 MHz
Model: Odroid XU3 based on EXYNOS5422
Board: Odroid XU3 based on EXYNOS5422
Type:  xu4
DRAM:  2 GiB
MMC:   EXYNOS DWMMC: 0, EXYNOS DWMMC: 1
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   No ethernet found.
Hit any key to stop autoboot:  0
Card did not respond to voltage select!
mmc_init: -95, time 11
switch to partitions #0, OK
mmc0 is current device
Scanning mmc 0:1...
reading /exynos5422-odroidxu4.dtb
62815 bytes read in 9 ms (6.7 MiB/s)
starting USB...
USB0:   USB EHCI 1.00
USB1:   Register 2000140 NbrPorts 2
Starting the controller
USB XHCI 1.00
USB2:   Register 2000140 NbrPorts 2
Starting the controller
USB XHCI 1.00
scanning bus 0 for devices... 1 USB Device(s) found
scanning bus 1 for devices... 3 USB Device(s) found
scanning bus 2 for devices... 2 USB Device(s) found
       scanning usb for storage devices... 0 Storage Device(s) found
       scanning usb for ethernet devices... 1 Ethernet Device(s) found
Waiting for Ethernet connection... done.
BOOTP broadcast 1
BOOTP broadcast 2
DHCP client bound to address 10.0.0.144 (1200 ms)
*** Warning: no boot file name; using '0A000090.img'
Using r8152#0 device
TFTP from server 0.0.0.0; our IP address is 10.0.0.144; sending
through gateway 10.0.0.1
Filename '0A000090.img'.
Load address: 0x43e00000
Loading: *
TFTP error: 'File not found' (1)
Not retrying...
missing environment variable: pxeuuid
missing environment variable: bootfile
Retrieving file: pxelinux.cfg/0A000090
*** ERROR: `serverip' not set
missing environment variable: bootfile
Retrieving file: pxelinux.cfg/0A00009
*** ERROR: `serverip' not set
missing environment variable: bootfile
Retrieving file: pxelinux.cfg/0A0000
*** ERROR: `serverip' not set
missing environment variable: bootfile
Retrieving file: pxelinux.cfg/0A000
*** ERROR: `serverip' not set
missing environment variable: bootfile
Retrieving file: pxelinux.cfg/0A00
*** ERROR: `serverip' not set
missing environment variable: bootfile
Retrieving file: pxelinux.cfg/0A0
*** ERROR: `serverip' not set
missing environment variable: bootfile
Retrieving file: pxelinux.cfg/0A
*** ERROR: `serverip' not set
missing environment variable: bootfile
Retrieving file: pxelinux.cfg/0
*** ERROR: `serverip' not set
missing environment variable: bootfile
Retrieving file: pxelinux.cfg/default-arm-exynos
*** ERROR: `serverip' not set
missing environment variable: bootfile
Retrieving file: pxelinux.cfg/default-arm
*** ERROR: `serverip' not set
missing environment variable: bootfile
Retrieving file: pxelinux.cfg/default
*** ERROR: `serverip' not set
Config file not found
BOOTP broadcast 1
DHCP client bound to address 10.0.0.144 (644 ms)
Using r8152#0 device
TFTP from server 0.0.0.0; our IP address is 10.0.0.144; sending
through gateway 10.0.0.1
Filename 'boot.scr.uimg'.
Load address: 0x50000000
Loading: *
TFTP error: 'File not found' (1)
Not retrying...
BOOTP broadcast 1
BOOTP broadcast 2
DHCP client bound to address 10.0.0.144 (1257 ms)
Using r8152#0 device
TFTP from server 0.0.0.0; our IP address is 10.0.0.144; sending
through gateway 10.0.0.1
Filename 'boot.scr.uimg'.
Load address: 0x42000000
Loading: *
TFTP error: 'File not found' (1)
Not retrying...
ODROID-XU3 #
ODROID-XU3 #
ODROID-XU3 # pmic s2mps11 dump
pmic -  operations

Usage:
pmic list          - list pmic devices
pmic dev [name]    - show or [set] operating PMIC device
pmic dump          - dump registers
pmic read address  - read byte of register at address
pmic write address - write byte to register at address

ODROID-XU3 # pmic list
| Name                            | Parent name         | Parent uclass @ seq
| s2mps11_pmic@66                 | i2c@12CA0000        | i2c @ 4
ODROID-XU3 # pmic s2mps11_pmic dump
pmic -  operations

Usage:
pmic list          - list pmic devices
pmic dev [name]    - show or [set] operating PMIC device
pmic dump          - dump registers
pmic read address  - read byte of register at address
pmic write address - write byte to register at address

ODROID-XU3 # pmic dump
First, set the PMIC device!
pmic -  operations

Usage:
pmic list          - list pmic devices
pmic dev [name]    - show or [set] operating PMIC device
pmic dump          - dump registers
pmic read address  - read byte of register at address
pmic write address - write byte to register at address

ODROID-XU3 # pmic s2mps11_pmic
pmic -  operations

Usage:
pmic list          - list pmic devices
pmic dev [name]    - show or [set] operating PMIC device
pmic dump          - dump registers
pmic read address  - read byte of register at address
pmic write address - write byte to register at address

ODROID-XU3 # pmic read
First, set the PMIC device!
pmic -  operations

Usage:
pmic list          - list pmic devices
pmic dev [name]    - show or [set] operating PMIC device
pmic dump          - dump registers
pmic read address  - read byte of register at address
pmic write address - write byte to register at address

ODROID-XU3 # pmic read 12CA0000
First, set the PMIC device!
pmic -  operations

Usage:
pmic list          - list pmic devices
pmic dev [name]    - show or [set] operating PMIC device
pmic dump          - dump registers
pmic read address  - read byte of register at address
pmic write address - write byte to register at address

ODROID-XU3 #
