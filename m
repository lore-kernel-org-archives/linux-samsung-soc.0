From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 1/4] ARM: EXYNOS: Add 5800 SoC support
Date: Mon, 21 Apr 2014 12:15:09 +0530
Message-ID: <1398062712-28602-2-git-send-email-arun.kk@samsung.com>
References: <1398062712-28602-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:42967 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751091AbaDUGpV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 02:45:21 -0400
In-Reply-To: <1398062712-28602-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, alim.akhtar@samsung.com, tomasz.figa@gmail.com, olofj@google.com, arunkk.samsung@gmail.com

Exynos5800 is an octa core SoC which is based on the 5420
platform. This patch adds the basic SoC support.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/mach-exynos/Kconfig             |    8 ++++++++
 arch/arm/mach-exynos/exynos.c            |    1 +
 arch/arm/mach-exynos/platsmp.c           |    2 +-
 arch/arm/plat-samsung/include/plat/cpu.h |   11 ++++++++++-
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index fc8bf18..84f2b8e 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -108,6 +108,14 @@ config SOC_EXYNOS5440
 	help
 	  Enable EXYNOS5440 SoC support
 
+config SOC_EXYNOS5800
+	bool "SAMSUNG EXYNOS5800"
+	default y
+	depends on ARCH_EXYNOS5
+	select PM_GENERIC_DOMAINS if PM_RUNTIME
+	help
+	  Enable EXYNOS5800 SoC support
+
 endmenu
 
 endif
diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index b32a907..2bda44d 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -378,6 +378,7 @@ static char const *exynos_dt_compat[] __initconst = {
 	"samsung,exynos5250",
 	"samsung,exynos5420",
 	"samsung,exynos5440",
+	"samsung,exynos5800",
 	NULL
 };
 
diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index 03e5e9f..d14be39 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -47,7 +47,7 @@ static inline void __iomem *cpu_boot_reg(int cpu)
 	boot_reg = cpu_boot_reg_base();
 	if (soc_is_exynos4412())
 		boot_reg += 4*cpu;
-	else if (soc_is_exynos5420())
+	else if (soc_is_exynos5420() || soc_is_exynos5800())
 		boot_reg += 4;
 	return boot_reg;
 }
diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
index 5992b8d..b1fe0b7 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -51,6 +51,7 @@ extern unsigned long samsung_cpu_id;
 #define EXYNOS5250_SOC_ID	0x43520000
 #define EXYNOS5420_SOC_ID	0xE5420000
 #define EXYNOS5440_SOC_ID	0xE5440000
+#define EXYNOS5800_SOC_ID	0xE5422000
 #define EXYNOS5_SOC_MASK	0xFFFFF000
 
 #define IS_SAMSUNG_CPU(name, id, mask)		\
@@ -74,6 +75,7 @@ IS_SAMSUNG_CPU(exynos4412, EXYNOS4412_CPU_ID, EXYNOS4_CPU_MASK)
 IS_SAMSUNG_CPU(exynos5250, EXYNOS5250_SOC_ID, EXYNOS5_SOC_MASK)
 IS_SAMSUNG_CPU(exynos5420, EXYNOS5420_SOC_ID, EXYNOS5_SOC_MASK)
 IS_SAMSUNG_CPU(exynos5440, EXYNOS5440_SOC_ID, EXYNOS5_SOC_MASK)
+IS_SAMSUNG_CPU(exynos5800, EXYNOS5800_SOC_ID, EXYNOS5_SOC_MASK)
 
 #if defined(CONFIG_CPU_S3C2410) || defined(CONFIG_CPU_S3C2412) || \
     defined(CONFIG_CPU_S3C2416) || defined(CONFIG_CPU_S3C2440) || \
@@ -160,6 +162,12 @@ IS_SAMSUNG_CPU(exynos5440, EXYNOS5440_SOC_ID, EXYNOS5_SOC_MASK)
 # define soc_is_exynos5420()	0
 #endif
 
+#if defined(CONFIG_SOC_EXYNOS5800)
+# define soc_is_exynos5800()	is_samsung_exynos5800()
+#else
+# define soc_is_exynos5800()	0
+#endif
+
 #if defined(CONFIG_SOC_EXYNOS5440)
 # define soc_is_exynos5440()	is_samsung_exynos5440()
 #else
@@ -168,7 +176,8 @@ IS_SAMSUNG_CPU(exynos5440, EXYNOS5440_SOC_ID, EXYNOS5_SOC_MASK)
 
 #define soc_is_exynos4() (soc_is_exynos4210() || soc_is_exynos4212() || \
 			  soc_is_exynos4412())
-#define soc_is_exynos5() (soc_is_exynos5250() || soc_is_exynos5420())
+#define soc_is_exynos5() (soc_is_exynos5250() || soc_is_exynos5420() || \
+			  soc_is_exynos5800())
 
 #define IODESC_ENT(x) { (unsigned long)S3C24XX_VA_##x, __phys_to_pfn(S3C24XX_PA_##x), S3C24XX_SZ_##x, MT_DEVICE }
 
-- 
1.7.9.5
