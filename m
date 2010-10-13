From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 3/6] ARM: S5PV210: Add EPLL clock operations
Date: Wed, 13 Oct 2010 17:08:16 +0900
Message-ID: <002601cb6aad$cc4a29d0$64de7d70$%kim@samsung.com>
References: <1286882399-27595-1-git-send-email-sw.youn@samsung.com>
 <1286883755-27755-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62148 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752901Ab0JMIH7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Oct 2010 04:07:59 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LA700509YL9IW70@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Oct 2010 17:07:57 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LA700EB7YL95J@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Oct 2010 17:07:58 +0900 (KST)
In-reply-to: <1286883755-27755-1-git-send-email-sw.youn@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Seungwhan Youn' <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: ben-linux@fluff.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

Seungwhan Youn wrote:
> 
> This patch adds EPLL specific clock get_rate/set_rate operations
> on S5PV210.
> 
> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
> ---
>  arch/arm/mach-s5pv210/clock.c |   77
> +++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 77 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
> index f1ec5bb..fdfadac 100644
> --- a/arch/arm/mach-s5pv210/clock.c
> +++ b/arch/arm/mach-s5pv210/clock.c
> @@ -1003,6 +1003,79 @@ static struct clksrc_clk *sysclks[] = {
>  	&clk_sclk_spdif,
>  };
> 
> +static u32 epll_div[][6] = {
> +	{  48000000, 0, 48, 3, 3, 0 },
> +	{  96000000, 0, 48, 3, 2, 0 },
> +	{ 144000000, 1, 72, 3, 2, 0 },
> +	{ 192000000, 0, 48, 3, 1, 0 },
> +	{ 288000000, 1, 72, 3, 1, 0 },
> +	{  32750000, 1, 65, 3, 4, 35127 },
> +	{  32768000, 1, 65, 3, 4, 35127 },
> +	{  45158400, 0, 45, 3, 3, 10355 },
> +	{  45000000, 0, 45, 3, 3, 10355 },
> +	{  45158000, 0, 45, 3, 3, 10355 },
> +	{  49125000, 0, 49, 3, 3, 9961 },
> +	{  49152000, 0, 49, 3, 3, 9961 },
> +	{  67737600, 1, 67, 3, 3, 48366 },
> +	{  67738000, 1, 67, 3, 3, 48366 },
> +	{  73800000, 1, 73, 3, 3, 47710 },
> +	{  73728000, 1, 73, 3, 3, 47710 },
> +	{  36000000, 1, 32, 3, 4, 0 },
> +	{  60000000, 1, 60, 3, 3, 0 },
> +	{  72000000, 1, 72, 3, 3, 0 },
> +	{  80000000, 1, 80, 3, 3, 0 },
> +	{  84000000, 0, 42, 3, 2, 0 },
> +	{  50000000, 0, 50, 3, 3, 0 },
> +};
> +
> +static int s5pv210_epll_set_rate(struct clk *clk, unsigned long rate)
> +{
> +	unsigned int epll_con, epll_con_k;
> +	unsigned int i;
> +
> +	/* Return if nothing changed */
> +	if (clk->rate == rate)
> +		return 0;
> +
> +	epll_con = __raw_readl(S5P_EPLL_CON);
> +	epll_con_k = __raw_readl(S5P_EPLL_CON1);
> +
> +	epll_con_k &= ~PLL46XX_KDIV_MASK;
> +	epll_con &= ~(1 << 27 |
> +			PLL46XX_MDIV_MASK << PLL46XX_MDIV_SHIFT |
> +			PLL46XX_PDIV_MASK << PLL46XX_PDIV_SHIFT |
> +			PLL46XX_SDIV_MASK << PLL46XX_SDIV_SHIFT);
> +
> +	for (i = 0; i < ARRAY_SIZE(epll_div); i++) {
> +		if (epll_div[i][0] == rate) {
> +			epll_con_k |= epll_div[i][5] << 0;
> +			epll_con |= (epll_div[i][1] << 27 |
> +					epll_div[i][2] <<
> PLL46XX_MDIV_SHIFT |
> +					epll_div[i][3] <<
> PLL46XX_PDIV_SHIFT |
> +					epll_div[i][4] <<
> PLL46XX_SDIV_SHIFT);
> +			break;
> +		}
> +	}
> +
> +	if (i == ARRAY_SIZE(epll_div)) {
> +		printk(KERN_ERR "%s: Invalid Clock EPLL Frequency\n",
> +				__func__);
> +		return -EINVAL;
> +	}
> +
> +	__raw_writel(epll_con, S5P_EPLL_CON);
> +	__raw_writel(epll_con_k, S5P_EPLL_CON1);
> +
> +	clk->rate = rate;
> +
> +	return 0;
> +}
> +
> +static struct clk_ops s5pv210_epll_ops = {
> +	.set_rate = s5pv210_epll_set_rate,
> +	.get_rate = s5p_epll_get_rate,
> +};
> +
>  void __init_or_cpufreq s5pv210_setup_clocks(void)
>  {
>  	struct clk *xtal_clk;
> @@ -1022,6 +1095,10 @@ void __init_or_cpufreq s5pv210_setup_clocks(void)
>  	unsigned int ptr;
>  	u32 clkdiv0, clkdiv1;
> 
> +	/* Set functions for clk_fout_epll */
> +	clk_fout_epll.enable = s5p_epll_enable;
> +	clk_fout_epll.ops = &s5pv210_epll_ops;
> +
>  	printk(KERN_DEBUG "%s: registering clocks\n", __func__);
> 
>  	clkdiv0 = __raw_readl(S5P_CLK_DIV0);
> --

I think...we need to sort out epll_set_rate() like epll_get_rate() later.

Will apply anyway.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
