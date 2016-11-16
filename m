From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: exynos: TM2 - add support for MFC video
 codec device
Date: Wed, 16 Nov 2016 19:14:55 +0200
Message-ID: <20161116171455.GC4192@kozik-lap>
References: <1479301889-11393-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161116131138eucas1p193a3f9016a86086be901748212fa9597@eucas1p1.samsung.com>
 <1479301889-11393-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36053 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752282AbcKPRPB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 12:15:01 -0500
Received: by mail-wm0-f68.google.com with SMTP id m203so13156727wma.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2016 09:15:00 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1479301889-11393-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Wed, Nov 16, 2016 at 02:11:29PM +0100, Marek Szyprowski wrote:
> This patch adds device nodes for MFC video codec device to Exynos 5433

BTW, you are mixing in various commit messages and titles the Exynos5433
with "Exynos 5433" (with space). Can we stick to one? :)

> SoC dtsi and proper initial clock configuration to TM2 dts.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts |  5 ++++
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 34 +++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> index 2e76b30..93efbeb 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> @@ -927,6 +927,11 @@
>  				 <&cmu_top CLK_MOUT_BUS_PLL_USER>;
>  };
>  
> +&cmu_mfc {

Alphabetical order.

> +	assigned-clocks = <&cmu_mfc CLK_MOUT_ACLK_MFC_400_USER>;
> +	assigned-clock-parents = <&cmu_top CLK_ACLK_MFC_400>;
> +};
> +
>  &spi_1 {
>  	cs-gpios = <&gpd6 3 GPIO_ACTIVE_HIGH>;
>  	status = "okay";
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 68127ab..31bffe1 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -864,6 +864,20 @@
>  			iommus = <&sysmmu_jpeg>;
>  		};
>  
> +		mfc: codec@152E0000 {
> +			compatible = "samsung,exynos5433-mfc";
> +			reg = <0x152E0000 0x10000>;
> +			interrupts = <GIC_SPI 358 0>;

IRQ type.

> +			clocks = <&cmu_mfc CLK_PCLK_MFC>,
> +				 <&cmu_mfc CLK_ACLK_MFC>,
> +				 <&cmu_mfc CLK_ACLK_XIU_MFCX>;
> +			clock-names = "pclk",
> +				      "aclk",
> +				      "aclk_xiu";

Let's keep it consistent with other, so first clock-names, then clocks.
And clock-names can be squashed (like in other places).

Best regards,
Krzysztof


> +			iommus = <&sysmmu_mfc_0>, <&sysmmu_mfc_1>;
> +			iommu-names = "left", "right";
> +		};
> +
>  		sysmmu_decon0x: sysmmu@0x13a00000 {
>  			compatible = "samsung,exynos-sysmmu";
>  			reg = <0x13a00000 0x1000>;
> @@ -924,6 +938,26 @@
>  			#iommu-cells = <0>;
>  		};
>  
> +		sysmmu_mfc_0: sysmmu@0x15200000 {
> +			compatible = "samsung,exynos-sysmmu";
> +			reg = <0x15200000 0x1000>;
> +			interrupts = <0 352 0>;
> +			clock-names = "pclk", "aclk";
> +			clocks = <&cmu_mfc CLK_PCLK_SMMU_MFC_0>,
> +				 <&cmu_mfc CLK_ACLK_SMMU_MFC_0>;
> +			#iommu-cells = <0>;
> +		};
> +
> +		sysmmu_mfc_1: sysmmu@0x15210000 {
> +			compatible = "samsung,exynos-sysmmu";
> +			reg = <0x15210000 0x1000>;
> +			interrupts = <0 354 0>;
> +			clock-names = "pclk", "aclk";
> +			clocks = <&cmu_mfc CLK_PCLK_SMMU_MFC_1>,
> +				 <&cmu_mfc CLK_ACLK_SMMU_MFC_1>;
> +			#iommu-cells = <0>;
> +		};
> +
>  		serial_0: serial@14c10000 {
>  			compatible = "samsung,exynos5433-uart";
>  			reg = <0x14c10000 0x100>;
> -- 
> 1.9.1
> 
