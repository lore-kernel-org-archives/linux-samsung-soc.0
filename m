From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] EXYNOS4X12: Add support cpufreq for EXYNOS4X12
Date: Fri, 10 Feb 2012 21:29:10 +0100
Message-ID: <4F357E16.4060304@gmail.com>
References: <013201cce7ed$a2ef9f20$e8cedd60$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:46814 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932440Ab2BJU3Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 15:29:16 -0500
In-Reply-To: <013201cce7ed$a2ef9f20$e8cedd60$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, jc.lee@samsung.com
Cc: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Dave Jones' <davej@redhat.com>

Hello,

I have a few comments below, it's mainly coding style nit picks though.

On 02/10/2012 01:15 PM, Kukjin Kim wrote:
> From: Jaecheol Lee<jc.lee@samsung.com>
>
> This patch adds support cpufreq for EXYNOS4X12 SoCs. Basically,
> the exynos-cpufreq.c is used commonly and exynos4x12-cpufreq.c
> is used for EXYNOS4212(two Cortex-A9 cores) and EXYNOS4412(four
> Cortex-A9 cores) SoCs.
>
> Signed-off-by: Jaecheol Lee<jc.lee@samsung.com>
> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
> ---
>   arch/arm/mach-exynos/include/mach/cpufreq.h    |    1 +
>   arch/arm/mach-exynos/include/mach/regs-clock.h |    9 +
>   drivers/cpufreq/Kconfig.arm                    |    7 +
>   drivers/cpufreq/Makefile                       |    1 +
>   drivers/cpufreq/exynos-cpufreq.c               |    2 +
>   drivers/cpufreq/exynos4x12-cpufreq.c           |  539
> ++++++++++++++++++++++++
>   6 files changed, 559 insertions(+), 0 deletions(-)
>   create mode 100644 drivers/cpufreq/exynos4x12-cpufreq.c
>
> diff --git a/arch/arm/mach-exynos/include/mach/cpufreq.h
> b/arch/arm/mach-exynos/include/mach/cpufreq.h
> index 3df27f2..96ac0cb 100644
> --- a/arch/arm/mach-exynos/include/mach/cpufreq.h
> +++ b/arch/arm/mach-exynos/include/mach/cpufreq.h
> @@ -32,3 +32,4 @@ struct exynos_dvfs_info {
>   };
>
>   extern int exynos4210_cpufreq_init(struct exynos_dvfs_info *);
> +extern int exynos4x12_cpufreq_init(struct exynos_dvfs_info *);
> diff --git a/arch/arm/mach-exynos/include/mach/regs-clock.h
> b/arch/arm/mach-exynos/include/mach/regs-clock.h
> index 113836b..1c57fa8 100644
> --- a/arch/arm/mach-exynos/include/mach/regs-clock.h
> +++ b/arch/arm/mach-exynos/include/mach/regs-clock.h
> @@ -160,6 +160,15 @@
>   #define EXYNOS4_CLKDIV_CPU0_PCLKDBG_MASK	(0x7<<
> EXYNOS4_CLKDIV_CPU0_PCLKDBG_SHIFT)
>   #define EXYNOS4_CLKDIV_CPU0_APLL_SHIFT		(24)

The parentheses here could be dropped.

>   #define EXYNOS4_CLKDIV_CPU0_APLL_MASK		(0x7<<
> EXYNOS4_CLKDIV_CPU0_APLL_SHIFT)
> +#define EXYNOS4_CLKDIV_CPU0_CORE2_SHIFT		28
> +#define EXYNOS4_CLKDIV_CPU0_CORE2_MASK		(0x7<<
> EXYNOS4_CLKDIV_CPU0_CORE2_SHIFT)
> +
> +#define EXYNOS4_CLKDIV_CPU1_COPY_SHIFT		0
> +#define EXYNOS4_CLKDIV_CPU1_COPY_MASK		(0x7<<
> EXYNOS4_CLKDIV_CPU1_COPY_SHIFT)
> +#define EXYNOS4_CLKDIV_CPU1_HPM_SHIFT		4
> +#define EXYNOS4_CLKDIV_CPU1_HPM_MASK		(0x7<<
> EXYNOS4_CLKDIV_CPU1_HPM_SHIFT)
> +#define EXYNOS4_CLKDIV_CPU1_CORES_SHIFT		8
> +#define EXYNOS4_CLKDIV_CPU1_CORES_MASK		(0x7<<
> EXYNOS4_CLKDIV_CPU1_CORES_SHIFT)
>
>   #define EXYNOS4_CLKDIV_DMC0_ACP_SHIFT		(0)

