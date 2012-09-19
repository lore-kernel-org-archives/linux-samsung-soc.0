From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V5] ARM: EXYNOS5: Add bus clock for FIMD
Date: Thu, 20 Sep 2012 08:20:40 +0900
Message-ID: <099f01cd96bd$623d1cd0$26b75670$%kim@samsung.com>
References: <1347978288-27759-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:11207 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752601Ab2ISXUl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Sep 2012 19:20:41 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAM0068IE63L140@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:20:40 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAM00JARE6GNYD0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:20:40 +0900 (KST)
In-reply-to: <1347978288-27759-1-git-send-email-l.krishna@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Leela Krishna Amudala' <l.krishna@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, jg1.han@samsung.com

Leela Krishna Amudala wrote:
> 
> This patch adds the bus clock for FIMD and changes the device name for lcd
> clock
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/mach-exynos/clock-exynos5.c |   32
++++++++++++++++++++++--------
> --
>  1 files changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-
> exynos/clock-exynos5.c
> index 774533c..404c53d 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -891,6 +891,13 @@ static struct clk exynos5_clk_mdma1 = {
>  	.ctrlbit	= (1 << 4),
>  };
> 
> +static struct clk exynos5_clk_fimd1 = {
> +	.name		= "fimd",
> +	.devname	= "exynos5-fb.1",
> +	.enable		= exynos5_clk_ip_disp1_ctrl,
> +	.ctrlbit	= (1 << 0),
> +};
> +
>  struct clk *exynos5_clkset_group_list[] = {
>  	[0] = &clk_ext_xtal_mux,
>  	[1] = NULL,
> @@ -1120,6 +1127,18 @@ static struct clksrc_clk exynos5_clk_sclk_spi2 = {
>  	.reg_div = { .reg = EXYNOS5_CLKDIV_PERIC2, .shift = 8, .size = 8 },
>  };
> 
> +struct clksrc_clk exynos5_clk_sclk_fimd1 = {
> +	.clk	= {
> +		.name		= "sclk_fimd",
> +		.devname	= "exynos5-fb.1",
> +		.enable		= exynos5_clksrc_mask_disp1_0_ctrl,
> +		.ctrlbit	= (1 << 0),
> +	},
> +	.sources = &exynos5_clkset_group,
> +	.reg_src = { .reg = EXYNOS5_CLKSRC_DISP1_0, .shift = 0, .size = 4 },
> +	.reg_div = { .reg = EXYNOS5_CLKDIV_DISP1_0, .shift = 0, .size = 4 },
> +};
> +
>  static struct clksrc_clk exynos5_clksrcs[] = {
>  	{
>  		.clk	= {
> @@ -1131,16 +1150,6 @@ static struct clksrc_clk exynos5_clksrcs[] = {
>  		.reg_div = { .reg = EXYNOS5_CLKDIV_FSYS3, .shift = 8, .size
> = 8 },
>  	}, {
>  		.clk	= {
> -			.name		= "sclk_fimd",
> -			.devname	= "s3cfb.1",
> -			.enable		= exynos5_clksrc_mask_disp1_0_ctrl,
> -			.ctrlbit	= (1 << 0),
> -		},
> -		.sources = &exynos5_clkset_group,
> -		.reg_src = { .reg = EXYNOS5_CLKSRC_DISP1_0, .shift =
> 0, .size = 4 },
> -		.reg_div = { .reg = EXYNOS5_CLKDIV_DISP1_0, .shift =
> 0, .size = 4 },
> -	}, {
> -		.clk	= {
>  			.name		= "aclk_266_gscl",
>  		},
>  		.sources = &clk_src_gscl_266,
> @@ -1240,12 +1249,14 @@ static struct clksrc_clk *exynos5_sysclks[] = {
>  	&exynos5_clk_mdout_spi0,
>  	&exynos5_clk_mdout_spi1,
>  	&exynos5_clk_mdout_spi2,
> +	&exynos5_clk_sclk_fimd1,
>  };
> 
>  static struct clk *exynos5_clk_cdev[] = {
>  	&exynos5_clk_pdma0,
>  	&exynos5_clk_pdma1,
>  	&exynos5_clk_mdma1,
> +	&exynos5_clk_fimd1,
>  };
> 
>  static struct clksrc_clk *exynos5_clksrc_cdev[] = {
> @@ -1274,6 +1285,7 @@ static struct clk_lookup exynos5_clk_lookup[] = {
>  	CLKDEV_INIT("dma-pl330.0", "apb_pclk", &exynos5_clk_pdma0),
>  	CLKDEV_INIT("dma-pl330.1", "apb_pclk", &exynos5_clk_pdma1),
>  	CLKDEV_INIT("dma-pl330.2", "apb_pclk", &exynos5_clk_mdma1),
> +	CLKDEV_INIT("exynos5-fb.1", "lcd", &exynos5_clk_fimd1),
>  };
> 
>  static unsigned long exynos5_epll_get_rate(struct clk *clk)
> --
> 1.7.0.4

Looks OK to me, will apply with Jingoo's ack(Or review?).

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
