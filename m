From: Jonghwan Choi <jhbird.choi@samsung.com>
Subject: [PATCH 4/5] cpufreq: exynos: Split exynos_target function into two
 functions
Date: Fri, 07 Dec 2012 17:20:18 +0900
Message-ID: <009001cdd453$b1381870$13a84950$%choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:18379 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753793Ab2LGIUU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Dec 2012 03:20:20 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MEN00AFUJ5B8QQ0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Dec 2012 17:20:18 +0900 (KST)
Received: from DOJHBIRDCHO03 ([12.23.118.55])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MEN00F1SJ5S2960@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Dec 2012 17:20:18 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Jaecheol Lee' <jc.lee@samsung.com>, "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Russell King' <linux@arm.linux.org.uk>

Split exynos_target function into exynos_target & exynos_cpufreq_scale.
Exynos_cpufreq_scale changes the voltage & frequency.

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c |  151
+++++++++++++++++++++----------------
 1 files changed, 86 insertions(+), 65 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c
b/drivers/cpufreq/exynos-cpufreq.c
index 82963a3..b0338e1 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -42,54 +42,55 @@ unsigned int exynos_getspeed(unsigned int cpu)
        return clk_get_rate(exynos_info->cpu_clk) / 1000;
 }

-static int exynos_target(struct cpufreq_policy *policy,
-                         unsigned int target_freq,
-                         unsigned int relation)
+static int exynos_cpufreq_get_index(unsigned int freq)
+{
+       struct cpufreq_frequency_table *freq_table =
exynos_info->freq_table;
+       int index;
+
+       for (index = 0;
+               freq_table[index].frequency != CPUFREQ_TABLE_END; index++)
+               if (freq_table[index].frequency == freq)
+                       break;
+
+       if (freq_table[index].frequency == CPUFREQ_TABLE_END)
+               return -EINVAL;
+
+       return index;
+}
+
+static int exynos_cpufreq_scale(unsigned int target_freq)
 {
-       unsigned int index, old_index;
-       unsigned int arm_volt, safe_arm_volt = 0;
-       int ret = 0;
        struct cpufreq_frequency_table *freq_table =
exynos_info->freq_table;
        unsigned int *volt_table = exynos_info->volt_table;
+       struct cpufreq_policy *policy = cpufreq_cpu_get(0);
+       unsigned int arm_volt, safe_arm_volt = 0;
        unsigned int mpll_freq_khz = exynos_info->mpll_freq_khz;
-
-       mutex_lock(&cpufreq_lock);
+       unsigned int index, old_index;
+       int ret = 0;

        freqs.old = policy->cur;
+       freqs.cpu = policy->cpu;

-       if (frequency_locked && target_freq != locking_frequency) {
-               ret = -EAGAIN;
+       if (target_freq == freqs.old)
                goto out;
-       }

        /*
         * The policy max have been changed so that we cannot get proper
         * old_index with cpufreq_frequency_table_target(). Thus, ignore
         * policy and get the index from the raw freqeuncy table.
         */
-       for (old_index = 0;
-               freq_table[old_index].frequency != CPUFREQ_TABLE_END;
-               old_index++)
-               if (freq_table[old_index].frequency == freqs.old)
-                       break;
-
-       if (freq_table[old_index].frequency == CPUFREQ_TABLE_END) {
-               ret = -EINVAL;
"0004-cpufreq-exynos-Split-exynos_target-function-into-two.patch" 236L,
6451C
1,1           Top
-       if (freq_table[old_index].frequency == CPUFREQ_TABLE_END) {
-               ret = -EINVAL;
+       old_index = exynos_cpufreq_get_index(freqs.old);
+       if (old_index < 0) {
+               ret = old_index;
                goto out;
        }

-       if (cpufreq_frequency_table_target(policy, freq_table,
-                                          target_freq, relation, &index)) {
-               ret = -EINVAL;
+       index = exynos_cpufreq_get_index(target_freq);
+       if (index < 0) {
+               ret = index;
                goto out;
        }

-       freqs.new = freq_table[index].frequency;
-       freqs.cpu = policy->cpu;
-
-       if (freqs.new == freqs.old)
-               goto out;
-
        /*
         * ARM clock source will be changed APLL to MPLL temporary
         * To support this level, need to control regulator for
@@ -108,13 +109,23 @@ static int exynos_target(struct cpufreq_policy
*policy,
        /* When the new frequency is higher than current frequency */
        if ((freqs.new > freqs.old) && !safe_arm_volt) {
                /* Firstly, voltage up to increase frequency */
-               regulator_set_voltage(arm_regulator, arm_volt,
-                               arm_volt);
+               ret = regulator_set_voltage(arm_regulator, arm_volt,
arm_volt);
+               if (ret) {
+                       pr_err("%s: failed to set cpu voltage to %d\n",
+                               __func__, arm_volt);
+                       goto out;
+               }
        }

-       if (safe_arm_volt)
-               regulator_set_voltage(arm_regulator, safe_arm_volt,
+       if (safe_arm_volt) {
+               ret = regulator_set_voltage(arm_regulator, safe_arm_volt,
                                      safe_arm_volt);
+               if (ret) {
+                       pr_err("%s: failed to set cpu voltage to %d\n",
+                               __func__, safe_arm_volt);
+                       goto out;
+               }
+       }

        exynos_info->set_freq(old_index, index);

@@ -126,8 +137,43 @@ static int exynos_target(struct cpufreq_policy *policy,
                /* down the voltage after frequency change */
                regulator_set_voltage(arm_regulator, arm_volt,
                                arm_volt);
+               if (ret) {
+                       pr_err("%s: failed to set cpu voltage to %d\n",
+                               __func__, arm_volt);
+                       goto out;
+               }
+       }
+
+out:
+
+       cpufreq_cpu_put(policy);
+
+       return ret;
+}
+
+static int exynos_target(struct cpufreq_policy *policy,
+                         unsigned int target_freq,
+                         unsigned int relation)
+{
+       struct cpufreq_frequency_table *freq_table =
exynos_info->freq_table;
 
76,1          47%
+{
+       struct cpufreq_frequency_table *freq_table =
exynos_info->freq_table;
+       unsigned int index;
+       int ret;
+
+       mutex_lock(&cpufreq_lock);
+
+       if (frequency_locked)
+               goto out;
+
+       if (cpufreq_frequency_table_target(policy, freq_table,
+                                          target_freq, relation, &index)) {
+               ret = -EINVAL;
+               goto out;
        }

+       freqs.new = freq_table[index].frequency;
+
+       ret = exynos_cpufreq_scale(freqs.new);
+
 out:
        mutex_unlock(&cpufreq_lock);

@@ -164,51 +210,26 @@ static int exynos_cpufreq_resume(struct cpufreq_policy
*policy)
 static int exynos_cpufreq_pm_notifier(struct notifier_block *notifier,
                                       unsigned long pm_event, void *v)
 {
-       struct cpufreq_policy *policy = cpufreq_cpu_get(0); /* boot CPU */
-       static unsigned int saved_frequency;
-       unsigned int temp;
+       int ret;

-       mutex_lock(&cpufreq_lock);
        switch (pm_event) {
        case PM_SUSPEND_PREPARE:
-               if (frequency_locked)
-                       goto out;
-
+               mutex_lock(&cpufreq_lock);
                frequency_locked = true;
+               mutex_unlock(&cpufreq_lock);

-               if (locking_frequency) {
-                       saved_frequency = exynos_getspeed(0);
+               ret = exynos_cpufreq_scale(locking_frequency);
+               if (ret < 0)
+                       return NOTIFY_BAD;

-                       mutex_unlock(&cpufreq_lock);
-                       exynos_target(policy, locking_frequency,
-                                     CPUFREQ_RELATION_H);
-                       mutex_lock(&cpufreq_lock);
-               }
                break;

        case PM_POST_SUSPEND:
-               if (saved_frequency) {
-                       /*
-                        * While frequency_locked, only locking_frequency
-                        * is valid for target(). In order to use
-                        * saved_frequency while keeping frequency_locked,
-                        * we temporarly overwrite locking_frequency.
-                        */
-                       temp = locking_frequency;
-                       locking_frequency = saved_frequency;
-
-                       mutex_unlock(&cpufreq_lock);
-                       exynos_target(policy, locking_frequency,
-                                     CPUFREQ_RELATION_H);
-                       mutex_lock(&cpufreq_lock);
-
-                       locking_frequency = temp;
-               }
+               mutex_lock(&cpufreq_lock);
                frequency_locked = false;
+               mutex_unlock(&cpufreq_lock);
                break;
 
151,1         94%

@@ -164,51 +210,26 @@ static int exynos_cpufreq_resume(struct cpufreq_policy
*policy)
 static int exynos_cpufreq_pm_notifier(struct notifier_block *notifier,
                                       unsigned long pm_event, void *v)
 {
-       struct cpufreq_policy *policy = cpufreq_cpu_get(0); /* boot CPU */
-       static unsigned int saved_frequency;
-       unsigned int temp;
+       int ret;

-       mutex_lock(&cpufreq_lock);
        switch (pm_event) {
        case PM_SUSPEND_PREPARE:
-               if (frequency_locked)
-                       goto out;
-
+               mutex_lock(&cpufreq_lock);
                frequency_locked = true;
+               mutex_unlock(&cpufreq_lock);

-               if (locking_frequency) {
-                       saved_frequency = exynos_getspeed(0);
+               ret = exynos_cpufreq_scale(locking_frequency);
+               if (ret < 0)
+                       return NOTIFY_BAD;

-                       mutex_unlock(&cpufreq_lock);
-                       exynos_target(policy, locking_frequency,
-                                     CPUFREQ_RELATION_H);
-                       mutex_lock(&cpufreq_lock);
-               }
                break;

        case PM_POST_SUSPEND:
-               if (saved_frequency) {
-                       /*
-                        * While frequency_locked, only locking_frequency
-                        * is valid for target(). In order to use
-                        * saved_frequency while keeping frequency_locked,
-                        * we temporarly overwrite locking_frequency.
-                        */
-                       temp = locking_frequency;
-                       locking_frequency = saved_frequency;
-
-                       mutex_unlock(&cpufreq_lock);
-                       exynos_target(policy, locking_frequency,
-                                     CPUFREQ_RELATION_H);
-                       mutex_lock(&cpufreq_lock);
-
-                       locking_frequency = temp;
-               }
+               mutex_lock(&cpufreq_lock);
                frequency_locked = false;
+               mutex_unlock(&cpufreq_lock);
                break;
        }
-out:
-       mutex_unlock(&cpufreq_lock);

        return NOTIFY_OK;
 }
--
1.7.4.1
