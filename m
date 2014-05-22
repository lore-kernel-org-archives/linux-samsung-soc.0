From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 4/4] ARM: dts: exynos: Update PMU node with CLKOUT related
 data
Date: Thu, 22 May 2014 10:11:52 +0530
Message-ID: <537D8010.40109@linaro.org>
References: <1400604211-9447-1-git-send-email-t.figa@samsung.com> <1400604211-9447-5-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:60072 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750819AbaEVEmA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 00:42:00 -0400
Received: by mail-pb0-f53.google.com with SMTP id md12so2100263pbc.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 21:42:00 -0700 (PDT)
In-Reply-To: <1400604211-9447-5-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Mark Brown <broonie@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>

On 05/20/2014 10:13 PM, Tomasz Figa wrote:

[...]

> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index ee3001f..b7956cc 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -31,6 +31,15 @@
>  		pinctrl2 = &pinctrl_2;
>  	};
>  
> +	pmu_system_controller: system-controller@10020000 {

#clock-cells = <1>;

> +		clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
> +				"clkout4", "clkout8", "clkout9";
> +		clocks = <&clock CLK_OUT_DMC>, <&clock CLK_OUT_TOP>,
> +			<&clock CLK_OUT_LEFTBUS>, <&clock CLK_OUT_RIGHTBUS>,
> +			<&clock CLK_OUT_CPU>, <&clock CLK_XXTI>,
> +			<&clock CLK_XUSBXTI>;
> +	};
> +
>  	sysram@02020000 {
>  		compatible = "mmio-sram";
>  		reg = <0x02020000 0x20000>;
> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
> index 264a28f..d9651fa 100644
> --- a/arch/arm/boot/dts/exynos4x12.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
> @@ -139,6 +139,12 @@
>  
>  	pmu_system_controller: system-controller@10020000 {
>  		compatible = "samsung,exynos4212-pmu", "syscon";

#clock-cells = <1>;

> +		clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
> +				"clkout4", "clkout5", "clkout8", "clkout9";
> +		clocks = <&clock CLK_OUT_DMC>, <&clock CLK_OUT_TOP>,
> +			<&clock CLK_OUT_LEFTBUS>, <&clock CLK_OUT_RIGHTBUS>,
> +			<&clock CLK_OUT_CPU>, <&clock CLK_OUT_ISP>,
> +			<&clock CLK_XXTI>, <&clock CLK_XUSBXTI>;
>  	};
>  
>  	g2d@10800000 {
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 68a3e6f..cb939ef 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -191,6 +191,9 @@
>  	pmu_system_controller: system-controller@10040000 {
>  		compatible = "samsung,exynos5250-pmu", "syscon";
>  		reg = <0x10040000 0x5000>;
> +		#clock-cells = <0>;

#clock-cells = <1>;

> +		clock-names = "clkout16";
> +		clocks = <&clock CLK_FIN_PLL>;
>  	};
>  
>  	watchdog@101D0000 {
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 8e7e35c..23d0ebb 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -723,6 +723,9 @@
>  	pmu_system_controller: system-controller@10040000 {
>  		compatible = "samsung,exynos5420-pmu", "syscon";
>  		reg = <0x10040000 0x5000>;
> +		#clock-cells = <0>;

#clock-cells = <1>;

> +		clock-names = "clkout16";
> +		clocks = <&clock CLK_FIN_PLL>;
>  	};
>  
>  	tmu_cpu0: tmu@10060000 {
> 


-- 
Tushar Behera
