From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 1/4] [CPUFREQ] EXYNOS4210: Remove regarding busfreq codes
Date: Tue,  5 Jul 2011 17:06:16 +0900
Message-ID: <1309853179-19438-2-git-send-email-kgene.kim@samsung.com>
References: <1309853179-19438-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:35345 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754481Ab1GEIOn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 04:14:43 -0400
In-Reply-To: <1309853179-19438-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org
Cc: davej@redhat.com, Jongpill Lee <boyko.lee@samsung.com>, SangWook Ju <sw.ju@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Jongpill Lee <boyko.lee@samsung.com>

Since busfreq codes can be handlend on busfreq driver,
this patch removes regarding busfreq codes on cpufreq.

Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
Signed-off-by: SangWook Ju <sw.ju@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/cpufreq/exynos4210-cpufreq.c |  180 +---------------------------------
 1 files changed, 3 insertions(+), 177 deletions(-)

diff --git a/drivers/cpufreq/exynos4210-cpufreq.c b/drivers/cpufreq/exynos4210-cpufreq.c
index 54025fc..28b3d53 100644
--- a/drivers/cpufreq/exynos4210-cpufreq.c
+++ b/drivers/cpufreq/exynos4210-cpufreq.c
@@ -31,16 +31,8 @@ static struct clk *mout_mpll;
 static struct clk *mout_apll;
 
 static struct regulator *arm_regulator;
-static struct regulator *int_regulator;
 
 static struct cpufreq_freqs freqs;
