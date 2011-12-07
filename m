From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/5] EXYNOS4210: cpufreq code is changed for stable
 working
Date: Wed, 07 Dec 2011 11:44:09 +0900
Message-ID: <03b201ccb48a$186fd310$494f7930$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Content-language: ko
Sender: cpufreq-owner@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: davej@redhat.com, kgene.kim@samsung.com, jc.lee@samsung.com, jhbird.choi@samsung.com, boyko.lee@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

From: Jaecheol Lee <jc.lee@samsung.com>

This patch is modify code for stable working
1. Remove unused register access code
2. Change sequence for frequency changing

Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/cpufreq/exynos4210-cpufreq.c |  101 ++++++++++++++++++++++------------
 1 files changed, 65 insertions(+), 36 deletions(-)

diff --git a/drivers/cpufreq/exynos4210-cpufreq.c b/drivers/cpufreq/exynos4210-cpufreq.c
index ba579e0..a0af2d4 100644
--- a/drivers/cpufreq/exynos4210-cpufreq.c
+++ b/drivers/cpufreq/exynos4210-cpufreq.c
@@ -36,6 +36,10 @@ static struct regulator *arm_regulator;
 
 static struct cpufreq_freqs freqs;
 
+struct cpufreq_clkdiv {
+	unsigned int clkdiv;
+};
+
 static unsigned int locking_frequency;
 static bool frequency_locked;
 static DEFINE_MUTEX(cpufreq_lock);
@@ -44,6 +48,8 @@ enum cpufreq_level_index {
 	L0, L1, L2, L3, L4, CPUFREQ_LEVEL_END,
 };
 
+static struct cpufreq_clkdiv exynos4_clkdiv_table[CPUFREQ_LEVEL_END];
+
 static struct cpufreq_frequency_table exynos4_freq_table[] = {
 	{L0, 1200*1000},
 	{L1, 1000*1000},
@@ -155,20 +161,7 @@ static void exynos4_set_clkdiv(unsigned int div_index)
 
 	/* Change Divider - CPU0 */
 
-	tmp = __raw_readl(S5P_CLKDIV_CPU);
-
-	tmp &= ~(S5P_CLKDIV_CPU0_CORE_MASK | S5P_CLKDIV_CPU0_COREM0_MASK |
-		S5P_CLKDIV_CPU0_COREM1_MASK | S5P_CLKDIV_CPU0_PERIPH_MASK |
-		S5P_CLKDIV_CPU0_ATB_MASK | S5P_CLKDIV_CPU0_PCLKDBG_MASK |
-		S5P_CLKDIV_CPU0_APLL_MASK);
-
-	tmp |= ((clkdiv_cpu0[div_index][0] << S5P_CLKDIV_CPU0_CORE_SHIFT) |
-		(clkdiv_cpu0[div_index][1] << S5P_CLKDIV_CPU0_COREM0_SHIFT) |
-		(clkdiv_cpu0[div_index][2] << S5P_CLKDIV_CPU0_COREM1_SHIFT) |
-		(clkdiv_cpu0[div_index][3] << S5P_CLKDIV_CPU0_PERIPH_SHIFT) |
-		(clkdiv_cpu0[div_index][4] << S5P_CLKDIV_CPU0_ATB_SHIFT) |
-		(clkdiv_cpu0[div_index][5] << S5P_CLKDIV_CPU0_PCLKDBG_SHIFT) |
-		(clkdiv_cpu0[div_index][6] << S5P_CLKDIV_CPU0_APLL_SHIFT));
+	tmp = exynos4_clkdiv_table[div_index].clkdiv;
 
 	__raw_writel(tmp, S5P_CLKDIV_CPU);
 
@@ -233,14 +226,12 @@ static void exynos4_set_frequency(unsigned int old_index, unsigned int new_index
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
 
@@ -249,18 +240,20 @@ static void exynos4_set_frequency(unsigned int old_index, unsigned int new_index
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
@@ -269,6 +262,12 @@ static void exynos4_set_frequency(unsigned int old_index, unsigned int new_index
 
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
@@ -320,14 +319,14 @@ static int exynos4_target(struct cpufreq_policy *policy,
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
 out:
 	mutex_unlock(&cpufreq_lock);
 	return err;
@@ -438,7 +437,12 @@ static int exynos4_cpufreq_cpu_init(struct cpufreq_policy *policy)
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
 
 	ret = cpufreq_frequency_table_cpuinfo(policy, exynos4_freq_table);
 	if (ret)
@@ -477,6 +481,9 @@ static struct cpufreq_driver exynos4_driver = {
 
 static int __init exynos4_cpufreq_init(void)
 {
+	int i;
+	unsigned int tmp;
+
 	cpu_clk = clk_get(NULL, "armclk");
 	if (IS_ERR(cpu_clk))
 		return PTR_ERR(cpu_clk);
@@ -503,6 +510,28 @@ static int __init exynos4_cpufreq_init(void)
 
 	register_pm_notifier(&exynos4_cpufreq_nb);
 
+	tmp = __raw_readl(S5P_CLKDIV_CPU);
+
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
+			(clkdiv_cpu0[i][1] << S5P_CLKDIV_CPU0_COREM0_SHIFT) |
+			(clkdiv_cpu0[i][2] << S5P_CLKDIV_CPU0_COREM1_SHIFT) |
+			(clkdiv_cpu0[i][3] << S5P_CLKDIV_CPU0_PERIPH_SHIFT) |
+			(clkdiv_cpu0[i][4] << S5P_CLKDIV_CPU0_ATB_SHIFT) |
+			(clkdiv_cpu0[i][5] << S5P_CLKDIV_CPU0_PCLKDBG_SHIFT) |
+			(clkdiv_cpu0[i][6] << S5P_CLKDIV_CPU0_APLL_SHIFT));
+
+		exynos4_clkdiv_table[i].clkdiv = tmp;
+	}
+
 	return cpufreq_register_driver(&exynos4_driver);
 
 out:
-- 
1.7.1

