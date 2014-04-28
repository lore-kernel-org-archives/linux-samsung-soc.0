From: Arun Kumar K <arunkk.samsung@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: Add peach-pit board support
Date: Mon, 28 Apr 2014 09:52:59 +0530
Message-ID: <CALt3h7_dZMv2zfpEmdGZYojZRnaXpCDzwVE4T1N0H6JuE7Q7Lw@mail.gmail.com>
References: <1398313031-14848-1-git-send-email-arun.kk@samsung.com>
	<535B9944.8090503@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f173.google.com ([209.85.128.173]:41890 "EHLO
	mail-ve0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752290AbaD1EXA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Apr 2014 00:23:00 -0400
In-Reply-To: <535B9944.8090503@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olofj@google.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@secretlab.ca>

Hi Tomasz,

On Sat, Apr 26, 2014 at 5:02 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Arun,
>
>
> On 24.04.2014 06:17, Arun Kumar K wrote:
>>
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
>>   arch/arm/boot/dts/Makefile                 |    1 +
>>   arch/arm/boot/dts/exynos5420-peach-pit.dts |  182
>> ++++++++++++++++++++++++++++
>>   2 files changed, 183 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/exynos5420-peach-pit.dts
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
>> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts
>> b/arch/arm/boot/dts/exynos5420-peach-pit.dts
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
>
>
> Do you really need so many compatible strings here? Furthermore, are all the
> newer revisions really fully backwards compatible with older ones?
>

AFAIK, these multiple board revisions exist and are backwards compatible.

> Also, do you have a way to check the revision in hardware, e.g. by some GPIO
> pins? If so, I don't think there would be any need to revision number as a
> part of compatible string.
>

I am not very sure about that.
Doug, Can you give some clarity on this?

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
>
>
> Please convert this dts file into reference-based syntax. It has multiple
> advantages over the legacy way of replicating full paths every time a node
> needs to be updated.
>

Ok will change it to reference-based.

> You can see other dts files for examples how this can be used, e.g.
> s3c64*.dts* (for a quite simple setup), imx6*.dts* (for more complex
> things), etc.
>
>
>> +               tpm_irq: tpm-irq {
>> +                       samsung,pins = "gpx1-0";
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
>> +               pinctrl-0 = <&power_key_irq>;
>> +
>> +               power {
>> +                       label = "Power";
>> +                       gpios = <&gpx1 2 GPIO_ACTIVE_LOW>;
>> +                       linux,code = <KEY_POWER>;
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
>> +                       /* Unused irq; but still need to configure the
>> pins */
>> +                       pinctrl-names = "default";
>> +                       pinctrl-0 = <&tpm_irq>;
>
>
> nit: Please move the pinctrl properties below compatible and reg, as this is
> more readable and consistent with other nodes.
>

Ok will do that.

>
>> +
>> +                       compatible = "infineon,slb9645tt";
>> +                       reg = <0x20>;
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
>
>
> Hmm, is this really a physical device? Shouldn't this have some kind of real
> compatible string first? Also I'm not even sure if "spidev" is supposed to
> be used like this, especially considering that this compatible string isn't
> even documented in Documentation/devicetree/bindings. (Rob, Mark, Grant, any
> opinions on this?)
>

Yes this is a flash memory sitting on the spi bus.
All its operations are standard ones and handled by spidev.
spidev still dont have an of_match_table and so its used like this.
Please let me know about the right way of using this.

Regards
Arun

> Best regards,
> Tomasz
