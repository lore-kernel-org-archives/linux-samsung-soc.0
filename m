From: Przemyslaw Marczak <p.marczak@samsung.com>
Subject: Re: [RFC] ARM: exynos: MCPM: [is this a] fix for secondary boot on
 5422?
Date: Mon, 15 Jun 2015 16:00:21 +0200
Message-ID: <557EDA75.8060807@samsung.com>
References: <1416896510-24612-1-git-send-email-khilman@kernel.org>
 <CAJKOXPfLEV1sQsz87ULDKX4vijqRpbGj7AcOEDiy83kukvVKVg@mail.gmail.com>
 <557EA6AE.304@samsung.com>
 <CAJKOXPfRgTf=6Z=pbz3zQj__Nt_uLtqhD65pYc3NMrF_NJ62=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:28577 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753292AbbFOOAs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 10:00:48 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NPZ00CDWO99UPC0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Jun 2015 15:00:45 +0100 (BST)
In-reply-to: <CAJKOXPfRgTf=6Z=pbz3zQj__Nt_uLtqhD65pYc3NMrF_NJ62=g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dza2k=?= <k.kozlowski.k@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, Olof Johansson <olof@lixom.net>, Mauro Ribeiro <mauro.ribeiro@hardkernel.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Doug Anderson <dianders@chromium.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>


On 06/15/2015 02:17 PM, Krzysztof Koz=C5=82owski wrote:
> 2015-06-15 19:19 GMT+09:00 Przemyslaw Marczak <p.marczak@samsung.com>=
:
>> Hello Krzysztof,
>>
>>
>> On 06/14/2015 10:56 AM, Krzysztof Koz=C5=82owski wrote:
>>>
>>>
>>> Hi,
>>>
>>> +Cc Marek, Bartlomiej, Kukjin Kim,
>>>
>>>
>>> I would like to bring back this topic. Unfortunately I don't have
>>> access to source code of BL1 (or any other firmware blob) so my
>>> knowledge here comes mostly from experimenting and from looking at
>>> sources of vendor kernel for Gear 2 (Exynos3250) and SM-G900H (Gala=
xy
>>> S5, Exynos5422).
>>>
>>> It seems that some booting firmware (I would suspect BL1 because th=
is
>>> ships Samsung to Hardkernel) uses SPARE2 as synchronization mechani=
sm.
>>> For example vendor kernel, when booting little core, it waits till
>>> SPARE2=3D=3D1 and then executes software reset for this core.
>>>
>>> Observations shown that BL1 for Odroid, when booting secondary litt=
le
>>> core:
>>> 1. Expects that SPARE2 register will be initialized to 1.
>>> 2. If it is, then it sets it to 0, proceeds further and little core=
 boots.
>>> 3. If it is not, then it sets it to 1 and waits. Maybe this is a
>>> notification to userspace - reset me please!
>>>
>>> Unfortunately executing software reset in that time (at point 3)
>>> stopped kernel from booting. No logs/dmesg and I was unable to turn=
 on
>>> early printk.
>>>
>>> The answer why two of little cores boot is quite simple now. At
>>> beginning the SPARE2=3D=3D0 so first little core will set it to 1 a=
nd wait
>>> till software reset. Kernel timeouts on this CPU bring up so it sta=
rts
>>> the sequence for next little core. Now the SPARE2=3D=3D1 so the cor=
e boots
>>> fine and SPARE2 is set to 0. The last little core starts from
>>> SPARE2=3D=3D0, sets it to 1 and waits for software reset.
>>>
>>> Since no one knows how this exactly works and we are stuck with BL1
>>> provided as is, then IMHO the patch makes sense.
>>>
>>> Kevin, can you refresh the patch?
>>> It would be nice to:
>>> 1. set SPARE2 only for Odroid (of_machine_is_compatible()),
>>> 2. extend the explanation.
>>>
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> I'm trying port the hardkernel's SPL to the mainline U-Boot at prese=
nt. The
>> mainline SPL is implemented for E5420 and E5800. But there are few
>> differences:
>> - different DRAM
>> - different clocks
>> - different boot core (peach-pi boots from A15)
>> - bl2 signature
>> - hdk's SPL uses smc calls
>> ... and some more.
>>
>> The BL1 keeps signature key and some part of code, but it's code is
>> proprietary - but we should be able to setup the secondary cores in =
BL2.
>>
>> When, I get the basic setup working, then I'm going to focus on the
>> secondary CPU's init. I don't have the documentation for iROM code, =
so
>> everything takes a while.
>
> Great, good luck!
>

Thanks!

>>
>>   If you looking for the lowlevel code, which is executed after wake=
up,
>> please check this :
>> https://github.com/hardkernel/u-boot/blob/odroidxu3-v2012.07/board/s=
amsung/smdk5422/lowlevel_init.S
>>
>> The 'lowlevel_init' label is always executed on boot.
>
> I already looked at it without any success. I couldn't find the reaso=
n
> of this SPARE2 behaviour in that code. However I found there one smal=
l
> funny fact about magic values for low power modes - kernel and u-boot
> expect some of the values in different places.
>
> Best regards,
> Krzysztof
>

I checked the SPARE registers, and only SPARE0 is set by iROM code to=20
0xFCBA0D10, it is defined in the kernel as: S5P_CHECK_AFTR. I didn't=20
analyzed the kernel code yet, however it looks, that it doesn't use=20
SPARE0 register.

I need finish the basic SPL support, and then will start synchronize=20
with the kernel.

Best regards,
--=20
Przemyslaw Marczak
Samsung R&D Institute Poland
Samsung Electronics
p.marczak@samsung.com
