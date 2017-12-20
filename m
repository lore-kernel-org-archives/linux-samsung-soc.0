From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/4] ARM: dts: split trats2 DTS in preparation for
 midas boards
Date: Wed, 20 Dec 2017 15:05:18 +0100
Message-ID: <CAJKOXPdzAvsaAOo6P+UA8VWYd7YjmtSqtkyKtNaz7jNdUXUH4A@mail.gmail.com>
References: <20171218123805.26345-1-simon@lineageos.org> <20171218123805.26345-3-simon@lineageos.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754664AbdLTOFV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 09:05:21 -0500
In-Reply-To: <20171218123805.26345-3-simon@lineageos.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Simon Shields <simon@lineageos.org>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>

On Mon, Dec 18, 2017 at 1:38 PM, Simon Shields <simon@lineageos.org> wrote:
> The midas boards share a lot with trats2. Split the common parts
> out of trats2 into a common midas dtsi and a common "galaxy s3" dts.
>
> Signed-off-by: Simon Shields <simon@lineageos.org>
> ---
>  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi        |  145 ++
>  ...exynos4412-trats2.dts => exynos4412-midas.dtsi} |  117 +-
>  arch/arm/boot/dts/exynos4412-trats2.dts            | 1446 +-------------------
>  3 files changed, 184 insertions(+), 1524 deletions(-)
>  create mode 100644 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
>  copy arch/arm/boot/dts/{exynos4412-trats2.dts => exynos4412-midas.dtsi} (92%)
>  rewrite arch/arm/boot/dts/exynos4412-trats2.dts (97%)
>
> diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> new file mode 100644
> index 000000000000..2806236484a6
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> @@ -0,0 +1,145 @@
> +/*
> + * Samsung's Exynos4412 based Galaxy S3 board device tree source
> + *
> + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
> + *             http://www.samsung.com
> + *
> + * Device tree source file for Samsung's Galaxy S3 boards which are based on
> + * Samsung's Exynos4412 SoC.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */

One new line to make it consistent with others.

