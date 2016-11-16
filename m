From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/5] arm64: dts: exynos: Move FSYS CMU configuration from
 Exynos5433 dtsi to TM2 dts
Date: Wed, 16 Nov 2016 18:54:02 +0200
Message-ID: <20161116165402.GA3727@kozik-lap>
References: <1479301615-11240-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161116130708eucas1p15ac7edddb555cc2b55bb28142ce9656e@eucas1p1.samsung.com>
 <1479301615-11240-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34945 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751277AbcKPQyN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 11:54:13 -0500
Received: by mail-wm0-f66.google.com with SMTP id a20so13032698wme.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2016 08:54:12 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1479301615-11240-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Wed, Nov 16, 2016 at 02:06:53PM +0100, Marek Szyprowski wrote:
> Move initial FSYS CMU (related to USB 3.0 devices) clocks configuration
> from generic exynos5433.dtsi file to exynos5433-tm2.dts, as this is
> a board specific item.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 13 +++++++++++++
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 28 ---------------------------
>  2 files changed, 13 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> index 9ea3f32..b7b2482 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> @@ -892,6 +892,19 @@
>  	status = "okay";
>  };
>  
> +&cmu_fsys {

If there would be a resubmit, please put it in alphabetical order.

> +	assigned-clocks = <&cmu_fsys CLK_MOUT_SCLK_USBDRD30_USER>,
> +		<&cmu_top CLK_MOUT_SCLK_USBDRD30>,
> +		<&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_USER>,
> +		<&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_USER>,
> +		<&cmu_top CLK_DIV_SCLK_USBDRD30>;
> +	assigned-clock-parents = <&cmu_top CLK_SCLK_USBDRD30_FSYS>,
> +		<&cmu_top CLK_MOUT_BUS_PLL_USER>,
> +		<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_PHY>,
> +		<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_PHY>;
> +	assigned-clock-rates = <0>, <0>, <0>, <0>, <66700000>;

I see this is not an equivalent change - some clocks are not assigned
now. I had impression from the commit msg that it will be just a move so
no practical impact. Won't there be a problem with missing clock
assigns?

BR,
Krzysztof

> +};
> +
>  &spi_1 {
>  	cs-gpios = <&gpd6 3 GPIO_ACTIVE_HIGH>;
>  	status = "okay";
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index a80eb4c..ab29352 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -1134,14 +1134,6 @@
>  			clocks = <&cmu_fsys CLK_ACLK_USBDRD30>,
>  				<&cmu_fsys CLK_SCLK_USBDRD30>;
>  			clock-names = "usbdrd30", "usbdrd30_susp_clk";
> -			assigned-clocks =
> -				<&cmu_fsys CLK_MOUT_SCLK_USBDRD30_USER>,
> -				<&cmu_top CLK_MOUT_SCLK_USBDRD30>,
> -				<&cmu_top CLK_DIV_SCLK_USBDRD30>;
> -			assigned-clock-parents =
> -				<&cmu_top CLK_SCLK_USBDRD30_FSYS>,
> -				<&cmu_top CLK_MOUT_BUS_PLL_USER>;
> -			assigned-clock-rates = <0>, <0>, <66700000>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			ranges;
> @@ -1165,12 +1157,6 @@
>  				<&cmu_fsys CLK_SCLK_USBDRD30>;
>  			clock-names = "phy", "ref", "phy_utmi", "phy_pipe",
>  					"itp";
> -			assigned-clocks =
> -				<&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_USER>,
> -				<&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_USER>;
> -			assigned-clock-parents =
> -				<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_PHY>,
> -				<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_PHY>;
>  			#phy-cells = <1>;
>  			samsung,pmu-syscon = <&pmu_system_controller>;
>  			status = "disabled";
> @@ -1185,12 +1171,6 @@
>  				<&cmu_fsys CLK_SCLK_USBHOST30>;
>  			clock-names = "phy", "ref", "phy_utmi", "phy_pipe",
>  					"itp";
> -			assigned-clocks =
> -				<&cmu_fsys CLK_MOUT_PHYCLK_USBHOST30_UHOST30_PIPE_PCLK_USER>,
> -				<&cmu_fsys CLK_MOUT_PHYCLK_USBHOST30_UHOST30_PHYCLOCK_USER>;
> -			assigned-clock-parents =
> -				<&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PIPE_PCLK_PHY>,
> -				<&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PHYCLOCK_PHY>;
>  			#phy-cells = <1>;
>  			samsung,pmu-syscon = <&pmu_system_controller>;
>  			status = "disabled";
> @@ -1201,14 +1181,6 @@
>  			clocks = <&cmu_fsys CLK_ACLK_USBHOST30>,
>  				<&cmu_fsys CLK_SCLK_USBHOST30>;
>  			clock-names = "usbdrd30", "usbdrd30_susp_clk";
> -			assigned-clocks =
> -				<&cmu_fsys CLK_MOUT_SCLK_USBHOST30_USER>,
> -				<&cmu_top CLK_MOUT_SCLK_USBHOST30>,
> -				<&cmu_top CLK_DIV_SCLK_USBHOST30>;
> -			assigned-clock-parents =
> -				<&cmu_top CLK_SCLK_USBHOST30_FSYS>,
> -				<&cmu_top CLK_MOUT_BUS_PLL_USER>;
> -			assigned-clock-rates = <0>, <0>, <66700000>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			ranges;
> -- 
> 1.9.1
> 
