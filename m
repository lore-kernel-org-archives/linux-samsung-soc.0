From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 4/5] EXYNOS: Make EXYNOS common cpufreq driver
Date: Tue,  6 Dec 2011 19:13:09 +0900
Message-ID: <1323166390-10980-5-git-send-email-kgene.kim@samsung.com>
References: <1323166390-10980-1-git-send-email-kgene.kim@samsung.com>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1323166390-10980-1-git-send-email-kgene.kim@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: davej@redhat.com, Jaecheol Lee <jc.lee@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Jaecheol Lee <jc.lee@samsung.com>

To support various EXYNOS series SoCs commonly,
added exynos common structure.
exynos-cpufreq.c => EXYNOS series common cpufreq driver
exynos4210-cpufreq.c => EXYNOS4210 support cpufreq driver

Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/include/mach/cpufreq.h |   34 +++
 drivers/cpufreq/Kconfig.arm                 |   15 +-
 drivers/cpufreq/Makefile                    |    1 +
 drivers/cpufreq/exynos-cpufreq.c            |  296 ++++++++++++++++++++
 drivers/cpufreq/exynos4210-cpufreq.c        |  385 +++++----------------------
 5 files changed, 414 insertions(+), 317 deletions(-)
 create mode 100644 arch/arm/mach-exynos/include/mach/cpufreq.h
 create mode 100644 drivers/cpufreq/exynos-cpufreq.c