> +/dts-v1/;
> +#include "exynos4412-midas.dtsi"
> +
> +/ {
> +       aliases {
> +               i2c9 = &i2c_ak8975;
> +               i2c10 = &i2c_cm36651;
> +       };
> +
> +       regulators {
> +               lcd_vdd3_reg: voltage-regulator-2 {
> +                       compatible = "regulator-fixed";
> +                       regulator-name = "LCD_VDD_2.2V";
> +                       regulator-min-microvolt = <2200000>;
> +                       regulator-max-microvolt = <2200000>;
> +                       gpio = <&gpc0 1 GPIO_ACTIVE_HIGH>;
> +                       enable-active-high;
> +               };
> +
> +               ps_als_reg: voltage-regulator-5 {
> +                       compatible = "regulator-fixed";
> +                       regulator-name = "LED_A_3.0V";
> +                       regulator-min-microvolt = <3000000>;
> +                       regulator-max-microvolt = <3000000>;
> +                       gpio = <&gpj0 5 GPIO_ACTIVE_HIGH>;
> +                       enable-active-high;
> +               };
> +       };
> +
> +       i2c_ak8975: i2c-gpio-0 {
> +               compatible = "i2c-gpio";
> +               gpios = <&gpy2 4 GPIO_ACTIVE_HIGH>, <&gpy2 5 GPIO_ACTIVE_HIGH>;
> +               i2c-gpio,delay-us = <2>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               status = "okay";
> +
> +               ak8975@c {
> +                       compatible = "asahi-kasei,ak8975";
> +                       reg = <0x0c>;
> +                       gpios = <&gpj0 7 GPIO_ACTIVE_HIGH>;
> +               };
> +       };
> +
> +       i2c_cm36651: i2c-gpio-2 {
> +               compatible = "i2c-gpio";
> +               gpios = <&gpf0 0 GPIO_ACTIVE_LOW>, <&gpf0 1 GPIO_ACTIVE_LOW>;
> +               i2c-gpio,delay-us = <2>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cm36651@18 {
> +                       compatible = "capella,cm36651";
> +                       reg = <0x18>;
> +                       interrupt-parent = <&gpx0>;
> +                       interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> +                       vled-supply = <&ps_als_reg>;
> +               };
> +       };
> +};
> +
> +&buck9_reg {
> +       maxim,ena-gpios = <&gpm0 3 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&cam_af_reg {
> +       gpio = <&gpm0 4 GPIO_ACTIVE_HIGH>;
> +       status = "okay";
> +};
> +
> +&cam_io_reg {
> +       gpio = <&gpm0 2 GPIO_ACTIVE_HIGH>;
> +       status = "okay";
> +};
> +
> +&dsi_0 {
> +       status = "okay";

One new line.

> +       panel@0 {
> +               compatible = "samsung,s6e8aa0";
> +               reg = <0>;
> +               vdd3-supply = <&lcd_vdd3_reg>;
> +               vci-supply = <&ldo25_reg>;
> +               reset-gpios = <&gpf2 1 GPIO_ACTIVE_HIGH>;
> +               power-on-delay= <50>;
> +               reset-delay = <100>;
> +               init-delay = <100>;
> +               flip-horizontal;
> +               flip-vertical;
> +               panel-width-mm = <58>;
> +               panel-height-mm = <103>;
> +
> +               display-timings {
> +                       timing-0 {
> +                               clock-frequency = <57153600>;
> +                               hactive = <720>;
> +                               vactive = <1280>;
> +                               hfront-porch = <5>;
> +                               hback-porch = <5>;
> +                               hsync-len = <5>;
> +                               vfront-porch = <13>;
> +                               vback-porch = <1>;
> +                               vsync-len = <2>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c_0 {
> +       status = "okay";
> +};
> +
> +&i2c_3 {
> +       status = "okay";
> +
> +       mms114-touchscreen@48 {
> +               compatible = "melfas,mms114";
> +               reg = <0x48>;
> +               interrupt-parent = <&gpm2>;
> +               interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> +               x-size = <720>;
> +               y-size = <1280>;
> +               avdd-supply = <&ldo23_reg>;
> +               vdd-supply = <&ldo24_reg>;
> +       };
> +};
> +
> +&ldo25_reg {
> +       regulator-name = "LCD_VCC_3.3V";
> +       regulator-min-microvolt = <2800000>;
> +       regulator-max-microvolt = <2800000>;
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-midas.dtsi
> similarity index 92%
> copy from arch/arm/boot/dts/exynos4412-trats2.dts
> copy to arch/arm/boot/dts/exynos4412-midas.dtsi
> index f285790e8e04..384767a34fa7 100644
> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> +++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
> @@ -10,7 +10,7 @@
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License version 2 as
>   * published by the Free Software Foundation.
> -*/
> + */
>
>  /dts-v1/;
>  #include "exynos4412.dtsi"
> @@ -25,19 +25,11 @@
>         compatible = "samsung,trats2", "samsung,exynos4412", "samsung,exynos4";

This looks incorrect. Not every midas board is trats2... Unless that
was left here for compatibility purpose but then it would be good to
see explanation.

>
>         aliases {
> -               i2c9 = &i2c_ak8975;
> -               i2c10 = &i2c_cm36651;
>                 i2c11 = &i2c_max77693;
>                 i2c12 = &i2c_max77693_fuel;
>         };
>
> -       memory@40000000 {
> -               device_type = "memory";
> -               reg =  <0x40000000 0x40000000>;
> -       };
> -
>         chosen {
> -               bootargs = "console=ttySAC2,115200N8 root=/dev/mmcblk0p5 rootwait earlyprintk panic=5";
>                 stdout-path = &serial_2;
>         };
>
> @@ -68,17 +60,8 @@
>                         regulator-name = "CAM_SENSOR_A";
>                         regulator-min-microvolt = <2800000>;
>                         regulator-max-microvolt = <2800000>;
> -                       gpio = <&gpm0 2 GPIO_ACTIVE_HIGH>;
> -                       enable-active-high;
> -               };
> -
> -               lcd_vdd3_reg: voltage-regulator-2 {
> -                       compatible = "regulator-fixed";
> -                       regulator-name = "LCD_VDD_2.2V";
> -                       regulator-min-microvolt = <2200000>;
> -                       regulator-max-microvolt = <2200000>;
> -                       gpio = <&gpc0 1 GPIO_ACTIVE_HIGH>;
>                         enable-active-high;
> +                       status = "disabled";

Why disabled?

>                 };
>
>                 cam_af_reg: voltage-regulator-3 {
> @@ -86,17 +69,8 @@
>                         regulator-name = "CAM_AF";
>                         regulator-min-microvolt = <2800000>;
>                         regulator-max-microvolt = <2800000>;
> -                       gpio = <&gpm0 4 GPIO_ACTIVE_HIGH>;
> -                       enable-active-high;
> -               };
> -
> -               ps_als_reg: voltage-regulator-5 {
> -                       compatible = "regulator-fixed";
> -                       regulator-name = "LED_A_3.0V";
> -                       regulator-min-microvolt = <3000000>;
> -                       regulator-max-microvolt = <3000000>;
> -                       gpio = <&gpj0 5 GPIO_ACTIVE_HIGH>;
>                         enable-active-high;
> +                       status = "disabled";

Why disabled?

>                 };
>
>                 vsil12: voltage-regulator-6 {
> @@ -227,37 +201,6 @@
>                 };
>         };
>
> -       i2c_ak8975: i2c-gpio-0 {
> -               compatible = "i2c-gpio";
> -               gpios = <&gpy2 4 GPIO_ACTIVE_HIGH>, <&gpy2 5 GPIO_ACTIVE_HIGH>;
> -               i2c-gpio,delay-us = <2>;
> -               #address-cells = <1>;
> -               #size-cells = <0>;
> -               status = "okay";
> -
> -               ak8975@c {
> -                       compatible = "asahi-kasei,ak8975";
> -                       reg = <0x0c>;
> -                       gpios = <&gpj0 7 GPIO_ACTIVE_HIGH>;
> -               };
> -       };
> -
> -       i2c_cm36651: i2c-gpio-2 {
> -               compatible = "i2c-gpio";
> -               gpios = <&gpf0 0 GPIO_ACTIVE_LOW>, <&gpf0 1 GPIO_ACTIVE_LOW>;
> -               i2c-gpio,delay-us = <2>;
> -               #address-cells = <1>;
> -               #size-cells = <0>;
> -
> -               cm36651@18 {
> -                       compatible = "capella,cm36651";
> -                       reg = <0x18>;
> -                       interrupt-parent = <&gpx0>;
> -                       interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> -                       vled-supply = <&ps_als_reg>;
> -               };
> -       };
> -
>         i2c-mhl {
>                 compatible = "i2c-gpio";
>                 gpios = <&gpf0 4 GPIO_ACTIVE_HIGH>, <&gpf0 6 GPIO_ACTIVE_HIGH>;
> @@ -296,8 +239,6 @@
>                                   <&clock CLK_MOUT_CAM1>;
>                 assigned-clock-parents = <&clock CLK_XUSBXTI>,
>                                          <&clock CLK_XUSBXTI>;
> -
> -
>         };
>
>         wlan_pwrseq: sdhci3-pwrseq {
> @@ -454,36 +395,7 @@
>         samsung,burst-clock-frequency = <500000000>;
>         samsung,esc-clock-frequency = <20000000>;
>         samsung,pll-clock-frequency = <24000000>;
> -       status = "okay";
> -
> -       panel@0 {
> -               compatible = "samsung,s6e8aa0";
> -               reg = <0>;
> -               vdd3-supply = <&lcd_vdd3_reg>;
> -               vci-supply = <&ldo25_reg>;
> -               reset-gpios = <&gpf2 1 GPIO_ACTIVE_HIGH>;
> -               power-on-delay= <50>;
> -               reset-delay = <100>;
> -               init-delay = <100>;
> -               flip-horizontal;
> -               flip-vertical;
> -               panel-width-mm = <58>;
> -               panel-height-mm = <103>;
> -
> -               display-timings {
> -                       timing-0 {
> -                               clock-frequency = <57153600>;
> -                               hactive = <720>;
> -                               vactive = <1280>;
> -                               hfront-porch = <5>;
> -                               hback-porch = <5>;
> -                               hsync-len = <5>;
> -                               vfront-porch = <13>;
> -                               vback-porch = <1>;
> -                               vsync-len = <2>;
> -                       };
> -               };
> -       };
> +       status = "disabled";

It is already disabled by exynos4.dtsi, no need to duplicate properties.

>  };
>
>  &exynos_usbphy {
> @@ -603,7 +515,7 @@
>         samsung,i2c-max-bus-freq = <400000>;
>         pinctrl-0 = <&i2c0_bus>;
>         pinctrl-names = "default";
> -       status = "okay";
> +       status = "disabled";

I do not get this node. It sits in midas.dtsi and s3.dtsi just enables
it. Why not enabling it here?

>         s5c73m3@3c {
>                 compatible = "samsung,s5c73m3";
> @@ -635,18 +547,7 @@
>         samsung,i2c-max-bus-freq = <400000>;
>         pinctrl-0 = <&i2c3_bus>;
>         pinctrl-names = "default";
> -       status = "okay";
> -
> -       mms114-touchscreen@48 {
> -               compatible = "melfas,mms114";
> -               reg = <0x48>;
> -               interrupt-parent = <&gpm2>;
> -               interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> -               x-size = <720>;
> -               y-size = <1280>;
> -               avdd-supply = <&ldo23_reg>;
> -               vdd-supply = <&ldo24_reg>;
> -       };
> +       status = "disabled";
>  };
>
>  &i2c_4 {
> @@ -827,6 +728,7 @@
>                                 regulator-name = "CAM_SENSOR_CORE_1.2V";
>                                 regulator-min-microvolt = <1200000>;
>                                 regulator-max-microvolt = <1200000>;
> +                               status = "okay";

Regulator should not be disabled or enabled. It is not a device. I do
not get the logic behind...

The ''status = disabled" usually is added in DTSI files to nodes which
are not fully configured at this point, e.g. they require external
resources (clocks, regulators). These external resources will be
provided when extending in DTS (or further DTSI) while enabling it.
However regulator has always all necessary resources.

>                         };
>
>                         ldo18_reg: LDO18 {
> @@ -874,9 +776,7 @@
>                         };
>
>                         ldo25_reg: LDO25 {
> -                               regulator-name = "LCD_VCC_3.3V";
> -                               regulator-min-microvolt = <2800000>;
> -                               regulator-max-microvolt = <2800000>;
> +                               status = "disabled";

Ditto.

Best regards,
Krzysztof
