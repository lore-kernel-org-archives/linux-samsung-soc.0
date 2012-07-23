From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH V2 7/7] ARM: EXYNOS5: Set parent clock to fimd
Date: Mon, 23 Jul 2012 17:41:07 +0900
Message-ID: <500D0E23.307@samsung.com>
References: <1342591053-7092-1-git-send-email-l.krishna@samsung.com>
 <1342591053-7092-8-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:31017 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751691Ab2GWIk4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jul 2012 04:40:56 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7L0036PURI5BD0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Jul 2012 17:40:55 +0900 (KST)
Received: from [10.90.51.60] by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0M7L002QTUS6EK40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Jul 2012 17:40:54 +0900 (KST)
In-reply-to: <1342591053-7092-8-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, jg1.han@samsung.com, joshi@samsung.com, grant.likely@secretlab.ca, linux-samsung-soc@vger.kernel.org, thomas.ab@samsung.com, olofj@google.com

Hi, Leela.

On 07/18/2012 02:57 PM, Leela Krishna Amudala wrote:
> This patch sets mout_mpll_user as parent clock to fimd also
> sets Fimd source clock rate to 800 MHz for MIPI LCD

Don't decide parent clock at the common clock codes.

Thanks.

>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>   arch/arm/mach-exynos/clock-exynos5.c       |   25 +++++++++++++++----------
>   arch/arm/mach-exynos/mach-exynos5-dt.c     |   11 +++++++++++
>   arch/arm/plat-samsung/include/plat/clock.h |    2 ++
>   3 files changed, 28 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
> index f001876..8c20c4d 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -1125,6 +1125,18 @@ static struct clksrc_clk exynos5_clk_sclk_spi2 = {
>   	.reg_div = { .reg = EXYNOS5_CLKDIV_PERIC2, .shift = 8, .size = 8 },
>   };
>   
> +struct clksrc_clk exynos5_clk_sclk_fimd = {
> +	.clk	= {
> +		.name	        = "sclk_fimd",
> +		.devname        = "exynos5-fb",
> +		.enable         = exynos5_clksrc_mask_disp1_0_ctrl,
> +		.ctrlbit        = (1 << 0),
> +	},
> +	.sources = &exynos5_clkset_group,
> +	.reg_src = { .reg = EXYNOS5_CLKSRC_DISP1_0, .shift = 0, .size = 4 },
> +	.reg_div = { .reg = EXYNOS5_CLKDIV_DISP1_0, .shift = 0, .size = 4 },
> +};
> +
>   static struct clksrc_clk exynos5_clksrcs[] = {
>   	{
>   		.clk	= {
> @@ -1136,16 +1148,6 @@ static struct clksrc_clk exynos5_clksrcs[] = {
>   		.reg_div = { .reg = EXYNOS5_CLKDIV_FSYS3, .shift = 8, .size = 8 },
>   	}, {
>   		.clk	= {
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
>   			.name		= "aclk_266_gscl",
>   		},
>   		.sources = &clk_src_gscl_266,
> @@ -1245,6 +1247,7 @@ static struct clksrc_clk *exynos5_sysclks[] = {
>   	&exynos5_clk_mdout_spi0,
>   	&exynos5_clk_mdout_spi1,
>   	&exynos5_clk_mdout_spi2,
> +	&exynos5_clk_sclk_fimd,
>   };
>   
>   static struct clk *exynos5_clk_cdev[] = {
> @@ -1497,6 +1500,8 @@ void __init_or_cpufreq exynos5_setup_clocks(void)
>   
>   	clk_set_rate(&exynos5_clk_aclk_acp.clk, 267000000);
>   	clk_set_rate(&exynos5_clk_pclk_acp.clk, 134000000);
> +	clk_set_parent(&exynos5_clk_sclk_fimd.clk,
> +			&exynos5_clk_mout_mpll_user.clk);
>   
>   	for (ptr = 0; ptr < ARRAY_SIZE(exynos5_clksrcs); ptr++)
>   		s3c_set_clksrc(&exynos5_clksrcs[ptr], true);
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
> index 2107e01..19f3724 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -24,6 +24,9 @@
>   #include <plat/regs-serial.h>
>   #include <plat/backlight.h>
>   #include <plat/gpio-cfg.h>
> +#include <plat/clock.h>
> +#include <plat/s5p-clock.h>
> +#include <plat/clock-clksrc.h>
>   
>   #include "common.h"
>   #include <video/platform_lcd.h>
> @@ -176,9 +179,17 @@ static void __init exynos5250_dt_map_io(void)
>   
>   static void __init exynos5250_dt_machine_init(void)
>   {
> +	struct device_node *fimd_node;
> +
>   	samsung_bl_set(&smdk5250_bl_gpio_info, &smdk5250_bl_data);
>   	of_platform_populate(NULL, of_default_bus_match_table,
>   				exynos5250_auxdata_lookup, NULL);
> +
> +	fimd_node = of_find_node_with_property(NULL, "supports-mipi-panel");
> +	if (of_get_property(fimd_node, "supports-mipi-panel", NULL))
> +		clk_set_rate(&exynos5_clk_sclk_fimd.clk, 800000000);
> +	of_node_put(fimd_node);
> +
>   	exynos_fimd_gpio_setup_24bpp();
>   	platform_add_devices(smdk5250_devices, ARRAY_SIZE(smdk5250_devices));
>   }
> diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/plat-samsung/include/plat/clock.h
> index a62753d..3d27783 100644
> --- a/arch/arm/plat-samsung/include/plat/clock.h
> +++ b/arch/arm/plat-samsung/include/plat/clock.h
> @@ -83,6 +83,8 @@ extern struct clk clk_ext;
>   extern struct clksrc_clk clk_epllref;
>   extern struct clksrc_clk clk_esysclk;
>   
> +extern struct clksrc_clk exynos5_clk_sclk_fimd;
> +
>   /* S3C64XX specific clocks */
>   extern struct clk clk_h2;
>   extern struct clk clk_27m;
