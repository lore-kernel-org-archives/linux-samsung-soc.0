From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: exynos: remove Exynos4212 support (dead
 code)
Date: Tue, 10 Jan 2017 19:27:27 +0200
Message-ID: <20170110172727.kxlldvitugspjrkh@kozik-lap>
References: <CGME20170109083453eucas1p295add9f8c3e5a10c7ae3081d6567fe08@eucas1p2.samsung.com>
 <1483950880-16016-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wj0-f193.google.com ([209.85.210.193]:34224 "EHLO
        mail-wj0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1162892AbdAJR1i (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Jan 2017 12:27:38 -0500
Received: by mail-wj0-f193.google.com with SMTP id qs7so50634022wjc.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jan 2017 09:27:37 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1483950880-16016-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>

On Mon, Jan 09, 2017 at 09:34:40AM +0100, Marek Szyprowski wrote:
> There are no Exynos4212 based boards in mainline, so there is no need to
> keep additional files for SoCs, which are never used. This patch removes
> support for Exynos4212 SoCs and moves previously shared Exynos4412
> definitions to a single file to simplify future maintenance.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4212.dtsi                  | 133 -----
>  ...os4x12-pinctrl.dtsi => exynos4412-pinctrl.dtsi} |   4 +-
>  arch/arm/boot/dts/exynos4412.dtsi                  | 578 +++++++++++++++++++-
>  arch/arm/boot/dts/exynos4x12.dtsi                  | 594 ---------------------
>  4 files changed, 576 insertions(+), 733 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/exynos4212.dtsi
>  rename arch/arm/boot/dts/{exynos4x12-pinctrl.dtsi => exynos4412-pinctrl.dtsi} (99%)
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
> diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4412-pinctrl.dtsi
> similarity index 99%
> rename from arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> rename to arch/arm/boot/dts/exynos4412-pinctrl.dtsi
> index 2f866f6e5838..1d27c28564e4 100644
> --- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-pinctrl.dtsi
> @@ -1,10 +1,10 @@
>  /*
> - * Samsung's Exynos4x12 SoCs pin-mux and pin-config device tree source
> + * Samsung's Exynos4412 SoCs pin-mux and pin-config device tree source
>   *
>   * Copyright (c) 2012 Samsung Electronics Co., Ltd.
>   *		http://www.samsung.com
>   *
> - * Samsung's Exynos4x12 SoCs pin-mux and pin-config optiosn are listed as device
> + * Samsung's Exynos4412 SoCs pin-mux and pin-config optiosn are listed as device
>   * tree nodes are listed in this file.
>   *
>   * This program is free software; you can redistribute it and/or modify
> diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
> index 3ebdf01d814c..9c6ed94f30d6 100644
> --- a/arch/arm/boot/dts/exynos4412.dtsi
> +++ b/arch/arm/boot/dts/exynos4412.dtsi
> @@ -17,11 +17,23 @@
>   * published by the Free Software Foundation.
>  */
>  
> -#include "exynos4x12.dtsi"
> +#include "exynos4.dtsi"
> +#include "exynos4412-pinctrl.dtsi"
> +#include "exynos4-cpu-thermal.dtsi"
>  
>  / {
>  	compatible = "samsung,exynos4412", "samsung,exynos4";
>  
> +	aliases {
> +		pinctrl0 = &pinctrl_0;
> +		pinctrl1 = &pinctrl_1;
> +		pinctrl2 = &pinctrl_2;
> +		pinctrl3 = &pinctrl_3;
> +		fimc-lite0 = &fimc_lite_0;
> +		fimc-lite1 = &fimc_lite_1;
> +		mshc0 = &mshc_0;
> +	};
> +
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> @@ -141,16 +153,574 @@
>  	pmu {
>  		interrupts = <2 2>, <3 2>, <18 2>, <19 2>;
>  	};
> -};
>  
> -&pmu_system_controller {
> -	compatible = "samsung,exynos4412-pmu", "syscon";
> +	sysram@02020000 {
> +		compatible = "mmio-sram";
> +		reg = <0x02020000 0x40000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0x02020000 0x40000>;
> +
> +		smp-sysram@0 {
> +			compatible = "samsung,exynos4210-sysram";
> +			reg = <0x0 0x1000>;
> +		};
> +
> +		smp-sysram@2f000 {
> +			compatible = "samsung,exynos4210-sysram-ns";
> +			reg = <0x2f000 0x1000>;
> +		};
> +	};
> +
> +	pd_isp: isp-power-domain@10023CA0 {
> +		compatible = "samsung,exynos4210-pd";
> +		reg = <0x10023CA0 0x20>;
> +		#power-domain-cells = <0>;
> +	};
> +
> +	l2c: l2-cache-controller@10502000 {
> +		compatible = "arm,pl310-cache";
> +		reg = <0x10502000 0x1000>;
> +		cache-unified;
> +		cache-level = <2>;
> +		arm,tag-latency = <2 2 1>;
> +		arm,data-latency = <3 2 1>;
> +		arm,double-linefill = <1>;
> +		arm,double-linefill-incr = <0>;
> +		arm,double-linefill-wrap = <1>;
> +		arm,prefetch-drop = <1>;
> +		arm,prefetch-offset = <7>;
> +	};
> +
> +	clock: clock-controller@10030000 {
> +		compatible = "samsung,exynos4412-clock";
> +		reg = <0x10030000 0x20000>;
> +		#clock-cells = <1>;
> +
> +		isp-clock-controller {
> +			compatible = "samsung,exynos4412-isp-clock";
> +			power-domains = <&pd_isp>;
> +		};

This is not the same. If you want to add it, please do it in separate
patch.


Best regards,
Krzysztof
