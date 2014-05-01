From: Arun Kumar K <arun.kk@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: Add peach-pit board support
Date: Thu, 1 May 2014 13:51:45 +0530
Message-ID: <CALt3h788BN532_e8V1OrFFPfsabgXCmpiBnwfG7jbNQi9YkFZg@mail.gmail.com>
References: <1398313031-14848-1-git-send-email-arun.kk@samsung.com>
	<CAD=FV=VTdi8o+_t+6fY4DqRT_VZDMKeFo3UNxi1UD7HAyHYNCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f174.google.com ([209.85.128.174]:37629 "EHLO
	mail-ve0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752473AbaEAIVq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 May 2014 04:21:46 -0400
In-Reply-To: <CAD=FV=VTdi8o+_t+6fY4DqRT_VZDMKeFo3UNxi1UD7HAyHYNCQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olofj@google.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Tom Rini <trini@ti.com>

Hi Doug,

On Wed, Apr 30, 2014 at 10:18 PM, Doug Anderson <dianders@chromium.org> wrote:
> Arun,
>
> On Wed, Apr 23, 2014 at 9:17 PM, Arun Kumar K <arun.kk@samsung.com> wrote:
>> Adds the google peach-pit board dts file which uses
>> exynos5420 SoC.
>>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>> ---
>> Changes from v1
>> ---------------
>> - Addressed review comments from Doug, Sachin & Tushar
>> - Removed adc and lid-switch nodes
>> ---
>>  arch/arm/boot/dts/Makefile                 |    1 +
>>  arch/arm/boot/dts/exynos5420-peach-pit.dts |  182 ++++++++++++++++++++++++++++
>>  2 files changed, 183 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/exynos5420-peach-pit.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 35c146f..3220e29 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -74,6 +74,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
>>         exynos5250-smdk5250.dtb \
>>         exynos5250-snow.dtb \
>>         exynos5420-arndale-octa.dtb \
>> +       exynos5420-peach-pit.dtb \
>>         exynos5420-smdk5420.dtb \
>>         exynos5440-sd5v1.dtb \
>>         exynos5440-ssdk5440.dtb
>> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>> new file mode 100644
>> index 0000000..fbb0469
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>> @@ -0,0 +1,182 @@
>> +/*
>> + * Google Peach Pit Rev 6+ board device tree source
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
>> +#include "exynos5420.dtsi"
>> +
>> +/ {
>> +       model = "Google Peach Pit Rev 6+";
>> +
>> +       compatible = "google,pit-rev16",
>> +               "google,pit-rev15", "google,pit-rev14",
>> +               "google,pit-rev13", "google,pit-rev12",
>> +               "google,pit-rev11", "google,pit-rev10",
>> +               "google,pit-rev9", "google,pit-rev8",
>> +               "google,pit-rev7", "google,pit-rev6",
>> +               "google,pit", "google,peach","samsung,exynos5420",
>> +               "samsung,exynos5";
>> +
>> +       memory {
>> +               reg = <0x20000000 0x80000000>;
>> +       };
>
> One other thing that came up at ELC: it might not be so wise to
> include actual values here.  We're expecting that the bootloader will
> probe memory and tell you whether you're on a 2GB board or a 4GB
> board.  IIRC the proper thing to do here is to use 0 for both, so:
>
> reg = <0 0>;
>

Ok I will make this change.
With this change can I have your Reviewed-by on the v3 patchset?

Regards
Arun

> -Doug
