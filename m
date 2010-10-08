From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/10] ARM: S5PC100: Modify SCLK_AUDIO{0,1,2} clock as
 sysclks
Date: Fri, 08 Oct 2010 18:57:52 +0900
Message-ID: <001801cb66cf$50855590$f19000b0$%kim@samsung.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
 <1286192356-17997-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28530 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752185Ab0JHJ6P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Oct 2010 05:58:15 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9Y008ZKUCDLA40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 18:57:49 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9Y00166UCD4X@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 18:57:49 +0900 (KST)
In-reply-to: <1286192356-17997-1-git-send-email-sw.youn@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Seungwhan Youn' <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: ben-linux@fluff.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

Seungwhan Youn wrote:
> 
> This patch modify SCLK_AUDIO{0,1,2} to be initial as sysclks
> on boot-time.
> 
> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
> ---
>  arch/arm/mach-s5pc100/clock.c |   72
++++++++++++++++++++++-------------------
>  1 files changed, 39 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pc100/clock.c b/arch/arm/mach-s5pc100/clock.c
> index 084abd1..42b7138 100644
> --- a/arch/arm/mach-s5pc100/clock.c
> +++ b/arch/arm/mach-s5pc100/clock.c
> @@ -848,6 +848,18 @@ struct clksrc_sources clk_src_group3 = {
>  	.nr_sources	= ARRAY_SIZE(clk_src_group3_list),
>  };
> 
> +static struct clksrc_clk clk_sclk_audio0 = {
> +	.clk	= {
> +		.name		= "sclk_audio",
> +		.id		= 0,
> +		.ctrlbit	= (1 << 8),
> +		.enable		= s5pc100_sclk1_ctrl,
> +	},
> +	.sources = &clk_src_group3,
> +	.reg_src = { .reg = S5P_CLK_SRC3, .shift = 12, .size = 3 },
> +	.reg_div = { .reg = S5P_CLK_DIV4, .shift = 12, .size = 4 },
> +};
> +
>  static struct clk *clk_src_group4_list[] = {
>  	[0] = &clk_mout_epll.clk,
>  	[1] = &clk_div_mpll.clk,
> @@ -862,6 +874,18 @@ struct clksrc_sources clk_src_group4 = {
>  	.nr_sources	= ARRAY_SIZE(clk_src_group4_list),
>  };
> 
> +static struct clksrc_clk clk_sclk_audio1 = {
> +	.clk	= {
> +		.name		= "sclk_audio",
> +		.id		= 1,
> +		.ctrlbit	= (1 << 9),
> +		.enable		= s5pc100_sclk1_ctrl,
> +	},
> +	.sources = &clk_src_group4,
> +	.reg_src = { .reg = S5P_CLK_SRC3, .shift = 16, .size = 3 },
> +	.reg_div = { .reg = S5P_CLK_DIV4, .shift = 16, .size = 4 },
> +};
> +
>  static struct clk *clk_src_group5_list[] = {
>  	[0] = &clk_mout_epll.clk,
>  	[1] = &clk_div_mpll.clk,
> @@ -875,6 +899,18 @@ struct clksrc_sources clk_src_group5 = {
>  	.nr_sources	= ARRAY_SIZE(clk_src_group5_list),
>  };
> 
> +static struct clksrc_clk clk_sclk_audio2 = {
> +	.clk	= {
> +		.name		= "sclk_audio",
> +		.id		= 2,
> +		.ctrlbit	= (1 << 10),
> +		.enable		= s5pc100_sclk1_ctrl,
> +	},
> +	.sources = &clk_src_group5,
> +	.reg_src = { .reg = S5P_CLK_SRC3, .shift = 20, .size = 3 },
> +	.reg_div = { .reg = S5P_CLK_DIV4, .shift = 20, .size = 4 },
> +};
> +
>  static struct clk *clk_src_group6_list[] = {
>  	[0] = &s5p_clk_27m,
>  	[1] = &clk_vclk54m,
> @@ -1001,39 +1037,6 @@ static struct clksrc_clk clksrcs[] = {
>  		.reg_src = { .reg = S5P_CLK_SRC2, .shift = 28, .size = 2 },
>  	}, {
>  		.clk	= {
> -			.name		= "sclk_audio",
> -			.id		= 0,
> -			.ctrlbit	= (1 << 8),
> -			.enable		= s5pc100_sclk1_ctrl,
> -
> -		},
> -		.sources = &clk_src_group3,
> -		.reg_src = { .reg = S5P_CLK_SRC3, .shift = 12, .size = 3 },
> -		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 12, .size = 4 },
> -	}, {
> -		.clk	= {
> -			.name		= "sclk_audio",
> -			.id		= 1,
> -			.ctrlbit	= (1 << 9),
> -			.enable		= s5pc100_sclk1_ctrl,
> -
> -		},
> -		.sources = &clk_src_group4,
> -		.reg_src = { .reg = S5P_CLK_SRC3, .shift = 16, .size = 3 },
> -		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 16, .size = 4 },
> -	}, {
> -		.clk	= {
> -			.name		= "sclk_audio",
> -			.id		= 2,
> -			.ctrlbit	= (1 << 10),
> -			.enable		= s5pc100_sclk1_ctrl,
> -
> -		},
> -		.sources = &clk_src_group5,
> -		.reg_src = { .reg = S5P_CLK_SRC3, .shift = 20, .size = 3 },
> -		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 20, .size = 4 },
> -	}, {
> -		.clk	= {
>  			.name		= "sclk_lcd",
>  			.id		= -1,
>  			.ctrlbit	= (1 << 0),
> @@ -1179,6 +1182,9 @@ static struct clksrc_clk *sysclks[] = {
>  	&clk_div_pclkd1,
>  	&clk_div_cam,
>  	&clk_div_hdmi,
> +	&clk_sclk_audio0,
> +	&clk_sclk_audio1,
> +	&clk_sclk_audio2,
>  };
> 
>  void __init_or_cpufreq s5pc100_setup_clocks(void)
> --

Ok...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
