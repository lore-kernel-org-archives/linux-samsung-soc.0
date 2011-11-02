From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 4/5] [CPUFREQ] EXYNOS4210: Add DVS lock feature for other driver
Date: Wed, 02 Nov 2011 21:43:13 +0900
Message-ID: <005701cc995c$fc66d3a0$f5347ae0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:31990 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753213Ab1KBMnO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Nov 2011 08:43:14 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org
Cc: davej@redhat.com, 'Jongpill Lee' <boyko.lee@samsung.com>, 'SangWook Ju' <sw.ju@samsung.com>, 'Jonghwan Choi' <jhbird.choi@samsung.com>, 'Jaecheol Lee' <jc.lee@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>

From: Jongpill Lee <boyko.lee@samsung.com>

This patch adds DVS lock feature for other driver and pm/
reboot notifier to enhance stability.

Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
Signed-off-by: SangWook Ju <sw.ju@samsung.com>
Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/cpufreq.h |   39 ++++++
 drivers/cpufreq/exynos4210-cpufreq.c         |  174
+++++++++++++++++++++++++-
 2 files changed, 207 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/include/mach/cpufreq.h

diff --git a/arch/arm/mach-exynos4/include/mach/cpufreq.h
b/arch/arm/mach-exynos4/include/mach/cpufreq.h
new file mode 100644
index 0000000..7e00931
--- /dev/null
+++ b/arch/arm/mach-exynos4/include/mach/cpufreq.h
@@ -0,0 +1,39 @@
+/* linux/arch/arm/mach-exynos4/include/mach/cpufreq.h
+ *
+ * Copyright (c) 2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * EXYNOS4 - CPUFreq support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+/*
+ * CPU frequency level index for using cpufreq lock API
+ * This should be same with cpufreq_frequency_table
+ */
+enum cpufreq_level_request {
+	CPU_L0,		/* 1200MHz */
+	CPU_L1,		/* 1000MHz */
+	CPU_L2,		/* 800MHz */
+	CPU_L3,		/* 500MHz */
+	CPU_L4,		/* 200MHz */
+	CPU_LEVEL_END,
+};
+
+enum cpufreq_lock_ID {
+	DVFS_LOCK_ID_G2D,	/* G2D */
+	DVFS_LOCK_ID_TV,	/* TV */
+	DVFS_LOCK_ID_MFC,	/* MFC */
+	DVFS_LOCK_ID_USB,	/* USB */
+	DVFS_LOCK_ID_CAM,	/* CAM */
+	DVFS_LOCK_ID_PM,	/* PM */
+	DVFS_LOCK_ID_USER,	/* USER */
+	DVFS_LOCK_ID_END,
+};
+
+int exynos4_cpufreq_lock(unsigned int nId,
+			enum cpufreq_level_request cpufreq_level);
+void exynos4_cpufreq_lock_free(unsigned int nId);
diff --git a/drivers/cpufreq/exynos4210-cpufreq.c
b/drivers/cpufreq/exynos4210-cpufreq.c
index 246f9e2..30e1949 100644
--- a/drivers/cpufreq/exynos4210-cpufreq.c
+++ b/drivers/cpufreq/exynos4210-cpufreq.c
@@ -17,14 +17,21 @@
 #include <linux/slab.h>
 #include <linux/regulator/consumer.h>
 #include <linux/cpufreq.h>
+#include <linux/suspend.h>
+#include <linux/reboot.h>
 
 #include <mach/map.h>
 #include <mach/regs-clock.h>
 #include <mach/regs-mem.h>
+#include <mach/cpufreq.h>
 
 #include <plat/clock.h>
 #include <plat/pm.h>
 
+static bool exynos4_cpufreq_init_done;
+static DEFINE_MUTEX(set_freq_lock);
+static DEFINE_MUTEX(set_cpu_freq_lock);
+
 static struct clk *cpu_clk;
 static struct clk *moutcore;
 static struct clk *mout_mpll;
@@ -53,6 +60,12 @@ static struct cpufreq_frequency_table
exynos4_freq_table[] = {
 	{0, CPUFREQ_TABLE_END},
 };
 