-static unsigned int memtype;
-
-enum exynos4_memory_type {
-	DDR2 = 4,
-	LPDDR2,
-	DDR3,
-};
 
 enum cpufreq_level_index {
 	L0, L1, L2, L3, CPUFREQ_LEVEL_END,
@@ -93,87 +85,24 @@ static unsigned int clkdiv_cpu1[CPUFREQ_LEVEL_END][2] = {
 	{ 3, 0 },
 };
 
-static unsigned int clkdiv_dmc0[CPUFREQ_LEVEL_END][8] = {
-	/*
-	 * Clock divider value for following
-	 * { DIVACP, DIVACP_PCLK, DIVDPHY, DIVDMC, DIVDMCD
-	 *		DIVDMCP, DIVCOPY2, DIVCORE_TIMERS }
-	 */
-
-	/* DMC L0: 400MHz */
-	{ 3, 1, 1, 1, 1, 1, 3, 1 },
-
-	/* DMC L1: 400MHz */
-	{ 3, 1, 1, 1, 1, 1, 3, 1 },
-
-	/* DMC L2: 266.7MHz */
-	{ 7, 1, 1, 2, 1, 1, 3, 1 },
-
-	/* DMC L3: 200MHz */
-	{ 7, 1, 1, 3, 1, 1, 3, 1 },
-};
-
-static unsigned int clkdiv_top[CPUFREQ_LEVEL_END][5] = {
-	/*
-	 * Clock divider value for following
-	 * { DIVACLK200, DIVACLK100, DIVACLK160, DIVACLK133, DIVONENAND }
-	 */
-
-	/* ACLK200 L0: 200MHz */
-	{ 3, 7, 4, 5, 1 },
-
-	/* ACLK200 L1: 200MHz */
-	{ 3, 7, 4, 5, 1 },
-
-	/* ACLK200 L2: 160MHz */
-	{ 4, 7, 5, 7, 1 },
-
-	/* ACLK200 L3: 133.3MHz */
-	{ 5, 7, 7, 7, 1 },
-};
-
-static unsigned int clkdiv_lr_bus[CPUFREQ_LEVEL_END][2] = {
-	/*
-	 * Clock divider value for following
-	 * { DIVGDL/R, DIVGPL/R }
-	 */
-
-	/* ACLK_GDL/R L0: 200MHz */
-	{ 3, 1 },
-
-	/* ACLK_GDL/R L1: 200MHz */
-	{ 3, 1 },
-
-	/* ACLK_GDL/R L2: 160MHz */
-	{ 4, 1 },
-
-	/* ACLK_GDL/R L3: 133.3MHz */
-	{ 5, 1 },
-};
-
 struct cpufreq_voltage_table {
 	unsigned int	index;		/* any */
 	unsigned int	arm_volt;	/* uV */
-	unsigned int	int_volt;
 };
 
 static struct cpufreq_voltage_table exynos4_volt_table[CPUFREQ_LEVEL_END] = {
 	{
 		.index		= L0,
 		.arm_volt	= 1200000,
-		.int_volt	= 1100000,
 	}, {
 		.index		= L1,
 		.arm_volt	= 1100000,
-		.int_volt	= 1100000,
 	}, {
 		.index		= L2,
 		.arm_volt	= 1000000,
-		.int_volt	= 1000000,
 	}, {
 		.index		= L3,
 		.arm_volt	= 900000,
-		.int_volt	= 1000000,
 	},
 };
 
@@ -242,80 +171,6 @@ void exynos4_set_clkdiv(unsigned int div_index)
 	do {
 		tmp = __raw_readl(S5P_CLKDIV_STATCPU1);
 	} while (tmp & 0x11);
-
-	/* Change Divider - DMC0 */
-
-	tmp = __raw_readl(S5P_CLKDIV_DMC0);
-
-	tmp &= ~(S5P_CLKDIV_DMC0_ACP_MASK | S5P_CLKDIV_DMC0_ACPPCLK_MASK |
-		S5P_CLKDIV_DMC0_DPHY_MASK | S5P_CLKDIV_DMC0_DMC_MASK |
-		S5P_CLKDIV_DMC0_DMCD_MASK | S5P_CLKDIV_DMC0_DMCP_MASK |
-		S5P_CLKDIV_DMC0_COPY2_MASK | S5P_CLKDIV_DMC0_CORETI_MASK);
-
-	tmp |= ((clkdiv_dmc0[div_index][0] << S5P_CLKDIV_DMC0_ACP_SHIFT) |
-		(clkdiv_dmc0[div_index][1] << S5P_CLKDIV_DMC0_ACPPCLK_SHIFT) |
-		(clkdiv_dmc0[div_index][2] << S5P_CLKDIV_DMC0_DPHY_SHIFT) |
-		(clkdiv_dmc0[div_index][3] << S5P_CLKDIV_DMC0_DMC_SHIFT) |
-		(clkdiv_dmc0[div_index][4] << S5P_CLKDIV_DMC0_DMCD_SHIFT) |
-		(clkdiv_dmc0[div_index][5] << S5P_CLKDIV_DMC0_DMCP_SHIFT) |
-		(clkdiv_dmc0[div_index][6] << S5P_CLKDIV_DMC0_COPY2_SHIFT) |
-		(clkdiv_dmc0[div_index][7] << S5P_CLKDIV_DMC0_CORETI_SHIFT));
-
-	__raw_writel(tmp, S5P_CLKDIV_DMC0);
-
-	do {
-		tmp = __raw_readl(S5P_CLKDIV_STAT_DMC0);
-	} while (tmp & 0x11111111);
-
-	/* Change Divider - TOP */
-
-	tmp = __raw_readl(S5P_CLKDIV_TOP);
-
-	tmp &= ~(S5P_CLKDIV_TOP_ACLK200_MASK | S5P_CLKDIV_TOP_ACLK100_MASK |
-		S5P_CLKDIV_TOP_ACLK160_MASK | S5P_CLKDIV_TOP_ACLK133_MASK |
-		S5P_CLKDIV_TOP_ONENAND_MASK);
-
-	tmp |= ((clkdiv_top[div_index][0] << S5P_CLKDIV_TOP_ACLK200_SHIFT) |
-		(clkdiv_top[div_index][1] << S5P_CLKDIV_TOP_ACLK100_SHIFT) |
-		(clkdiv_top[div_index][2] << S5P_CLKDIV_TOP_ACLK160_SHIFT) |
-		(clkdiv_top[div_index][3] << S5P_CLKDIV_TOP_ACLK133_SHIFT) |
-		(clkdiv_top[div_index][4] << S5P_CLKDIV_TOP_ONENAND_SHIFT));
-
-	__raw_writel(tmp, S5P_CLKDIV_TOP);
-
-	do {
-		tmp = __raw_readl(S5P_CLKDIV_STAT_TOP);
-	} while (tmp & 0x11111);
-
-	/* Change Divider - LEFTBUS */
-
-	tmp = __raw_readl(S5P_CLKDIV_LEFTBUS);
-
-	tmp &= ~(S5P_CLKDIV_BUS_GDLR_MASK | S5P_CLKDIV_BUS_GPLR_MASK);
-
-	tmp |= ((clkdiv_lr_bus[div_index][0] << S5P_CLKDIV_BUS_GDLR_SHIFT) |
-		(clkdiv_lr_bus[div_index][1] << S5P_CLKDIV_BUS_GPLR_SHIFT));
-
-	__raw_writel(tmp, S5P_CLKDIV_LEFTBUS);
-
-	do {
-		tmp = __raw_readl(S5P_CLKDIV_STAT_LEFTBUS);
-	} while (tmp & 0x11);
-
-	/* Change Divider - RIGHTBUS */
-
-	tmp = __raw_readl(S5P_CLKDIV_RIGHTBUS);
-
-	tmp &= ~(S5P_CLKDIV_BUS_GDLR_MASK | S5P_CLKDIV_BUS_GPLR_MASK);
-
-	tmp |= ((clkdiv_lr_bus[div_index][0] << S5P_CLKDIV_BUS_GDLR_SHIFT) |
-		(clkdiv_lr_bus[div_index][1] << S5P_CLKDIV_BUS_GPLR_SHIFT));
-
-	__raw_writel(tmp, S5P_CLKDIV_RIGHTBUS);
-
-	do {
-		tmp = __raw_readl(S5P_CLKDIV_STAT_RIGHTBUS);
-	} while (tmp & 0x11);
 }
 
 static void exynos4_set_apll(unsigned int index)
