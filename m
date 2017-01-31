From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 3/3 REBASED] arm64: dts: exynos: Add initial
 configuration for DISP clocks for TM2/TM2e
Date: Tue, 31 Jan 2017 09:39:49 +0900
Message-ID: <588FDCD5.10105@samsung.com>
References: <20170128152846.ychltfggmlrgrwwx@kozik-lap>
 <CGME20170130105746eucas1p1232fb56b92e5939beb7ee65670422860@eucas1p1.samsung.com>
 <1485773856-22707-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:58084 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753638AbdAaAjw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 30 Jan 2017 19:39:52 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OKM002SQCIEQ260@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 31 Jan 2017 09:39:50 +0900 (KST)
In-reply-to: <1485773856-22707-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

Hi Marek,

On 2017년 01월 30일 19:57, Marek Szyprowski wrote:
> Add initial clock configuration for display subsystem for Exynos5433
> based TM2/TM2e boards in device tree in order to avoid dependency on the
> configuration left by the bootloader. This initial configuration is also
> needed to ensure that display subsystem is operational if display power
> domain gets turned off before clock controller is probed and the inital
> clock configuration left by the bootloader saved.
> 
> TM2 and TM2e uses different rate for DISP PLL clock, but for better
> maintainability all 'assigned-clocks-*' properties for DISP CMU are
> defines in each board dts instead of redefining the rates property.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Changelog:
> v3 resend:
> - rebased onto Linux next-20170130
> 
> v3:
> - added comment about DISP CMU clocks configuration on TM2 and TM2e
> ---
>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 12 --------
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      | 34 ++++++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts     | 34 ++++++++++++++++++++++
>  3 files changed, 68 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> index 53fd0683d400..098ad557fee3 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> @@ -217,18 +217,6 @@
>  	assigned-clock-parents = <&cmu_top CLK_FOUT_AUD_PLL>;
>  };
>  
> -&cmu_disp {
> -	assigned-clocks = <&cmu_mif CLK_MOUT_SCLK_DECON_TV_ECLK_A>,
> -			  <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>,
> -			  <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>,
> -			  <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK>;
> -	assigned-clock-parents = <&cmu_mif CLK_MOUT_BUS_PLL_DIV2>,
> -				 <0>,
> -				 <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
> -				 <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>;
> -	assigned-clock-rates = <0>, <400000000>;
> -};
> -
>  &cmu_fsys {
>  	assigned-clocks = <&cmu_top CLK_MOUT_SCLK_USBDRD30>,
>  		<&cmu_top CLK_MOUT_SCLK_USBHOST30>,
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> index ddba2f889326..dea0a6f5bc18 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> @@ -18,6 +18,40 @@
>  	compatible = "samsung,tm2", "samsung,exynos5433";
>  };
>  
> +&cmu_disp {
> +	/*
> +	 * TM2 and TM2e differ only by DISP_PLL rate, but define all assigned
> +	 * clocks properties for DISP CMU for each board to keep them together
> +	 * for easier review and maintenance.
> +	 */
> +	assigned-clocks = <&cmu_disp CLK_FOUT_DISP_PLL>,
> +			  <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>,
> +			  <&cmu_disp CLK_MOUT_ACLK_DISP_333_USER>,
> +			  <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
> +			  <&cmu_disp CLK_MOUT_SCLK_DSIM0>,
> +			  <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
> +			  <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK>,
> +			  <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_RXCLKESC0_USER>,
> +			  <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER>,
> +			  <&cmu_disp CLK_MOUT_DISP_PLL>,
> +			  <&cmu_mif CLK_MOUT_SCLK_DECON_TV_ECLK_A>,
> +			  <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>,
> +			  <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK>;
> +	assigned-clock-parents = <0>, <0>,
> +				 <&cmu_mif CLK_ACLK_DISP_333>,
> +				 <&cmu_mif CLK_SCLK_DSIM0_DISP>,
> +				 <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
> +				 <&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
> +				 <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
> +				 <&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY>,
> +				 <&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY>,
> +				 <&cmu_disp CLK_FOUT_DISP_PLL>,
> +				 <&cmu_mif CLK_MOUT_BUS_PLL_DIV2>,
> +				 <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
> +				 <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>;
> +	assigned-clock-rates = <250000000>, <400000000>;
> +};
> +
>  &hsi2c_9 {
>  	status = "okay";
>  
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
> index 2fbf3a860316..7891a31adc17 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
> @@ -18,6 +18,40 @@
>  	compatible = "samsung,tm2e", "samsung,exynos5433";
>  };
>  
> +&cmu_disp {
> +	/*
> +	 * TM2 and TM2e differ only by DISP_PLL rate, but define all assigned
> +	 * clocks properties for DISP CMU for each board to keep them together
> +	 * for easier review and maintenance.
> +	 */
> +	assigned-clocks = <&cmu_disp CLK_FOUT_DISP_PLL>,
> +			  <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>,
> +			  <&cmu_disp CLK_MOUT_ACLK_DISP_333_USER>,
> +			  <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
> +			  <&cmu_disp CLK_MOUT_SCLK_DSIM0>,
> +			  <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
> +			  <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK>,
> +			  <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_RXCLKESC0_USER>,
> +			  <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER>,
> +			  <&cmu_disp CLK_MOUT_DISP_PLL>,
> +			  <&cmu_mif CLK_MOUT_SCLK_DECON_TV_ECLK_A>,
> +			  <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>,
> +			  <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK>;
> +	assigned-clock-parents = <0>, <0>,
> +				 <&cmu_mif CLK_ACLK_DISP_333>,
> +				 <&cmu_mif CLK_SCLK_DSIM0_DISP>,
> +				 <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
> +				 <&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
> +				 <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
> +				 <&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY>,
> +				 <&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY>,
> +				 <&cmu_disp CLK_FOUT_DISP_PLL>,
> +				 <&cmu_mif CLK_MOUT_BUS_PLL_DIV2>,
> +				 <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
> +				 <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>;
> +	assigned-clock-rates = <278000000>, <400000000>;
> +};
> +
>  &ldo31_reg {
>  	regulator-name = "TSP_VDD_1.8V_AP";
>  	regulator-min-microvolt = <1800000>;
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
