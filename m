From: Tyler Baker <tyler.baker@linaro.org>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable DWC2 USB driver and USB
 ethernet gadget
Date: Thu, 1 Oct 2015 10:54:19 -0700
Message-ID: <CANMBJr5khg1z87bqdVdxWvN7wiG1qXC46Z_NzmB8xKnJKzJmbA@mail.gmail.com>
References: <1439889333-11990-1-git-send-email-m.szyprowski@samsung.com>
	<55D2FC8D.2020007@samsung.com>
	<CANMBJr4gwDg8iNcKmVKXqeKBkDhh36BFxeSnCSe0ny4E+LqmFg@mail.gmail.com>
	<55DD19E6.6040501@samsung.com>
	<CANMBJr50FdYvJVKf08zcPGO+SUOHjq5-e7Panv-FK8VhLGN5dg@mail.gmail.com>
	<55DD35EE.7030105@samsung.com>
	<55DD56CF.7040800@samsung.com>
	<55DD6180.5090003@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f41.google.com ([209.85.192.41]:36382 "EHLO
	mail-qg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752284AbbJARyU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Oct 2015 13:54:20 -0400
Received: by qgx61 with SMTP id 61so74231813qgx.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Oct 2015 10:54:19 -0700 (PDT)
In-Reply-To: <55DD6180.5090003@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Kevin Hilman <khilman@linaro.org>

On 25 August 2015 at 23:49, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
> On 26.08.2015 15:03, Marek Szyprowski wrote:
>> Hello,
>>
>> On 2015-08-26 05:43, Krzysztof Kozlowski wrote:
>>> On 26.08.2015 10:58, Tyler Baker wrote:
>>>> Hi Krzysztof,
>>>>
>>>> On 25 August 2015 at 18:44, Krzysztof Kozlowski
>>>> <k.kozlowski@samsung.com> wrote:
>>>>> On 26.08.2015 06:00, Tyler Baker wrote:
>>>>>> Hi Marek/Krzysztof,
>>>>>>
>>>>>> On 18 August 2015 at 02:36, Krzysztof Kozlowski
>>>>>> <k.kozlowski@samsung.com> wrote:
>>>>>>> On 18.08.2015 18:15, Marek Szyprowski wrote:
>>>>>>>> DWC2 (s3c-hsotg) hardware module is available on many Exynos
>>>>>>>> based boards,
>>>>>>>> so enable DWC2 driver as well as the most common USB Ethernet
>>>>>>>> gadget.
>>>>>>>>
>>>>>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>>> The kernelci.org bot recently reported a handful of exynos boot
>>>>>> failures in next-20150825[1] only when using exynos_defconfig.
>>>>> I noticed the issue too but I fought it was a temporary network
>>>>> problem.
>>>>> Apparently it's not temporary. :)
>>>> I thought the same as well :)
>>>>
>>>>>> I went
>>>>>> ahead and bisected[2] the failure and found this patch was the
>>>>>> offender. Looking a bit closer, the kernelci.org boot tests typically
>>>>>> pass ip=dhcp or ip=<ipaddr> as a kernel argument so that networking is
>>>>>> setup by the kernel. These boot failures are due to the kernel network
>>>>>> initialization timing out. Previously, in next-20150821[3] all the
>>>>>> exynos platforms failing in next-20150825 initialized their network
>>>>>> interfaces successfully, so this seems like a regression. Please have
>>>>>> a closer look at the boot logs[4][5] for comparison. Kevin pointed out
>>>>>> that  "asix 3-3.2.4:1.0 eth0: register 'asix' at
>>>>>> usb-12110000.usb-3.2.4, ASIX AX88772 USB 2.0 Ethernet" is missing from
>>>>>> the failed boot logs. Anyways, as a summary it looks like this change
>>>>>> broke networking support on the arndale, arndale-octa, odroid xu3, and
>>>>>> odroid x2.
>>>>> I don't have such problem on my Odroid XU3 which also performs netboot
>>>>> (Arch ARM Linux):
>>>> Doh. I just realized the odroid-u3 is failing not the odroid-xu3,
>>>> sorry for the confusion!
>>>>
>>>>> netboot=tftpboot 0x40008000 zImage; tftpboot 0x44000000
>>>>> exynos5422-odroidxu3-lite.dtb; bootz 0x40008000 - 0x44000000
>>>>>
>>>>> TFTP from server 192.168.1.10; our IP address is 192.168.1.11
>>>>>
>>>>> [    0.000000] Kernel command line: console=tty1
>>>>> console=ttySAC2,115200n8 root=/dev/mmcblk0p1 rootwait rw
>>>>> no_console_suspend smsc95xx.macaddr=00:1e:06:61:7a:93
>>>>>
>>>>>
>>>>> Do you have anything connected to USB ports of the devices?
>>>> Nope, nothing connected to the USB ports in my lab.
>>>>
>>>>> For example on boot-exynos5250-arndale.html I see:
>>>>> [    2.792934] using random self ethernet address
>>>>> [    2.797209] using random host ethernet address
>>>>> [    2.802244] usb0: HOST MAC 46:52:cf:b5:0f:e8
>>>>> [    2.805923] usb0: MAC a2:04:5d:a6:2c:fa
>>>>> [    2.809720] using random self ethernet address
>>>>> [    2.814137] using random host ethernet address
>>>>> [    2.818599] g_ether gadget: Ethernet Gadget, version: Memorial
>>>>> Day 2008
>>>>> [    2.825159] g_ether gadget: g_ether ready
>>>>>
>>>>> It looks like that's the difference.
>>> Two issues seem strange to me:
>>> 1. Why on these boards (except Odroid XU3) appears an usb0 interface
>>> (after adding gadget support)? If they don't have the USB cable attached
>>> then it shouldn't?
>>
>> When USB Ethernet gadget is loaded it always creates usb0 network
>> interface, regardless of the USB cable being attached or not.
>
> Thanks for explaining.
>
>>
>>> 2. ip=dhcp should send DCHP requests on all interfaces:
>>>
>>>     Otherwise the device is determined using
>>>     autoconfiguration. This is done by sending
>>>     autoconfiguration requests out of all devices,
>>>     and using the device that received the first reply.
>>>
>>> So why it is not sent on eth0? Maybe there is no eth0 interface now
>>> because of some conflict in USB drivers? Or maybe there was no eth0
>>> interface also before and everything booted from MMC?
>>
>> Maybe the names of network interfaces has changed or kernel parameters
>> lacks specifying which network interface has to be configured (usb0 or
>> eth0)?
>
> The ip=dhcp should send requests on all interfaces. The eth0 (provided
> by smsc95xx, @EHCI USB 12580000) should be there.
>
> After comparing U3 boots I see that on broken boot the "exynos-ehci
> 12580000.ehci" starts earlier - around 2.17s. Detection of MMC happens
> at 2.7s.
>
> However on proper U3 boot, the 12580000.ehci probes around 15s. This
> happens after MMC detection and after starting udev.
>
> Tyler,
> I don't know exactly how does your boot sequence look like. Maybe
> netboot always failed and it booted from mmc? But clearly the change is
> sensible and presence of usb0 interface should not fail the boot.

I'm just going to disable in kernel DHCP on these platforms, as they
are now broken.

Cheers,

Tyler
