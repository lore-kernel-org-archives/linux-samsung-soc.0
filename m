From: Jingoo Han <jg1.han@samsung.com>
Subject: RE: [PATCH 2/3] ARM: EXYNOS: Add clkdev lookup entry for lcd clock
Date: Wed, 29 Feb 2012 19:26:54 +0900
Message-ID: <001701ccf6cc$a83727d0$f8a57770$%han@samsung.com>
References: <1322718611-20934-1-git-send-email-tushar.behera@linaro.org>
 <1322718611-20934-3-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60293 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756747Ab2B2K0z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 05:26:55 -0500
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M050041CH0UU0J0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Feb 2012 19:26:54 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.119.56])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0M0500FRAH0U0M20@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 29 Feb 2012 19:26:54 +0900 (KST)
In-reply-to: <1322718611-20934-3-git-send-email-tushar.behera@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org

Hi Tushar,

> -----Original Message-----
> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-soc-owner@vger.kernel.org] On Behalf
> Of Tushar Behera
> Sent: Thursday, December 01, 2011 2:50 PM
> To: linux-samsung-soc@vger.kernel.org
> Cc: kgene.kim@samsung.com; linaro-dev@lists.linaro.org; patches@linaro.org
> Subject: [PATCH 2/3] ARM: EXYNOS: Add clkdev lookup entry for lcd clock
> 
> The framebuffer driver needs the clock named 'lcd' as its bus
> clock but the equivalent clock on Exynos4 is named as 'fimd'.
> Hence, create a clkdev lookup entry with the name 'lcd' that
> references the 'fimd' clock.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>

Acked-by: Jingoo Han <jg1.han@samsung.com>

I also tested this patch with SMDKV310 board.
It works properly.

Thank you.

> ---
>  arch/arm/mach-exynos/clock.c |   14 +++++++++-----
>  1 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/clock.c b/arch/arm/mach-exynos/clock.c
> index 5d8d483..607ec28 100644
> --- a/arch/arm/mach-exynos/clock.c
> +++ b/arch/arm/mach-exynos/clock.c
> @@ -489,11 +489,6 @@ static struct clk init_clocks_off[] = {
>  		.enable		= exynos4_clk_ip_cam_ctrl,
>  		.ctrlbit	= (1 << 3),
>  	}, {
> -		.name		= "fimd",
> -		.devname	= "exynos4-fb.0",
> -		.enable		= exynos4_clk_ip_lcd0_ctrl,
> -		.ctrlbit	= (1 << 0),
> -	}, {
>  		.name		= "hsmmc",
>  		.devname	= "s3c-sdhci.0",
>  		.parent		= &clk_aclk_133.clk,
> @@ -782,6 +777,13 @@ static struct clk clk_pdma1 = {
>  	.ctrlbit	= (1 << 1),
>  };
> 
> +static struct clk clk_fimd0 = {
> +	.name		= "fimd",
> +	.devname	= "exynos4-fb.0",
> +	.enable		= exynos4_clk_ip_lcd0_ctrl,
> +	.ctrlbit	= (1 << 0),
> +};
> +
>  struct clk *clkset_group_list[] = {
>  	[0] = &clk_ext_xtal_mux,
>  	[1] = &clk_xusbxti,
> @@ -1294,6 +1296,7 @@ static struct clksrc_clk *sysclks[] = {
>  static struct clk *clk_cdev[] = {
>  	&clk_pdma0,
>  	&clk_pdma1,
> +	&clk_fimd0,
>  };
> 
>  static struct clksrc_clk *clksrc_cdev[] = {
> @@ -1318,6 +1321,7 @@ static struct clk_lookup exynos4_clk_lookup[] = {
>  	CLKDEV_INIT("s3c-sdhci.3", "mmc_busclk.2", &clk_sclk_mmc3.clk),
>  	CLKDEV_INIT("dma-pl330.0", "apb_pclk", &clk_pdma0),
>  	CLKDEV_INIT("dma-pl330.1", "apb_pclk", &clk_pdma1),
> +	CLKDEV_INIT("exynos4-fb.0", "lcd", &clk_fimd0),
>  };
> 
>  static int xtal_rate;
> --
> 1.7.4.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
