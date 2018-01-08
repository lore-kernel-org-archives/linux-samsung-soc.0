From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [U-boot] Odroidxu3/4 -s2mps11 bind pmic failed
Date: Mon, 8 Jan 2018 12:27:26 +0530
Message-ID: <CANAwSgRFFGqgYT2NvzqNthNhU0XvDtbxsQtg1L7oU6EeZ3MYog@mail.gmail.com>
References: <CANAwSgSrNEfy-78cYRm+HeBa_MDk1xn5P4neYJPiDW-RpfW-Gw@mail.gmail.com>
 <20180102231706.7b7f446d@jawa> <CANAwSgQrHUjOFLJL=soG7aFooZ2D-PwP5vLT+hdxzaRL6JPM7Q@mail.gmail.com>
 <20180103093846.0fa8b8e2@jawa> <CGME20180107153516epcas5p37d4e6ec5b6dd9cde536d0af5d8cda1a4@epcas5p3.samsung.com>
 <CANAwSgQnnBwiXAeJk25_+JmQBNUc-_Vz+BqNUgJHPUL9VXZ8=Q@mail.gmail.com> <7088671e-9572-cf33-a8d0-a285d31ff1db@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:33872 "EHLO
        mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755604AbeAHG5r (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Jan 2018 01:57:47 -0500
Received: by mail-oi0-f48.google.com with SMTP id a70so406798oib.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Jan 2018 22:57:47 -0800 (PST)
In-Reply-To: <7088671e-9572-cf33-a8d0-a285d31ff1db@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: Lukasz Majewski <lukma@denx.de>, Krzysztof Kozlowski <krzk@kernel.org>, Simon Glass <sjg@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, U-Boot Mailing List <u-boot@lists.denx.de>, linux-samsung-soc@vger.kernel.org

Hi Jaehoon,

On 8 January 2018 at 11:56, Jaehoon Chung <jh80.chung@samsung.com> wrote:
> On 01/08/2018 12:34 AM, Anand Moon wrote:
>> Hi Lukasz,
>>
>> On 3 January 2018 at 14:08, Lukasz Majewski <lukma@denx.de> wrote:
>>> Hi Anand,
>>>
>>>> Hi Lukasz
>>>>
>>>> On 3 January 2018 at 03:47, Lukasz Majewski <lukma@denx.de> wrote:
>>>>> On Wed, 3 Jan 2018 01:54:57 +0530
>>>>> Anand Moon <linux.amoon@gmail.com> wrote:
>>>>>
>>>>>> Hi All,
>>>>>>
>>>>>> I would like to get the s2mps11 regulator binding for u-boot to
>>>>>> work on Odroid XU3/XU4
>>>>>> as in case of Odroid U3 we have max77686_bind function which dose
>>>>>> the job.
>>>>>>
>>>>>> what will be the correct way to reset s2mps11 control register to
>>>>>> the default values
>>>>>> in-order to support reset of some regulators.
>>>>>>
>>>>>> Below is the command I tried to gather some information but it
>>>>>> failed.
>>>>>>
>>>>>> Best Regards
>>>>>> -Anand Moon
>>>>>> -----------------------------------------------------------------------------------------------------------------------------------------
>>>>>> U-Boot 2018.01-rc3-00060-g1314bd1 (Jan 02 2018 - 17:56:26 +0000)
>>>>>> for ODROID-XU3/XU4/HC1
>>>>>>
>>>>>> CPU:   Exynos5422 @ 800 MHz
>>>>>> Model: Odroid XU3 based on EXYNOS5422
>>>>>> Board: Odroid XU3 based on EXYNOS5422
>>>>>> Type:  xu4
>>>>>> DRAM:  2 GiB
>>>>>> MMC:   EXYNOS DWMMC: 0, EXYNOS DWMMC: 1
>>>>>> *** Warning - bad CRC, using default environment
>>>>>>
>>>>>> In:    serial
>>>>>> Out:   serial
>>>>>> Err:   serial
>>>>>> Net:   No ethernet found.
>>>>>> Hit any key to stop autoboot:  0
>>>>>> Card did not respond to voltage select!
>>>>>> mmc_init: -95, time 11
>>>>>> switch to partitions #0, OK
>>>>>> mmc0 is current device
>>>>>> Scanning mmc 0:1...
>>>>>> reading /exynos5422-odroidxu4.dtb
>>>>>> 62815 bytes read in 9 ms (6.7 MiB/s)
>>>>>> starting USB...
>>>>>> USB0:   USB EHCI 1.00
>>>>>> USB1:   Register 2000140 NbrPorts 2
>>>>>> Starting the controller
>>>>>> USB XHCI 1.00
>>>>>> USB2:   Register 2000140 NbrPorts 2
>>>>>> Starting the controller
>>>>>> USB XHCI 1.00
>>>>>> scanning bus 0 for devices... 1 USB Device(s) found
>>>>>> scanning bus 1 for devices... 3 USB Device(s) found
>>>>>> scanning bus 2 for devices... 2 USB Device(s) found
>>>>>>        scanning usb for storage devices... 0 Storage Device(s)
>>>>>> found scanning usb for ethernet devices... 1 Ethernet Device(s)
>>>>>> found Waiting for Ethernet connection... done.
>>>>>> BOOTP broadcast 1
>>>>>> BOOTP broadcast 2
>>>>>> DHCP client bound to address 10.0.0.144 (1200 ms)
>>>>>> *** Warning: no boot file name; using '0A000090.img'
>>>>>> Using r8152#0 device
>>>>>> TFTP from server 0.0.0.0; our IP address is 10.0.0.144; sending
>>>>>> through gateway 10.0.0.1
>>>>>> Filename '0A000090.img'.
>>>>>> Load address: 0x43e00000
>>>>>> Loading: *
>>>>>> TFTP error: 'File not found' (1)
>>>>>> Not retrying...
>>>>>> missing environment variable: pxeuuid
>>>>>> missing environment variable: bootfile
>>>>>> Retrieving file: pxelinux.cfg/0A000090
>>>>>> *** ERROR: `serverip' not set
>>>>>> missing environment variable: bootfile
>>>>>> Retrieving file: pxelinux.cfg/0A00009
>>>>>> *** ERROR: `serverip' not set
>>>>>> missing environment variable: bootfile
>>>>>> Retrieving file: pxelinux.cfg/0A0000
>>>>>> *** ERROR: `serverip' not set
>>>>>> missing environment variable: bootfile
>>>>>> Retrieving file: pxelinux.cfg/0A000
>>>>>> *** ERROR: `serverip' not set
>>>>>> missing environment variable: bootfile
>>>>>> Retrieving file: pxelinux.cfg/0A00
>>>>>> *** ERROR: `serverip' not set
>>>>>> missing environment variable: bootfile
>>>>>> Retrieving file: pxelinux.cfg/0A0
>>>>>> *** ERROR: `serverip' not set
>>>>>> missing environment variable: bootfile
>>>>>> Retrieving file: pxelinux.cfg/0A
>>>>>> *** ERROR: `serverip' not set
>>>>>> missing environment variable: bootfile
>>>>>> Retrieving file: pxelinux.cfg/0
>>>>>> *** ERROR: `serverip' not set
>>>>>> missing environment variable: bootfile
>>>>>> Retrieving file: pxelinux.cfg/default-arm-exynos
>>>>>> *** ERROR: `serverip' not set
>>>>>> missing environment variable: bootfile
>>>>>> Retrieving file: pxelinux.cfg/default-arm
>>>>>> *** ERROR: `serverip' not set
>>>>>> missing environment variable: bootfile
>>>>>> Retrieving file: pxelinux.cfg/default
>>>>>> *** ERROR: `serverip' not set
>>>>>> Config file not found
>>>>>> BOOTP broadcast 1
>>>>>> DHCP client bound to address 10.0.0.144 (644 ms)
>>>>>> Using r8152#0 device
>>>>>> TFTP from server 0.0.0.0; our IP address is 10.0.0.144; sending
>>>>>> through gateway 10.0.0.1
>>>>>> Filename 'boot.scr.uimg'.
>>>>>> Load address: 0x50000000
>>>>>> Loading: *
>>>>>> TFTP error: 'File not found' (1)
>>>>>> Not retrying...
>>>>>> BOOTP broadcast 1
>>>>>> BOOTP broadcast 2
>>>>>> DHCP client bound to address 10.0.0.144 (1257 ms)
>>>>>> Using r8152#0 device
>>>>>> TFTP from server 0.0.0.0; our IP address is 10.0.0.144; sending
>>>>>> through gateway 10.0.0.1
>>>>>> Filename 'boot.scr.uimg'.
>>>>>> Load address: 0x42000000
>>>>>> Loading: *
>>>>>> TFTP error: 'File not found' (1)
>>>>>> Not retrying...
>>>>>> ODROID-XU3 #
>>>>>> ODROID-XU3 #
>>>>>> ODROID-XU3 # pmic s2mps11 dump
>>>>>> pmic -  operations
>>>>>>
>>>>>> Usage:
>>>>>> pmic list          - list pmic devices
>>>>>> pmic dev [name]    - show or [set] operating PMIC device
>>>>>> pmic dump          - dump registers
>>>>>> pmic read address  - read byte of register at address
>>>>>> pmic write address - write byte to register at address
>>>>>
>>>>> First try to:
>>>>>
>>>>> pmic list
>>>>> pmic dev s2mps11_pmic@66
>>>>>
>>>>> pmic dump
>>>>> pmic write 0xXX for your device
>>>>>
>>>>>
>>>> [snip]
>>>>
>>>> Thanks for your input.
>>>>
>>>> ODROID-XU3 #
>>>> | Name                            | Parent name         | Parent
>>>> uclass @ seq | s2mps11_pmic@66                 | i2c@12CA0000
>>>> | i2c @ 4 ODROID-XU3 # pmic dev s2mps11_pmic@66
>>>> dev: 0 @ s2mps11_pmic@66
>>>> ODROID-XU3 # pmic dump
>>>> Dump pmic: s2mps11_pmic@66 registers
>>>>
>>>> 0x00: 83 00 11 00 ff 3b 03 1a 00 00 04 01 10 00 00 57
>>>> 0x10: 5f 55 ff ff ff ff ff 00 00 00 00 00 00 00 00 00
>>>> 0x20: 00 50 12 ca dc d8 50 f8 40 f9 40 f8 40 fe 3f 60
>>>> 0x30: 78 90 c0 d8 44 d8 30 d8 64 d9 50 d8 a8 c8 d4 14
>>>> 0x40: d4 d4 c8 d4 d4 f2 d4 c8 d4 f2 2c f2 dc f2 14 f2
>>>> 0x50: 14 14 10 cc e8 14 ec c8 f2 14 f2 14 14 14 2c 10
>>>> 0x60: 14 14 28
>>>>
>>>> Actually, I am looking into setting some of the s2mps11 control
>>>> register + reset clk values
>>>> during board initialization.
>>>
>>> You can try to set those values by writing some u-boot script or bring
>>> the below (needed) code upstream, so those could be reused by others.
>>>
>> [snip]
>>
>> I dont have s2mps11 datasheet with me.
>> but I tried to write simple .probe function with debug message
>> but print message did not invoke during the booting of the device.
>>
>> neither did the debug print appeared during the pmci dump command.
>>
>> ODROID-XU3 #
>> ODROID-XU3 # pmic list
>> | Name                            | Parent name         | Parent uclass @ seq
>> | s2mps11_pmic@66                 | i2c@12CA0000        | i2c @ 4
>> ODROID-XU3 # pmic dev s2mps11_pmic@66
>> dev: 0 @ s2mps11_pmic@66
>> ODROID-XU3 # pmic dump
>> Dump pmic: s2mps11_pmic@66 registers
>>
>> 0x00: 83 00 11 00 ff 3b 03 1a 00 00 04 01 10 00 00 57
>> 0x10: 5f 55 ff ff ff ff ff 00 00 00 00 00 00 00 00 00
>> 0x20: 00 50 12 ca dc d8 50 f8 40 f9 40 f8 40 fe 3f 60
>> 0x30: 78 90 c0 d8 44 d8 30 d8 64 d9 50 d8 a8 c8 d4 14
>> 0x40: d4 d4 c8 d4 d4 f2 d4 c8 d4 f2 2c f2 dc f2 14 f2
>> 0x50: 14 14 10 cc e8 14 ec c8 f2 14 f2 14 14 14 2c 10
>> 0x60: 14 14 28
>>
>> ----
>> How can we invoke and verify the s2mps11 init function during board
>> initialization ?
>
> When i have checked the above values, those are the reset value at each registers.
> but some registers are different with reset values.
>
> do you want to change the pmic register value at init time?
[snip]

What I have debug at my end pmci is not getting invoke or initialize via u-boot.
Yes default value for all the control registers would be fine.

I was looking into some missing feature like.
s2mps11 regulator initialization via dts in u-boot.
 s2mps11_pmic
     .probe = s2mps11_probe
     .bind = s2mps11_bind

Can we enable CONFIG_SPL_BUILD for Odroid platform.
much of the core initialization is blocked under this flag.
Is their any plan to make this feature working.

Best Regards
-Anand
