From: Arun Kumar K <arunkk.samsung@gmail.com>
Subject: Re: [PATCH] ARM: dts: Add peach-pit board support
Date: Tue, 22 Apr 2014 13:20:43 +0530
Message-ID: <CALt3h7_C8OLUQ9F-7mVusqeEvvAiHfdkP8pYeRcn0184t=W4Gw@mail.gmail.com>
References: <1397971609-6144-1-git-send-email-arun.kk@samsung.com>
	<CAD=FV=W8X71YfONPU_4517qL+vcU0CKaFq5vwJfoHAsH5omL1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f177.google.com ([209.85.128.177]:51422 "EHLO
	mail-ve0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751500AbaDVHuo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 03:50:44 -0400
In-Reply-To: <CAD=FV=W8X71YfONPU_4517qL+vcU0CKaFq5vwJfoHAsH5omL1Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@google.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olofj@google.com>

Hi Doug,

Thank you for the review.

On Tue, Apr 22, 2014 at 4:26 AM, Doug Anderson <dianders@google.com> wrote:
> Arun,
>
> On Sat, Apr 19, 2014 at 10:26 PM, Arun Kumar K <arun.kk@samsung.com> wrote:
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
>
> We should probably make the final number GPIO_ACTIVE_LOW instead of 1.
>  You'll probably need to add this to the top:
>   #include <dt-bindings/gpio/gpio.h>
>

Yes I will use macro directly.

>> +                       linux,code = <116>; /* KEY_POWER */
>
> I believe you can just use KEY_POWER instead of 116 now, though you might need:
>   #include <dt-bindings/input/input.h>
>
> See "tegra124-venice2.dts".
>
>> +                       gpio-key,wakeup;
>> +               };
>> +
>> +               lid-switch {
>> +                       label = "Lid";
>> +                       gpios = <&gpx3 4 1>;
>> +                       linux,input-type = <5>; /* EV_SW */
>> +                       linux,code = <0>; /* SW_LID */
>
> Similar here.  Use #defines directly.

Here there is a small issue as code 0 is reserved.
I should add a new code for SW_LID and use it here.
In that case I think its better to add as a separate patch.

>
>> +                       debounce-interval = <1>;
>> +                       gpio-key,wakeup;
>> +               };
>> +       };
>> +
>> +       rtc@101E0000 {
>> +               status = "okay";
>> +       };
>> +
>> +       serial@12C30000 {
>> +               status = "okay";
>> +       };
>> +
>> +       mmc@12200000 {
>> +               status = "okay";
>> +               num-slots = <1>;
>> +               broken-cd;
>> +               caps2-mmc-hs200-1_8v;
>> +               supports-highspeed;
>> +               non-removable;
>> +               card-detect-delay = <200>;
>> +               clock-frequency = <400000000>;
>> +               samsung,dw-mshc-ciu-div = <3>;
>> +               samsung,dw-mshc-sdr-timing = <0 4>;
>> +               samsung,dw-mshc-ddr-timing = <0 2>;
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
>> +
>> +               slot@0 {
>> +                       reg = <0>;
>> +                       bus-width = <8>;
>> +               };
>> +       };
>> +
>> +       mmc@12220000 {
>> +               status = "okay";
>> +               num-slots = <1>;
>> +               supports-highspeed;
>> +               card-detect-delay = <200>;
>> +               clock-frequency = <400000000>;
>> +               samsung,dw-mshc-ciu-div = <3>;
>> +               samsung,dw-mshc-sdr-timing = <2 3>;
>> +               samsung,dw-mshc-ddr-timing = <1 2>;
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
>> +
>> +               slot@0 {
>> +                       reg = <0>;
>> +                       bus-width = <4>;
>> +               };
>> +       };
>> +
>> +       i2c@12E10000 {
>> +               status = "okay";
>> +               clock-frequency = <400000>;
>> +
>> +               tpm@20 {
>> +                       /* Unused irq; but still need to configure the pins */
>> +                       pinctrl-names = "default";
>> +                       pinctrl-0 = <&tpm_irq>;
>> +
>> +                       compatible = "infineon,slb9645tt";
>> +                       reg = <0x20>;
>
> What happened to "powered-while-suspended"?
>

This property is not yet in mainline driver.

>> +               };
>> +       };
>> +
>> +       spi@12d30000 {
>> +               status = "okay";
>> +               samsung,spi-src-clk = <0>;
>> +               num-cs = <1>;
>> +
>> +               spidev@0 {
>> +                       compatible = "spidev";
>> +                       reg = <0>;
>> +                       spi-max-frequency = <50000000>;
>> +                       pinctrl-names = "default";
>> +                       pinctrl-0 = <&spi_flash_cs>;
>> +
>> +                       controller-data {
>> +                               cs-gpio = <&gpa2 5 0>;
>> +                               samsung,spi-feedback-delay = <2>;
>> +                       };
>> +               };
>> +       };
>> +
>> +       adc@12D10000 {
>
> Actually, this won't work without the vdd-supply (unless you've got
> dummy regulators enabled, which is non-ideal).  I know I suggested
> that maybe adc was ready to go into the device tree, but seeing the
> missing buck makes me think we should wait.
>