+/* This defines are for cpufreq lock */
+#define CPUFREQ_MIN_LEVEL	(CPUFREQ_LEVEL_END - 1)
+unsigned int cpufreq_lock_id;
+unsigned int cpufreq_lock_val[DVFS_LOCK_ID_END];
+unsigned int cpufreq_lock_level = CPUFREQ_MIN_LEVEL;
+
 static unsigned int clkdiv_cpu0[CPUFREQ_LEVEL_END][7] = {
 	/*
 	 * Clock divider value for following
@@ -272,22 +285,31 @@ static int exynos4_target(struct cpufreq_policy
*policy,
 {
 	unsigned int index, old_index;
 	unsigned int arm_volt;
+	int ret = 0;
+
+	mutex_lock(&set_freq_lock);
 
 	freqs.old = exynos4_getspeed(policy->cpu);
 
 	if (cpufreq_frequency_table_target(policy, exynos4_freq_table,
-					   freqs.old, relation, &old_index))
-		return -EINVAL;
+					   freqs.old, relation, &old_index))
{
+		ret = -EINVAL;
+		goto out;
+	}
 
 	if (cpufreq_frequency_table_target(policy, exynos4_freq_table,
-					   target_freq, relation, &index))
-		return -EINVAL;
+					   target_freq, relation, &index)) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	freqs.new = exynos4_freq_table[index].frequency;
 	freqs.cpu = policy->cpu;
 
-	if (freqs.new == freqs.old)
-		return 0;
+	if (freqs.new == freqs.old) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	/* get the voltage value */
 	arm_volt = exynos4_volt_table[index].arm_volt;
@@ -311,8 +333,98 @@ static int exynos4_target(struct cpufreq_policy
*policy,
 		regulator_set_voltage(arm_regulator, arm_volt, arm_volt);
 	}
 
+out:
+	mutex_unlock(&set_freq_lock);
+
+	return ret;
+}
+
+atomic_t exynos4_cpufreq_lock_count;
+
+int exynos4_cpufreq_lock(unsigned int id,
+		enum cpufreq_level_request cpufreq_level)
+{
+	int i, old_idx = 0;
+	unsigned int freq_old, freq_new, arm_volt;
+
+	if (!exynos4_cpufreq_init_done)
+		return 0;
+
+	if (cpufreq_lock_id & (1 << id)) {
+		printk(KERN_ERR "%s:Device [%d] already locked cpufreq\n",
+				__func__,  id);
+		return 0;
+	}
+	mutex_lock(&set_cpu_freq_lock);
+	cpufreq_lock_id |= (1 << id);
+	cpufreq_lock_val[id] = cpufreq_level;
+
+	/* If the requested cpufreq is higher than current min frequency */
+	if (cpufreq_level < cpufreq_lock_level)
+		cpufreq_lock_level = cpufreq_level;
+
+	mutex_unlock(&set_cpu_freq_lock);
+
+	/*
+	 * If current frequency is lower than requested freq,
+	 * it needs to update
+	 */
+	mutex_lock(&set_freq_lock);
+	freq_old = exynos4_getspeed(0);
+	freq_new = exynos4_freq_table[cpufreq_level].frequency;
+	if (freq_old < freq_new) {
+		/* Find out current level index */
+		for (i = 0 ; i < CPUFREQ_LEVEL_END ; i++) {
+			if (freq_old == exynos4_freq_table[i].frequency) {
+				old_idx = exynos4_freq_table[i].index;
+				break;
+			} else if (i == (CPUFREQ_LEVEL_END - 1)) {
+				printk(KERN_ERR "%s: Level not found\n",
+						__func__);
+				mutex_unlock(&set_freq_lock);
+				return -EINVAL;
+			} else {
+				continue;
+			}
+		}
+		freqs.old = freq_old;
+		freqs.new = freq_new;
+		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+
+		/* get the voltage value */
+		arm_volt = exynos4_volt_table[cpufreq_level].arm_volt;
+		regulator_set_voltage(arm_regulator, arm_volt,
+				arm_volt);
+
+		exynos4_set_frequency(old_idx, cpufreq_level);
+		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+	}
+	mutex_unlock(&set_freq_lock);
+
 	return 0;
 }
