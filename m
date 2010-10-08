From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/10] ARM: S5PC100: Add SCLK_SPDIF clock
Date: Fri, 08 Oct 2010 19:11:34 +0900
Message-ID: <001901cb66d1$32db1e10$98915a30$%kim@samsung.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
 <1286192545-18327-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33208 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755277Ab0JHKL4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Oct 2010 06:11:56 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9Y00AIFUYUXC40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 19:11:18 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9Y004FDUYTGB@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 19:11:18 +0900 (KST)
In-reply-to: <1286192545-18327-1-git-send-email-sw.youn@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Seungwhan Youn' <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: ben-linux@fluff.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

Seungwhan Youn wrote:
> 
> This patch add SCLK_SPDIF clock to support source clock of S/PDIF
> on S5PC100.
> 
> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
> ---
>  arch/arm/mach-s5pc100/clock.c |   59
> +++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 59 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pc100/clock.c b/arch/arm/mach-s5pc100/clock.c
> index 42b7138..306ae74 100644
> --- a/arch/arm/mach-s5pc100/clock.c
> +++ b/arch/arm/mach-s5pc100/clock.c
> @@ -980,6 +980,64 @@ struct clksrc_sources clk_src_pwi = {
>  	.nr_sources	= ARRAY_SIZE(clk_src_pwi_list),
>  };
> 
> +static struct clk *clk_sclk_spdif_list[] = {
> +	[0] = &clk_sclk_audio0.clk,
> +	[1] = &clk_sclk_audio1.clk,
> +	[2] = &clk_sclk_audio2.clk,
> +};
> +
> +struct clksrc_sources clk_src_sclk_spdif = {
> +	.sources	= clk_sclk_spdif_list,
> +	.nr_sources	= ARRAY_SIZE(clk_sclk_spdif_list),
> +};
> +
> +static int s5pc100_spdif_set_rate(struct clk *clk, unsigned long rate)
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

How about following?

static int parent_set_rate(struct clk *clk, unsigned long rate)
{
	struct clk *p_clk;
	int ret;
	
	p_clk = clk_get_parent(clk);
	ret = clk_set_rate(p_clk, rate);

	clk_put(p_clk);

	return ret;
}

Hmm...isn't there any method?...

> +}
> +
> +static unsigned long s5pc100_spdif_get_rate(struct clk *clk)
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

Similar...

> +static struct clk_ops s5pc100_sclk_spdif_ops = {
> +	.set_rate	= s5pc100_spdif_set_rate,
> +	.get_rate	= s5pc100_spdif_get_rate,
> +};
> +
> +static struct clksrc_clk clk_sclk_spdif = {
> +	.clk	= {
> +		.name		= "sclk_spdif",
> +		.id		= -1,
> +		.ctrlbit	= (1 << 11),
> +		.enable		= s5pc100_sclk1_ctrl,
> +		.ops		= &s5pc100_sclk_spdif_ops,
> +	},
> +	.sources = &clk_src_sclk_spdif,
> +	.reg_src = { .reg = S5P_CLK_SRC3, .shift = 24, .size = 2 },
> +};
> +
>  static struct clksrc_clk clksrcs[] = {
>  	{
>  		.clk	= {
> @@ -1185,6 +1243,7 @@ static struct clksrc_clk *sysclks[] = {
>  	&clk_sclk_audio0,
>  	&clk_sclk_audio1,
>  	&clk_sclk_audio2,
> +	&clk_sclk_spdif,
>  };
> 
>  void __init_or_cpufreq s5pc100_setup_clocks(void)
> --


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