@@ -404,7 +259,7 @@ static int exynos4_target(struct cpufreq_policy *policy,
 			  unsigned int relation)
 {
 	unsigned int index, old_index;
-	unsigned int arm_volt, int_volt;
+	unsigned int arm_volt;
 
 	freqs.old = exynos4_getspeed(policy->cpu);
 
@@ -424,26 +279,21 @@ static int exynos4_target(struct cpufreq_policy *policy,
 
 	/* get the voltage value */
 	arm_volt = exynos4_volt_table[index].arm_volt;
-	int_volt = exynos4_volt_table[index].int_volt;
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 
 	/* control regulator */
-	if (freqs.new > freqs.old) {
+	if (freqs.new > freqs.old)
 		/* Voltage up */
 		regulator_set_voltage(arm_regulator, arm_volt, arm_volt);
-		regulator_set_voltage(int_regulator, int_volt, int_volt);
-	}
 
 	/* Clock Configuration Procedure */
 	exynos4_set_frequency(old_index, index);
 
 	/* control regulator */
-	if (freqs.new < freqs.old) {
+	if (freqs.new < freqs.old)
 		/* Voltage down */
 		regulator_set_voltage(arm_regulator, arm_volt, arm_volt);
-		regulator_set_voltage(int_regulator, int_volt, int_volt);
-	}
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 
@@ -519,27 +369,6 @@ static int __init exynos4_cpufreq_init(void)
 		goto out;
 	}
 
-	int_regulator = regulator_get(NULL, "vdd_int");
-	if (IS_ERR(int_regulator)) {
-		printk(KERN_ERR "failed to get resource %s\n", "vdd_int");
-		goto out;
-	}
-
-	/*
-	 * Check DRAM type.
-	 * Because DVFS level is different according to DRAM type.
-	 */
-	memtype = __raw_readl(S5P_VA_DMC0 + S5P_DMC0_MEMCON_OFFSET);
-	memtype = (memtype >> S5P_DMC0_MEMTYPE_SHIFT);
-	memtype &= S5P_DMC0_MEMTYPE_MASK;
-
-	if ((memtype < DDR2) && (memtype > DDR3)) {
-		printk(KERN_ERR "%s: wrong memtype= 0x%x\n", __func__, memtype);
-		goto out;
-	} else {
-		printk(KERN_DEBUG "%s: memtype= 0x%x\n", __func__, memtype);
-	}
-
 	return cpufreq_register_driver(&exynos4_driver);
 
 out:
@@ -558,9 +387,6 @@ out:
 	if (!IS_ERR(arm_regulator))
 		regulator_put(arm_regulator);
 
-	if (!IS_ERR(int_regulator))
-		regulator_put(int_regulator);
-
 	printk(KERN_ERR "%s: failed initialization\n", __func__);
 
 	return -EINVAL;
-- 
1.7.1
