From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V3 5/7] ARM: S5PV310: Update CPUFREQ
Date: Thu, 23 Dec 2010 14:49:55 +0900
Message-ID: <1293083397-15969-6-git-send-email-kgene.kim@samsung.com>
References: <1293083397-15969-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:56529 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751076Ab0LWGHv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Dec 2010 01:07:51 -0500
In-Reply-To: <1293083397-15969-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Sangwook Ju <sw.ju@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Sangwook Ju <sw.ju@samsung.com>

This patch updates following of CPUFREQ.

- Updated DVFS table and divider value
- Added common function
- Added some function for changing APLL and setting

Signed-off-by: Sangwook Ju <sw.ju@samsung.com>
Reviewed-by: Jaecheol Lee <jc.lee@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv310/cpufreq.c |  301 +++++++++++++++++++++------------------
 1 files changed, 160 insertions(+), 141 deletions(-)

diff --git a/arch/arm/mach-s5pv310/cpufreq.c b/arch/arm/mach-s5pv310/cpufreq.c
index bcd4ebf..b04cbc7 100644
--- a/arch/arm/mach-s5pv310/cpufreq.c
+++ b/arch/arm/mach-s5pv310/cpufreq.c
@@ -24,6 +24,7 @@
 #include <mach/regs-mem.h>
 
 #include <plat/clock.h>
+#include <plat/pm.h>
 
 static struct clk *cpu_clk;
 static struct clk *moutcore;
@@ -36,7 +37,6 @@ static struct regulator *int_regulator;
 #endif
 
 static struct cpufreq_freqs freqs;