Ditto.

>   #define EXYNOS4_CLKDIV_DMC0_ACP_MASK		(0x7<<
> EXYNOS4_CLKDIV_DMC0_ACP_SHIFT)
> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> index e0664fe..062c6a0 100644
> --- a/drivers/cpufreq/Kconfig.arm
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -25,6 +25,7 @@ config ARM_EXYNOS_CPUFREQ
>   	bool "SAMSUNG EXYNOS SoCs"
>   	depends on ARCH_EXYNOS
>   	select ARM_EXYNOS4210_CPUFREQ if CPU_EXYNOS4210
> +	select ARM_EXYNOS4X12_CPUFREQ if (SOC_EXYNOS4212 || SOC_EXYNOS4412)
>   	default y
>   	help
>   	  This adds the CPUFreq driver common part for Samsung
> @@ -37,3 +38,9 @@ config ARM_EXYNOS4210_CPUFREQ
>   	help
>   	  This adds the CPUFreq driver for Samsung EXYNOS4210
>   	  SoC (S5PV310 or S5PC210).
> +
> +config ARM_EXYNOS4X12_CPUFREQ
> +	bool "Samsung EXYNOS4X12"
> +	help
> +	  This adds the CPUFreq driver for Samsung EXYNOS4X12
> +	  SoC (EXYNOS4212 or EXYNOS4412).

s/or/and ?

> diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
> index ac000fa..7b21c68 100644
> --- a/drivers/cpufreq/Makefile
> +++ b/drivers/cpufreq/Makefile
> @@ -44,6 +44,7 @@ obj-$(CONFIG_ARM_S3C64XX_CPUFREQ)	+= s3c64xx-cpufreq.o
>   obj-$(CONFIG_ARM_S5PV210_CPUFREQ)	+= s5pv210-cpufreq.o
>   obj-$(CONFIG_ARM_EXYNOS_CPUFREQ)	+= exynos-cpufreq.o
>   obj-$(CONFIG_ARM_EXYNOS4210_CPUFREQ)	+= exynos4210-cpufreq.o
> +obj-$(CONFIG_ARM_EXYNOS4X12_CPUFREQ)	+= exynos4x12-cpufreq.o
>   obj-$(CONFIG_ARCH_OMAP2PLUS)            += omap-cpufreq.o
>
>
> ############################################################################
> ######
> diff --git a/drivers/cpufreq/exynos-cpufreq.c
> b/drivers/cpufreq/exynos-cpufreq.c
> index 5467879..ccc3145 100644
> --- a/drivers/cpufreq/exynos-cpufreq.c
> +++ b/drivers/cpufreq/exynos-cpufreq.c
> @@ -252,6 +252,8 @@ static int __init exynos_cpufreq_init(void)
>
>   	if (soc_is_exynos4210())
>   		ret = exynos4210_cpufreq_init(exynos_info);
> +	else if (soc_is_exynos4212() || soc_is_exynos4412())
> +		ret = exynos4x12_cpufreq_init(exynos_info);
>   	else
>   		pr_err("%s: CPU type not found\n", __func__);
>
> diff --git a/drivers/cpufreq/exynos4x12-cpufreq.c
> b/drivers/cpufreq/exynos4x12-cpufreq.c
> new file mode 100644
> index 0000000..5ddba2e
> --- /dev/null
> +++ b/drivers/cpufreq/exynos4x12-cpufreq.c
> @@ -0,0 +1,539 @@
> +/*
> + * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.

2010 - 2012 ?

> + *		http://www.samsung.com
> + *
> + * EXYNOS4X12 - CPU frequency scaling support
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include<linux/module.h>
> +#include<linux/kernel.h>
> +#include<linux/err.h>
> +#include<linux/clk.h>
> +#include<linux/io.h>
> +#include<linux/slab.h>
> +#include<linux/cpufreq.h>
> +
> +#include<mach/regs-clock.h>
> +#include<mach/cpufreq.h>
> +
> +#define CPUFREQ_LEVEL_END	(L13 + 1)
> +
> +static int max_support_idx;
> +static int min_support_idx = (CPUFREQ_LEVEL_END - 1);
> +
> +static struct clk *cpu_clk;
> +static struct clk *moutcore;
> +static struct clk *mout_mpll;
> +static struct clk *mout_apll;
> +
> +struct cpufreq_clkdiv {
> +	unsigned int	index;
> +	unsigned int	clkdiv;
> +	unsigned int	clkdiv1;
> +};
> +
> +static unsigned int exynos4x12_volt_table[CPUFREQ_LEVEL_END];
> +
> +static struct cpufreq_frequency_table exynos4x12_freq_table[] = {
> +	{L0, 1500*1000},

Whitespaces around '*' ?


> +static unsigned int clkdiv_cpu0_4212[CPUFREQ_LEVEL_END][8] = {
...
> +	/* ARM L3: 1200Mhz */
> +	{ 0, 3, 7, 0, 5, 1, 2, 0 },
> +
> +	/* ARM L4: 1100MHz */
> +	{ 0, 3, 6, 0, 4, 1, 2, 0 },

