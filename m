From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] ARM: dts: Add peach-pi board support
Date: Fri, 2 May 2014 11:31:20 -0700
Message-ID: <CAD=FV=XYjMg7V9=OzAy_ifwaM83QS0tiTrp5+nxvG236kkSjRQ@mail.gmail.com>
References: <1399035821-25096-1-git-send-email-arun.kk@samsung.com>
	<1399035821-25096-4-git-send-email-arun.kk@samsung.com>
	<5363D176.80601@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:62744 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752794AbaEBSbU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 14:31:20 -0400
Received: by mail-ob0-f180.google.com with SMTP id va2so2966218obc.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 May 2014 11:31:20 -0700 (PDT)
In-Reply-To: <5363D176.80601@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olofj@google.com>, Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Arun Kumar <arunkk.samsung@gmail.com>

Tomasz,

On Fri, May 2, 2014 at 10:10 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Arun,
>
>
> On 02.05.2014 15:03, Arun Kumar K wrote:
>>
>> Adds support for google peach-pi board having the
>> Exynos5800 SoC.
>>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>> ---
>>   arch/arm/boot/dts/Makefile                |    3 +-
>>   arch/arm/boot/dts/exynos5800-peach-pi.dts |  144
>> +++++++++++++++++++++++++++++
>>   2 files changed, 146 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/arm/boot/dts/exynos5800-peach-pi.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 35c146f..efe1573 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -76,7 +76,8 @@ dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
>>         exynos5420-arndale-octa.dtb \
>>         exynos5420-smdk5420.dtb \
>>         exynos5440-sd5v1.dtb \
>> -       exynos5440-ssdk5440.dtb
>> +       exynos5440-ssdk5440.dtb \
>> +       exynos5800-peach-pi.dtb
>>   dtb-$(CONFIG_ARCH_HI3xxx) += hi3620-hi4511.dtb
>>   dtb-$(CONFIG_ARCH_HIGHBANK) += highbank.dtb \
>>         ecx-2000.dtb
>> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> new file mode 100644
>> index 0000000..e0f8633
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> @@ -0,0 +1,144 @@
>> +/*
>> + * Google Peach Pi Rev 10+ board device tree source
>> + *
>> + * Copyright (c) 2014 Google, Inc
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +/dts-v1/;
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include "exynos5800.dtsi"
>> +
>> +/ {
>> +       model = "Google Peach Pi Rev 10+";
>> +
>> +       compatible = "google,pi-rev16",
>> +               "google,pi-rev15", "google,pi-rev14",
>> +               "google,pi-rev13", "google,pi-rev12",
>> +               "google,pi-rev11", "google,pi-rev10",
>> +               "google,pi", "google,peach", "samsung,exynos5800",
>> +               "samsung,exynos5";
>
>
> I can see this board using the "google,peach" compatible string, which is
> the same as one listed for peach-pit board. Since they are based on
> different SoCs, are they really compatible?

I'd like to see "google,peach" continue to be here but won't fight too
strongly if it's rejected.  The pit and pi boards are incredibly
similar to each other.  They have a 380 point difference in their
processor and a few minor peripheral differences, but not a lot else.

I could totally imagine some code somewhere wanting to know if this
board is compatible with "google,peach" just like you can imagine code
somewhere wanting to know if this is compatible with
"samsung,exynos5".

Potentially you could swap the order of "google,peach" and
"samsung,exynos5800" though...


>> +
>> +       memory {
>> +               reg = <0 0>;
>
> I don't think this is a good idea, because this is basically rendering this
> dts file useless, unless used with a bootloader that can actually inject
> correct values. I believe that some generic setup could be provided in the
> dts, so you could at least get the board running.

I won't say that I care a whole lot, but I think that was what was
agreed upon the other day.  Specifically Tom Rini of U-Boot was
worried about the fact that U-Boot will read the memory node and
totally clobber it.  He thought there might be cases where someone
might _purposely_ not want U-Boot to do that.

...I would wonder what alternate bootloader you're imagining will
actually run on this board and not do this?


In any case, if people don't like it then we can get rid of it IMHO.

-Doug
