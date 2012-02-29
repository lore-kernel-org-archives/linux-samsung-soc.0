From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/3] ARM: EXYNOS: Add clkdev lookup entry for lcd clock
Date: Wed, 29 Feb 2012 10:02:50 +0100
Message-ID: <4F4DE9BA.7010102@samsung.com>
References: <1322718611-20934-1-git-send-email-tushar.behera@linaro.org>
 <1322718611-20934-3-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:13050 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753983Ab2B2JCw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 04:02:52 -0500
Received: from euspt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M05007B2D4RGA@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Feb 2012 09:02:51 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0500GBOD4QRN@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Feb 2012 09:02:51 +0000 (GMT)
In-reply-to: <1322718611-20934-3-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org

Hi Tushar,

On 12/01/2011 06:50 AM, Tushar Behera wrote:
> The framebuffer driver needs the clock named 'lcd' as its bus
> clock but the equivalent clock on Exynos4 is named as 'fimd'.
> Hence, create a clkdev lookup entry with the name 'lcd' that
> references the 'fimd' clock.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

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

Thanks,
-- 
Sylwester Nawrocki
Samsung Poland R&D Center
