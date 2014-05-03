From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: Add peach-pi board support
Date: Sat, 03 May 2014 04:00:59 +0200
Message-ID: <53644DDB.7050503@gmail.com>
References: <1399035821-25096-1-git-send-email-arun.kk@samsung.com>	<1399035821-25096-4-git-send-email-arun.kk@samsung.com>	<5363D176.80601@gmail.com> <CAD=FV=XYjMg7V9=OzAy_ifwaM83QS0tiTrp5+nxvG236kkSjRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f54.google.com ([209.85.192.54]:58342 "EHLO
	mail-qg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751388AbaECCBB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 22:01:01 -0400
In-Reply-To: <CAD=FV=XYjMg7V9=OzAy_ifwaM83QS0tiTrp5+nxvG236kkSjRQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olofj@google.com>, Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Arun Kumar <arunkk.samsung@gmail.com>

Hi Doug,

On 02.05.2014 20:31, Doug Anderson wrote:
> Tomasz,
>
> On Fri, May 2, 2014 at 10:10 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> Hi Arun,
>>
>>
>> On 02.05.2014 15:03, Arun Kumar K wrote:
>>>
>>> Adds support for google peach-pi board having the
>>> Exynos5800 SoC.
>>>
>>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>>> ---
>>>    arch/arm/boot/dts/Makefile                |    3 +-
>>>    arch/arm/boot/dts/exynos5800-peach-pi.dts |  144
>>> +++++++++++++++++++++++++++++
>>>    2 files changed, 146 insertions(+), 1 deletion(-)
>>>    create mode 100644 arch/arm/boot/dts/exynos5800-peach-pi.dts
>>>
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>> index 35c146f..efe1573 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -76,7 +76,8 @@ dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
>>>          exynos5420-arndale-octa.dtb \
>>>          exynos5420-smdk5420.dtb \
>>>          exynos5440-sd5v1.dtb \
>>> -       exynos5440-ssdk5440.dtb
>>> +       exynos5440-ssdk5440.dtb \
>>> +       exynos5800-peach-pi.dtb
>>>    dtb-$(CONFIG_ARCH_HI3xxx) += hi3620-hi4511.dtb
>>>    dtb-$(CONFIG_ARCH_HIGHBANK) += highbank.dtb \
>>>          ecx-2000.dtb
>>> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts
>>> b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>>> new file mode 100644
>>> index 0000000..e0f8633
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>>> @@ -0,0 +1,144 @@
>>> +/*
>>> + * Google Peach Pi Rev 10+ board device tree source
>>> + *
>>> + * Copyright (c) 2014 Google, Inc
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License version 2 as
>>> + * published by the Free Software Foundation.
>>> + */
>>> +
>>> +/dts-v1/;
>>> +#include <dt-bindings/input/input.h>
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include "exynos5800.dtsi"
>>> +
>>> +/ {
>>> +       model = "Google Peach Pi Rev 10+";
>>> +
>>> +       compatible = "google,pi-rev16",
>>> +               "google,pi-rev15", "google,pi-rev14",
>>> +               "google,pi-rev13", "google,pi-rev12",
>>> +               "google,pi-rev11", "google,pi-rev10",
>>> +               "google,pi", "google,peach", "samsung,exynos5800",
>>> +               "samsung,exynos5";
>>
>>
>> I can see this board using the "google,peach" compatible string, which is
>> the same as one listed for peach-pit board. Since they are based on
>> different SoCs, are they really compatible?
>
> I'd like to see "google,peach" continue to be here but won't fight too
> strongly if it's rejected.  The pit and pi boards are incredibly
> similar to each other.  They have a 380 point difference in their
> processor and a few minor peripheral differences, but not a lot else.
>
> I could totally imagine some code somewhere wanting to know if this
> board is compatible with "google,peach" just like you can imagine code
> somewhere wanting to know if this is compatible with
> "samsung,exynos5".
>
> Potentially you could swap the order of "google,peach" and
> "samsung,exynos5800" though...
>

Well, if you can use the device tree of peach-pit board and boot 
peach-pi and vice-versa and it won't cause any hardware failures then I 
guess it's fine to keep this string.

Not sure about the order, though, as both "google,peach" and 
"samsung,exynos5800" strings can't really be strictly ordered. IMHO 
current order is the closest to ideal, as particular family of similar 
boards is supposedly less generic than all boards based on particular SoC.

>
>>> +
>>> +       memory {
>>> +               reg = <0 0>;
>>
>> I don't think this is a good idea, because this is basically rendering this
>> dts file useless, unless used with a bootloader that can actually inject
>> correct values. I believe that some generic setup could be provided in the
>> dts, so you could at least get the board running.
>
> I won't say that I care a whole lot, but I think that was what was
> agreed upon the other day.  Specifically Tom Rini of U-Boot was
> worried about the fact that U-Boot will read the memory node and
> totally clobber it.  He thought there might be cases where someone
> might _purposely_ not want U-Boot to do that.
>
> ...I would wonder what alternate bootloader you're imagining will
> actually run on this board and not do this?

People should have the freedom to choose anything they want. We have 
also barebox and coreboot with ARM and even Exynos5 support (in 
coreboot), but people might want to use something completely exotic as 
well and the device tree should let them do so.

Best regards,
Tomasz
