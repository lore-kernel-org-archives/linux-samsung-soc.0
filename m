From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 3/4] ARM: dts: add Samsung's exynos4412-based midas boards
Date: Wed, 20 Dec 2017 15:08:27 +0100
Message-ID: <CAJKOXPf4H6kSXJCSaVBPr9G1yNw9FjCUT+fox2V++Nyrco5bQA@mail.gmail.com>
References: <20171218123805.26345-1-simon@lineageos.org> <20171218123805.26345-4-simon@lineageos.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755060AbdLTOIa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 09:08:30 -0500
In-Reply-To: <20171218123805.26345-4-simon@lineageos.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Simon Shields <simon@lineageos.org>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>

On Mon, Dec 18, 2017 at 1:38 PM, Simon Shields <simon@lineageos.org> wrote:
> "midas" is the codename for a family of smartphones released by Samsung
> Mobile. It includes the Galaxy S3 (GT-I9300/I9305) and the Galaxy
> Note 2 (GT-N7100/N7105). The boards largely have the same peripherals:
> the main differences are touchscreen, display panel and cellular modem.
>
> Signed-off-by: Simon Shields <simon@lineageos.org>
> ---
>  arch/arm/boot/dts/Makefile          |  3 +++
>  arch/arm/boot/dts/exynos4412-m0.dts | 27 +++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos4412-m3.dts | 14 +++++++++++++
>  arch/arm/boot/dts/exynos4412-t0.dts | 40 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 84 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos4412-m0.dts
>  create mode 100644 arch/arm/boot/dts/exynos4412-m3.dts
>  create mode 100644 arch/arm/boot/dts/exynos4412-t0.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 66e28af289da..035abd66b472 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -164,11 +164,14 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
>         exynos4210-trats.dtb \
>         exynos4210-universal_c210.dtb \
>         exynos4412-itop-elite.dtb \
> +       exynos4412-m0.dtb \
> +       exynos4412-m3.dtb \
>         exynos4412-odroidu3.dtb \
>         exynos4412-odroidx.dtb \
>         exynos4412-odroidx2.dtb \
>         exynos4412-origen.dtb \
>         exynos4412-smdk4412.dtb \
> +       exynos4412-t0.dtb \
>         exynos4412-tiny4412.dtb \
>         exynos4412-trats2.dtb
>  dtb-$(CONFIG_ARCH_EXYNOS5) += \
> diff --git a/arch/arm/boot/dts/exynos4412-m0.dts b/arch/arm/boot/dts/exynos4412-m0.dts
> new file mode 100644
> index 000000000000..56c1ea6b5695
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos4412-m0.dts
> @@ -0,0 +1,27 @@
> +/*
> + * Samsung's Exynos4412 based M0 (GT-I9300) board device tree source
> + *
> + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
> + *             http://www.samsung.com
> + *
> + * Device tree source file for Samsung's M0 board which is based on
> + * Samsung's Exynos4412 SoC.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +/dts-v1/;
> +#include "exynos4412-galaxy-s3.dtsi"
> +
> +/ {
> +       model = "Samsung M0 (GT-I9300) based on Exynos4412";
> +       compatible = "samsung,m0", "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
> +
> +       memory@40000000 {
> +               device_type = "memory";
> +               reg =  <0x40000000 0x40000000>;

I think each board has the same memory so maybe this can be made part
of midas.dtsi?

> +       };

What about bootargs?

> +

Unneeded new line.

> +};
> diff --git a/arch/arm/boot/dts/exynos4412-m3.dts b/arch/arm/boot/dts/exynos4412-m3.dts
> new file mode 100644
> index 000000000000..80431044f07a
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos4412-m3.dts
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +#include "exynos4412-galaxy-s3.dtsi"
> +
> +/ {
> +       model = "Samsung M3 (GT-I9305) based on Exynos4412";
> +       compatible = "samsung,m3", "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
> +
> +       memory@40000000 {
> +               device_type = "memory";
> +               reg =  <0x40000000 0x80000000>;
> +       };
> +

Ditto

> +};
> diff --git a/arch/arm/boot/dts/exynos4412-t0.dts b/arch/arm/boot/dts/exynos4412-t0.dts
> new file mode 100644
> index 000000000000..1444e893fb0e
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos4412-t0.dts
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +#include "exynos4412-midas.dtsi"
> +
> +/ {
> +       compatible = "samsung,t0", "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
> +       model = "Samsung T0 (GT-N7100, GT-N7105) based on Exynos4412";
> +
> +       memory@40000000 {
> +               device_type = "memory";
> +               reg =  <0x40000000 0x80000000>;
> +       };
> +};
> +
> +&buck9_reg {
> +       maxim,ena-gpios = <&gpm1 0 GPIO_ACTIVE_HIGH>;
> +       status = "okay";
> +};
> +
> +&cam_io_reg {
> +       gpio = <&gpm0 7 GPIO_ACTIVE_HIGH>;
> +       status = "okay";
> +};
> +
> +&cam_af_reg {
> +       gpio = <&gpm1 1 GPIO_ACTIVE_HIGH>;
> +       status = "okay";
> +};

Please but the cam nodes in alphabetical order.

> +
> +&ldo13_reg {
> +       regulator-name = "VCC_1.8V_LCD";
> +       regulator-always-on;
> +};
> +
> +&ldo25_reg {
> +       regulator-name = "VCI_3.0V_LCD";
> +       regulator-min-microvolt = <3000000>;
> +       regulator-max-microvolt = <3000000>;
> +       status = "okay";
> +};
> --
> 2.15.1
>
