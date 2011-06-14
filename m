From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/5] ARM: EXYNOS4: Add sclk_spdif clocks
Date: Tue, 14 Jun 2011 14:47:35 +0900
Message-ID: <005701cc2a56$947a7870$bd6f6950$%kim@samsung.com>
References: <1307687667-9127-1-git-send-email-ch.naveen@samsung.com>
 <1307687667-9127-3-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:12326 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751155Ab1FNFrp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jun 2011 01:47:45 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMR00AZOMPU2CM0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jun 2011 14:47:43 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LMR00J6DMRJUF@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jun 2011 14:47:43 +0900 (KST)
In-reply-to: <1307687667-9127-3-git-send-email-ch.naveen@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>, broonie@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com, lrg@ti.com, sbkim73@samsung.com, sw.youn@samsung.com, linux-samsung-

> From: Naveen Krishna Chatradhi wrote:
> 
> Add the sclk_spdif clock is of type 'struct clksrc_clk' clock.
> Also, add clk_spdifcdclk clocks of type 'struct clk' clock.
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
>  arch/arm/mach-exynos4/clock.c |   70
> +++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 70 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
> index 7aa4aef..57ca356 100644
> --- a/arch/arm/mach-exynos4/clock.c
> +++ b/arch/arm/mach-exynos4/clock.c
> @@ -73,6 +73,11 @@ static struct clk clk_audiocdclk2 = {
>  	.id		= 2,
>  };
> 
> +static struct clk clk_spdifcdclk = {
> +	.name		= "spdifcdclk",
> +	.id		= -1,
> +};

Do we really need this?

spdif_extclk? not spdifcdclk.

> +
>  static int exynos4_clksrc_mask_top_ctrl(struct clk *clk, int enable)
>  {
>  	return s5p_gatectrl(S5P_CLKSRC_MASK_TOP, clk, enable);
> @@ -592,6 +597,11 @@ static struct clk init_clocks_off[] = {
>  		.enable		= exynos4_clk_ip_peril_ctrl,
>  		.ctrlbit	= (1 << 21),
>  	}, {
> +		.name		= "spdif",
> +		.id		= -1,
> +		.enable		= exynos4_clk_ip_peril_ctrl,
> +		.ctrlbit	= (1 << 26),
> +	}, {
>  		.name		= "ac97",
>  		.id		= -1,
>  		.enable		= exynos4_clk_ip_peril_ctrl,
> @@ -858,6 +868,65 @@ static struct clk init_clocks[] = {
>  	}
>  };
> 
> +static int exynos4_spdif_set_rate(struct clk *clk, unsigned long rate)
> +{
> +	struct clk *pclk;
> +	int ret;
> +
> +	pclk = clk_get_parent(clk);
> +	if (IS_ERR(pclk))
> +		return -EINVAL;
> +
> +	ret = pclk->ops->set_rate(pclk, rate);
> +	clk_put(pclk);
> +
> +	return ret;
> +}
> +
> +static unsigned long exynos4_spdif_get_rate(struct clk *clk)
> +{
> +	struct clk *pclk;
> +	int rate;
> +
> +	pclk = clk_get_parent(clk);
> +	if (IS_ERR(pclk))
> +		return -EINVAL;
> +
> +	rate = pclk->ops->get_rate(clk);
> +	clk_put(pclk);
> +
> +	return rate;
> +}

I think, we can move above into plat-s5p for common spdif with others.

> +
> +static struct clk_ops exynos4_sclk_spdif_ops = {
> +	.set_rate	= exynos4_spdif_set_rate,
> +	.get_rate	= exynos4_spdif_get_rate,
> +};
> +
> +static struct clk *clkset_sclk_spdif_list[] = {
> +	[0] = &clk_sclk_audio0.clk,
> +	[1] = &clk_sclk_audio1.clk,
> +	[2] = &clk_sclk_audio2.clk,
> +	[3] = &clk_spdifcdclk,
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
> +		.ops		= &exynos4_sclk_spdif_ops,
> +	},
> +		.sources = &clkset_sclk_spdif,
> +		.reg_src = { .reg = S5P_CLKSRC_PERIL1, .shift = 8, .size = 2
},
> +};
> +
>  static struct clk *clkset_group_list[] = {
>  	[0] = &clk_ext_xtal_mux,
>  	[1] = &clk_xusbxti,
> @@ -1274,6 +1343,7 @@ static struct clksrc_clk *sysclks[] = {
>  	&clk_sclk_audio0,
>  	&clk_sclk_audio1,
>  	&clk_sclk_audio2,
> +	&clk_sclk_spdif,
>  };
> 
>  static u32 epll_div[][6] = {
> --
> 1.7.2.3



Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
