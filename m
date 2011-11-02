From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/5] [CPUFREQ] EXYNOS4210: cpufreq code is changed for stable
 working
Date: Wed, 02 Nov 2011 21:43:05 +0900
Message-ID: <005601cc995c$f7db5810$e7920830$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:31958 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753213Ab1KBMnH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Nov 2011 08:43:07 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org
Cc: davej@redhat.com, 'Jongpill Lee' <boyko.lee@samsung.com>, 'SangWook Ju' <sw.ju@samsung.com>, 'Jonghwan Choi' <jhbird.choi@samsung.com>, 'Jaecheol Lee' <jc.lee@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>

From: Jongpill Lee <boyko.lee@samsung.com>

This patch is modify code for stable working
1. Remove unused register access code
2. Change sequence for frequency changing

Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
Signed-off-by: SangWook Ju <sw.ju@samsung.com>
Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
---
 drivers/cpufreq/exynos4210-cpufreq.c |  139
+++++++++++++++++++++------------
 1 files changed, 88 insertions(+), 51 deletions(-)

diff --git a/drivers/cpufreq/exynos4210-cpufreq.c
b/drivers/cpufreq/exynos4210-cpufreq.c
index 5ca9380..246f9e2 100644
--- a/drivers/cpufreq/exynos4210-cpufreq.c
+++ b/drivers/cpufreq/exynos4210-cpufreq.c
@@ -34,10 +34,16 @@ static struct regulator *arm_regulator;
 
 static struct cpufreq_freqs freqs;
 
+struct cpufreq_clkdiv {
+	unsigned int clkdiv;
+};
+
 enum cpufreq_level_index {
 	L0, L1, L2, L3, L4, CPUFREQ_LEVEL_END,
 };
 