diff --git a/arch/arm/mach-exynos/include/mach/cpufreq.h b/arch/arm/mach-exynos/include/mach/cpufreq.h
new file mode 100644
index 0000000..3df27f2
--- /dev/null
+++ b/arch/arm/mach-exynos/include/mach/cpufreq.h
@@ -0,0 +1,34 @@
+/* linux/arch/arm/mach-exynos/include/mach/cpufreq.h
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * EXYNOS - CPUFreq support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+enum cpufreq_level_index {
+	L0, L1, L2, L3, L4,
+	L5, L6, L7, L8, L9,
+	L10, L11, L12, L13, L14,
+	L15, L16, L17, L18, L19,
+	L20,
+};
+
+struct exynos_dvfs_info {
+	unsigned long	mpll_freq_khz;
+	unsigned int	pll_safe_idx;
+	unsigned int	pm_lock_idx;
+	unsigned int	max_support_idx;
+	unsigned int	min_support_idx;
+	struct clk	*cpu_clk;
+	unsigned int	*volt_table;
+	struct cpufreq_frequency_table	*freq_table;
+	void (*set_freq)(unsigned int, unsigned int);
+	bool (*need_apll_change)(unsigned int, unsigned int);
+};
+
+extern int exynos4210_cpufreq_init(struct exynos_dvfs_info *);
diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index 72a0044..e0664fe 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -21,12 +21,19 @@ config ARM_S5PV210_CPUFREQ
 
 	  If in doubt, say N.
 
+config ARM_EXYNOS_CPUFREQ
+	bool "SAMSUNG EXYNOS SoCs"
+	depends on ARCH_EXYNOS
+	select ARM_EXYNOS4210_CPUFREQ if CPU_EXYNOS4210
+	default y
+	help
+	  This adds the CPUFreq driver common part for Samsung
+	  EXYNOS SoCs.
+
+	  If in doubt, say N.
+
 config ARM_EXYNOS4210_CPUFREQ
 	bool "Samsung EXYNOS4210"
-	depends on CPU_EXYNOS4210
-	default y
 	help
 	  This adds the CPUFreq driver for Samsung EXYNOS4210
 	  SoC (S5PV310 or S5PC210).
-
-	  If in doubt, say N.
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index a48bc02..48cfff7 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -42,6 +42,7 @@ obj-$(CONFIG_X86_CPUFREQ_NFORCE2)	+= cpufreq-nforce2.o
 obj-$(CONFIG_UX500_SOC_DB8500)		+= db8500-cpufreq.o
 obj-$(CONFIG_ARM_S3C64XX_CPUFREQ)	+= s3c64xx-cpufreq.o
 obj-$(CONFIG_ARM_S5PV210_CPUFREQ)	+= s5pv210-cpufreq.o
+obj-$(CONFIG_ARM_EXYNOS_CPUFREQ)	+= exynos-cpufreq.o
 obj-$(CONFIG_ARM_EXYNOS4210_CPUFREQ)	+= exynos4210-cpufreq.o
 
 ##################################################################################
diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
new file mode 100644
index 0000000..24e4dd4
--- /dev/null
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -0,0 +1,296 @@
+/*
+ * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * EXYNOS - CPU frequency scaling support for EXYNOS series
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/err.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/regulator/consumer.h>
+#include <linux/cpufreq.h>
+#include <linux/suspend.h>
+#include <linux/reboot.h>
+
+#include <mach/map.h>
+#include <mach/regs-clock.h>
+#include <mach/regs-mem.h>
+#include <mach/cpufreq.h>
+
+#include <plat/clock.h>
+#include <plat/pm.h>
+
+static struct exynos_dvfs_info *exynos_info;
+
+static struct regulator *arm_regulator;
+static struct cpufreq_freqs freqs;
+
+static unsigned int locking_frequency;
+static bool frequency_locked;
+static DEFINE_MUTEX(cpufreq_lock);
+
+int exynos_verify_speed(struct cpufreq_policy *policy)
+{
+	return cpufreq_frequency_table_verify(policy,
+					      exynos_info->freq_table);
+}
+
+unsigned int exynos_getspeed(unsigned int cpu)
+{
+	return clk_get_rate(exynos_info->cpu_clk) / 1000;
+}
+
+static int exynos_target(struct cpufreq_policy *policy,
+			  unsigned int target_freq,
+			  unsigned int relation)
+{
+	unsigned int index, old_index;
+	unsigned int arm_volt, safe_arm_volt = 0;
+	int ret = 0;
+	struct cpufreq_frequency_table *freq_table = exynos_info->freq_table;
+	unsigned int *volt_table = exynos_info->volt_table;
+	unsigned int mpll_freq_khz = exynos_info->mpll_freq_khz;
+
+	mutex_lock(&cpufreq_lock);
+
+	freqs.old = policy->cur;
+
+	if (frequency_locked && target_freq != locking_frequency) {
+		ret = -EAGAIN;
+		goto out;
+	}
+
+	if (cpufreq_frequency_table_target(policy, freq_table,
+					   freqs.old, relation, &old_index)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (cpufreq_frequency_table_target(policy, freq_table,
+					   target_freq, relation, &index)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	freqs.new = freq_table[index].frequency;
+	freqs.cpu = policy->cpu;
+
+	/*
+	 * ARM clock source will be changed APLL to MPLL temporary
+	 * To support this level, need to control regulator for
+	 * required voltage level
+	 */
+	if (exynos_info->need_apll_change != NULL) {
+		if (exynos_info->need_apll_change(old_index, index) &&
+		   (freq_table[index].frequency < mpll_freq_khz) &&
+		   (freq_table[old_index].frequency < mpll_freq_khz))
+			safe_arm_volt = volt_table[exynos_info->pll_safe_idx];
+	}
+	arm_volt = volt_table[index];
+
+	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+
+	/* When the new frequency is higher than current frequency */
+	if ((freqs.new > freqs.old) && !safe_arm_volt) {
+		/* Firstly, voltage up to increase frequency */
+		regulator_set_voltage(arm_regulator, arm_volt,
+				arm_volt);
+	}
+
+	if (safe_arm_volt)
+		regulator_set_voltage(arm_regulator, safe_arm_volt,
+				      safe_arm_volt);
+	if (freqs.new != freqs.old)
+		exynos_info->set_freq(old_index, index);
+
+	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+
+	/* When the new frequency is lower than current frequency */
+	if ((freqs.new < freqs.old) ||
+	   ((freqs.new > freqs.old) && safe_arm_volt)) {
+		/* down the voltage after frequency change */
+		regulator_set_voltage(arm_regulator, arm_volt,
+				arm_volt);
+	}
+
+out:
+	mutex_unlock(&cpufreq_lock);
+
+	return ret;
+}
+
+#ifdef CONFIG_PM
+static int exynos_cpufreq_suspend(struct cpufreq_policy *policy)
+{
+	return 0;
+}
+
+static int exynos_cpufreq_resume(struct cpufreq_policy *policy)
+{
+	return 0;
+}
+#endif
+
+/**
+ * exynos_cpufreq_pm_notifier - block CPUFREQ's activities in suspend-resume
+ *			context
+ * @notifier
+ * @pm_event
+ * @v
+ *
+ * While frequency_locked == true, target() ignores every frequency but
+ * locking_frequency. The locking_frequency value is the initial frequency,
+ * which is set by the bootloader. In order to eliminate possible
+ * inconsistency in clock values, we save and restore frequencies during
+ * suspend and resume and block CPUFREQ activities. Note that the standard
+ * suspend/resume cannot be used as they are too deep (syscore_ops) for
+ * regulator actions.
+ */
+static int exynos_cpufreq_pm_notifier(struct notifier_block *notifier,
+				       unsigned long pm_event, void *v)
+{
+	struct cpufreq_policy *policy = cpufreq_cpu_get(0); /* boot CPU */
+	static unsigned int saved_frequency;
+	unsigned int temp;
+
+	mutex_lock(&cpufreq_lock);
+	switch (pm_event) {
+	case PM_SUSPEND_PREPARE:
+		if (frequency_locked)
+			goto out;
+
+		frequency_locked = true;
+
+		if (locking_frequency) {
+			saved_frequency = exynos_getspeed(0);
+
+			mutex_unlock(&cpufreq_lock);
+			exynos_target(policy, locking_frequency,
+				      CPUFREQ_RELATION_H);
+			mutex_lock(&cpufreq_lock);
+		}
+		break;
+
+	case PM_POST_SUSPEND:
+		if (saved_frequency) {
+			/*
+			 * While frequency_locked, only locking_frequency
+			 * is valid for target(). In order to use
+			 * saved_frequency while keeping frequency_locked,
+			 * we temporarly overwrite locking_frequency.
+			 */
+			temp = locking_frequency;
+			locking_frequency = saved_frequency;
+
+			mutex_unlock(&cpufreq_lock);
+			exynos_target(policy, locking_frequency,
+				      CPUFREQ_RELATION_H);
+			mutex_lock(&cpufreq_lock);
+
+			locking_frequency = temp;
+		}
+		frequency_locked = false;
+		break;
+	}
+out:
+	mutex_unlock(&cpufreq_lock);
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block exynos_cpufreq_nb = {
+	.notifier_call = exynos_cpufreq_pm_notifier,
+};
+
+static int exynos_cpufreq_cpu_init(struct cpufreq_policy *policy)
+{
+	policy->cur = policy->min = policy->max = exynos_getspeed(policy->cpu);
+
+	cpufreq_frequency_table_get_attr(exynos_info->freq_table, policy->cpu);
+
+	/* set the transition latency value */
+	policy->cpuinfo.transition_latency = 100000;
+
+	/*
+	 * EXYNOS4 multi-core processors has 2 cores
+	 * that the frequency cannot be set independently.
+	 * Each cpu is bound to the same speed.
+	 * So the affected cpu is all of the cpus.
+	 */
+	if (num_online_cpus() == 1) {
+		cpumask_copy(policy->related_cpus, cpu_possible_mask);
+		cpumask_copy(policy->cpus, cpu_online_mask);
+	} else {
+		cpumask_setall(policy->cpus);
+	}
+
+	return cpufreq_frequency_table_cpuinfo(policy, exynos_info->freq_table);
+}
+
+static struct cpufreq_driver exynos_driver = {
+	.flags		= CPUFREQ_STICKY,
+	.verify		= exynos_verify_speed,
+	.target		= exynos_target,
+	.get		= exynos_getspeed,
+	.init		= exynos_cpufreq_cpu_init,
+	.name		= "exynos_cpufreq",
+#ifdef CONFIG_PM
+	.suspend	= exynos_cpufreq_suspend,
+	.resume		= exynos_cpufreq_resume,
+#endif
+};
+
+static int __init exynos_cpufreq_init(void)
+{
+	int ret = -EINVAL;
+
+	exynos_info = kzalloc(sizeof(struct exynos_dvfs_info), GFP_KERNEL);
+	if (!exynos_info)
+		return -ENOMEM;
+
+	if (soc_is_exynos4210())
+		ret = exynos4210_cpufreq_init(exynos_info);
+	else
+		pr_err("%s: CPU type not found\n", __func__);
+
+	if (ret)
+		goto err_vdd_arm;
+
+	if (exynos_info->set_freq == NULL) {
+		pr_err("%s: No set_freq function (ERR)\n", __func__);
+		goto err_vdd_arm;
+	}
+
+	arm_regulator = regulator_get(NULL, "vdd_arm");
+	if (IS_ERR(arm_regulator)) {
+		pr_err("%s: failed to get resource vdd_arm\n", __func__);
+		goto err_vdd_arm;
+	}
+
+	register_pm_notifier(&exynos_cpufreq_nb);
+
+	if (cpufreq_register_driver(&exynos_driver)) {
+		pr_err("%s: failed to register cpufreq driver\n", __func__);
+		goto err_cpufreq;
+	}
+
+	return 0;
+err_cpufreq:
+	unregister_pm_notifier(&exynos_cpufreq_nb);
+
+	if (!IS_ERR(arm_regulator))
+		regulator_put(arm_regulator);
+err_vdd_arm:
+	kfree(exynos_info);
+	pr_debug("%s: failed initialization\n", __func__);
+	return -EINVAL;
+}
+late_initcall(exynos_cpufreq_init);
diff --git a/drivers/cpufreq/exynos4210-cpufreq.c b/drivers/cpufreq/exynos4210-cpufreq.c
index a0af2d4..6bc4ada 100644
--- a/drivers/cpufreq/exynos4210-cpufreq.c
+++ b/drivers/cpufreq/exynos4210-cpufreq.c
@@ -2,7 +2,7 @@
  * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  *
- * EXYNOS4 - CPU frequency scaling support
+ * EXYNOS4210 - CPU frequency scaling support
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -23,10 +23,16 @@
 #include <mach/map.h>
 #include <mach/regs-clock.h>
 #include <mach/regs-mem.h>
+#include <mach/cpufreq.h>
 
 #include <plat/clock.h>
 #include <plat/pm.h>
 
+#define CPUFREQ_LEVEL_END	L5
+
+static int max_support_idx = L0;
+static int min_support_idx = (CPUFREQ_LEVEL_END - 1);
+
 static struct clk *cpu_clk;
 static struct clk *moutcore;
 static struct clk *mout_mpll;
@@ -37,20 +43,18 @@ static struct regulator *arm_regulator;
 static struct cpufreq_freqs freqs;
 
 struct cpufreq_clkdiv {
+	unsigned int index;
 	unsigned int clkdiv;
 };
 
-static unsigned int locking_frequency;
-static bool frequency_locked;
-static DEFINE_MUTEX(cpufreq_lock);
-
-enum cpufreq_level_index {
-	L0, L1, L2, L3, L4, CPUFREQ_LEVEL_END,
+static unsigned int exynos4210_volt_table[CPUFREQ_LEVEL_END] = {
+	1250000, 1150000, 1050000, 975000, 950000,
 };
 
-static struct cpufreq_clkdiv exynos4_clkdiv_table[CPUFREQ_LEVEL_END];
 
-static struct cpufreq_frequency_table exynos4_freq_table[] = {
+static struct cpufreq_clkdiv exynos4210_clkdiv_table[CPUFREQ_LEVEL_END];
+
+static struct cpufreq_frequency_table exynos4210_freq_table[] = {
 	{L0, 1200*1000},
 	{L1, 1000*1000},
 	{L2, 800*1000},
@@ -104,31 +108,7 @@ static unsigned int clkdiv_cpu1[CPUFREQ_LEVEL_END][2] = {
 	{ 3, 0 },
 };
 
-struct cpufreq_voltage_table {
-	unsigned int	index;		/* any */
-	unsigned int	arm_volt;	/* uV */
-};
-
-static struct cpufreq_voltage_table exynos4_volt_table[CPUFREQ_LEVEL_END] = {
-	{
-		.index		= L0,
-		.arm_volt	= 1350000,
-	}, {
-		.index		= L1,
-		.arm_volt	= 1300000,
-	}, {
-		.index		= L2,
-		.arm_volt	= 1200000,
-	}, {
-		.index		= L3,
-		.arm_volt	= 1100000,
-	}, {
-		.index		= L4,
-		.arm_volt	= 1050000,
-	},
-};
-
-static unsigned int exynos4_apll_pms_table[CPUFREQ_LEVEL_END] = {
+static unsigned int exynos4210_apll_pms_table[CPUFREQ_LEVEL_END] = {
 	/* APLL FOUT L0: 1200MHz */
 	((150 << 16) | (3 << 8) | 1),
 
@@ -145,23 +125,13 @@ static unsigned int exynos4_apll_pms_table[CPUFREQ_LEVEL_END] = {
 	((200 << 16) | (6 << 8) | 3),
 };
 
-static int exynos4_verify_speed(struct cpufreq_policy *policy)
-{
-	return cpufreq_frequency_table_verify(policy, exynos4_freq_table);
-}
-
-static unsigned int exynos4_getspeed(unsigned int cpu)
-{
-	return clk_get_rate(cpu_clk) / 1000;
-}
-
-static void exynos4_set_clkdiv(unsigned int div_index)
+static void exynos4210_set_clkdiv(unsigned int div_index)
 {
 	unsigned int tmp;
 
 	/* Change Divider - CPU0 */
 
-	tmp = exynos4_clkdiv_table[div_index].clkdiv;
+	tmp = exynos4210_clkdiv_table[div_index].clkdiv;
 
 	__raw_writel(tmp, S5P_CLKDIV_CPU);
 
@@ -185,7 +155,7 @@ static void exynos4_set_clkdiv(unsigned int div_index)
 	} while (tmp & 0x11);
 }
 
-static void exynos4_set_apll(unsigned int index)
+static void exynos4210_set_apll(unsigned int index)
 {
 	unsigned int tmp;
 
@@ -204,7 +174,7 @@ static void exynos4_set_apll(unsigned int index)
 	/* 3. Change PLL PMS values */
 	tmp = __raw_readl(S5P_APLL_CON0);
 	tmp &= ~((0x3ff << 16) | (0x3f << 8) | (0x7 << 0));
-	tmp |= exynos4_apll_pms_table[index];
+	tmp |= exynos4210_apll_pms_table[index];
 	__raw_writel(tmp, S5P_APLL_CON0);
 
 	/* 4. wait_lock_time */
@@ -221,305 +191,90 @@ static void exynos4_set_apll(unsigned int index)
 	} while (tmp != (0x1 << S5P_CLKSRC_CPU_MUXCORE_SHIFT));
 }
 
-static void exynos4_set_frequency(unsigned int old_index, unsigned int new_index)
+bool exynos4210_pms_change(unsigned int old_index, unsigned int new_index)
+{
+	unsigned int old_pm = (exynos4210_apll_pms_table[old_index] >> 8);
+	unsigned int new_pm = (exynos4210_apll_pms_table[new_index] >> 8);
+
+	return (old_pm == new_pm) ? 0 : 1;
+}
+
+static void exynos4210_set_frequency(unsigned int old_index,
+				     unsigned int new_index)
 {
 	unsigned int tmp;
 
 	if (old_index > new_index) {
-		/*
-		 * L1/L3, L2/L4 Level change require
-		 * to only change s divider value
-		 */
-		if (((old_index == L3) && (new_index == L1)) ||
-				((old_index == L4) && (new_index == L2))) {
+		if (!exynos4210_pms_change(old_index, new_index)) {
 			/* 1. Change the system clock divider values */
-			exynos4_set_clkdiv(new_index);
+			exynos4210_set_clkdiv(new_index);
 
 			/* 2. Change just s value in apll m,p,s value */
 			tmp = __raw_readl(S5P_APLL_CON0);
 			tmp &= ~(0x7 << 0);
-			tmp |= (exynos4_apll_pms_table[new_index] & 0x7);
+			tmp |= (exynos4210_apll_pms_table[new_index] & 0x7);
 			__raw_writel(tmp, S5P_APLL_CON0);
 		} else {
 			/* Clock Configuration Procedure */
 			/* 1. Change the system clock divider values */
-			exynos4_set_clkdiv(new_index);
+			exynos4210_set_clkdiv(new_index);
 			/* 2. Change the apll m,p,s value */
-			exynos4_set_apll(new_index);
+			exynos4210_set_apll(new_index);
 		}
 	} else if (old_index < new_index) {
-		/*
-		 * L1/L3, L2/L4 Level change require
-		 * to only change s divider value
-		 */
-		if (((old_index == L1) && (new_index == L3)) ||
-				((old_index == L2) && (new_index == L4))) {
+		if (!exynos4210_pms_change(old_index, new_index)) {
 			/* 1. Change just s value in apll m,p,s value */
 			tmp = __raw_readl(S5P_APLL_CON0);
 			tmp &= ~(0x7 << 0);
-			tmp |= (exynos4_apll_pms_table[new_index] & 0x7);
+			tmp |= (exynos4210_apll_pms_table[new_index] & 0x7);
 			__raw_writel(tmp, S5P_APLL_CON0);
 
 			/* 2. Change the system clock divider values */
-			exynos4_set_clkdiv(new_index);
+			exynos4210_set_clkdiv(new_index);
 		} else {
 			/* Clock Configuration Procedure */
 			/* 1. Change the apll m,p,s value */
-			exynos4_set_apll(new_index);
+			exynos4210_set_apll(new_index);
 			/* 2. Change the system clock divider values */
-			exynos4_set_clkdiv(new_index);
+			exynos4210_set_clkdiv(new_index);
 		}
 	}
 }
 
-static int exynos4_target(struct cpufreq_policy *policy,
-			  unsigned int target_freq,
-			  unsigned int relation)
-{
-	unsigned int index, old_index;
-	unsigned int arm_volt;
-	int err = -EINVAL;
-
-	freqs.old = exynos4_getspeed(policy->cpu);
-
-	mutex_lock(&cpufreq_lock);
-
-	if (frequency_locked && target_freq != locking_frequency) {
-		err = -EAGAIN;
-		goto out;
-	}
-
-	if (cpufreq_frequency_table_target(policy, exynos4_freq_table,
-					   freqs.old, relation, &old_index))
-		goto out;
-
-	if (cpufreq_frequency_table_target(policy, exynos4_freq_table,
-					   target_freq, relation, &index))
-		goto out;
-
-	err = 0;
-
-	freqs.new = exynos4_freq_table[index].frequency;
-	freqs.cpu = policy->cpu;
-
-	if (freqs.new == freqs.old)
-		goto out;
-
-	/* get the voltage value */
-	arm_volt = exynos4_volt_table[index].arm_volt;
-
-	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
-
-	/* control regulator */
-	if (freqs.new > freqs.old) {
-		/* Voltage up */
-		regulator_set_voltage(arm_regulator, arm_volt, arm_volt);
-	}
-
-	/* Clock Configuration Procedure */
-	exynos4_set_frequency(old_index, index);
-
-	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-
-	/* control regulator */
-	if (freqs.new < freqs.old) {
-		/* Voltage down */
-		regulator_set_voltage(arm_regulator, arm_volt, arm_volt);
-	}
-
-out:
-	mutex_unlock(&cpufreq_lock);
-	return err;
-}
-
-#ifdef CONFIG_PM
-/*
- * These suspend/resume are used as syscore_ops, it is already too
- * late to set regulator voltages at this stage.
- */
-static int exynos4_cpufreq_suspend(struct cpufreq_policy *policy)
-{
-	return 0;
-}
-
-static int exynos4_cpufreq_resume(struct cpufreq_policy *policy)
-{
-	return 0;
-}
-#endif
-
-/**
- * exynos4_cpufreq_pm_notifier - block CPUFREQ's activities in suspend-resume
- *			context
- * @notifier
- * @pm_event
- * @v
- *
- * While frequency_locked == true, target() ignores every frequency but
- * locking_frequency. The locking_frequency value is the initial frequency,
- * which is set by the bootloader. In order to eliminate possible
- * inconsistency in clock values, we save and restore frequencies during
- * suspend and resume and block CPUFREQ activities. Note that the standard
- * suspend/resume cannot be used as they are too deep (syscore_ops) for
- * regulator actions.
- */
-static int exynos4_cpufreq_pm_notifier(struct notifier_block *notifier,
-				       unsigned long pm_event, void *v)
-{
-	struct cpufreq_policy *policy = cpufreq_cpu_get(0); /* boot CPU */
-	static unsigned int saved_frequency;
-	unsigned int temp;
-
-	mutex_lock(&cpufreq_lock);
-	switch (pm_event) {
-	case PM_SUSPEND_PREPARE:
-		if (frequency_locked)
-			goto out;
-		frequency_locked = true;
-
-		if (locking_frequency) {
-			saved_frequency = exynos4_getspeed(0);
-
-			mutex_unlock(&cpufreq_lock);
-			exynos4_target(policy, locking_frequency,
-				       CPUFREQ_RELATION_H);
-			mutex_lock(&cpufreq_lock);
-		}
-
-		break;
-	case PM_POST_SUSPEND:
-
-		if (saved_frequency) {
-			/*
-			 * While frequency_locked, only locking_frequency
-			 * is valid for target(). In order to use
-			 * saved_frequency while keeping frequency_locked,
-			 * we temporarly overwrite locking_frequency.
-			 */
-			temp = locking_frequency;
-			locking_frequency = saved_frequency;
-
-			mutex_unlock(&cpufreq_lock);
-			exynos4_target(policy, locking_frequency,
-				       CPUFREQ_RELATION_H);
-			mutex_lock(&cpufreq_lock);
-
-			locking_frequency = temp;
-		}
-
-		frequency_locked = false;
-		break;
-	}
-out:
-	mutex_unlock(&cpufreq_lock);
-
-	return NOTIFY_OK;
-}
-
-static struct notifier_block exynos4_cpufreq_nb = {
-	.notifier_call = exynos4_cpufreq_pm_notifier,
-};
-
-static int exynos4_cpufreq_cpu_init(struct cpufreq_policy *policy)
-{
-	int ret;
-
-	policy->cur = policy->min = policy->max = exynos4_getspeed(policy->cpu);
-
-	cpufreq_frequency_table_get_attr(exynos4_freq_table, policy->cpu);
-
-	/* set the transition latency value */
-	policy->cpuinfo.transition_latency = 100000;
-
-	/*
-	 * EXYNOS4 multi-core processors has 2 cores
-	 * that the frequency cannot be set independently.
-	 * Each cpu is bound to the same speed.
-	 * So the affected cpu is all of the cpus.
-	 */
-	if (!cpu_online(1)) {
-		cpumask_copy(policy->related_cpus, cpu_possible_mask);
-		cpumask_copy(policy->cpus, cpu_online_mask);
-	} else {
-		cpumask_setall(policy->cpus);
-	}
-
-	ret = cpufreq_frequency_table_cpuinfo(policy, exynos4_freq_table);
-	if (ret)
-		return ret;
-
-	cpufreq_frequency_table_get_attr(exynos4_freq_table, policy->cpu);
-
-	return 0;
-}
-
-static int exynos4_cpufreq_cpu_exit(struct cpufreq_policy *policy)
-{
-	cpufreq_frequency_table_put_attr(policy->cpu);
-	return 0;
-}
-
-static struct freq_attr *exynos4_cpufreq_attr[] = {
-	&cpufreq_freq_attr_scaling_available_freqs,
-	NULL,
-};
-
-static struct cpufreq_driver exynos4_driver = {
-	.flags		= CPUFREQ_STICKY,
-	.verify		= exynos4_verify_speed,
-	.target		= exynos4_target,
-	.get		= exynos4_getspeed,
-	.init		= exynos4_cpufreq_cpu_init,
-	.exit		= exynos4_cpufreq_cpu_exit,
-	.name		= "exynos4_cpufreq",
-	.attr		= exynos4_cpufreq_attr,
-#ifdef CONFIG_PM
-	.suspend	= exynos4_cpufreq_suspend,
-	.resume		= exynos4_cpufreq_resume,
-#endif
-};
-
-static int __init exynos4_cpufreq_init(void)
+int exynos4210_cpufreq_init(struct exynos_dvfs_info *info)
 {
 	int i;
 	unsigned int tmp;
+	unsigned long rate;
 
 	cpu_clk = clk_get(NULL, "armclk");
 	if (IS_ERR(cpu_clk))
 		return PTR_ERR(cpu_clk);
 
-	locking_frequency = exynos4_getspeed(0);
-
 	moutcore = clk_get(NULL, "moutcore");
 	if (IS_ERR(moutcore))
-		goto out;
+		goto err_moutcore;
 
 	mout_mpll = clk_get(NULL, "mout_mpll");
 	if (IS_ERR(mout_mpll))
-		goto out;
+		goto err_mout_mpll;
+
+	rate = clk_get_rate(mout_mpll) / 1000;
 
 	mout_apll = clk_get(NULL, "mout_apll");
 	if (IS_ERR(mout_apll))
-		goto out;
-
-	arm_regulator = regulator_get(NULL, "vdd_arm");
-	if (IS_ERR(arm_regulator)) {
-		printk(KERN_ERR "failed to get resource %s\n", "vdd_arm");
-		goto out;
-	}
-
-	register_pm_notifier(&exynos4_cpufreq_nb);
+		goto err_mout_apll;
 
 	tmp = __raw_readl(S5P_CLKDIV_CPU);
 
 	for (i = L0; i <  CPUFREQ_LEVEL_END; i++) {
 		tmp &= ~(S5P_CLKDIV_CPU0_CORE_MASK |
-			 S5P_CLKDIV_CPU0_COREM0_MASK |
-			 S5P_CLKDIV_CPU0_COREM1_MASK |
-			 S5P_CLKDIV_CPU0_PERIPH_MASK |
-			 S5P_CLKDIV_CPU0_ATB_MASK |
-			 S5P_CLKDIV_CPU0_PCLKDBG_MASK |
-			 S5P_CLKDIV_CPU0_APLL_MASK);
+			S5P_CLKDIV_CPU0_COREM0_MASK |
+			S5P_CLKDIV_CPU0_COREM1_MASK |
+			S5P_CLKDIV_CPU0_PERIPH_MASK |
+			S5P_CLKDIV_CPU0_ATB_MASK |
+			S5P_CLKDIV_CPU0_PCLKDBG_MASK |
+			S5P_CLKDIV_CPU0_APLL_MASK);
 
 		tmp |= ((clkdiv_cpu0[i][0] << S5P_CLKDIV_CPU0_CORE_SHIFT) |
 			(clkdiv_cpu0[i][1] << S5P_CLKDIV_CPU0_COREM0_SHIFT) |
@@ -529,29 +284,33 @@ static int __init exynos4_cpufreq_init(void)
 			(clkdiv_cpu0[i][5] << S5P_CLKDIV_CPU0_PCLKDBG_SHIFT) |
 			(clkdiv_cpu0[i][6] << S5P_CLKDIV_CPU0_APLL_SHIFT));
 
-		exynos4_clkdiv_table[i].clkdiv = tmp;
+		exynos4210_clkdiv_table[i].clkdiv = tmp;
 	}
 
-	return cpufreq_register_driver(&exynos4_driver);
-
-out:
-	if (!IS_ERR(cpu_clk))
-		clk_put(cpu_clk);
+	info->mpll_freq_khz = rate;
+	info->pm_lock_idx = L2;
+	info->pll_safe_idx = L2;
+	info->max_support_idx = max_support_idx;
+	info->min_support_idx = min_support_idx;
+	info->cpu_clk = cpu_clk;
+	info->volt_table = exynos4210_volt_table;
+	info->freq_table = exynos4210_freq_table;
+	info->set_freq = exynos4210_set_frequency;
+	info->need_apll_change = exynos4210_pms_change;
 
-	if (!IS_ERR(moutcore))
-		clk_put(moutcore);
+	return 0;
 
+err_mout_apll:
 	if (!IS_ERR(mout_mpll))
 		clk_put(mout_mpll);
+err_mout_mpll:
+	if (!IS_ERR(moutcore))
+		clk_put(moutcore);
+err_moutcore:
+	if (!IS_ERR(cpu_clk))
+		clk_put(cpu_clk);
 
-	if (!IS_ERR(mout_apll))
-		clk_put(mout_apll);
-
-	if (!IS_ERR(arm_regulator))
-		regulator_put(arm_regulator);
-
-	printk(KERN_ERR "%s: failed initialization\n", __func__);
-
+	pr_debug("%s: failed initialization\n", __func__);
 	return -EINVAL;
 }
-late_initcall(exynos4_cpufreq_init);
+EXPORT_SYMBOL(exynos4210_cpufreq_init);
-- 
1.7.1

