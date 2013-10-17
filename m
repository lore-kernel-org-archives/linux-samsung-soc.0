From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: EXYNOS: Initialize L2x0 cache controller for Exynos4 only
Date: Thu, 17 Oct 2013 17:33:12 +0530
Message-ID: <1382011392-18199-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:34762 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752427Ab3JQMED (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 08:04:03 -0400
Received: by mail-pd0-f172.google.com with SMTP id z10so2611345pdj.17
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2013 05:04:02 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tushar.behera@linaro.org

L2x0 cache controller is present only in Cortex-A9 based Exynos4 SoCs.
Thus move this function to Exynos4 early init call to avoid non-Exynos4
SoCs from calling this function in multi-platform support.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
Tested on Origen(4210), Arndale(5250) and 5420 boards.
---
 arch/arm/mach-exynos/common.c          |    3 +--
 arch/arm/mach-exynos/common.h          |    2 +-
 arch/arm/mach-exynos/mach-exynos4-dt.c |    9 ++++++++-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 1510436..f822b226 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -396,7 +396,7 @@ static int __init exynos_core_init(void)
 }
 core_initcall(exynos_core_init);
 
-static int __init exynos4_l2x0_cache_init(void)
+int __init exynos4_l2x0_cache_init(void)
 {
 	int ret;
 
@@ -408,7 +408,6 @@ static int __init exynos4_l2x0_cache_init(void)
 	clean_dcache_area(&l2x0_regs_phys, sizeof(unsigned long));
 	return 0;
 }
-early_initcall(exynos4_l2x0_cache_init);
 
 static int __init exynos_init(void)
 {
diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index 3f03334..3031321 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -24,7 +24,7 @@ void exynos5_restart(enum reboot_mode mode, const char *cmd);
 void exynos_cpuidle_init(void);
 void exynos_cpufreq_init(void);
 void exynos_init_late(void);
-
+int exynos4_l2x0_cache_init(void);
 void exynos_firmware_init(void);
 
 #ifdef CONFIG_PM_GENERIC_DOMAINS
diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index ffd19a0..2e6f51c 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -49,11 +49,18 @@ static void __init exynos4_reserve(void)
 				mfc_mem.lsize);
 #endif
 }
+
+static void __init exynos4_early_init(void)
+{
+	exynos4_l2x0_cache_init();
+	exynos_firmware_init();
+}
+
 DT_MACHINE_START(EXYNOS4210_DT, "Samsung Exynos4 (Flattened Device Tree)")
 	/* Maintainer: Thomas Abraham <thomas.abraham@linaro.org> */
 	.smp		= smp_ops(exynos_smp_ops),
 	.map_io		= exynos_init_io,
-	.init_early	= exynos_firmware_init,
+	.init_early	= exynos4_early_init,
 	.init_machine	= exynos4_dt_machine_init,
 	.init_late	= exynos_init_late,
 	.dt_compat	= exynos4_dt_compat,
-- 
1.7.9.5
