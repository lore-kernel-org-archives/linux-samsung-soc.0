From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH v4 2/8] arm64: dts: exynos: Add dts files for 64-bit
 Exynos5433 SoC
Date: Sat, 28 Feb 2015 09:47:01 +0900
Message-ID: <CAGTfZH0VVT0hMn4ooRNZxnqjUQ_hF8nHg-4NtNriayick50qgw@mail.gmail.com>
References: <1424755011-15999-1-git-send-email-cw00.choi@samsung.com>
	<6850624.bdB2Ab6zJx@wuerfel>
	<54EED6E1.4060908@samsung.com>
	<2707354.mhmQEHxoKV@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:37923 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751566AbbB1ArD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Feb 2015 19:47:03 -0500
In-Reply-To: <2707354.mhmQEHxoKV@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Chanwoo Choi <cw00.choi@samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, "will.deacon@arm.com" <will.deacon@arm.com>, linux-kernel <linux-kernel@vger.kernel.org>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>, Abhilash Kesavan <a.kesavan@samsung.com>, "chanho61.park@samsung.com" <chanho61.park@samsung.com>, "inki.dae@samsung.com" <inki.dae@samsung.com>, ideal.song@samsung.com

On Fri, Feb 27, 2015 at 12:42 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thursday 26 February 2015 17:18:41 Chanwoo Choi wrote:
>> I add following aliases and serial_1/serial_3 dt node in board dtsi:
>> I tested that change the alias of serial_x node.
>>
>>         aliases {
>>                 serial0 = &serial_1;
>>                 serial1 = &serial_3;
>>         };
>>
>>         /* Add 'linux,stdout-path' property to print kernel log by using ealycon */
>>         chosen {
>>                 linux,stdout-path = &serial_1;
>>         };
>>
>>         [snip]
>>
>>         /* serial_1 is used for printing kernel log throught JIG cable */
>>         &serial_1 {
>>                 status = "okay";
>>         };
>>
>>         &serial_3 {
>>                 status = "okay";
>>         };
>>
>> In result, serial driver create the /dev/ttySAC0 for serial_1 and /dev/ttySAC1 for serial_3.
>> But, I cannot complete the kernel booting and stop it with following kernel log
>>
>> [    0.000000] Booting Linux on physical CPU 0x100
>> [    0.000000] Initializing cgroup subsys cpuset
>> [    0.000000] Initializing cgroup subsys cpu
>> [    0.000000] Initializing cgroup subsys cpuacct
>> [    0.000000] Linux version 4.0.0-rc1-00066-g49bfcec-dirty (cwchoi00@chan) (gcc version 4.9.2 20140904 (prerelease) (crosstool-NG l5
>> [snip]
>> [    0.000000] Kernel command line: console=ttySAC1,115200 earlycon=exynos4210,0x14C20000
>
> What is the "earlycon=exynos4210,0x14C20000" doing here? Should that not just be
> "earlycon=exynos" or something like that when you set the correct stdout-path?

"earlycon=exynos4210,0x14C20000" is correct bootparam. You can check
it on Documentation/kernel-parameters.txt as following.

     exynos4210,<addr>
                Use early console provided by serial driver available
                on Samsung SoCs, requires selecting proper type and
                a correct base address of the selected UART port. The
                serial port must already be setup and configured.
                Options are not yet supported.

>
>> [snip]
>> [    0.651647] dma-pl330 15610000.pdma: Loaded driver for PL330 DMAC-341330
>> [    0.651851] dma-pl330 15610000.pdma:         DBUFF-32x4bytes Num_Chans-8 Num_Peri-32 Num_Events-32
>> [    0.658566] dma-pl330 15600000.pdma: Loaded driver for PL330 DMAC-341330
>> [    0.662872] dma-pl330 15600000.pdma:         DBUFF-32x4bytes Num_Chans-8 Num_Peri-32 Num_Events-32
>> [    0.672487] dma-pl330 11420000.adma: Loaded driver for PL330 DMAC-341330
>> [ 8466.414900] dma-pl330 11420000.adma:         DBUFF-8x8bytes Num_Chans-8 Num_Peri-16 Num_Events-8
>> [ 8466.481648] 14c20000.serial: ttySAC0 at MMIO 0x14c20000 (irq = 21, base_baud = 0) is a S3C6400/10
>> (dont' print any kernel log)
>>
>> So, I change the kernel command line about ('console' bootparam) as following:
>> because tty framework must use the 'console' bootparam to print kernel log.
>> - original     : Kernel command line: console=ttySAC1,115200 ... (cannot the kernel log from serial driver probed)
>> - modification : Kernel command line: console=ttySAC0,115200 ... (got the successful kernel booting)
>>
>> After modification, I got the successful kernel booting.
>>
>> If should use the serial_0 device and then modify the 'aliases' as following:
>> I have to modify the commandline of bootloader if the commandline of bootloader is used
>> instad of default kernel command line.
>>
>>         aliases {
>>                 serial0 = &serial_0;
>>                 serial1 = &serial_1;
>>                 serial2 = &serial_3;
>>         };
>
> If you need the numbers to match, maybe there is still a bug in the serial port
> driver and it uses some arbitrary number (e.g. probe order, or ascending
> MMIO address) for the console instead of the alias?

The serial port driver request the 'tty' device information to print kernel log.
So, bootloader is supposed to pass the 'tty' device as upper example.
But, The bootloader could not get the the 'alias' information in board dtsi.

Thanks,
Chanwoo Choi
