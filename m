From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: EXYNOS: Cleanup common.h file
Date: Thu, 11 Jul 2013 14:27:27 +0530
Message-ID: <1373533047-4509-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:34968 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932597Ab3GKJNK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jul 2013 05:13:10 -0400
Received: by mail-pa0-f54.google.com with SMTP id kx10so7649501pab.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jul 2013 02:13:09 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Remove unused declarations that got left behind subsequent to
making Exynos a DT-only platform.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/common.h |   41 -----------------------------------------
 1 file changed, 41 deletions(-)

diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index c4abde2..7318e62 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -17,7 +17,6 @@
 
 void mct_init(void __iomem *base, int irq_g0, int irq_l0, int irq_l1);
 void exynos_init_time(void);
-extern unsigned long xxti_f, xusbxti_f;
 
 struct map_desc;
 void exynos_init_io(void);
@@ -25,54 +24,14 @@ void exynos4_restart(enum reboot_mode mode, const char *cmd);
 void exynos5_restart(enum reboot_mode mode, const char *cmd);
 void exynos_init_late(void);
 
-/* ToDo: remove these after migrating legacy exynos4 platforms to dt */
-void exynos4_clk_init(struct device_node *np, int is_exynos4210, void __iomem *reg_base, unsigned long xom);
-void exynos4_clk_register_fixed_ext(unsigned long, unsigned long);
-
 void exynos_firmware_init(void);
 
-void exynos_set_timer_source(u8 channels);
-
 #ifdef CONFIG_PM_GENERIC_DOMAINS
 int exynos_pm_late_initcall(void);
 #else
 static inline int exynos_pm_late_initcall(void) { return 0; }
 #endif
 
-#ifdef CONFIG_ARCH_EXYNOS4
-void exynos4_register_clocks(void);
-void exynos4_setup_clocks(void);
-
-#else
-#define exynos4_register_clocks()
-#define exynos4_setup_clocks()
-#endif
-
-#ifdef CONFIG_ARCH_EXYNOS5
-void exynos5_register_clocks(void);
-void exynos5_setup_clocks(void);
-
-#else
-#define exynos5_register_clocks()
-#define exynos5_setup_clocks()
-#endif
-
-#ifdef CONFIG_CPU_EXYNOS4210
-void exynos4210_register_clocks(void);
-
-#else
-#define exynos4210_register_clocks()
-#endif
-
-#ifdef CONFIG_SOC_EXYNOS4212
-void exynos4212_register_clocks(void);
-
-#else
-#define exynos4212_register_clocks()
-#endif
-
-struct device_node;
-
 extern struct smp_operations exynos_smp_ops;
 
 extern void exynos_cpu_die(unsigned int cpu);
-- 
1.7.9.5