+static struct cpufreq_clkdiv exynos4_clkdiv_table[CPUFREQ_LEVEL_END];
+
 static struct cpufreq_frequency_table exynos4_freq_table[] = {
 	{L0, 1200*1000},
 	{L1, 1000*1000},
@@ -149,20 +155,7 @@ static void exynos4_set_clkdiv(unsigned int div_index)
 
 	/* Change Divider - CPU0 */
 
-	tmp = __raw_readl(S5P_CLKDIV_CPU);
-
-	tmp &= ~(S5P_CLKDIV_CPU0_CORE_MASK | S5P_CLKDIV_CPU0_COREM0_MASK |
-		S5P_CLKDIV_CPU0_COREM1_MASK | S5P_CLKDIV_CPU0_PERIPH_MASK |
-		S5P_CLKDIV_CPU0_ATB_MASK | S5P_CLKDIV_CPU0_PCLKDBG_MASK |
-		S5P_CLKDIV_CPU0_APLL_MASK);
-
-	tmp |= ((clkdiv_cpu0[div_index][0] << S5P_CLKDIV_CPU0_CORE_SHIFT) |
-		(clkdiv_cpu0[div_index][1] << S5P_CLKDIV_CPU0_COREM0_SHIFT)
|
-		(clkdiv_cpu0[div_index][2] << S5P_CLKDIV_CPU0_COREM1_SHIFT)
|
-		(clkdiv_cpu0[div_index][3] << S5P_CLKDIV_CPU0_PERIPH_SHIFT)
|
-		(clkdiv_cpu0[div_index][4] << S5P_CLKDIV_CPU0_ATB_SHIFT) |
-		(clkdiv_cpu0[div_index][5] << S5P_CLKDIV_CPU0_PCLKDBG_SHIFT)
|
-		(clkdiv_cpu0[div_index][6] << S5P_CLKDIV_CPU0_APLL_SHIFT));
+	tmp = exynos4_clkdiv_table[div_index].clkdiv;
 
 	__raw_writel(tmp, S5P_CLKDIV_CPU);
 
@@ -227,14 +220,12 @@ static void exynos4_set_frequency(unsigned int
old_index, unsigned int new_index
 	unsigned int tmp;
 
 	if (old_index > new_index) {
-		/* The frequency changing to L0 needs to change apll */
-		if (freqs.new == exynos4_freq_table[L0].frequency) {
-			/* 1. Change the system clock divider values */
-			exynos4_set_clkdiv(new_index);
-
-			/* 2. Change the apll m,p,s value */
-			exynos4_set_apll(new_index);
-		} else {
+		/*
+		 * L1/L3, L2/L4 Level change require
+		 * to only change s divider value
+		 */
+		if (((old_index == L3) && (new_index == L1)) ||
+				((old_index == L4) && (new_index == L2))) {
 			/* 1. Change the system clock divider values */
 			exynos4_set_clkdiv(new_index);
 
@@ -243,18 +234,20 @@ static void exynos4_set_frequency(unsigned int
old_index, unsigned int new_index
 			tmp &= ~(0x7 << 0);
 			tmp |= (exynos4_apll_pms_table[new_index] & 0x7);
 			__raw_writel(tmp, S5P_APLL_CON0);
-		}
-	}
-
-	else if (old_index < new_index) {
-		/* The frequency changing from L0 needs to change apll */
-		if (freqs.old == exynos4_freq_table[L0].frequency) {
-			/* 1. Change the apll m,p,s value */
-			exynos4_set_apll(new_index);
-
-			/* 2. Change the system clock divider values */
-			exynos4_set_clkdiv(new_index);
 		} else {
+			/* Clock Configuration Procedure */
+			/* 1. Change the system clock divider values */
+			exynos4_set_clkdiv(new_index);
+			/* 2. Change the apll m,p,s value */
+			exynos4_set_apll(new_index);
+		}
+	} else if (old_index < new_index) {
+		/*
+		 * L1/L3, L2/L4 Level change require
+		 * to only change s divider value
+		 */
+		if (((old_index == L1) && (new_index == L3)) ||
+				((old_index == L2) && (new_index == L4))) {
 			/* 1. Change just s value in apll m,p,s value */
 			tmp = __raw_readl(S5P_APLL_CON0);
 			tmp &= ~(0x7 << 0);
@@ -263,6 +256,12 @@ static void exynos4_set_frequency(unsigned int
old_index, unsigned int new_index
 
 			/* 2. Change the system clock divider values */
 			exynos4_set_clkdiv(new_index);
+		} else {
+			/* Clock Configuration Procedure */
+			/* 1. Change the apll m,p,s value */
+			exynos4_set_apll(new_index);
+			/* 2. Change the system clock divider values */
+			exynos4_set_clkdiv(new_index);
 		}
 	}
 }
@@ -304,14 +303,14 @@ static int exynos4_target(struct cpufreq_policy
*policy,
 	/* Clock Configuration Procedure */
 	exynos4_set_frequency(old_index, index);
 
+	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+
 	/* control regulator */
 	if (freqs.new < freqs.old) {
 		/* Voltage down */
 		regulator_set_voltage(arm_regulator, arm_volt, arm_volt);
 	}
 
-	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-
 	return 0;
 }
 
@@ -342,7 +341,12 @@ static int exynos4_cpufreq_cpu_init(struct
cpufreq_policy *policy)
 	 * Each cpu is bound to the same speed.
 	 * So the affected cpu is all of the cpus.
 	 */
-	cpumask_setall(policy->cpus);
+	if (!cpu_online(1)) {
+		cpumask_copy(policy->related_cpus, cpu_possible_mask);
+		cpumask_copy(policy->cpus, cpu_online_mask);
+	} else {
+		cpumask_setall(policy->cpus);
+	}
 
 	return cpufreq_frequency_table_cpuinfo(policy, exynos4_freq_table);
 }
@@ -362,47 +366,80 @@ static struct cpufreq_driver exynos4_driver = {
 
 static int __init exynos4_cpufreq_init(void)
 {
+	int i;
+	unsigned int tmp;
+
 	cpu_clk = clk_get(NULL, "armclk");
 	if (IS_ERR(cpu_clk))
 		return PTR_ERR(cpu_clk);
 
 	moutcore = clk_get(NULL, "moutcore");
 	if (IS_ERR(moutcore))
-		goto out;
+		goto err_moutcore;
 
 	mout_mpll = clk_get(NULL, "mout_mpll");
 	if (IS_ERR(mout_mpll))
-		goto out;
+		goto err_mout_mpll;
 
 	mout_apll = clk_get(NULL, "mout_apll");
 	if (IS_ERR(mout_apll))
-		goto out;
+		goto err_mout_apll;
 
 	arm_regulator = regulator_get(NULL, "vdd_arm");
 	if (IS_ERR(arm_regulator)) {
 		printk(KERN_ERR "failed to get resource %s\n", "vdd_arm");
-		goto out;
+		goto err_vdd_arm;
 	}
 
-	return cpufreq_register_driver(&exynos4_driver);
+	tmp = __raw_readl(S5P_CLKDIV_CPU);
 
-out:
-	if (!IS_ERR(cpu_clk))
-		clk_put(cpu_clk);
+	for (i = L0; i <  CPUFREQ_LEVEL_END; i++) {
+		tmp &= ~(S5P_CLKDIV_CPU0_CORE_MASK |
+			 S5P_CLKDIV_CPU0_COREM0_MASK |
+			 S5P_CLKDIV_CPU0_COREM1_MASK |
+			 S5P_CLKDIV_CPU0_PERIPH_MASK |
+			 S5P_CLKDIV_CPU0_ATB_MASK |
+			 S5P_CLKDIV_CPU0_PCLKDBG_MASK |
+			 S5P_CLKDIV_CPU0_APLL_MASK);
+
+		tmp |= ((clkdiv_cpu0[i][0] << S5P_CLKDIV_CPU0_CORE_SHIFT) |
+			(clkdiv_cpu0[i][1] << S5P_CLKDIV_CPU0_COREM0_SHIFT)
|
+			(clkdiv_cpu0[i][2] << S5P_CLKDIV_CPU0_COREM1_SHIFT)
|
+			(clkdiv_cpu0[i][3] << S5P_CLKDIV_CPU0_PERIPH_SHIFT)
|
+			(clkdiv_cpu0[i][4] << S5P_CLKDIV_CPU0_ATB_SHIFT) |
+			(clkdiv_cpu0[i][5] << S5P_CLKDIV_CPU0_PCLKDBG_SHIFT)
|
+			(clkdiv_cpu0[i][6] << S5P_CLKDIV_CPU0_APLL_SHIFT));
+
+		exynos4_clkdiv_table[i].clkdiv = tmp;
+	}
 
-	if (!IS_ERR(moutcore))
-		clk_put(moutcore);
+	if (cpufreq_register_driver(&exynos4_driver)) {
+		pr_err("failed to register cpufreq driver\n");
+		goto err_cpufreq;
+	}
 
-	if (!IS_ERR(mout_mpll))
-		clk_put(mout_mpll);
+	return 0;
+err_cpufreq:
+	if (!IS_ERR(arm_regulator))
+		regulator_put(arm_regulator);
 
+err_vdd_arm:
 	if (!IS_ERR(mout_apll))
 		clk_put(mout_apll);
 
-	if (!IS_ERR(arm_regulator))
-		regulator_put(arm_regulator);
+err_mout_apll:
+	if (!IS_ERR(mout_mpll))
+		clk_put(mout_mpll);
+
+err_mout_mpll:
+	if (!IS_ERR(moutcore))
+		clk_put(moutcore);
+
+err_moutcore:
+	if (!IS_ERR(cpu_clk))
+		clk_put(cpu_clk);
 
-	printk(KERN_ERR "%s: failed initialization\n", __func__);
+	pr_debug("%s: failed initialization\n", __func__);
 
 	return -EINVAL;
 }
-- 
1.7.1
