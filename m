From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/2] arm64: dts: exynos: Add initial configuration for DISP
 clocks for TM2/TM2e
Date: Thu, 26 Jan 2017 11:03:04 +0900
Message-ID: <588958D8.4040600@samsung.com>
References: <1485345118-3082-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170125115215eucas1p239b83cbdfead5b59e3cbbc6e3d3a4b22@eucas1p2.samsung.com>
 <1485345118-3082-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:51924 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752309AbdAZCDI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 21:03:08 -0500
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OKD00FWZ7156S80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jan 2017 11:03:06 +0900 (KST)
In-reply-to: <1485345118-3082-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Marek,

On 2017년 01월 25일 20:51, Marek Szyprowski wrote:
> Add initial clock configuration for display subsystem for Exynos5433
> based TM2/TM2e boards in device tree in order to avoid dependency on the
> configuration left by the bootloader. This initial configuration is also
> needed to ensure that display subsystem is operational if display power
> domain gets turned off before clock controller is probed and the inital
> clock configuration left by the bootloader saved.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 25 ++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> index 13a0950b57e2..1b9a8a92a40c 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> @@ -218,15 +218,32 @@
>  };
>  
>  &cmu_disp {
> -	assigned-clocks = <&cmu_mif CLK_MOUT_SCLK_DECON_TV_ECLK_A>,
> +	assigned-clocks = <&cmu_disp CLK_FOUT_DISP_PLL>,
>  			  <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>,
> +			  <&cmu_disp CLK_MOUT_ACLK_DISP_333_USER>,
> +			  <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
> +			  <&cmu_disp CLK_MOUT_SCLK_DSIM0>,
> +			  <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
> +			  <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK>,
> +			  <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_RXCLKESC0_USER>,
> +			  <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER>,
> +			  <&cmu_disp CLK_MOUT_DISP_PLL>,
> +			  <&cmu_mif CLK_MOUT_SCLK_DECON_TV_ECLK_A>,
>  			  <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>,
>  			  <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK>;
> -	assigned-clock-parents = <&cmu_mif CLK_MOUT_BUS_PLL_DIV2>,
> -				 <0>,
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
>  				 <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
>  				 <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>;
> -	assigned-clock-rates = <0>, <400000000>;
> +	assigned-clock-rates = <266000000>, <400000000>;

The bootloader initialized the CLK_FOUT_DISP_PLL with 250000000. 
when checking the clock rate with clk_summary.

But, the pll table for fout_disp_pll in clk-exynos5433.c
doesn't include the entry for 250000000 rate. 

On this patch, I think you correct the frequency of CLK_FOUT_DISP_PLL.

Before applying this patch:
root@localhost:~# cat /sys/kernel/debug/clk/clk_summary | grep fout_disp_pll
    fout_disp_pll                         1            1   250000000          0 0  

After applying this patch:
root@localhost:~# cat /sys/kernel/debug/clk/clk_summary | grep fout_disp_pll     
    fout_disp_pll                         1            1   266000000          0 0  

>  };
>  
>  &cmu_fsys {
> 

I checked the relationship between clocks and parent clocks on this patch
with clock-exynos5433.c driver. Looks good to me.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
