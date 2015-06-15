From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Subject: Re: [RFC] ARM: exynos: MCPM: [is this a] fix for secondary boot on 5422?
Date: Mon, 15 Jun 2015 21:17:07 +0900
Message-ID: <CAJKOXPfRgTf=6Z=pbz3zQj__Nt_uLtqhD65pYc3NMrF_NJ62=g@mail.gmail.com>
References: <1416896510-24612-1-git-send-email-khilman@kernel.org>
	<CAJKOXPfLEV1sQsz87ULDKX4vijqRpbGj7AcOEDiy83kukvVKVg@mail.gmail.com>
	<557EA6AE.304@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f175.google.com ([209.85.160.175]:36648 "EHLO
	mail-yk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754072AbbFOMRH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 08:17:07 -0400
Received: by ykaz81 with SMTP id z81so54527081yka.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2015 05:17:07 -0700 (PDT)
In-Reply-To: <557EA6AE.304@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Przemyslaw Marczak <p.marczak@samsung.com>
Cc: Kevin Hilman <khilman@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, Olof Johansson <olof@lixom.net>, Mauro Ribeiro <mauro.ribeiro@hardkernel.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Doug Anderson <dianders@chromium.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>

2015-06-15 19:19 GMT+09:00 Przemyslaw Marczak <p.marczak@samsung.com>:
> Hello Krzysztof,
>
>
> On 06/14/2015 10:56 AM, Krzysztof Koz=C5=82owski wrote:
>>
>>
>> Hi,
>>
>> +Cc Marek, Bartlomiej, Kukjin Kim,
>>
>>
>> I would like to bring back this topic. Unfortunately I don't have
>> access to source code of BL1 (or any other firmware blob) so my
>> knowledge here comes mostly from experimenting and from looking at
>> sources of vendor kernel for Gear 2 (Exynos3250) and SM-G900H (Galax=
y
>> S5, Exynos5422).
>>
>> It seems that some booting firmware (I would suspect BL1 because thi=
s
>> ships Samsung to Hardkernel) uses SPARE2 as synchronization mechanis=
m.
>> For example vendor kernel, when booting little core, it waits till
>> SPARE2=3D=3D1 and then executes software reset for this core.
>>
>> Observations shown that BL1 for Odroid, when booting secondary littl=
e
>> core:
>> 1. Expects that SPARE2 register will be initialized to 1.
>> 2. If it is, then it sets it to 0, proceeds further and little core =
boots.
>> 3. If it is not, then it sets it to 1 and waits. Maybe this is a
>> notification to userspace - reset me please!
>>
>> Unfortunately executing software reset in that time (at point 3)
>> stopped kernel from booting. No logs/dmesg and I was unable to turn =
on
>> early printk.
>>
>> The answer why two of little cores boot is quite simple now. At
>> beginning the SPARE2=3D=3D0 so first little core will set it to 1 an=
d wait
>> till software reset. Kernel timeouts on this CPU bring up so it star=
ts
>> the sequence for next little core. Now the SPARE2=3D=3D1 so the core=
 boots
>> fine and SPARE2 is set to 0. The last little core starts from
>> SPARE2=3D=3D0, sets it to 1 and waits for software reset.
>>
>> Since no one knows how this exactly works and we are stuck with BL1
>> provided as is, then IMHO the patch makes sense.
>>
>> Kevin, can you refresh the patch?
>> It would be nice to:
>> 1. set SPARE2 only for Odroid (of_machine_is_compatible()),
>> 2. extend the explanation.
>>
>>
>> Best regards,
>> Krzysztof
>>
>
> I'm trying port the hardkernel's SPL to the mainline U-Boot at presen=
t. The
> mainline SPL is implemented for E5420 and E5800. But there are few
> differences:
> - different DRAM
> - different clocks
> - different boot core (peach-pi boots from A15)
> - bl2 signature
> - hdk's SPL uses smc calls
> ... and some more.
>
> The BL1 keeps signature key and some part of code, but it's code is
> proprietary - but we should be able to setup the secondary cores in B=
L2.
>
> When, I get the basic setup working, then I'm going to focus on the
> secondary CPU's init. I don't have the documentation for iROM code, s=
o
> everything takes a while.

Great, good luck!

>
>  If you looking for the lowlevel code, which is executed after wakeup=
,
> please check this :
> https://github.com/hardkernel/u-boot/blob/odroidxu3-v2012.07/board/sa=
msung/smdk5422/lowlevel_init.S
>
> The 'lowlevel_init' label is always executed on boot.

I already looked at it without any success. I couldn't find the reason
of this SPARE2 behaviour in that code. However I found there one small
funny fact about magic values for low power modes - kernel and u-boot
expect some of the values in different places.

Best regards,
Krzysztof
