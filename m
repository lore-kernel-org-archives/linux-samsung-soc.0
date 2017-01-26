From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/2] clk: samsung: exynos5433: Add IDs for
 PHYCLK_MIPIDPHY0_* clocks
Date: Thu, 26 Jan 2017 09:22:49 +0900
Message-ID: <58894159.1050007@samsung.com>
References: <1485345118-3082-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170125115214eucas1p1517ce7ca8fe88e4742a1306630b91d09@eucas1p1.samsung.com>
 <1485345118-3082-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39018 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751829AbdAZAww (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 19:52:52 -0500
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OKD00BX22E2II10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jan 2017 09:22:50 +0900 (KST)
In-reply-to: <1485345118-3082-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi,

On 2017년 01월 25일 20:51, Marek Szyprowski wrote:
> Add missing identifiers for phyclk_mipidphy0_bitclkdiv8_phy and
> phyclk_mipidphy0_rxclkesc0_phy clocks. Access to those clocks is needed
> to setup initial clock configuration for display subsystem in device tree
> in order to avoid dependency on the configuration left by the bootloader.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c   | 6 ++++--
>  include/dt-bindings/clock/exynos5433.h | 5 ++++-
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index 0db5204c307c..1ab4fca255e1 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -2559,8 +2559,10 @@ static void __init exynos5433_cmu_g2d_init(struct device_node *np)
>  	FRATE(0, "phyclk_mipidphy1_bitclkdiv8_phy", NULL, 0, 188000000),
>  	FRATE(0, "phyclk_mipidphy1_rxclkesc0_phy", NULL, 0, 100000000),
>  	/* PHY clocks from MIPI_DPHY0 */
> -	FRATE(0, "phyclk_mipidphy0_bitclkdiv8_phy", NULL, 0, 188000000),
> -	FRATE(0, "phyclk_mipidphy0_rxclkesc0_phy", NULL, 0, 100000000),
> +	FRATE(CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY, "phyclk_mipidphy0_bitclkdiv8_phy",
> +			NULL, 0, 188000000),
> +	FRATE(CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY, "phyclk_mipidphy0_rxclkesc0_phy",
> +			NULL, 0, 100000000),
>  	/* PHY clocks from HDMI_PHY */
>  	FRATE(CLK_PHYCLK_HDMIPHY_TMDS_CLKO_PHY, "phyclk_hdmiphy_tmds_clko_phy",
>  			NULL, 0, 300000000),
> diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
> index 4fa6bb2136e3..be39d23e6a32 100644
> --- a/include/dt-bindings/clock/exynos5433.h
> +++ b/include/dt-bindings/clock/exynos5433.h
> @@ -771,7 +771,10 @@
>  
>  #define CLK_PCLK_DECON					113
>  
> -#define DISP_NR_CLK					114
> +#define CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY		114
> +#define CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY		115
> +
> +#define DISP_NR_CLK					116
>  
>  /* CMU_AUD */
>  #define CLK_MOUT_AUD_PLL_USER				1
> 

Looks good to me.
Acked-by: Chanwoo Choi <cw00.choi@samsugn.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