Could be better to use "MHz" only, not a mix of Mhz and MHz.
Also a whitespace after the numbers might be a good idea.

> +
> +	/* ARM L5: 1000MHz */
> +	{ 0, 2, 5, 0, 4, 1, 1, 0 },
> +
> +	/* ARM L6: 900MHz */
> +	{ 0, 2, 5, 0, 3, 1, 1, 0 },
> +
> +	/* ARM L7: 800MHz */
> +	{ 0, 2, 5, 0, 3, 1, 1, 0 },
> +
> +	/* ARM L8: 700MHz */
> +	{ 0, 2, 4, 0, 3, 1, 1, 0 },
> +
> +	/* ARM L9: 600MHz */
> +	{ 0, 2, 4, 0, 3, 1, 1, 0 },
> +
> +	/* ARM L10: 500MHz */
> +	{ 0, 2, 4, 0, 3, 1, 1, 0 },
> +
> +	/* ARM L11: 400MHz */
> +	{ 0, 2, 4, 0, 3, 1, 1, 0 },
> +
> +	/* ARM L12: 300MHz */
> +	{ 0, 2, 4, 0, 2, 1, 1, 0 },
> +
> +	/* ARM L13: 200MHz */
> +	{ 0, 1, 3, 0, 1, 1, 1, 0 },
> +};
> +
> +static unsigned int clkdiv_cpu0_4412[CPUFREQ_LEVEL_END][8] = {
> +	/*
> +	 * Clock divider value for following
> +	 * { DIVCORE, DIVCOREM0, DIVCOREM1, DIVPERIPH,
> +	 *		DIVATB, DIVPCLK_DBG, DIVAPLL, DIVCORE2 }
> +	 */
> +	/* ARM L0: 1500Mhz */
> +	{ 0, 3, 7, 0, 6, 1, 2, 0 },
> +
> +	/* ARM L1: 1400Mhz */
> +	{ 0, 3, 7, 0, 6, 1, 2, 0 },
> +
> +	/* ARM L2: 1300Mhz */
> +	{ 0, 3, 7, 0, 5, 1, 2, 0 },
> +
> +	/* ARM L3: 1200Mhz */
> +	{ 0, 3, 7, 0, 5, 1, 2, 0 },
> +
> +	/* ARM L4: 1100MHz */
> +	{ 0, 3, 6, 0, 4, 1, 2, 0 },
> +
> +	/* ARM L5: 1000MHz */
> +	{ 0, 2, 5, 0, 4, 1, 1, 0 },
> +
> +	/* ARM L6: 900MHz */
> +	{ 0, 2, 5, 0, 3, 1, 1, 0 },
> +
> +	/* ARM L7: 800MHz */
> +	{ 0, 2, 5, 0, 3, 1, 1, 0 },
> +
> +	/* ARM L8: 700MHz */
> +	{ 0, 2, 4, 0, 3, 1, 1, 0 },
> +
> +	/* ARM L9: 600MHz */
> +	{ 0, 2, 4, 0, 3, 1, 1, 0 },
> +
> +	/* ARM L10: 500MHz */
> +	{ 0, 2, 4, 0, 3, 1, 1, 0 },
> +
> +	/* ARM L11: 400MHz */
> +	{ 0, 2, 4, 0, 3, 1, 1, 0 },
> +
> +	/* ARM L12: 300MHz */
> +	{ 0, 2, 4, 0, 2, 1, 1, 0 },
> +
> +	/* ARM L13: 200MHz */
> +	{ 0, 1, 3, 0, 1, 1, 1, 0 },
> +};
> +
> +static unsigned int clkdiv_cpu1_4212[CPUFREQ_LEVEL_END][2] = {
> +	/* Clock divider value for following
> +	 * { DIVCOPY, DIVHPM }
> +	 */
> +	/* ARM L0: 1500MHz */
> +	{ 6, 0 },
> +
> +	/* ARM L1: 1400MHz */
> +	{ 6, 0 },
> +
> +	/* ARM L2: 1300MHz */
> +	{ 5, 0 },
> +
> +	/* ARM L3: 1200MHz */
> +	{ 5, 0 },
> +
> +	/* ARM L4: 1100MHz */
> +	{ 4, 0 },
> +
> +	/* ARM L5: 1000MHz */
> +	{ 4, 0 },
> +
> +	/* ARM L6: 900MHz */
> +	{ 3, 0 },
> +
> +	/* ARM L7: 800MHz */
> +	{ 3, 0 },
> +
> +	/* ARM L8: 700MHz */
> +	{ 3, 0 },
> +
> +	/* ARM L9: 600MHz */
> +	{ 3, 0 },
> +
> +	/* ARM L10: 500MHz */
> +	{ 3, 0 },
> +
> +	/* ARM L11: 400MHz */
> +	{ 3, 0 },
> +
> +	/* ARM L12: 300MHz */
> +	{ 3, 0 },
> +
> +	/* ARM L13: 200MHz */
> +	{ 3, 0 },
> +};
> +
> +static unsigned int clkdiv_cpu1_4412[CPUFREQ_LEVEL_END][3] = {
> +	/* Clock divider value for following
> +	 * { DIVCOPY, DIVHPM, DIVCORES }
> +	 */
> +	/* ARM L0: 1500MHz */
> +	{ 6, 0, 7 },
> +
> +	/* ARM L1: 1400MHz */
> +	{ 6, 0, 6 },
> +
> +	/* ARM L2: 1300MHz */
> +	{ 5, 0, 6 },
> +
> +	/* ARM L3: 1200MHz */
> +	{ 5, 0, 5 },
> +
> +	/* ARM L4: 1100MHz */
> +	{ 4, 0, 5 },
> +
> +	/* ARM L5: 1000MHz */
> +	{ 4, 0, 4 },
> +
> +	/* ARM L6: 900MHz */
> +	{ 3, 0, 4 },
> +
> +	/* ARM L7: 800MHz */
> +	{ 3, 0, 3 },
> +
> +	/* ARM L8: 700MHz */
> +	{ 3, 0, 3 },
> +
> +	/* ARM L9: 600MHz */
> +	{ 3, 0, 2 },
> +
> +	/* ARM L10: 500MHz */
> +	{ 3, 0, 2 },
> +
> +	/* ARM L11: 400MHz */
> +	{ 3, 0, 1 },
> +
> +	/* ARM L12: 300MHz */
> +	{ 3, 0, 1 },
> +
> +	/* ARM L13: 200MHz */
> +	{ 3, 0, 0 },
> +};
> +
> +static unsigned int exynos4x12_apll_pms_table[CPUFREQ_LEVEL_END] = {
> +	/* APLL FOUT L0: 1500MHz */
> +	((250<<  16) | (4<<  8) | (0x0)),
> +
> +	/* APLL FOUT L1: 1400MHz */
> +	((175<<  16) | (3<<  8) | (0x0)),
> +
> +	/* APLL FOUT L2: 1300MHz */
> +	((325<<  16) | (6<<  8) | (0x0)),
> +
> +	/* APLL FOUT L3: 1200MHz */
> +	((200<<  16) | (4<<  8) | (0x0)),
> +
> +	/* APLL FOUT L4: 1100MHz */
> +	((275<<  16) | (6<<  8) | (0x0)),
> +
> +	/* APLL FOUT L5: 1000MHz */
> +	((125<<  16) | (3<<  8) | (0x0)),
> +
> +	/* APLL FOUT L6: 900MHz */
> +	((150<<  16) | (4<<  8) | (0x0)),
> +
> +	/* APLL FOUT L7: 800MHz */
> +	((100<<  16) | (3<<  8) | (0x0)),

Not sure if we need all " | (0x0)" above.

> +	/* APLL FOUT L8: 700MHz */
> +	((175<<  16) | (3<<  8) | (0x1)),
> +
> +	/* APLL FOUT L9: 600MHz */
> +	((200<<  16) | (4<<  8) | (0x1)),
> +
> +	/* APLL FOUT L10: 500MHz */
> +	((125<<  16) | (3<<  8) | (0x1)),
> +
> +	/* APLL FOUT L11 400MHz */
> +	((100<<  16) | (3<<  8) | (0x1)),
> +
> +	/* APLL FOUT L12: 300MHz */
> +	((200<<  16) | (4<<  8) | (0x2)),
> +
> +	/* APLL FOUT L13: 200MHz */
> +	((100<<  16) | (3<<  8) | (0x2)),
> +};
> +
> +static const unsigned int asv_voltage_4x12[CPUFREQ_LEVEL_END] = {
> +	1350000, 1287500, 1250000, 1187500, 1137500, 1087500, 1037500,
> +	1000000,  987500,  975000,  950000,  925000,  900000,  900000
> +};
> +
> +static void exynos4x12_set_clkdiv(unsigned int div_index)
> +{
> +	unsigned int tmp;
> +	unsigned int stat_cpu1;
> +
> +	/* Change Divider - CPU0 */
> +
> +	tmp = exynos4x12_clkdiv_table[div_index].clkdiv;
> +
> +	__raw_writel(tmp, EXYNOS4_CLKDIV_CPU);
> +
> +	do {
> +		tmp = __raw_readl(EXYNOS4_CLKDIV_STATCPU);
> +	} while (tmp&  0x11111111);

	while (__raw_readl(EXYNOS4_CLKDIV_STATCPU) & 0x11111111))
		cpu_relax();
