From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: exynos: TM2 - add support for GScaler
 devices
Date: Wed, 16 Nov 2016 19:08:48 +0200
Message-ID: <20161116170848.GA4192@kozik-lap>
References: <1479301889-11393-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161116131137eucas1p198803f55c69c10f95031b54d878c72d3@eucas1p1.samsung.com>
 <1479301889-11393-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35884 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753008AbcKPRIy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 12:08:54 -0500
Received: by mail-wm0-f66.google.com with SMTP id m203so13097798wma.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2016 09:08:53 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1479301889-11393-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Wed, Nov 16, 2016 at 02:11:27PM +0100, Marek Szyprowski wrote:
> This patch adds device nodes for GScaler devices to Exynos 5433 SoC dtsi
> and proper initial clock configuration to TM2 dts.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts |  7 +++
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 81 +++++++++++++++++++++++++++
>  2 files changed, 88 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> index 5ab1028..5ff5c30 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> @@ -909,6 +909,13 @@
>  	assigned-clock-rates = <0>, <0>, <0>, <0>, <66700000>;
>  };
>  
> +&cmu_gscl {

When resubmitting, please put it in alphabetical order.

> +	assigned-clocks = <&cmu_gscl CLK_MOUT_ACLK_GSCL_111_USER>,
> +			  <&cmu_gscl CLK_MOUT_ACLK_GSCL_333_USER>;
> +	assigned-clock-parents = <&cmu_top CLK_ACLK_GSCL_111>,
> +				 <&cmu_top CLK_ACLK_GSCL_333>;
> +};
> +
>  &spi_1 {
>  	cs-gpios = <&gpd6 3 GPIO_ACTIVE_HIGH>;
>  	status = "okay";
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index ab29352..8ecde41 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -26,6 +26,12 @@
>  
>  	interrupt-parent = <&gic>;
>  
> +	aliases {
> +		gsc0 = &gsc_0;
> +		gsc1 = &gsc_1;
> +		gsc2 = &gsc_2;
> +	};
> +
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> @@ -798,6 +804,51 @@
>  			reg = <0x145f0000 0x1038>;
>  		};
>  
> +		gsc_0: video-scaler@13C00000 {
> +			compatible = "samsung,exynos5433-gsc";
> +			reg = <0x13c00000 0x1000>;
> +			interrupts = <GIC_SPI 297 0>;

IRQ_TYPE_LEVEL_HIGH (and test it)
Please see:
https://git.kernel.org/cgit/linux/kernel/git/krzk/linux.git/commit/?h=for-v4.10/dt64-gic-flags-fixes&id=ef4aea97a70013cecb69adf6a9f0d25ab6f11590

I am not accepting '0' as flags anymore because this was pointed out as
totally wrong. I know that it always worked for us... Applying of
Exynos5433 was last exception. :)

Best regards,
Krzysztof

> +			clocks = <&cmu_gscl CLK_PCLK_GSCL0>,
> +				 <&cmu_gscl CLK_ACLK_GSCL0>,
> +				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
> +				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>;
> +			clock-names = "pclk",
> +				      "aclk",
> +				      "aclk_xiu",
> +				      "aclk_gsclbend";
> +			iommus = <&sysmmu_gscl0>;
> +		};
> +
> +		gsc_1: video-scaler@13C10000 {
> +			compatible = "samsung,exynos5433-gsc";
> +			reg = <0x13c10000 0x1000>;
> +			interrupts = <GIC_SPI 298 0>;
> +			clocks = <&cmu_gscl CLK_PCLK_GSCL1>,
> +				 <&cmu_gscl CLK_ACLK_GSCL1>,
> +				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
> +				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>;
> +			clock-names = "pclk",
> +				      "aclk",
> +				      "aclk_xiu",
> +				      "aclk_gsclbend";
> +			iommus = <&sysmmu_gscl1>;
> +		};
> +
> +		gsc_2: video-scaler@13C20000 {
> +			compatible = "samsung,exynos5433-gsc";
> +			reg = <0x13c20000 0x1000>;
> +			interrupts = <GIC_SPI 299 0>;
> +			clocks = <&cmu_gscl CLK_PCLK_GSCL2>,
> +				 <&cmu_gscl CLK_ACLK_GSCL2>,
> +				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
> +				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>;
> +			clock-names = "pclk",
> +				      "aclk",
> +				      "aclk_xiu",
> +				      "aclk_gsclbend";
> +			iommus = <&sysmmu_gscl2>;
> +		};
> +
>  		sysmmu_decon0x: sysmmu@0x13a00000 {
>  			compatible = "samsung,exynos-sysmmu";
>  			reg = <0x13a00000 0x1000>;
> @@ -818,6 +869,36 @@
>  			#iommu-cells = <0>;
>  		};
>  
> +		sysmmu_gscl0: sysmmu@0x13C80000 {
> +			compatible = "samsung,exynos-sysmmu";
> +			reg = <0x13C80000 0x1000>;
> +			interrupts = <GIC_SPI 288 0>;
> +			clock-names = "aclk", "pclk";
> +			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL0>,
> +				 <&cmu_gscl CLK_PCLK_SMMU_GSCL0>;
> +			#iommu-cells = <0>;
> +		};
> +
> +		sysmmu_gscl1: sysmmu@0x13C90000 {
> +			compatible = "samsung,exynos-sysmmu";
> +			reg = <0x13C90000 0x1000>;
> +			interrupts = <GIC_SPI 290 0>;
> +			clock-names = "aclk", "pclk";
> +			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL1>,
> +				 <&cmu_gscl CLK_PCLK_SMMU_GSCL1>;
> +			#iommu-cells = <0>;
> +		};
> +
> +		sysmmu_gscl2: sysmmu@0x13CA0000 {
> +			compatible = "samsung,exynos-sysmmu";
> +			reg = <0x13CA0000 0x1000>;
> +			interrupts = <GIC_SPI 292 0>;
> +			clock-names = "aclk", "pclk";
> +			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL2>,
> +				 <&cmu_gscl CLK_PCLK_SMMU_GSCL2>;
> +			#iommu-cells = <0>;
> +		};
> +
>  		serial_0: serial@14c10000 {
>  			compatible = "samsung,exynos5433-uart";
>  			reg = <0x14c10000 0x100>;
> -- 
> 1.9.1
> 