Ok will remove the adc nodes for now.

> I also notice that the adc is a little broken on ToT.  I'll try to
> submit another patch to fix.
>
> For when you put this back in: you also are missing the status="okay" line...
>

Sure.

>> +               ncp15wb473@3 {
>> +                       compatible = "ntc,ncp15wb473";
>> +                       pullup-uv = <1800000>;
>> +                       pullup-ohm = <47000>;
>> +                       pulldown-ohm = <0>;
>> +                       io-channels = <&adc 3>;
>> +               };
>> +               ncp15wb473@4 {
>> +                       compatible = "ntc,ncp15wb473";
>> +                       pullup-uv = <1800000>;
>> +                       pullup-ohm = <47000>;
>> +                       pulldown-ohm = <0>;
>> +                       io-channels = <&adc 4>;
>> +               };
>> +               ncp15wb473@5 {
>> +                       compatible = "ntc,ncp15wb473";
>> +                       pullup-uv = <1800000>;
>> +                       pullup-ohm = <47000>;
>> +                       pulldown-ohm = <0>;
>> +                       io-channels = <&adc 5>;
>> +               };
>> +               ncp15wb473@6 {
>> +                       compatible = "ntc,ncp15wb473";
>> +                       pullup-uv = <1800000>;
>> +                       pullup-ohm = <47000>;
>> +                       pulldown-ohm = <0>;
>> +                       io-channels = <&adc 6>;
>> +               };
>> +       };
>> +
>> +       backlight {
>> +               compatible = "pwm-backlight";
>> +               pwms = <&pwm 0 1000000 0>;
>> +               default-brightness-level = <2800>;
>> +               pinctrl-0 = <&backlight_pwm>;
>> +               pinctrl-names = "default";
>> +       };
>> +
>> +       /*
>> +        * Use longest HW watchdog in SoC (32 seconds) since the hardware
>> +        * watchdog provides no debugging information (compared to soft/hard
>> +        * lockup detectors) and so should be last resort.
>> +        */
>> +       watchdog@101D0000 {
>> +               timeout-sec = <32>;
>> +       };
>> +};
>
> Thanks for sending!  My stuffy is mostly nits, so I think we're in
> pretty good shape...
>
>
> BTW: how much of the above have you tested?  I don't think you tested
> the ADC, but hopefully you tested the backlight / watchdog?  Did you
> test the SPI flash?
>

Yes I have tested watchdog, spi flash and backlight.
In case of spi flash, there is an issue with the controller in latest kernel
which needs a fix which will be posted soon.
And in backlight I have missed on property while sending which is
"brightness-levels" which I will correct in v2.

Regards
Arun

>
> -Doug