?
> +
> +	/* Change Divider - CPU1 */
> +	tmp = exynos4x12_clkdiv_table[div_index].clkdiv1;
> +
> +	__raw_writel(tmp, EXYNOS4_CLKDIV_CPU1);
> +	if (soc_is_exynos4212())
> +		stat_cpu1 = 0x11;
> +	else
> +		stat_cpu1 = 0x111;
> +
> +	do {
> +		tmp = __raw_readl(EXYNOS4_CLKDIV_STATCPU1);
> +	} while (tmp&  stat_cpu1);

	while (__raw_readl(EXYNOS4_CLKDIV_STATCPU1) & stat_cpu1))
		cpu_relax();
?
> +}
> +
> +static void exynos4x12_set_apll(unsigned int index)
> +{
> +	unsigned int tmp, pdiv;
> +
> +	/* 1. MUX_CORE_SEL = MPLL,
> +	 * ARMCLK uses MPLL for lock time */

The above comment should easily fit in one line.

> +	clk_set_parent(moutcore, mout_mpll);
> +
> +	do {
> +		tmp = (__raw_readl(EXYNOS4_CLKMUX_STATCPU)
> +			>>  EXYNOS4_CLKSRC_CPU_MUXCORE_SHIFT);
> +		tmp&= 0x7;
> +	} while (tmp != 0x2);
> +
> +	/* 2. Set APLL Lock time */
> +	pdiv = ((exynos4x12_apll_pms_table[index]>>  8)&  0x3f);
> +
> +	__raw_writel((pdiv * 250), EXYNOS4_APLL_LOCK);
> +
> +	/* 3. Change PLL PMS values */
> +	tmp = __raw_readl(EXYNOS4_APLL_CON0);
> +	tmp&= ~((0x3ff<<  16) | (0x3f<<  8) | (0x7<<  0));
> +	tmp |= exynos4x12_apll_pms_table[index];
> +	__raw_writel(tmp, EXYNOS4_APLL_CON0);
> +
> +	/* 4. wait_lock_time */
> +	do {
> +		tmp = __raw_readl(EXYNOS4_APLL_CON0);
> +	} while (!(tmp&  (0x1<<  EXYNOS4_APLLCON0_LOCKED_SHIFT)));
> +
> +	/* 5. MUX_CORE_SEL = APLL */
> +	clk_set_parent(moutcore, mout_apll);
> +
> +	do {
> +		tmp = __raw_readl(EXYNOS4_CLKMUX_STATCPU);
> +		tmp&= EXYNOS4_CLKMUX_STATCPU_MUXCORE_MASK;
> +	} while (tmp != (0x1<<  EXYNOS4_CLKSRC_CPU_MUXCORE_SHIFT));
> +}
> +
> +bool exynos4x12_pms_change(unsigned int old_index, unsigned int new_index)
> +{
> +	unsigned int old_pm = (exynos4x12_apll_pms_table[old_index]>>  8);
> +	unsigned int new_pm = (exynos4x12_apll_pms_table[new_index]>>  8);

Parentheses could be omitted here.

> +
> +	return (old_pm == new_pm) ? 0 : 1;

This could simplified to:

	return (old_pm != new_pm);

> +}
> +
> +static void exynos4x12_set_frequency(unsigned int old_index,
> +				  unsigned int new_index)
> +{
> +	unsigned int tmp;
> +
> +	if (old_index>  new_index) {
> +		if (!exynos4x12_pms_change(old_index, new_index)) {
> +			/* 1. Change the system clock divider values */
> +			exynos4x12_set_clkdiv(new_index);
> +			/* 2. Change just s value in apll m,p,s value */
> +			tmp = __raw_readl(EXYNOS4_APLL_CON0);
> +			tmp&= ~(0x7<<  0);
> +			tmp |= (exynos4x12_apll_pms_table[new_index]&  0x7);
> +			__raw_writel(tmp, EXYNOS4_APLL_CON0);
> +
> +		} else {
> +			/* Clock Configuration Procedure */
> +			/* 1. Change the system clock divider values */
> +			exynos4x12_set_clkdiv(new_index);
> +			/* 2. Change the apll m,p,s value */
> +			exynos4x12_set_apll(new_index);
> +		}
> +	} else if (old_index<  new_index) {
> +		if (!exynos4x12_pms_change(old_index, new_index)) {
> +			/* 1. Change just s value in apll m,p,s value */
> +			tmp = __raw_readl(EXYNOS4_APLL_CON0);
> +			tmp&= ~(0x7<<  0);
> +			tmp |= (exynos4x12_apll_pms_table[new_index]&  0x7);
> +			__raw_writel(tmp, EXYNOS4_APLL_CON0);
> +			/* 2. Change the system clock divider values */
> +			exynos4x12_set_clkdiv(new_index);
> +		} else {
> +			/* Clock Configuration Procedure */
> +			/* 1. Change the apll m,p,s value */
> +			exynos4x12_set_apll(new_index);
> +			/* 2. Change the system clock divider values */
> +			exynos4x12_set_clkdiv(new_index);
> +		}
> +	}
> +}
> +
> +static void __init set_volt_table(void)
> +{
> +	unsigned int i;
> +
> +	max_support_idx = L1;
> +
> +	/* Not supported */
> +	exynos4x12_freq_table[L0].frequency = CPUFREQ_ENTRY_INVALID;
> +
> +	for (i = 0 ; i<  CPUFREQ_LEVEL_END ; i++)
> +		exynos4x12_volt_table[i] = asv_voltage_4x12[i];
> +}
> +
> +int exynos4x12_cpufreq_init(struct exynos_dvfs_info *info)
> +{
> +	int i;
> +	unsigned int tmp;
> +	unsigned long rate;
> +
> +	set_volt_table();
> +
> +	cpu_clk = clk_get(NULL, "armclk");
> +	if (IS_ERR(cpu_clk))
> +		return PTR_ERR(cpu_clk);
> +
> +	moutcore = clk_get(NULL, "moutcore");
> +	if (IS_ERR(moutcore))
> +		goto err_moutcore;
> +
> +	mout_mpll = clk_get(NULL, "mout_mpll");
> +	if (IS_ERR(mout_mpll))
> +		goto err_mout_mpll;
> +
> +	rate = clk_get_rate(mout_mpll) / 1000;
> +
> +	mout_apll = clk_get(NULL, "mout_apll");
> +	if (IS_ERR(mout_apll))
> +		goto err_mout_apll;
> +
> +	for (i = L0; i<   CPUFREQ_LEVEL_END; i++) {
> +
> +		exynos4x12_clkdiv_table[i].index = i;
> +
> +		tmp = __raw_readl(EXYNOS4_CLKDIV_CPU);
> +
> +		tmp&= ~(EXYNOS4_CLKDIV_CPU0_CORE_MASK |
> +			EXYNOS4_CLKDIV_CPU0_COREM0_MASK |
> +			EXYNOS4_CLKDIV_CPU0_COREM1_MASK |
> +			EXYNOS4_CLKDIV_CPU0_PERIPH_MASK |
> +			EXYNOS4_CLKDIV_CPU0_ATB_MASK |
> +			EXYNOS4_CLKDIV_CPU0_PCLKDBG_MASK |
> +			EXYNOS4_CLKDIV_CPU0_APLL_MASK);
> +
> +		if (soc_is_exynos4212()) {
> +			tmp |= ((clkdiv_cpu0_4212[i][0]<<
> EXYNOS4_CLKDIV_CPU0_CORE_SHIFT) |
> +				(clkdiv_cpu0_4212[i][1]<<
> EXYNOS4_CLKDIV_CPU0_COREM0_SHIFT) |
> +				(clkdiv_cpu0_4212[i][2]<<
> EXYNOS4_CLKDIV_CPU0_COREM1_SHIFT) |
> +				(clkdiv_cpu0_4212[i][3]<<
> EXYNOS4_CLKDIV_CPU0_PERIPH_SHIFT) |
> +				(clkdiv_cpu0_4212[i][4]<<
> EXYNOS4_CLKDIV_CPU0_ATB_SHIFT) |
> +				(clkdiv_cpu0_4212[i][5]<<
> EXYNOS4_CLKDIV_CPU0_PCLKDBG_SHIFT) |
> +				(clkdiv_cpu0_4212[i][6]<<
> EXYNOS4_CLKDIV_CPU0_APLL_SHIFT));
> +		} else {
> +			tmp&= ~EXYNOS4_CLKDIV_CPU0_CORE2_MASK;
> +
> +			tmp |= ((clkdiv_cpu0_4412[i][0]<<
> EXYNOS4_CLKDIV_CPU0_CORE_SHIFT) |
> +				(clkdiv_cpu0_4412[i][1]<<
> EXYNOS4_CLKDIV_CPU0_COREM0_SHIFT) |
> +				(clkdiv_cpu0_4412[i][2]<<
> EXYNOS4_CLKDIV_CPU0_COREM1_SHIFT) |
> +				(clkdiv_cpu0_4412[i][3]<<
> EXYNOS4_CLKDIV_CPU0_PERIPH_SHIFT) |
> +				(clkdiv_cpu0_4412[i][4]<<
> EXYNOS4_CLKDIV_CPU0_ATB_SHIFT) |
> +				(clkdiv_cpu0_4412[i][5]<<
> EXYNOS4_CLKDIV_CPU0_PCLKDBG_SHIFT) |
> +				(clkdiv_cpu0_4412[i][6]<<
> EXYNOS4_CLKDIV_CPU0_APLL_SHIFT) |
> +				(clkdiv_cpu0_4412[i][7]<<
> EXYNOS4_CLKDIV_CPU0_CORE2_SHIFT));
> +		}

This doesn't look terribly neat. Alternatively you could for example
put all the bit shifts into an array and convert the above into a loop.

static const unsigned int cpu0_clkdiv_shifts[] =
	EXYNOS4_CLKDIV_CPU0_CORE_SHIFT,
	EXYNOS4_CLKDIV_CPU0_COREM0_SHIFT,
	EXYNOS4_CLKDIV_CPU0_COREM1_SHIFT,
	EXYNOS4_CLKDIV_CPU0_PERIPH_SHIFT,
	EXYNOS4_CLKDIV_CPU0_ATB_SHIFT,
	EXYNOS4_CLKDIV_CPU0_PCLKDBG_SHIFT,
	EXYNOS4_CLKDIV_CPU0_APLL_SHIFT,
	EXYNOS4_CLKDIV_CPU0_CORE2_SHIFT,
};

	for (clkid = 0; clkid < ARRAY_SIZE(cpu0_clkdiv_shifts); clkid++)
		tmp |= (clkdiv_cpu0_4412[i][clkid] << cpu0_clkdiv_shifts);

> +
> +		exynos4x12_clkdiv_table[i].clkdiv = tmp;
> +
> +		tmp = __raw_readl(EXYNOS4_CLKDIV_CPU1);
> +
> +		if (soc_is_exynos4212()) {
> +			tmp&= ~(EXYNOS4_CLKDIV_CPU1_COPY_MASK |
> +				EXYNOS4_CLKDIV_CPU1_HPM_MASK);
> +			tmp |= ((clkdiv_cpu1_4212[i][0]<<
> EXYNOS4_CLKDIV_CPU1_COPY_SHIFT) |
> +				(clkdiv_cpu1_4212[i][1]<<
> EXYNOS4_CLKDIV_CPU1_HPM_SHIFT));
> +		} else {
> +			tmp&= ~(EXYNOS4_CLKDIV_CPU1_COPY_MASK |
> +				EXYNOS4_CLKDIV_CPU1_HPM_MASK |
> +				EXYNOS4_CLKDIV_CPU1_CORES_MASK);
> +			tmp |= ((clkdiv_cpu1_4412[i][0]<<
> EXYNOS4_CLKDIV_CPU1_COPY_SHIFT) |
> +				(clkdiv_cpu1_4412[i][1]<<
> EXYNOS4_CLKDIV_CPU1_HPM_SHIFT) |
> +				(clkdiv_cpu1_4412[i][2]<<
> EXYNOS4_CLKDIV_CPU1_CORES_SHIFT));
> +		}
> +		exynos4x12_clkdiv_table[i].clkdiv1 = tmp;
> +	}
> +
> +	info->mpll_freq_khz = rate;
> +	info->pm_lock_idx = L5;
> +	info->pll_safe_idx = L7;
> +	info->max_support_idx = max_support_idx;
> +	info->min_support_idx = min_support_idx;
> +	info->cpu_clk = cpu_clk;
> +	info->volt_table = exynos4x12_volt_table;
> +	info->freq_table = exynos4x12_freq_table;
> +	info->set_freq = exynos4x12_set_frequency;
> +	info->need_apll_change = exynos4x12_pms_change;
> +
> +	return 0;
> +
> +err_mout_apll:
> +	if (!IS_ERR(mout_mpll))

Isn't this condition always true ? it looks like this and another two
IS_ERR() checks below could be safely omitted.

> +		clk_put(mout_mpll);
> +err_mout_mpll:
> +	if (!IS_ERR(moutcore))
> +		clk_put(moutcore);
> +err_moutcore:
> +	if (!IS_ERR(cpu_clk))
> +		clk_put(cpu_clk);

--

Thanks,
Sylwester
