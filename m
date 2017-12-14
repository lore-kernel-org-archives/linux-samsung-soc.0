From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/4] ARM: dts: split trats2 dts in preparation for
 midas boards
Date: Thu, 14 Dec 2017 14:44:49 +0100
Message-ID: <CAJKOXPfcUkF=b27OF4zmj7K0KQfBHbY-QwOUKU6RHy+4gBu1Zg@mail.gmail.com>
References: <20171214125015.2611-1-simon@lineageos.org> <20171214125015.2611-3-simon@lineageos.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752772AbdLNNow (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 08:44:52 -0500
In-Reply-To: <20171214125015.2611-3-simon@lineageos.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Simon Shields <simon@lineageos.org>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>

On Thu, Dec 14, 2017 at 1:50 PM, Simon Shields <simon@lineageos.org> wrote:
> The midas boards share a lot with trats2. Split the common parts
> out of trats2 into a common midas dtsi and a common "galaxy s3" dts.
>
> Signed-off-by: Simon Shields <simon@lineageos.org>
> ---
>  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi |  144 +++
>  arch/arm/boot/dts/exynos4412-midas.dtsi     | 1291 +++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos4412-trats2.dts     | 1364 +--------------------------

Manual review whether you copied the contents directly or with any
errors would be a quite big task. Run format-patch with -B30% or try
to experiment with other options (most important is -B, but also you
can play with -M and -C).

>  3 files changed, 1441 insertions(+), 1358 deletions(-)
>  create mode 100644 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
>  create mode 100644 arch/arm/boot/dts/exynos4412-midas.dtsi
>
> diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> new file mode 100644
> index 000000000000..088e8d7fa257
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> @@ -0,0 +1,144 @@
> +// SPDX-License-Identifier: GPL-2.0

You need to retain original copyrights because the contents is directly copied.

> +/dts-v1/;
> +#include "exynos4412-midas.dtsi"
> +
> +/ {
> +       regulators {
> +               lcd_vdd3_reg: voltage-regulator-10 {
> +                       compatible = "regulator-fixed";
> +                       regulator-name = "LCD_VDD_2.2V";
> +                       regulator-min-microvolt = <2200000>;
> +                       regulator-max-microvolt = <2200000>;
> +                       enable-active-high;
> +                       gpio = <&gpc0 1 GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               ps_als_reg: voltage-regulator-11 {
> +                       compatible = "regulator-fixed";
> +                       regulator-name = "LED_A_3.0V";
> +                       regulator-min-microvolt = <3000000>;
> +                       regulator-max-microvolt = <3000000>;
> +                       enable-active-high;
> +                       gpio = <&gpj0 5 GPIO_ACTIVE_HIGH>;
> +               };
> +       };
> +
> +       i2c_ak8975: i2c-gpio-10 {
> +               compatible = "i2c-gpio";
> +               gpios = <&gpy2 4 GPIO_ACTIVE_HIGH>, <&gpy2 5 GPIO_ACTIVE_HIGH>;
> +               i2c-gpio,delay-us = <2>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               ak8975@c {
> +                       compatible = "asahi-kasei,ak8975";
> +                       reg = <0x0c>;
> +                       gpios = <&gpj0 7 GPIO_ACTIVE_HIGH>;
> +               };
> +       };
> +
> +       i2c_cm36651: i2c-gpio-11 {
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
> +       vddcore-supply = <&ldo8_reg>;
> +       vddio-supply = <&ldo10_reg>;
> +       samsung,burst-clock-frequency = <500000000>;
> +       samsung,esc-clock-frequency = <20000000>;
> +       samsung,pll-clock-frequency = <24000000>;
> +       status = "okay";
> +
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
> +       samsung,i2c-sda-delay = <100>;
> +       samsung,i2c-slave-addr = <0x10>;
> +       samsung,i2c-max-bus-freq = <400000>;
> +       pinctrl-0 = <&i2c3_bus>;
> +       pinctrl-names = "default";
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
> +&ldo17_reg {
> +       regulator-name = "CAM_SENSOR_CORE_1.2V";
> +       regulator-min-microvolt = <1200000>;
> +       regulator-max-microvolt = <1200000>;
> +};
> +
> +&ldo25_reg {
> +       regulator-name = "LCD_VCC_3.3V";
> +       regulator-min-microvolt = <3300000>;
> +       regulator-max-microvolt = <3300000>;
> +};
> +
> diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
> new file mode 100644
> index 000000000000..ad2824933951
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
> @@ -0,0 +1,1291 @@
> +// SPDX-License-Identifier: GPL-2.0

You need to retain original copyrights because the contents is directly copied.

Quickly looking at other differences this seems to be a rewrite, not a
copy. Basically you are changing Trats2 without mentioning even the
changes.

I did not run dtx_diff but I have doubts that it is okay. I expect the
same output between two DTBs (if not the same then at least equivalent
from functional point of view).

Best regards,
Krzysztof