-static unsigned int armclk_use_apll;
 static unsigned int memtype;
 
 enum s5pv310_memory_type {
@@ -46,19 +46,18 @@ enum s5pv310_memory_type {
 };
 
 enum cpufreq_level_index {
-	L0, L1, L2, L3, L4, CPUFREQ_LEVEL_END,
+	L0, L1, L2, L3, CPUFREQ_LEVEL_END,
 };
 
 static struct cpufreq_frequency_table s5pv310_freq_table[] = {
 	{L0, 1000*1000},
 	{L1, 800*1000},
 	{L2, 400*1000},
-	{L3, 200*1000},
-	{L4, 100*1000},
+	{L3, 100*1000},
 	{0, CPUFREQ_TABLE_END},
 };
 
-static unsigned int clkdiv_cpu0[CPUFREQ_LEVEL_END + 1][7] = {
+static unsigned int clkdiv_cpu0[CPUFREQ_LEVEL_END][7] = {
 	/*
 	 * Clock divider value for following
 	 * { DIVCORE, DIVCOREM0, DIVCOREM1, DIVPERIPH,
@@ -66,25 +65,38 @@ static unsigned int clkdiv_cpu0[CPUFREQ_LEVEL_END + 1][7] = {
 	 */
 
 	/* ARM L0: 1000MHz */
-	{ 0, 3, 7, 3, 3, 0, 0 },
+	{ 0, 3, 7, 3, 3, 0, 1 },
 
 	/* ARM L1: 800MHz */
-	{ 0, 3, 7, 3, 3, 0, 0 },
+	{ 0, 3, 7, 3, 3, 0, 1 },
 
 	/* ARM L2: 400MHz */
-	{ 1, 1, 3, 1, 1, 0, 0 },
+	{ 0, 1, 3, 1, 3, 0, 1 },
 
-	/* ARM L3: 200MHz */
-	{ 3, 0, 1, 0, 0, 0, 0 },
+	/* ARM L3: 100MHz */
+	{ 0, 0, 1, 0, 3, 1, 1 },
+};
 
-	/* ARM L4A: 100MHz, for DDR2/3 */
-	{ 7, 0, 1, 0, 0, 0, 0 },
+static unsigned int clkdiv_cpu1[CPUFREQ_LEVEL_END][2] = {
+	/*
+	 * Clock divider value for following
+	 * { DIVCOPY, DIVHPM }
+	 */
+
+	 /* ARM L0: 1000MHz */
+	{ 3, 0 },
+
+	/* ARM L1: 800MHz */
+	{ 3, 0 },
 
-	/* ARM L4B: 100MHz, for LPDDR2 (SMDKV310 has LPDDR2) */
-	{ 7, 0, 1, 0, 0, 0, 0 },
+	/* ARM L2: 400MHz */
+	{ 3, 0 },
+
+	/* ARM L3: 100MHz */
+	{ 3, 0 },
 };
 
-static unsigned int clkdiv_dmc0[CPUFREQ_LEVEL_END + 1][8] = {
+static unsigned int clkdiv_dmc0[CPUFREQ_LEVEL_END][8] = {
 	/*
 	 * Clock divider value for following
 	 * { DIVACP, DIVACP_PCLK, DIVDPHY, DIVDMC, DIVDMCD
@@ -97,20 +109,14 @@ static unsigned int clkdiv_dmc0[CPUFREQ_LEVEL_END + 1][8] = {
 	/* DMC L1: 400MHz */
 	{ 3, 1, 1, 1, 1, 1, 3, 1 },
 
-	/* DMC L2: 400MHz */
-	{ 3, 1, 1, 1, 1, 1, 3, 1 },
-
-	/* DMC L3: 400MHz */
-	{ 3, 1, 1, 1, 1, 1, 3, 1 },
-
-	/* DMC L4A: 400MHz, for DDR2/3 */
-	{ 7, 1, 1, 1, 1, 1, 3, 1 },
+	/* DMC L2: 266.7MHz */
+	{ 7, 1, 1, 2, 1, 1, 3, 1 },
 
-	/* DMC L4B: 200MHz, for LPDDR2 */
+	/* DMC L3: 200MHz */
 	{ 7, 1, 1, 3, 1, 1, 3, 1 },
 };
 
-static unsigned int clkdiv_top[CPUFREQ_LEVEL_END + 1][5] = {
+static unsigned int clkdiv_top[CPUFREQ_LEVEL_END][5] = {
 	/*
 	 * Clock divider value for following
 	 * { DIVACLK200, DIVACLK100, DIVACLK160, DIVACLK133, DIVONENAND }
@@ -122,20 +128,14 @@ static unsigned int clkdiv_top[CPUFREQ_LEVEL_END + 1][5] = {
 	/* ACLK200 L1: 200MHz */
 	{ 3, 7, 4, 5, 1 },
 
-	/* ACLK200 L2: 200MHz */
-	{ 3, 7, 4, 5, 1 },
-
-	/* ACLK200 L3: 200MHz */
-	{ 3, 7, 4, 5, 1 },
-
-	/* ACLK200 L4A: 100MHz */
-	{ 7, 7, 7, 7, 1 },
+	/* ACLK200 L2: 160MHz */
+	{ 4, 7, 5, 7, 1 },
 
-	/* ACLK200 L4B: 100MHz */
-	{ 7, 7, 7, 7, 1 },
+	/* ACLK200 L3: 133.3MHz */
+	{ 5, 7, 7, 7, 1 },
 };
 
-static unsigned int clkdiv_lr_bus[CPUFREQ_LEVEL_END + 1][2] = {
+static unsigned int clkdiv_lr_bus[CPUFREQ_LEVEL_END][2] = {
 	/*
 	 * Clock divider value for following
 	 * { DIVGDL/R, DIVGPL/R }
@@ -147,17 +147,11 @@ static unsigned int clkdiv_lr_bus[CPUFREQ_LEVEL_END + 1][2] = {
 	/* ACLK_GDL/R L1: 200MHz */
 	{ 3, 1 },
 
-	/* ACLK_GDL/R L2: 200MHz */
-	{ 3, 1 },
-
-	/* ACLK_GDL/R L3: 200MHz */
-	{ 3, 1 },
+	/* ACLK_GDL/R L2: 160MHz */
+	{ 4, 1 },
 
-	/* ACLK_GDL/R L4A: 100MHz */
-	{ 7, 1 },
-
-	/* ACLK_GDL/R L4B: 100MHz */
-	{ 7, 1 },
+	/* ACLK_GDL/R L3: 133.3MHz */
+	{ 5, 1 },
 };
 
 struct cpufreq_voltage_table {
@@ -166,7 +160,7 @@ struct cpufreq_voltage_table {
 	unsigned int	int_volt;
 };
 
-static struct cpufreq_voltage_table s5pv310_volt_table[] = {
+static struct cpufreq_voltage_table s5pv310_volt_table[CPUFREQ_LEVEL_END] = {
 	{
 		.index		= L0,
 		.arm_volt	= 1200000,
@@ -177,19 +171,29 @@ static struct cpufreq_voltage_table s5pv310_volt_table[] = {
 		.int_volt	= 1100000,
 	}, {
 		.index		= L2,
-		.arm_volt	= 1050000,
-		.int_volt	= 1100000,
+		.arm_volt	= 1000000,
+		.int_volt	= 1000000,
 	}, {
 		.index		= L3,
-		.arm_volt	= 1050000,
-		.int_volt	= 1100000,
-	}, {
-		.index		= L4,
-		.arm_volt	= 1000000,
+		.arm_volt	= 900000,
 		.int_volt	= 1000000,
 	},
 };
 
+static unsigned int s5pv310_apll_pms_table[CPUFREQ_LEVEL_END] = {
+	/* APLL FOUT L0: 1000MHz */
+	((250 << 16) | (6 << 8) | 1),
+
+	/* APLL FOUT L1: 800MHz */
+	((200 << 16) | (6 << 8) | 1),
+
+	/* APLL FOUT L2 : 400MHz */
+	((200 << 16) | (6 << 8) | 2),
+
+	/* APLL FOUT L3: 100MHz */
+	((200 << 16) | (6 << 8) | 4),
+};
+
 int s5pv310_verify_speed(struct cpufreq_policy *policy)
 {
 	return cpufreq_frequency_table_verify(policy, s5pv310_freq_table);
@@ -227,6 +231,21 @@ void s5pv310_set_clkdiv(unsigned int div_index)
 		tmp = __raw_readl(S5P_CLKDIV_STATCPU);
 	} while (tmp & 0x1111111);
 
+	/* Change Divider - CPU1 */
+
+	tmp = __raw_readl(S5P_CLKDIV_CPU1);
+
+	tmp &= ~((0x7 << 4) | 0x7);
+
+	tmp |= ((clkdiv_cpu1[div_index][0] << 4) |
+		(clkdiv_cpu1[div_index][1] << 0));
+
+	__raw_writel(tmp, S5P_CLKDIV_CPU1);
+
+	do {
+		tmp = __raw_readl(S5P_CLKDIV_STATCPU1);
+	} while (tmp & 0x11);
+
 	/* Change Divider - DMC0 */
 
 	tmp = __raw_readl(S5P_CLKDIV_DMC0);
@@ -302,17 +321,101 @@ void s5pv310_set_clkdiv(unsigned int div_index)
 	} while (tmp & 0x11);
 }
 
+static void s5pv310_set_apll(unsigned int index)
+{
+	unsigned int tmp;
+
+	/* 1. MUX_CORE_SEL = MPLL, ARMCLK uses MPLL for lock time */
+	clk_set_parent(moutcore, mout_mpll);
+
+	do {
+		tmp = (__raw_readl(S5P_CLKMUX_STATCPU)
+			>> S5P_CLKSRC_CPU_MUXCORE_SHIFT);
+		tmp &= 0x7;
+	} while (tmp != 0x2);
+
+	/* 2. Set APLL Lock time */
+	__raw_writel(S5P_APLL_LOCKTIME, S5P_APLL_LOCK);
+
+	/* 3. Change PLL PMS values */
+	tmp = __raw_readl(S5P_APLL_CON0);
+	tmp &= ~((0x3ff << 16) | (0x3f << 8) | (0x7 << 0));
+	tmp |= s5pv310_apll_pms_table[index];
+	__raw_writel(tmp, S5P_APLL_CON0);
+
+	/* 4. wait_lock_time */
+	do {
+		tmp = __raw_readl(S5P_APLL_CON0);
+	} while (!(tmp & (0x1 << S5P_APLLCON0_LOCKED_SHIFT)));
+
+	/* 5. MUX_CORE_SEL = APLL */
+	clk_set_parent(moutcore, mout_apll);
+
+	do {
+		tmp = __raw_readl(S5P_CLKMUX_STATCPU);
+		tmp &= S5P_CLKMUX_STATCPU_MUXCORE_MASK;
+	} while (tmp != (0x1 << S5P_CLKSRC_CPU_MUXCORE_SHIFT));
+}
+
+static void s5pv310_set_frequency(unsigned int old_index, unsigned int new_index)
+{
+	unsigned int tmp;
+
+	if (old_index > new_index) {
+		/* The frequency changing to L0 needs to change apll */
+		if (freqs.new == s5pv310_freq_table[L0].frequency) {
+			/* 1. Change the system clock divider values */
+			s5pv310_set_clkdiv(new_index);
+
+			/* 2. Change the apll m,p,s value */
+			s5pv310_set_apll(new_index);
+		} else {
+			/* 1. Change the system clock divider values */
+			s5pv310_set_clkdiv(new_index);
+
+			/* 2. Change just s value in apll m,p,s value */
+			tmp = __raw_readl(S5P_APLL_CON0);
+			tmp &= ~(0x7 << 0);
+			tmp |= (s5pv310_apll_pms_table[new_index] & 0x7);
+			__raw_writel(tmp, S5P_APLL_CON0);
+		}
+	}
+
+	else if (old_index < new_index) {
+		/* The frequency changing from L0 needs to change apll */
+		if (freqs.old == s5pv310_freq_table[L0].frequency) {
+			/* 1. Change the apll m,p,s value */
+			s5pv310_set_apll(new_index);
+
+			/* 2. Change the system clock divider values */
+			s5pv310_set_clkdiv(new_index);
+		} else {
+			/* 1. Change just s value in apll m,p,s value */
+			tmp = __raw_readl(S5P_APLL_CON0);
+			tmp &= ~(0x7 << 0);
+			tmp |= (s5pv310_apll_pms_table[new_index] & 0x7);
+			__raw_writel(tmp, S5P_APLL_CON0);
+
+			/* 2. Change the system clock divider values */
+			s5pv310_set_clkdiv(new_index);
+		}
+	}
+}
+
 static int s5pv310_target(struct cpufreq_policy *policy,
 			  unsigned int target_freq,
 			  unsigned int relation)
 {
-	unsigned int index, div_index, tmp;
+	unsigned int index, old_index;
 	unsigned int arm_volt, int_volt;
-	unsigned int need_apll = 0;
 
 	freqs.old = s5pv310_getspeed(policy->cpu);
 
 	if (cpufreq_frequency_table_target(policy, s5pv310_freq_table,
+					   freqs.old, relation, &old_index))
+		return -EINVAL;
+
+	if (cpufreq_frequency_table_target(policy, s5pv310_freq_table,
 					   target_freq, relation, &index))
 		return -EINVAL;
 
@@ -322,19 +425,6 @@ static int s5pv310_target(struct cpufreq_policy *policy,
 	if (freqs.new == freqs.old)
 		return 0;
 
-	/*
-	 * If freqs.new is higher than 800MHz
-	 * cpufreq driver should turn on apll
-	 */
-	if (index < L1)
-		need_apll = 1;
-
-	/* If the memory type is LPDDR2, use L4-B instead of L4-A */
-	if ((index == L4) && (memtype == LPDDR2))
-		div_index = index + 1;
-	else
-		div_index = index;
-
 	/* get the voltage value */
 	arm_volt = s5pv310_volt_table[index].arm_volt;
 	int_volt = s5pv310_volt_table[index].int_volt;
@@ -351,69 +441,7 @@ static int s5pv310_target(struct cpufreq_policy *policy,
 	}
 
 	/* Clock Configuration Procedure */
-
-	/* 1. Change the system clock divider values */
-	s5pv310_set_clkdiv(div_index);
-
-	/* 2. Change the divider values for special clocks in CMU_TOP */
-	/* currently nothing */
-
-	/* 3. Change the XPLL values or Select the parent XPLL */
-	if (need_apll) {
-		if (!armclk_use_apll) {
-			/*
-			 * If the parent clock of armclk isn't apll
-			 * here need to set apll (include m,p,s value)
-			 */
-
-			/* a. MUX_CORE_SEL = MPLL,
-			 * ARMCLK uses MPLL for lock time */
-			clk_set_parent(moutcore, mout_mpll);
-
-			do {
-				tmp = (__raw_readl(S5P_CLKMUX_STATCPU)
-					>> S5P_CLKSRC_CPU_MUXCORE_SHIFT);
-				tmp &= 0x7;
-			} while (tmp != 0x2);
-
-			/* b. Set APLL Lock time */
-			__raw_writel(S5P_APLL_LOCKTIME, S5P_APLL_LOCK);
-
-			/* c. Change PLL PMS values */
-			__raw_writel(S5P_APLL_VAL_1000, S5P_APLL_CON0);
-
-			/* d. Turn on a PLL */
-			tmp = __raw_readl(S5P_APLL_CON0);
-			tmp |= (0x1 << S5P_APLLCON0_ENABLE_SHIFT);
-			__raw_writel(tmp, S5P_APLL_CON0);
-
-			/* e. wait_lock_time */
-			do {
-				tmp = __raw_readl(S5P_APLL_CON0);
-			} while (!(tmp & (0x1 << S5P_APLLCON0_LOCKED_SHIFT)));
-
-			armclk_use_apll = 1;
-
-		}
-
-		/* MUX_CORE_SEL = APLL */
-		clk_set_parent(moutcore, mout_apll);
-
-		do {
-			tmp = __raw_readl(S5P_CLKMUX_STATCPU);
-			tmp &= S5P_CLKMUX_STATCPU_MUXCORE_MASK;
-		} while (tmp != (0x1 << S5P_CLKSRC_CPU_MUXCORE_SHIFT));
-
-	} else {
-		if (clk_get_parent(moutcore) != mout_mpll) {
-			clk_set_parent(moutcore, mout_mpll);
-
-			do {
-				tmp = __raw_readl(S5P_CLKMUX_STATCPU);
-				tmp &= S5P_CLKMUX_STATCPU_MUXCORE_MASK;
-			} while (tmp != (0x2 << S5P_CLKSRC_CPU_MUXCORE_SHIFT));
-		}
-	}
+	s5pv310_set_frequency(old_index, index);
 
 	/* control regulator */
 	if (freqs.new < freqs.old) {
@@ -477,8 +505,6 @@ static struct cpufreq_driver s5pv310_driver = {
 
 static int __init s5pv310_cpufreq_init(void)
 {
-	unsigned int tmp;
-
 	cpu_clk = clk_get(NULL, "armclk");
 	if (IS_ERR(cpu_clk))
 		return PTR_ERR(cpu_clk);
@@ -509,13 +535,6 @@ static int __init s5pv310_cpufreq_init(void)
 	}
 #endif
 
-	/* check parent clock of armclk */
-	tmp = __raw_readl(S5P_CLKSRC_CPU);
-	if (tmp & S5P_CLKSRC_CPU_MUXCORE_SHIFT)
-		armclk_use_apll = 0;
-	else
-		armclk_use_apll = 1;
-
 	/*
 	 * Check DRAM type.
 	 * Because DVFS level is different according to DRAM type.
-- 
1.6.2.5
