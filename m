From: Arun Kumar K <arunkk.samsung@gmail.com>
Subject: Re: [PATCH] ARM: dts: Add peach-pit board support
Date: Tue, 22 Apr 2014 12:01:23 +0530
Message-ID: <CALt3h79bZGBFCykW9maw1pM0hZnjkYt5nZPO9t881=mn+Hqn6g@mail.gmail.com>
References: <1397971609-6144-1-git-send-email-arun.kk@samsung.com>
	<CAK9yfHxxkF_=8phxO8dim6F_BCbYcbsGQHPE4jBaQh=sLoFyvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f179.google.com ([209.85.220.179]:61538 "EHLO
	mail-vc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751933AbaDVGbY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 02:31:24 -0400
In-Reply-To: <CAK9yfHxxkF_=8phxO8dim6F_BCbYcbsGQHPE4jBaQh=sLoFyvg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@google.com>, Olof Johansson <olofj@google.com>

Hi Sachin,

Thank you for the review.
Will address you comments and post the next version.

Regards
Arun

On Mon, Apr 21, 2014 at 10:59 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Hi Arun,
>
> On 20 April 2014 10:56, Arun Kumar K <arun.kk@samsung.com> wrote:
>> Adds the google peach-pit board dts file which uses
>> exynos5420 SoC.
>>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>> ---
>>  arch/arm/boot/dts/Makefile                 |    1 +
>>  arch/arm/boot/dts/exynos5420-peach-pit.dts |  225 ++++++++++++++++++++++++++++
>>  2 files changed, 226 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/exynos5420-peach-pit.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index b9d6a8b..09bcb8d 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -74,6 +74,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
>>         exynos5250-snow.dtb \
>>         exynos5420-arndale-octa.dtb \
>>         exynos5420-smdk5420.dtb \
>> +       exynos5420-peach-pit.dtb \
>
> Please arrange alphabetically. This should be added above smdk.
>
>>         exynos5440-sd5v1.dtb \
>>         exynos5440-ssdk5440.dtb
>>  dtb-$(CONFIG_ARCH_HI3xxx) += hi3620-hi4511.dtb
>> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>> new file mode 100644
>> index 0000000..4d61a5e
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>> @@ -0,0 +1,225 @@
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
>> +               "google,pit", "google,peach", "samsung,exynos5420";
>
> Please include the generic "samsung,exynos5" string.
>
>> +
>> +       memory {
>> +               reg = <0x20000000 0x80000000>;
>> +       };
>> +
>> +       fixed-rate-clocks {
>> +               oscclk {
>> +                       compatible = "samsung,exynos5420-oscclk";
>> +                       clock-frequency = <24000000>;
>> +               };
>> +       };
>> +
>> +       pinctrl@13400000 {
>> +               lid_irq: lid-irq {
>> +                       samsung,pins = "gpx3-4";
>> +                       samsung,pin-function = <0>;
>> +                       samsung,pin-pud = <0>;
>> +                       samsung,pin-drv = <0>;
>> +               };
>> +
>> +               power_key_irq: power-key-irq {
>> +                       samsung,pins = "gpx1-2";
>> +                       samsung,pin-function = <0>;
>> +                       samsung,pin-pud = <0>;
>> +                       samsung,pin-drv = <0>;
>> +               };
>> +
>> +               tpm_irq: tpm-irq {
>> +                       samsung,pins = "gpx1-0";
>> +                       samsung,pin-function = <0>;
>> +                       samsung,pin-pud = <0>;
>> +                       samsung,pin-drv = <0>;
>> +               };
>> +       };
>> +
>> +       pinctrl@14010000 {
>> +               spi_flash_cs: spi-flash-cs {
>> +                       samsung,pins = "gpa2-5";
>> +                       samsung,pin-function = <1>;
>> +                       samsung,pin-pud = <0>;
>> +                       samsung,pin-drv = <3>;
>> +               };
>> +
>> +               backlight_pwm: backlight-pwm {
>> +                       samsung,pins = "gpb2-0";
>> +                       samsung,pin-function = <2>;
>> +                       samsung,pin-pud = <0>;
>> +                       samsung,pin-drv = <0>;
>> +               };
>> +       };
>> +
>> +       gpio-keys {
>> +               compatible = "gpio-keys";
>> +
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&power_key_irq &lid_irq>;
>> +
>> +               power {
>> +                       label = "Power";
>> +                       gpios = <&gpx1 2 1>;
>> +                       linux,code = <116>; /* KEY_POWER */
>
> You may use the macro directly (instead of code) by including the
> appropriate header file
> (include/dt-bindings/input/input.h).
>
>
> --
> With warm regards,
> Sachin
