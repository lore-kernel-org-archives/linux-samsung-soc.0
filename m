From: Jonghwan Choi <jhbird.choi@samsung.com>
Subject: [PATCH 1/5 RESEND] cpufreq: exynos: Remove unused variable & IS_ERR
Date: Mon, 10 Dec 2012 16:22:44 +0900
Message-ID: <002701cdd6a7$25fd9270$71f8b750$%choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14282 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752054Ab2LJHWq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Dec 2012 02:22:46 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MET002BA0G0ZD80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 16:22:45 +0900 (KST)
Received: from DOJHBIRDCHO03 ([12.23.118.55])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MET00EPF0HW5790@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 16:22:44 +0900 (KST)
References: 
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jonghwan Choi' <jhbird.choi@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Jaecheol Lee' <jc.lee@samsung.com>, "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Russell King' <linux@arm.linux.org.uk>

The variable 'max_support_idx, min_support_idx, pm_lock_idx"
are never used, so remove the unused variable.

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 arch/arm/mach-exynos/include/mach/cpufreq.h |    3 ---
 drivers/cpufreq/exynos-cpufreq.c            |    3 +--
 drivers/cpufreq/exynos4210-cpufreq.c        |   15 +++------------
 drivers/cpufreq/exynos4x12-cpufreq.c        |    8 --------
 drivers/cpufreq/exynos5250-cpufreq.c        |    8 --------
 5 files changed, 4 insertions(+), 33 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/cpufreq.h
b/arch/arm/mach-exynos/include/mach/cpufreq.h
index 7517c3f..39f0dc6 100644
--- a/arch/arm/mach-exynos/include/mach/cpufreq.h
+++ b/arch/arm/mach-exynos/include/mach/cpufreq.h
@@ -21,9 +21,6 @@ enum cpufreq_level_index {
 struct exynos_dvfs_info {
 	unsigned long	mpll_freq_khz;
 	unsigned int	pll_safe_idx;
-	unsigned int	pm_lock_idx;
-	unsigned int	max_support_idx;
-	unsigned int	min_support_idx;
 	struct clk	*cpu_clk;
 	unsigned int	*volt_table;
 	struct cpufreq_frequency_table	*freq_table;
diff --git a/drivers/cpufreq/exynos-cpufreq.c
b/drivers/cpufreq/exynos-cpufreq.c
index af2d81e..5888aee 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -296,8 +296,7 @@ static int __init exynos_cpufreq_init(void)
 err_cpufreq:
 	unregister_pm_notifier(&exynos_cpufreq_nb);
 
-	if (!IS_ERR(arm_regulator))
-		regulator_put(arm_regulator);
+	regulator_put(arm_regulator);
 err_vdd_arm:
 	kfree(exynos_info);
 	pr_debug("%s: failed initialization\n", __func__);
diff --git a/drivers/cpufreq/exynos4210-cpufreq.c
b/drivers/cpufreq/exynos4210-cpufreq.c
index fb148fa..5ae5c52 100644
--- a/drivers/cpufreq/exynos4210-cpufreq.c
+++ b/drivers/cpufreq/exynos4210-cpufreq.c
@@ -22,9 +22,6 @@
 
 #define CPUFREQ_LEVEL_END	L5
 
-static int max_support_idx = L0;
-static int min_support_idx = (CPUFREQ_LEVEL_END - 1);
-
 static struct clk *cpu_clk;
 static struct clk *moutcore;
 static struct clk *mout_mpll;
@@ -276,10 +273,7 @@ int exynos4210_cpufreq_init(struct exynos_dvfs_info
*info)
 	}
 
 	info->mpll_freq_khz = rate;
-	info->pm_lock_idx = L2;
 	info->pll_safe_idx = L2;
-	info->max_support_idx = max_support_idx;
-	info->min_support_idx = min_support_idx;
 	info->cpu_clk = cpu_clk;
 	info->volt_table = exynos4210_volt_table;
 	info->freq_table = exynos4210_freq_table;
@@ -289,14 +283,11 @@ int exynos4210_cpufreq_init(struct exynos_dvfs_info
*info)
 	return 0;
 
 err_mout_apll:
-	if (!IS_ERR(mout_mpll))
-		clk_put(mout_mpll);
+	clk_put(mout_mpll);
 err_mout_mpll:
-	if (!IS_ERR(moutcore))
-		clk_put(moutcore);
+	clk_put(moutcore);
 err_moutcore:
-	if (!IS_ERR(cpu_clk))
-		clk_put(cpu_clk);
+	clk_put(cpu_clk);
 
 	pr_debug("%s: failed initialization\n", __func__);
 	return -EINVAL;
diff --git a/drivers/cpufreq/exynos4x12-cpufreq.c
b/drivers/cpufreq/exynos4x12-cpufreq.c
index 8c5a7af..29b41ab 100644
--- a/drivers/cpufreq/exynos4x12-cpufreq.c
+++ b/drivers/cpufreq/exynos4x12-cpufreq.c
@@ -22,9 +22,6 @@
 
 #define CPUFREQ_LEVEL_END	(L13 + 1)
 
-static int max_support_idx;
-static int min_support_idx = (CPUFREQ_LEVEL_END - 1);
-
 static struct clk *cpu_clk;
 static struct clk *moutcore;
 static struct clk *mout_mpll;
@@ -420,8 +417,6 @@ static void __init set_volt_table(void)
 {
 	unsigned int i;
 
-	max_support_idx = L1;
-
 	/* Not supported */
 	exynos4x12_freq_table[L0].frequency = CPUFREQ_ENTRY_INVALID;
 
@@ -511,10 +506,7 @@ int exynos4x12_cpufreq_init(struct exynos_dvfs_info
*info)
 	}
 
 	info->mpll_freq_khz = rate;
-	info->pm_lock_idx = L5;
 	info->pll_safe_idx = L7;
-	info->max_support_idx = max_support_idx;
-	info->min_support_idx = min_support_idx;
 	info->cpu_clk = cpu_clk;
 	info->volt_table = exynos4x12_volt_table;
 	info->freq_table = exynos4x12_freq_table;
diff --git a/drivers/cpufreq/exynos5250-cpufreq.c
b/drivers/cpufreq/exynos5250-cpufreq.c
index e64c253..8a5d733 100644
--- a/drivers/cpufreq/exynos5250-cpufreq.c
+++ b/drivers/cpufreq/exynos5250-cpufreq.c
@@ -23,8 +23,6 @@
 
 #define CPUFREQ_LEVEL_END	(L15 + 1)
 
-static int max_support_idx;
-static int min_support_idx = (CPUFREQ_LEVEL_END - 1);
 static struct clk *cpu_clk;
 static struct clk *moutcore;
 static struct clk *mout_mpll;
@@ -249,8 +247,6 @@ static void __init set_volt_table(void)
 {
 	unsigned int i;
 
-	max_support_idx = L0;
-
 	for (i = 0 ; i < CPUFREQ_LEVEL_END ; i++)
 		exynos5250_volt_table[i] = asv_voltage_5250[i];
 }
@@ -313,12 +309,8 @@ int exynos5250_cpufreq_init(struct exynos_dvfs_info
*info)
 	}
 
 	info->mpll_freq_khz = rate;
-	/* 1000Mhz */
-	info->pm_lock_idx = L7;
 	/* 800Mhz */
 	info->pll_safe_idx = L9;
-	info->max_support_idx = max_support_idx;
-	info->min_support_idx = min_support_idx;
 	info->cpu_clk = cpu_clk;
 	info->volt_table = exynos5250_volt_table;
 	info->freq_table = exynos5250_freq_table;
-- 
1.7.4.4
