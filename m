From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 3/4] ARM: dts: add Samsung's exynos4412-based midas
 boards
Date: Wed, 17 Jan 2018 20:31:22 +0100
Message-ID: <20180117193122.olbfycmuyps5usur@kozik-lap>
References: <20180117125845.3954-1-simon@lineageos.org>
 <20180117125845.3954-4-simon@lineageos.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34983 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753787AbeAQTb0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 Jan 2018 14:31:26 -0500
Content-Disposition: inline
In-Reply-To: <20180117125845.3954-4-simon@lineageos.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Simon Shields <simon@lineageos.org>
Cc: linux-samsung-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?utf-8?Q?Bart=C5=82omiej_=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>

On Wed, Jan 17, 2018 at 11:58:44PM +1100, Simon Shields wrote:
> "midas" is the codename for a family of smartphones released by Samsung
> Mobile. It includes the Galaxy S3 (GT-I9300/I9305) and the Galaxy
> Note 2 (GT-N7100/N7105). The boards largely have the same peripherals:
> the main differences are touchscreen, display panel and cellular modem.
> 
> Signed-off-by: Simon Shields <simon@lineageos.org>
> ---
>  arch/arm/boot/dts/Makefile             |  3 ++
>  arch/arm/boot/dts/exynos4412-i9300.dts | 22 +++++++++++++
>  arch/arm/boot/dts/exynos4412-i9305.dts | 20 ++++++++++++
>  arch/arm/boot/dts/exynos4412-n710x.dts | 59 ++++++++++++++++++++++++++++++++++
>  4 files changed, 104 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos4412-i9300.dts
>  create mode 100644 arch/arm/boot/dts/exynos4412-i9305.dts
>  create mode 100644 arch/arm/boot/dts/exynos4412-n710x.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 66e28af289da..955ef9df1b6b 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -163,7 +163,10 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
>  	exynos4210-smdkv310.dtb \
>  	exynos4210-trats.dtb \
>  	exynos4210-universal_c210.dtb \
> +	exynos4412-i9300.dtb \
> +	exynos4412-i9305.dtb \
>  	exynos4412-itop-elite.dtb \
> +	exynos4412-n710x.dtb \
>  	exynos4412-odroidu3.dtb \
>  	exynos4412-odroidx.dtb \
>  	exynos4412-odroidx2.dtb \
> diff --git a/arch/arm/boot/dts/exynos4412-i9300.dts b/arch/arm/boot/dts/exynos4412-i9300.dts
> new file mode 100644
> index 000000000000..f8125a945f8d
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos4412-i9300.dts
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung's Exynos4412 based M0 (GT-I9300) board device tree source
> + *
> + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + */
> +
> +/dts-v1/;
> +#include "exynos4412-galaxy-s3.dtsi"
> +
> +/ {
> +	model = "Samsung Galaxy S3 (GT-I9300) based on Exynos4412";
> +	compatible = "samsung,i9300", "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
> +
> +	/* bootargs are passed in by bootloader */
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg =  <0x40000000 0x40000000>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/exynos4412-i9305.dts b/arch/arm/boot/dts/exynos4412-i9305.dts
> new file mode 100644
> index 000000000000..54a2a55dbf70
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos4412-i9305.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +#include "exynos4412-galaxy-s3.dtsi"
> +
> +/ {
> +	model = "Samsung Galaxy S3 (GT-I9305) based on Exynos4412";
> +	compatible = "samsung,i9305", "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
> +
> +	/* bootargs are passed in by bootloader */
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg =  <0x40000000 0x80000000>;
> +	};
> +};
> +
> +&i2c0_bus {
> +	/* SCL and SDA pins are swapped */
> +	samsung,pins = "gpd1-1", "gpd1-0";
> +};
> diff --git a/arch/arm/boot/dts/exynos4412-n710x.dts b/arch/arm/boot/dts/exynos4412-n710x.dts
> new file mode 100644
> index 000000000000..b64aa9b61763
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos4412-n710x.dts
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: GPL-2.0

Here, and in other files in this patchset you can add your own
copyrights/authorship if you wish. If you do not wish, there is no
problem from my side.

> +/dts-v1/;
> +#include "exynos4412-midas.dtsi"
> +
> +/ {
> +	compatible = "samsung,n710x", "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
> +	model = "Samsung Galaxy Note 2 (GT-N7100, GT-N7105) based on Exynos4412";
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg =  <0x40000000 0x80000000>;
> +	};
> +
> +	/* bootargs are passed in by bootloader */
> +
> +	regulators {
> +		cam_vdda_reg: voltage-regulator-9 {
> +			compatible = "regulator-fixed";
> +			regulator-name = "CAM_SENSOR_CORE_1.2V";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			gpio = <&gpm4 1 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +		};
> +	};
> +};
> +
> +&buck9_reg {
> +	maxim,ena-gpios = <&gpm1 0 GPIO_ACTIVE_HIGH>;
> +	status = "okay";

Without status.

> +};
> +
> +&cam_af_reg {
> +	gpio = <&gpm1 1 GPIO_ACTIVE_HIGH>;
> +	status = "okay";
> +};
> +
> +&cam_io_reg {
> +	gpio = <&gpm0 7 GPIO_ACTIVE_HIGH>;
> +	status = "okay";
> +};
> +
> +&ldo13_reg {
> +	regulator-name = "VCC_1.8V_LCD";
> +	regulator-always-on;
> +};
> +
> +&ldo25_reg {
> +	regulator-name = "VCI_3.0V_LCD";
> +	regulator-min-microvolt = <3000000>;
> +	regulator-max-microvolt = <3000000>;
> +	status = "okay";

Without status.

Best regards,
Krzysztof


> +};
> +
> +&s5c73m3 {
> +	standby-gpios = <&gpm0 6 GPIO_ACTIVE_LOW>;   /* ISP_STANDBY */
> +	vdda-supply = <&cam_vdda_reg>;
> +	status = "okay";
> +};
> -- 
> 2.15.1
> 
