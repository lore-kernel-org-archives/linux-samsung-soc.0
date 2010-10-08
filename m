From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 5/10] ARM: S5PV210: Add SCLK_SPDIF clock
Date: Fri, 08 Oct 2010 19:16:01 +0900
Message-ID: <001b01cb66d1$d2a27010$77e75030$%kim@samsung.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
 <1286193154-17201-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53209 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755102Ab0JHKPr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Oct 2010 06:15:47 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9Y00FILV6A2H00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 19:15:46 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9Y005RBV6A99@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 19:15:46 +0900 (KST)
In-reply-to: <1286193154-17201-1-git-send-email-sw.youn@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Seungwhan Youn' <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: ben-linux@fluff.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

Seungwhan Youn wrote:
> 
> This patch add SCLK_SPDIF clock to support source clock of S/PDIF
> on S5PV210.
> 
> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
> ---
>  arch/arm/mach-s5pv210/clock.c |   62
> +++++++++++++++++++++++++++++++++++------
>  1 files changed, 53 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
> index d562670..195a088 100644
> --- a/arch/arm/mach-s5pv210/clock.c
> +++ b/arch/arm/mach-s5pv210/clock.c
> @@ -431,6 +431,12 @@ static struct clk init_clocks_disable[] = {
>  		.parent		= &clk_p,
>  		.enable		= s5pv210_clk_ip3_ctrl,
>  		.ctrlbit	= (1 << 6),
> +	}, {
> +		.name		= "spdif",
> +		.id		= -1,
> +		.parent		= &clk_p,
> +		.enable		= s5pv210_clk_ip3_ctrl,
> +		.ctrlbit	= (1 << 0),
>  	},
>  };
> 
> @@ -660,6 +666,53 @@ static struct clksrc_sources clkset_sclk_spdif = {
>  	.nr_sources	= ARRAY_SIZE(clkset_sclk_spdif_list),
>  };
> 
> +static int s5pv210_spdif_set_rate(struct clk *clk, unsigned long rate)
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

Similar with previous reply...please refer to it...

> +static unsigned long s5pv210_spdif_get_rate(struct clk *clk)
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
> +
> +static struct clk_ops s5pv210_sclk_spdif_ops = {
> +	.set_rate	= s5pv210_spdif_set_rate,
> +	.get_rate	= s5pv210_spdif_get_rate,
> +};
> +
> +static struct clksrc_clk clk_sclk_spdif = {
> +	.clk		= {
> +		.name		= "sclk_spdif",
> +		.id		= -1,
> +		.enable		= s5pv210_clk_mask0_ctrl,
> +		.ctrlbit	= (1 << 27),
> +		.ops		= &s5pv210_sclk_spdif_ops,
> +	},
> +	.sources = &clkset_sclk_spdif,
> +	.reg_src = { .reg = S5P_CLK_SRC6, .shift = 12, .size = 2 },
> +};
> +
>  static struct clk *clkset_group2_list[] = {
>  	[0] = &clk_ext_xtal_mux,
>  	[1] = &clk_xusbxti,
> @@ -744,15 +797,6 @@ static struct clksrc_clk clksrcs[] = {
>  		.sources = &clkset_sclk_mixer,
>  		.reg_src = { .reg = S5P_CLK_SRC1, .shift = 4, .size = 1 },
>  	}, {
> -		.clk		= {
> -			.name		= "sclk_spdif",
> -			.id		= -1,
> -			.enable		= s5pv210_clk_mask0_ctrl,
> -			.ctrlbit	= (1 << 27),
> -		},
> -		.sources = &clkset_sclk_spdif,
> -		.reg_src = { .reg = S5P_CLK_SRC6, .shift = 12, .size = 2 },
> -	}, {
>  		.clk	= {
>  			.name		= "sclk_fimc",
>  			.id		= 0,
> --


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
