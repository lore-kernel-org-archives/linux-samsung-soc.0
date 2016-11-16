From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: exynos: TM2 - add support for JPEG codec
 device
Date: Wed, 16 Nov 2016 19:10:54 +0200
Message-ID: <20161116171054.GB4192@kozik-lap>
References: <1479301889-11393-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161116131138eucas1p18c6a9d4469caff62cbd8a73cb443d5e0@eucas1p1.samsung.com>
 <1479301889-11393-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35118 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932162AbcKPRK7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 12:10:59 -0500
Received: by mail-wm0-f67.google.com with SMTP id a20so13184379wme.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2016 09:10:58 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1479301889-11393-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Wed, Nov 16, 2016 at 02:11:28PM +0100, Marek Szyprowski wrote:
> This patch adds device nodes for JPEG codec device to Exynos
> 5433 SoC dtsi and proper initial clock configuration to TM2 dts.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 11 +++++++++++
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 25 +++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> index 5ff5c30..2e76b30 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> @@ -916,6 +916,17 @@
>  				 <&cmu_top CLK_ACLK_GSCL_333>;
>  };
>  
> +&cmu_mscl {

If resubmitting, please put it in alphabetical order.

> +	assigned-clocks = <&cmu_mscl CLK_MOUT_ACLK_MSCL_400_USER>,
> +			  <&cmu_mscl CLK_MOUT_SCLK_JPEG_USER>,
> +			  <&cmu_mscl CLK_MOUT_SCLK_JPEG>,
> +			  <&cmu_top CLK_MOUT_SCLK_JPEG_A>;
> +	assigned-clock-parents = <&cmu_top CLK_ACLK_MSCL_400>,
> +				 <&cmu_top CLK_SCLK_JPEG_MSCL>,
> +				 <&cmu_mscl CLK_MOUT_SCLK_JPEG_USER>,
> +				 <&cmu_top CLK_MOUT_BUS_PLL_USER>;
> +};
> +
>  &spi_1 {
>  	cs-gpios = <&gpd6 3 GPIO_ACTIVE_HIGH>;
>  	status = "okay";
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 8ecde41..68127ab 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -849,6 +849,21 @@
>  			iommus = <&sysmmu_gscl2>;
>  		};
>  
> +		jpeg: codec@15020000 {
> +			compatible = "samsung,exynos5433-jpeg";
> +			reg = <0x15020000 0x10000>;
> +			interrupts = <GIC_SPI 411 0>;

IRQ_TYPE_LEVEL_HIGH (or any different valid type)

> +			clock-names = "pclk",
> +				      "aclk",
> +				      "aclk_xiu",
> +				      "sclk";

These could be put in one line.

Best regards,
Krzysztof

> +			clocks = <&cmu_mscl CLK_PCLK_JPEG>,
> +				 <&cmu_mscl CLK_ACLK_JPEG>,
> +				 <&cmu_mscl CLK_ACLK_XIU_MSCLX>,
> +				 <&cmu_mscl CLK_SCLK_JPEG>;
> +			iommus = <&sysmmu_jpeg>;
> +		};
> +
>  		sysmmu_decon0x: sysmmu@0x13a00000 {
>  			compatible = "samsung,exynos-sysmmu";
>  			reg = <0x13a00000 0x1000>;
> @@ -899,6 +914,16 @@
>  			#iommu-cells = <0>;
>  		};
>  
> +		sysmmu_jpeg: sysmmu@0x15060000 {
> +			compatible = "samsung,exynos-sysmmu";
> +			reg = <0x15060000 0x1000>;
> +			interrupts = <GIC_SPI 408 0>;
> +			clock-names = "pclk", "aclk";
> +			clocks = <&cmu_mscl CLK_PCLK_SMMU_JPEG>,
> +				 <&cmu_mscl CLK_ACLK_SMMU_JPEG>;
> +			#iommu-cells = <0>;
> +		};
> +
>  		serial_0: serial@14c10000 {
>  			compatible = "samsung,exynos5433-uart";
>  			reg = <0x14c10000 0x100>;
> -- 
> 1.9.1
> 
