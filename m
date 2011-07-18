From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 2/3] ARM: EXYNOS4: Add sclk_spdif clocks.
Date: Mon, 18 Jul 2011 14:33:19 +0900
Message-ID: <048301cc450c$37dc4b90$a794e2b0$%kim@samsung.com>
References: <1308655463-8787-1-git-send-email-ch.naveen@samsung.com>
 <1308655463-8787-3-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40737 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750990Ab1GRFd2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2011 01:33:28 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOI00ILEKRIJSH0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Jul 2011 14:33:26 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOI003OQKRQ3H@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Jul 2011 14:33:27 +0900 (KST)
In-reply-to: <1308655463-8787-3-git-send-email-ch.naveen@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>, jassisinghbrar@gmail.com, sbkim73@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: 'Seungwhan Youn' <sw.youn@samsung.com>

Naveen Krishna Chatradhi wrote:
> 
> Add the sclk_spdif clock is of type 'struct clksrc_clk' clock.
> Also, add clk_spdifextclk clocks of type 'struct clk' clock.
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
>  arch/arm/mach-exynos4/clock.c |   35
> +++++++++++++++++++++++++++++++++++
>  1 files changed, 35 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
> index 937335a..feeb27e 100644
> --- a/arch/arm/mach-exynos4/clock.c
> +++ b/arch/arm/mach-exynos4/clock.c
> @@ -64,6 +64,11 @@ static struct clk clk_audiocdclk2 = {
>  	.name		= "audiocdclk",
>  };
> 
> +static struct clk clk_spdifextclk = {
> +	.name		= "spdif_extclk",
> +	.id		= -1,
> +};
> +
>  static int exynos4_clksrc_mask_top_ctrl(struct clk *clk, int enable)
>  {
>  	return s5p_gatectrl(S5P_CLKSRC_MASK_TOP, clk, enable);
> @@ -550,6 +555,11 @@ static struct clk init_clocks_off[] = {
>  		.enable		= exynos4_clk_ip_peril_ctrl,
>  		.ctrlbit	= (1 << 21),
>  	}, {
> +		.name		= "spdif",
> +		.id		= -1,
> +		.enable		= exynos4_clk_ip_peril_ctrl,
> +		.ctrlbit	= (1 << 26),
> +	}, {

Need to re-work based on clkdev :)

>  		.name		= "ac97",
>  		.id		= -1,
>  		.enable		= exynos4_clk_ip_peril_ctrl,
> @@ -801,6 +811,30 @@ static struct clk init_clocks[] = {
>  	}
>  };
> 
> +static struct clk *clkset_sclk_spdif_list[] = {
> +	[0] = &clk_sclk_audio0.clk,
> +	[1] = &clk_sclk_audio1.clk,
> +	[2] = &clk_sclk_audio2.clk,
> +	[3] = &clk_spdifextclk,
> +};
> +
> +static struct clksrc_sources clkset_sclk_spdif = {
> +	.sources	= clkset_sclk_spdif_list,
> +	.nr_sources	= ARRAY_SIZE(clkset_sclk_spdif_list),
> +};
> +
> +static struct clksrc_clk clk_sclk_spdif = {
> +	.clk	= {
> +		.name		= "sclk_spdif",
> +		.id		= -1,
> +		.enable		= exynos4_clksrc_mask_peril1_ctrl,
> +		.ctrlbit	= (1 << 8),
> +		.ops		= &s5p_sclk_spdif_ops,
> +	},
> +		.sources = &clkset_sclk_spdif,
> +		.reg_src = { .reg = S5P_CLKSRC_PERIL1, .shift = 8, .size = 2
},
> +};

Hmm...is it possible to move this into struct clksrc_clk clksrcs[] ?

> +
>  static struct clk *clkset_group_list[] = {
>  	[0] = &clk_ext_xtal_mux,
>  	[1] = &clk_xusbxti,
> @@ -1206,6 +1240,7 @@ static struct clksrc_clk *sysclks[] = {
>  	&clk_sclk_audio0,
>  	&clk_sclk_audio1,
>  	&clk_sclk_audio2,
> +	&clk_sclk_spdif,
>  };
> 
>  static int xtal_rate;
> --
> 1.7.2.3


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