+EXPORT_SYMBOL_GPL(exynos4_cpufreq_lock);
+
+void exynos4_cpufreq_lock_free(unsigned int id)
+{
+	int i;
+
+	if (!exynos4_cpufreq_init_done)
+		return;
+
+	mutex_lock(&set_cpu_freq_lock);
+	cpufreq_lock_id &= ~(1 << id);
+	cpufreq_lock_val[id] = CPUFREQ_MIN_LEVEL;
+	cpufreq_lock_level = CPUFREQ_MIN_LEVEL;
+	if (cpufreq_lock_id) {
+		for (i = 0; i < DVFS_LOCK_ID_END; i++) {
+			if (cpufreq_lock_val[i] < cpufreq_lock_level)
+				cpufreq_lock_level = cpufreq_lock_val[i];
+		}
+	}
+	mutex_unlock(&set_cpu_freq_lock);
+}
+EXPORT_SYMBOL_GPL(exynos4_cpufreq_lock_free);
 
 #ifdef CONFIG_PM
 static int exynos4_cpufreq_suspend(struct cpufreq_policy *policy)
@@ -326,6 +438,31 @@ static int exynos4_cpufreq_resume(struct cpufreq_policy
*policy)
 }
 #endif
 
+static int exynos4_cpufreq_notifier_event(struct notifier_block *this,
+		unsigned long event, void *ptr)
+{
+	int ret;
+
+	switch (event) {
+	case PM_SUSPEND_PREPARE:
+		ret = exynos4_cpufreq_lock(DVFS_LOCK_ID_PM, CPU_L0);
+		if (ret < 0)
+			return NOTIFY_BAD;
+		pr_debug("PM_SUSPEND_PREPARE for CPUFREQ\n");
+		return NOTIFY_OK;
+	case PM_POST_RESTORE:
+	case PM_POST_SUSPEND:
+		pr_debug("PM_POST_SUSPEND for CPUFREQ\n");
+		exynos4_cpufreq_lock_free(DVFS_LOCK_ID_PM);
+		return NOTIFY_OK;
+	}
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block exynos4_cpufreq_notifier = {
+	.notifier_call = exynos4_cpufreq_notifier_event,
+};
+
 static int exynos4_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
 	policy->cur = policy->min = policy->max =
exynos4_getspeed(policy->cpu);
@@ -351,6 +488,23 @@ static int exynos4_cpufreq_cpu_init(struct
cpufreq_policy *policy)
 	return cpufreq_frequency_table_cpuinfo(policy, exynos4_freq_table);
 }
 
+static int exynos4_cpufreq_reboot_notifier_call(struct notifier_block
*this,
+		unsigned long code, void *_cmd)
+{
+	int ret;
+
+	ret = exynos4_cpufreq_lock(DVFS_LOCK_ID_PM, CPU_L0);
+	if (ret < 0)
+		return NOTIFY_BAD;
+
+	printk(KERN_INFO "REBOOT Notifier for CPUFREQ\n");
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block exynos4_cpufreq_reboot_notifier = {
+	.notifier_call = exynos4_cpufreq_reboot_notifier_call,
+};
+
 static struct cpufreq_driver exynos4_driver = {
 	.flags		= CPUFREQ_STICKY,
 	.verify		= exynos4_verify_speed,
@@ -391,6 +545,11 @@ static int __init exynos4_cpufreq_init(void)
 		goto err_vdd_arm;
 	}
 
+	register_pm_notifier(&exynos4_cpufreq_notifier);
+	register_reboot_notifier(&exynos4_cpufreq_reboot_notifier);
+
+	exynos4_cpufreq_init_done = true;
+
 	tmp = __raw_readl(S5P_CLKDIV_CPU);
 
 	for (i = L0; i <  CPUFREQ_LEVEL_END; i++) {
@@ -420,6 +579,9 @@ static int __init exynos4_cpufreq_init(void)
 
 	return 0;
 err_cpufreq:
+	unregister_reboot_notifier(&exynos4_cpufreq_reboot_notifier);
+	unregister_pm_notifier(&exynos4_cpufreq_notifier);
+
 	if (!IS_ERR(arm_regulator))
 		regulator_put(arm_regulator);
 
-- 
1.7.1
