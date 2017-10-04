From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/7] ARM: EXYNOS: Remove Exynos4212 related dead code
Date: Wed, 04 Oct 2017 08:38:22 +0200
Message-ID: <20171004063828.22068-2-m.szyprowski@samsung.com>
References: <20171004063828.22068-1-m.szyprowski@samsung.com>
        <CGME20171004063835eucas1p2d9c25263cbae0b9d57f1af2dfcfcdcd6@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54533 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751203AbdJDGii (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 02:38:38 -0400
In-reply-to: <20171004063828.22068-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Support for Exynos4212 SoCs has been removed by commit bca9085e0ae9 ("ARM:
dts: exynos: remove Exynos4212 support (dead code)"), so there is no need
to keep remaining dead code related to this SoC version.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-exynos/Kconfig    |  5 -----
 arch/arm/mach-exynos/common.h   | 11 +----------
 arch/arm/mach-exynos/exynos.c   |  2 --
 arch/arm/mach-exynos/firmware.c |  5 -----
 arch/arm/mach-exynos/pm.c       |  3 +--
 arch/arm/mach-exynos/suspend.c  |  4 ----
 6 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 0a99140b6ba2..44fa753bd79c 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -85,11 +85,6 @@ config CPU_EXYNOS4210
 	default y
 	depends on ARCH_EXYNOS4
 
-config SOC_EXYNOS4212
-	bool "SAMSUNG EXYNOS4212"
-	default y
-	depends on ARCH_EXYNOS4
-
 config SOC_EXYNOS4412
 	bool "SAMSUNG EXYNOS4412"
 	default y
diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index 9424a8a9f308..3f715524c9d6 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -18,7 +18,6 @@
 #define EXYNOS3_SOC_MASK	0xFFFFF000
 
 #define EXYNOS4210_CPU_ID	0x43210000
-#define EXYNOS4212_CPU_ID	0x43220000
 #define EXYNOS4412_CPU_ID	0xE4412200
 #define EXYNOS4_CPU_MASK	0xFFFE0000
 
@@ -39,7 +38,6 @@ static inline int is_samsung_##name(void)	\
 
 IS_SAMSUNG_CPU(exynos3250, EXYNOS3250_SOC_ID, EXYNOS3_SOC_MASK)
 IS_SAMSUNG_CPU(exynos4210, EXYNOS4210_CPU_ID, EXYNOS4_CPU_MASK)
-IS_SAMSUNG_CPU(exynos4212, EXYNOS4212_CPU_ID, EXYNOS4_CPU_MASK)
 IS_SAMSUNG_CPU(exynos4412, EXYNOS4412_CPU_ID, EXYNOS4_CPU_MASK)
 IS_SAMSUNG_CPU(exynos5250, EXYNOS5250_SOC_ID, EXYNOS5_SOC_MASK)
 IS_SAMSUNG_CPU(exynos5410, EXYNOS5410_SOC_ID, EXYNOS5_SOC_MASK)
@@ -59,12 +57,6 @@ IS_SAMSUNG_CPU(exynos5800, EXYNOS5800_SOC_ID, EXYNOS5_SOC_MASK)
 # define soc_is_exynos4210()	0
 #endif
 
-#if defined(CONFIG_SOC_EXYNOS4212)
-# define soc_is_exynos4212()	is_samsung_exynos4212()
-#else
-# define soc_is_exynos4212()	0
-#endif
-
 #if defined(CONFIG_SOC_EXYNOS4412)
 # define soc_is_exynos4412()	is_samsung_exynos4412()
 #else
@@ -105,8 +97,7 @@ IS_SAMSUNG_CPU(exynos5800, EXYNOS5800_SOC_ID, EXYNOS5_SOC_MASK)
 # define soc_is_exynos5800()	0
 #endif
 
-#define soc_is_exynos4() (soc_is_exynos4210() || soc_is_exynos4212() || \
-			  soc_is_exynos4412())
+#define soc_is_exynos4() (soc_is_exynos4210() || soc_is_exynos4412())
 #define soc_is_exynos5() (soc_is_exynos5250() || soc_is_exynos5410() || \
 			  soc_is_exynos5420() || soc_is_exynos5800())
 
diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index c404c15ad07f..9a9caac1125a 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -195,7 +195,6 @@ static void __init exynos_dt_machine_init(void)
 		exynos_cpuidle.dev.platform_data = &cpuidle_coupled_exynos_data;
 #endif
 	if (of_machine_is_compatible("samsung,exynos4210") ||
-	    of_machine_is_compatible("samsung,exynos4212") ||
 	    (of_machine_is_compatible("samsung,exynos4412") &&
 	     of_machine_is_compatible("samsung,trats2")) ||
 	    of_machine_is_compatible("samsung,exynos3250") ||
@@ -208,7 +207,6 @@ static char const *const exynos_dt_compat[] __initconst = {
 	"samsung,exynos3250",
 	"samsung,exynos4",
 	"samsung,exynos4210",
-	"samsung,exynos4212",
 	"samsung,exynos4412",
 	"samsung,exynos5",
 	"samsung,exynos5250",
diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index e81a78b125d9..2a51e4603a6f 100644
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@ -70,12 +70,7 @@ static int exynos_cpu_boot(int cpu)
 
 	/*
 	 * The second parameter of SMC_CMD_CPU1BOOT command means CPU id.
-	 * But, Exynos4212 has only one secondary CPU so second parameter
-	 * isn't used for informing secure firmware about CPU id.
 	 */
-	if (soc_is_exynos4212())
-		cpu = 0;
-
 	exynos_smc(SMC_CMD_CPU1BOOT, cpu, 0, 0);
 	return 0;
 }
diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index 1a7e5b5d08d8..c9740d96db9e 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -167,8 +167,7 @@ void exynos_enter_aftr(void)
 
 	exynos_pm_central_suspend();
 
-	if (of_machine_is_compatible("samsung,exynos4212") ||
-	    of_machine_is_compatible("samsung,exynos4412")) {
+	if (of_machine_is_compatible("samsung,exynos4412")) {
 		/* Setting SEQ_OPTION register */
 		pmu_raw_writel(S5P_USE_STANDBY_WFI0 | S5P_USE_STANDBY_WFE0,
 			       S5P_CENTRAL_SEQ_OPTION);
diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index b529ba04ed16..370d37ded7e7 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -225,7 +225,6 @@ static int __init exynos_pmu_irq_init(struct device_node *node,
 
 EXYNOS_PMU_IRQ(exynos3250_pmu_irq, "samsung,exynos3250-pmu");
 EXYNOS_PMU_IRQ(exynos4210_pmu_irq, "samsung,exynos4210-pmu");
-EXYNOS_PMU_IRQ(exynos4212_pmu_irq, "samsung,exynos4212-pmu");
 EXYNOS_PMU_IRQ(exynos4412_pmu_irq, "samsung,exynos4412-pmu");
 EXYNOS_PMU_IRQ(exynos5250_pmu_irq, "samsung,exynos5250-pmu");
 EXYNOS_PMU_IRQ(exynos5420_pmu_irq, "samsung,exynos5420-pmu");
@@ -616,9 +615,6 @@ static const struct of_device_id exynos_pmu_of_device_ids[] __initconst = {
 	}, {
 		.compatible = "samsung,exynos4210-pmu",
 		.data = &exynos4_pm_data,
-	}, {
-		.compatible = "samsung,exynos4212-pmu",
-		.data = &exynos4_pm_data,
 	}, {
 		.compatible = "samsung,exynos4412-pmu",
 		.data = &exynos4_pm_data,
-- 
2.14.2
