From: Jingoo Han <jg1.han@samsung.com>
Subject: RE: [PATCH 7/7] ARM: EXYNOS5: Set parent clock to fimd
Date: Wed, 11 Jul 2012 19:24:08 +0900
Message-ID: <001e01cd5f4f$4e316ed0$ea944c70$%han@samsung.com>
References: <1341999741-15578-1-git-send-email-l.krishna@samsung.com>
 <1341999741-15578-8-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:63067 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751688Ab2GKKYK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jul 2012 06:24:10 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6Z00BX1RK1QCO0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 19:24:08 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.119.56])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6Z009VFRK8R640@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 19:24:08 +0900 (KST)
In-reply-to: <1341999741-15578-8-git-send-email-l.krishna@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Leela Krishna Amudala' <l.krishna@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, olofj@google.com, thomas.ab@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, 'Jingoo Han' <jg1.han@samsung.com>

On July 11, 2012 6:42 PM, Leela Krishna Amudala <l.krishna@samsung.com> wrote:

> 
> From: Leela Krishna <l.krishna@samsung.com>
> 
> This patch sets mout_mpll_user as parent clock to fimd also
> sets Fimd source clock rate to 800 MHz for MIPI LCD
> 
> Signed-off-by: Leela Krishna <l.krishna@samsung.com>
> ---
>  arch/arm/mach-exynos/clock-exynos5.c       |   25 +++++++++++++++----------
>  arch/arm/mach-exynos/mach-exynos5-dt.c     |   11 +++++++++++
>  arch/arm/plat-samsung/include/plat/clock.h |    2 ++
>  3 files changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
> index 61bf88d..a0d65f6 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -1039,6 +1039,18 @@ static struct clksrc_clk exynos5_clk_sclk_mmc3 = {
>  	.reg_div = { .reg = EXYNOS5_CLKDIV_FSYS2, .shift = 24, .size = 8 },
>  };
> 
> +struct clksrc_clk exynos5_clk_sclk_fimd = {
> +	.clk	= {
> +		.name		= "sclk_fimd",
> +		.devname	= "exynos5-fb",
> +		.enable		= exynos5_clksrc_mask_disp1_0_ctrl,
> +		.ctrlbit	= (1 << 0),
> +	},
> +	.sources = &exynos5_clkset_group,
> +	.reg_src = { .reg = EXYNOS5_CLKSRC_DISP1_0, .shift = 0,	.size = 4 },

Please use spaces instead of tab.

> +	.reg_div = { .reg = EXYNOS5_CLKDIV_DISP1_0, .shift = 0, .size = 4 },
> +};
> +
>  static struct clksrc_clk exynos5_clksrcs[] = {
>  	{
>  		.clk	= {
> @@ -1050,16 +1062,6 @@ static struct clksrc_clk exynos5_clksrcs[] = {
>  		.reg_div = { .reg = EXYNOS5_CLKDIV_FSYS3, .shift = 8, .size = 8 },
>  	}, {
>  		.clk	= {
> -			.name		= "sclk_fimd",
> -			.devname	= "exynos5-fb",
> -			.enable		= exynos5_clksrc_mask_disp1_0_ctrl,
> -			.ctrlbit	= (1 << 0),
> -		},
> -		.sources = &exynos5_clkset_group,
> -		.reg_src = { .reg = EXYNOS5_CLKSRC_DISP1_0, .shift = 0, .size = 4 },
> -		.reg_div = { .reg = EXYNOS5_CLKDIV_DISP1_0, .shift = 0, .size = 4 },
> -	}, {
> -		.clk	= {
>  			.name		= "aclk_266_gscl",
>  		},
>  		.sources = &clk_src_gscl_266,
> @@ -1153,6 +1155,7 @@ static struct clksrc_clk *exynos5_sysclks[] = {
>  	&exynos5_clk_dout_mmc4,
>  	&exynos5_clk_aclk_acp,
>  	&exynos5_clk_pclk_acp,
> +	&exynos5_clk_sclk_fimd,
>  };
> 
>  static struct clk *exynos5_clk_cdev[] = {
> @@ -1402,6 +1405,8 @@ void __init_or_cpufreq exynos5_setup_clocks(void)
> 
>  	clk_set_rate(&exynos5_clk_aclk_acp.clk, 267000000);
>  	clk_set_rate(&exynos5_clk_pclk_acp.clk, 134000000);
> +	clk_set_parent(&exynos5_clk_sclk_fimd.clk,
> +			&exynos5_clk_mout_mpll_user.clk);
> 
>  	for (ptr = 0; ptr < ARRAY_SIZE(exynos5_clksrcs); ptr++)
>  		s3c_set_clksrc(&exynos5_clksrcs[ptr], true);
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
> index 9d5bccc..248ca58 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -24,6 +24,9 @@
>  #include <plat/regs-serial.h>
>  #include <plat/backlight.h>
>  #include <plat/gpio-cfg.h>
> +#include <plat/clock.h>
> +#include <plat/s5p-clock.h>
> +#include <plat/clock-clksrc.h>
> 
>  #include "common.h"
> 
> @@ -172,9 +175,17 @@ static void __init exynos5250_dt_map_io(void)
> 
>  static void __init exynos5250_dt_machine_init(void)
>  {
> +	struct device_node *fimd_node;
> +
>  	samsung_bl_set(&smdk5250_bl_gpio_info, &smdk5250_bl_data);
>  	of_platform_populate(NULL, of_default_bus_match_table,
>  				exynos5250_auxdata_lookup, NULL);
> +

Delete this useless line.

> +	fimd_node = of_find_node_with_property(NULL, "supports-mipi-panel");
> +	if (of_get_property(fimd_node, "supports-mipi-panel", NULL))
> +		clk_set_rate(&exynos5_clk_sclk_fimd.clk, 800000000);
> +	of_node_put(fimd_node);
> +
>  	exynos_fimd_gpio_setup_24bpp();
>  	platform_add_devices(smdk5250_devices, ARRAY_SIZE(smdk5250_devices));
>  }
> diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/plat-samsung/include/plat/clock.h
> index a62753d..3d27783 100644
> --- a/arch/arm/plat-samsung/include/plat/clock.h
> +++ b/arch/arm/plat-samsung/include/plat/clock.h
> @@ -83,6 +83,8 @@ extern struct clk clk_ext;
>  extern struct clksrc_clk clk_epllref;
>  extern struct clksrc_clk clk_esysclk;
> 
> +extern struct clksrc_clk exynos5_clk_sclk_fimd;
> +
>  /* S3C64XX specific clocks */
>  extern struct clk clk_h2;
>  extern struct clk clk_27m;
> --
> 1.7.0.4
