From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 1/5] [CPUFREQ] EXYNOS4210: Remove code about bus on cpufreq
Date: Tue,  6 Dec 2011 19:13:06 +0900
Message-ID: <1323166390-10980-2-git-send-email-kgene.kim@samsung.com>
References: <1323166390-10980-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:53670 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750941Ab1LJSKX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Dec 2011 13:10:23 -0500
In-Reply-To: <1323166390-10980-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: davej@redhat.com, Jaecheol Lee <jc.lee@samsung.com>, Jongpill Lee <boyko.lee@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Jaecheol Lee <jc.lee@samsung.com>

This patch removes code for bus on cpufreq because the code
for bus frequency changing moves to busfreq driver.
So code about bus on cpufreq is not necessary.

Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/cpufreq/exynos4210-cpufreq.c |  174 +---------------------------------
 1 files changed, 1 insertions(+), 173 deletions(-)

diff --git a/drivers/cpufreq/exynos4210-cpufreq.c b/drivers/cpufreq/exynos4210-cpufreq.c
index ab9741f..578956c 100644
--- a/drivers/cpufreq/exynos4210-cpufreq.c
+++ b/drivers/cpufreq/exynos4210-cpufreq.c
@@ -33,21 +33,13 @@ static struct clk *mout_mpll;
 static struct clk *mout_apll;
 
 static struct regulator *arm_regulator;
-static struct regulator *int_regulator;
 
 static struct cpufreq_freqs freqs;
-static unsigned int memtype;
 
 static unsigned int locking_frequency;
 static bool frequency_locked;
 static DEFINE_MUTEX(cpufreq_lock);
 
-enum exynos4_memory_type {
-	DDR2 = 4,
-	LPDDR2,
-	DDR3,
-};
-
 enum cpufreq_level_index {
 	L0, L1, L2, L3, CPUFREQ_LEVEL_END,
 };
@@ -99,87 +91,24 @@ static unsigned int clkdiv_cpu1[CPUFREQ_LEVEL_END][2] = {
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
 
@@ -248,80 +177,6 @@ static void exynos4_set_clkdiv(unsigned int div_index)
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
@@ -410,7 +265,7 @@ static int exynos4_target(struct cpufreq_policy *policy,
 			  unsigned int relation)
 {
 	unsigned int index, old_index;
-	unsigned int arm_volt, int_volt;
+	unsigned int arm_volt;
 	int err = -EINVAL;
 
 	freqs.old = exynos4_getspeed(policy->cpu);
@@ -440,7 +295,6 @@ static int exynos4_target(struct cpufreq_policy *policy,
 
 	/* get the voltage value */
 	arm_volt = exynos4_volt_table[index].arm_volt;
-	int_volt = exynos4_volt_table[index].int_volt;
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 
@@ -448,7 +302,6 @@ static int exynos4_target(struct cpufreq_policy *policy,
 	if (freqs.new > freqs.old) {
 		/* Voltage up */
 		regulator_set_voltage(arm_regulator, arm_volt, arm_volt);
-		regulator_set_voltage(int_regulator, int_volt, int_volt);
 	}
 
 	/* Clock Configuration Procedure */
@@ -458,7 +311,6 @@ static int exynos4_target(struct cpufreq_policy *policy,
 	if (freqs.new < freqs.old) {
 		/* Voltage down */
 		regulator_set_voltage(arm_regulator, arm_volt, arm_volt);
-		regulator_set_voltage(int_regulator, int_volt, int_volt);
 	}
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
@@ -636,27 +488,6 @@ static int __init exynos4_cpufreq_init(void)
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
 	register_pm_notifier(&exynos4_cpufreq_nb);
 
 	return cpufreq_register_driver(&exynos4_driver);
@@ -677,9 +508,6 @@ out:
 	if (!IS_ERR(arm_regulator))
 		regulator_put(arm_regulator);
 
-	if (!IS_ERR(int_regulator))
-		regulator_put(int_regulator);
-
 	printk(KERN_ERR "%s: failed initialization\n", __func__);
 
 	return -EINVAL;
-- 
1.7.1
