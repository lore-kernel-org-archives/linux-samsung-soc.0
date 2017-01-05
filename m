From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dst: exynos: remove Exynos4212 support (dead code)
Date: Thu, 5 Jan 2017 22:24:08 +0200
Message-ID: <20170105202408.rq46l7utb6xvg7vf@kozik-lap>
References: <CGME20161228111259epcas1p3c15a3155ef6f5c4bc831dddd175fc5a1@epcas1p3.samsung.com>
 <1482923567-19583-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33764 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966792AbdAEUdw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Jan 2017 15:33:52 -0500
Received: by mail-wm0-f66.google.com with SMTP id u144so245572wmu.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Jan 2017 12:33:51 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1482923567-19583-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>

On Wed, Dec 28, 2016 at 12:12:47PM +0100, Marek Szyprowski wrote:
> There are no Exynos4212 based boards in mainline, so there is no need to
> keep additional files for SoCs, which are never used. This patch removes
> support for Exynos4212 SoCs and moves previously shared Exynos4412
> definitions to a single file to simplify future maintenance.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

If resend will happen, then in subject:
s/dst/dts/

> ---
>  arch/arm/boot/dts/exynos4212.dtsi         | 133 ----
>  arch/arm/boot/dts/exynos4412-pinctrl.dtsi | 993 ++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos4412.dtsi         | 578 ++++++++++++++++-
>  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi | 984 -----------------------------

Change around pinctrl looks like rename. Please format the patch with
apropriate -M (and if needed -B) so no one would have to review the same
code. Actually -B should not be needed. It is weird that rename was not
detected here.

>  arch/arm/boot/dts/exynos4x12.dtsi         | 594 ------------------
>  5 files changed, 1567 insertions(+), 1715 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/exynos4212.dtsi
>  create mode 100644 arch/arm/boot/dts/exynos4412-pinctrl.dtsi
>  delete mode 100644 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
>  delete mode 100644 arch/arm/boot/dts/exynos4x12.dtsi
> 
> diff --git a/arch/arm/boot/dts/exynos4212.dtsi b/arch/arm/boot/dts/exynos4212.dtsi
> deleted file mode 100644
> index 538901123d37..000000000000
> --- a/arch/arm/boot/dts/exynos4212.dtsi
> +++ /dev/null
> @@ -1,133 +0,0 @@
> -/*
> - * Samsung's Exynos4212 SoC device tree source
> - *
> - * Copyright (c) 2012 Samsung Electronics Co., Ltd.
> - *		http://www.samsung.com
> - *
> - * Samsung's Exynos4212 SoC device nodes are listed in this file. Exynos4212
> - * based board files can include this file and provide values for board specfic
> - * bindings.
> - *
> - * Note: This file does not include device nodes for all the controllers in
> - * Exynos4212 SoC. As device tree coverage for Exynos4212 increases, additional
> - * nodes can be added to this file.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> -*/
> -
> -#include "exynos4x12.dtsi"
> -
> -/ {
> -	compatible = "samsung,exynos4212", "samsung,exynos4";
> -
> -	cpus {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		cpu0: cpu@A00 {
> -			device_type = "cpu";
> -			compatible = "arm,cortex-a9";
> -			reg = <0xA00>;
> -			clocks = <&clock CLK_ARM_CLK>;
> -			clock-names = "cpu";
> -			operating-points-v2 = <&cpu0_opp_table>;
> -			cooling-min-level = <13>;
> -			cooling-max-level = <7>;
> -			#cooling-cells = <2>; /* min followed by max */
> -		};
> -
> -		cpu@A01 {
> -			device_type = "cpu";
> -			compatible = "arm,cortex-a9";
> -			reg = <0xA01>;
> -			operating-points-v2 = <&cpu0_opp_table>;
> -		};
> -	};
> -
> -	cpu0_opp_table: opp_table0 {
> -		compatible = "operating-points-v2";
> -		opp-shared;
> -
> -		opp00 {
> -			opp-hz = /bits/ 64 <200000000>;
> -			opp-microvolt = <900000>;
> -			clock-latency-ns = <200000>;
> -		};
> -		opp01 {
> -			opp-hz = /bits/ 64 <300000000>;
> -			opp-microvolt = <900000>;
> -			clock-latency-ns = <200000>;
> -		};
> -		opp02 {
> -			opp-hz = /bits/ 64 <400000000>;
> -			opp-microvolt = <925000>;
> -			clock-latency-ns = <200000>;
> -		};
> -		opp03 {
> -			opp-hz = /bits/ 64 <500000000>;
> -			opp-microvolt = <950000>;
> -			clock-latency-ns = <200000>;
> -		};
> -		opp04 {
> -			opp-hz = /bits/ 64 <600000000>;
> -			opp-microvolt = <975000>;
> -			clock-latency-ns = <200000>;
> -		};
> -		opp05 {
> -			opp-hz = /bits/ 64 <700000000>;
> -			opp-microvolt = <987500>;
> -			clock-latency-ns = <200000>;
> -		};
> -		opp06 {
> -			opp-hz = /bits/ 64 <800000000>;
> -			opp-microvolt = <1000000>;
> -			clock-latency-ns = <200000>;
> -		};
> -		opp07 {
> -			opp-hz = /bits/ 64 <900000000>;
> -			opp-microvolt = <1037500>;
> -			clock-latency-ns = <200000>;
> -		};
> -		opp08 {
> -			opp-hz = /bits/ 64 <1000000000>;
> -			opp-microvolt = <1087500>;
> -			clock-latency-ns = <200000>;
> -		};
> -		opp09 {
> -			opp-hz = /bits/ 64 <1100000000>;
> -			opp-microvolt = <1137500>;
> -			clock-latency-ns = <200000>;
> -		};
> -		opp10 {
> -			opp-hz = /bits/ 64 <1200000000>;
> -			opp-microvolt = <1187500>;
> -			clock-latency-ns = <200000>;
> -		};
> -		opp11 {
> -			opp-hz = /bits/ 64 <1300000000>;
> -			opp-microvolt = <1250000>;
> -			clock-latency-ns = <200000>;
> -		};
> -		opp12 {
> -			opp-hz = /bits/ 64 <1400000000>;
> -			opp-microvolt = <1287500>;
> -			clock-latency-ns = <200000>;
> -		};
> -		opp13 {
> -			opp-hz = /bits/ 64 <1500000000>;
> -			opp-microvolt = <1350000>;
> -			clock-latency-ns = <200000>;
> -			turbo-mode;
> -		};
> -	};
> -};
> -
> -&combiner {
> -	samsung,combiner-nr = <18>;
> -};
> -
> -&gic {
> -	cpu-offset = <0x8000>;
> -};
> diff --git a/arch/arm/boot/dts/exynos4412-pinctrl.dtsi b/arch/arm/boot/dts/exynos4412-pinctrl.dtsi
> new file mode 100644
> index 000000000000..e6b9ccfab20e
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos4412-pinctrl.dtsi
> @@ -0,0 +1,993 @@
> +/*
> + * Samsung's Exynos4x12 SoCs pin-mux and pin-config device tree source

Exynos4412

> + *
> + * Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * Samsung's Exynos4x12 SoCs pin-mux and pin-config optiosn are listed as device

Ditto


Did you check if output DTBs of Exynos4412 (or decompiled DTSes) are equal?

Best regards,
Krzysztof
