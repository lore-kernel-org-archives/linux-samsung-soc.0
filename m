From: Marc Zyngier <maz@misterjones.org>
Subject: Re: [PATCH v3 2/7] ARM: S5P6440: Add Clock and PLL support
Date: Mon, 11 Jan 2010 09:01:45 +0100
Message-ID: <20100111090145.3735b865@hina.wild-wind.fr.eu.org>
References: <1263182094-14425-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from inca-roads.misterjones.org ([213.251.177.50]:51747 "EHLO
	inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752034Ab0AKIBw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2010 03:01:52 -0500
In-Reply-To: <1263182094-14425-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, Adityapratap Sharma <aditya.ps@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Atul Dahiya <atul.dahiya@samsung.com>

On Mon, 11 Jan 2010 12:54:54 +0900
Kukjin Kim <kgene.kim@samsung.com> wrote:

> diff --git a/arch/arm/plat-s5p/s5p6440-clock.c b/arch/arm/plat-s5p/s5p6440-clock.c
> new file mode 100644
> index 0000000..8553b2e
> --- /dev/null
> +++ b/arch/arm/plat-s5p/s5p6440-clock.c
> @@ -0,0 +1,705 @@
> +/* linux/arch/arm/plat-s5p/s5p6440-clock.c
> + *
> + * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * S5P6440 - Clock support
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/clk.h>
> +#include <linux/sysdev.h>
> +#include <linux/io.h>
> +
> +#include <mach/hardware.h>
> +#include <mach/map.h>
> +
> +#include <plat/cpu-freq.h>
> +#include <mach/regs-clock.h>
> +#include <plat/clock.h>
> +#include <plat/cpu.h>
> +#include <plat/clock-clksrc.h>
> +#include <plat/s5p-clock.h>
> +#include <plat/pll.h>
> +#include <asm/div64.h>
> +
> +/* APLL Mux output clock */
> +static struct clksrc_clk clk_mout_apll = {
> +	.clk    = {
> +		.name           = "mout_apll",
> +		.id             = -1,
> +	},
> +	.sources        = &clk_src_apll,
> +	.reg_src        = { .reg = S5P_CLK_SRC0, .shift = 0, .size = 1 },
> +};
> +
> +static int s5p6440_epll_enable(struct clk *clk, int enable)
> +{
> +	unsigned int ctrlbit = clk->ctrlbit;
> +	unsigned int epll_con = __raw_readl(S5P_EPLL_CON) & ~ctrlbit;
> +
> +	if (enable)
> +		__raw_writel(epll_con | ctrlbit, S5P_EPLL_CON);
> +	else
> +		__raw_writel(epll_con, S5P_EPLL_CON);
> +
> +	return 0;
> +}
> +
> +unsigned long s5p6440_epll_get_rate(struct clk *clk)
> +{
> +	return clk->rate;
> +}
> +
> +static u32 epll_div[][5] = {
> +	{ 36000000,	0,	48, 1, 4 },
> +	{ 48000000,	0,	32, 1, 3 },
> +	{ 60000000,	0,	40, 1, 3 },
> +	{ 72000000,	0,	48, 1, 3 },
> +	{ 84000000,	0,	28, 1, 2 },
> +	{ 96000000,	0,	32, 1, 2 },
> +	{ 32768000,	45264,	43, 1, 4 },
> +	{ 45158000,	6903,	30, 1, 3 },
> +	{ 49152000,	50332,	32, 1, 3 },
> +	{ 67738000,	10398,	45, 1, 3 },
> +	{ 73728000,	9961,	49, 1, 3 }
> +};
> +
> +static int s5p6440_epll_set_rate(struct clk *clk, unsigned long rate)
> +{
> +	unsigned int epll_con, epll_con_k;
> +	unsigned int i;
> +
> +	if (clk->rate == rate)	/* Return if nothing changed */
> +		return 0;
> +
> +	epll_con = __raw_readl(S5P_EPLL_CON);
> +	epll_con_k = __raw_readl(S5P_EPLL_CON_K);
> +
> +	epll_con_k &= ~(PLL90XX_KDIV_MASK);
> +	epll_con &= ~(PLL90XX_MDIV_MASK | PLL90XX_PDIV_MASK | PLL90XX_SDIV_MASK);
> +
> +	for (i = 0; i < ARRAY_SIZE(epll_div); i++) {
> +		 if (epll_div[i][0] == rate) {
> +			epll_con_k |= (epll_div[i][1] << PLL90XX_KDIV_SHIFT);
> +			epll_con |= (epll_div[i][2] << PLL90XX_MDIV_SHIFT) |
> +				    (epll_div[i][3] << PLL90XX_PDIV_SHIFT) |
> +				    (epll_div[i][4] << PLL90XX_SDIV_SHIFT);
> +			break;
> +		}
> +	}
> +
> +	if (i == ARRAY_SIZE(epll_div)) {
> +		printk(KERN_ERR "%s: Invalid Clock EPLL Frequency\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	__raw_writel(epll_con, S5P_EPLL_CON);
> +	__raw_writel(epll_con_k, S5P_EPLL_CON_K);
> +
> +	clk->rate = rate;
> +
> +	return 0;
> +}
> +
> +static struct clk_ops s5p6440_epll_ops = {
> +	.get_rate = s5p6440_epll_get_rate,
> +	.set_rate = s5p6440_epll_set_rate,
> +};
> +
> +static struct clksrc_clk clk_mout_epll = {
> +	.clk    = {
> +		.name           = "mout_epll",
> +		.id             = -1,
> +	},
> +	.sources        = &clk_src_epll,
> +	.reg_src        = { .reg = S5P_CLK_SRC0, .shift = 2, .size = 1 },
> +};
> +
> +static struct clksrc_clk clk_mout_mpll = {
> +	.clk = {
> +		.name           = "mout_mpll",
> +		.id             = -1,
> +	},
> +	.sources        = &clk_src_mpll,
> +	.reg_src        = { .reg = S5P_CLK_SRC0, .shift = 1, .size = 1 },
> +};
> +
> +struct clk clk_h_low = {
> +	.name		= "hclk_low",
> +	.id		= -1,
> +	.rate		= 0,
> +	.parent		= NULL,
> +	.ctrlbit	= 0,
> +	.ops		= &clk_ops_def_setrate,
> +};
> +
> +struct clk clk_p_low = {
> +	.name		= "pclk_low",
> +	.id		= -1,
> +	.rate		= 0,
> +	.parent		= NULL,
> +	.ctrlbit	= 0,
> +	.ops		= &clk_ops_def_setrate,
> +};
> +
> +enum perf_level {
> +	L0 = 532*1000,
> +	L1 = 266*1000,
> +	L2 = 133*1000,
> +};
> +
> +static const u32 clock_table[][3] = {
> +	/*{ARM_CLK, DIVarm, DIVhclk}*/
> +	{L0 * 1000, (0 << ARM_DIV_RATIO_SHIFT), (3 << S5P_CLKDIV0_HCLK_SHIFT)},
> +	{L1 * 1000, (1 << ARM_DIV_RATIO_SHIFT), (1 << S5P_CLKDIV0_HCLK_SHIFT)},
> +	{L2 * 1000, (3 << ARM_DIV_RATIO_SHIFT), (0 << S5P_CLKDIV0_HCLK_SHIFT)},
> +};
> +

I'm a bit concerned by this. S5P6440 supports many other useful ARM
clocks, specially when HCLK is set to 100MHz or 166MHz. Here, you only
care about the HCLK=133MHz case. I suspect you need different tables
for this.

	M.
-- 
And if you don't know where you're going, any road will take you there...
