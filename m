From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: EXYNOS: Consolidate Kconfig entries
Date: Thu,  6 Feb 2014 17:29:56 +0530
Message-ID: <1391687996-26011-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:43711 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756213AbaBFMFE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 07:05:04 -0500
Received: by mail-pa0-f42.google.com with SMTP id kl14so1603637pab.15
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Feb 2014 04:05:04 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, olof@lixom.net, sachin.kamat@linaro.org

Instead of repeating the Kconfig entries for every SoC, move them under
ARCH_EXYNOS4 and 5 and move the entries common to both 4 and 5 under
ARCH_EXYNOS. Also, since the individual SoCs do not have any specific
machine/platform code, keep them as boolean symbols instead of user
selectable and select them from Exynos4 and 5 config symbols. Individual
SoC symbols can be removed eventually once the driver Kconfig dependencies
on these symbols are removed.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/Kconfig             |   12 ++++++
 arch/arm/mach-exynos/Kconfig |   97 ++++++++++--------------------------------
 2 files changed, 35 insertions(+), 74 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e25419817791..56a9990ef58e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -829,18 +829,30 @@ config ARCH_S5PV210
 
 config ARCH_EXYNOS
 	bool "Samsung EXYNOS"
+	select ARCH_HAS_BANDGAP
 	select ARCH_HAS_CPUFREQ
 	select ARCH_HAS_HOLES_MEMORYMODEL
 	select ARCH_REQUIRE_GPIOLIB
 	select ARCH_SPARSEMEM_ENABLE
+	select ARM_AMBA
 	select ARM_GIC
+	select CLKSRC_OF
 	select COMMON_CLK
 	select CPU_V7
 	select GENERIC_CLOCKEVENTS
+	select HAVE_ARM_SCU if SMP
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	select HAVE_S3C_RTC if RTC_CLASS
+	select HAVE_SMP
 	select NEED_MACH_MEMORY_H
+	select PINCTRL
+	select PINCTRL_EXYNOS
+	select PM_GENERIC_DOMAINS if PM
+	select S5P_DEV_MFC
+	select S5P_PM if PM
+	select S5P_SLEEP if PM
+	select SAMSUNG_DMADEV
 	select SPARSE_IRQ
 	select USE_OF
 	help
diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 4c414af75ef0..54162ef1656e 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -14,99 +14,33 @@ menu "SAMSUNG EXYNOS SoCs Support"
 config ARCH_EXYNOS4
 	bool "SAMSUNG EXYNOS4"
 	default y
-	select ARM_AMBA
-	select CLKSRC_OF
+	select ARM_CPU_SUSPEND if PM
 	select CLKSRC_SAMSUNG_PWM if CPU_EXYNOS4210
 	select CPU_EXYNOS4210
 	select GIC_NON_BANKED
 	select KEYBOARD_SAMSUNG if INPUT_KEYBOARD
-	select HAVE_ARM_SCU if SMP
-	select HAVE_SMP
 	select MIGHT_HAVE_CACHE_L2X0
-	select PINCTRL
-	select PM_GENERIC_DOMAINS if PM
-	select S5P_DEV_MFC
+	select SOC_EXYNOS4212
+	select SOC_EXYNOS4412
 	help
-	  Samsung EXYNOS4 SoCs based systems
+	  Samsung EXYNOS4 (Cortex-A9) SoC based systems
 
 config ARCH_EXYNOS5
 	bool "SAMSUNG EXYNOS5"
-	select ARM_AMBA
-	select CLKSRC_OF
-	select HAVE_ARM_SCU if SMP
-	select HAVE_SMP
-	select PINCTRL
+	default y
+	select SOC_EXYNOS5250
+	select SOC_EXYNOS5420
 	select USB_ARCH_HAS_XHCI
 	help
-	  Samsung EXYNOS5 (Cortex-A15) SoC based systems
+	  Samsung EXYNOS5 (Cortex-A15/A7) SoC based systems
 
 comment "EXYNOS SoCs"
 
-config CPU_EXYNOS4210
-	bool "SAMSUNG EXYNOS4210"
-	default y
-	depends on ARCH_EXYNOS4
-	select ARCH_HAS_BANDGAP
-	select ARM_CPU_SUSPEND if PM
-	select PINCTRL_EXYNOS
-	select S5P_PM if PM
-	select S5P_SLEEP if PM
-	select SAMSUNG_DMADEV
-	help
-	  Enable EXYNOS4210 CPU support
-
-config SOC_EXYNOS4212
-	bool "SAMSUNG EXYNOS4212"
-	default y
-	depends on ARCH_EXYNOS4
-	select ARCH_HAS_BANDGAP
-	select PINCTRL_EXYNOS
-	select S5P_PM if PM
-	select S5P_SLEEP if PM
-	select SAMSUNG_DMADEV
-	help
-	  Enable EXYNOS4212 SoC support
-
-config SOC_EXYNOS4412
-	bool "SAMSUNG EXYNOS4412"
-	default y
-	depends on ARCH_EXYNOS4
-	select ARCH_HAS_BANDGAP
-	select PINCTRL_EXYNOS
-	select SAMSUNG_DMADEV
-	help
-	  Enable EXYNOS4412 SoC support
-
-config SOC_EXYNOS5250
-	bool "SAMSUNG EXYNOS5250"
-	default y
-	depends on ARCH_EXYNOS5
-	select ARCH_HAS_BANDGAP
-	select PINCTRL_EXYNOS
-	select PM_GENERIC_DOMAINS if PM
-	select S5P_PM if PM
-	select S5P_SLEEP if PM
-	select S5P_DEV_MFC
-	select SAMSUNG_DMADEV
-	help
-	  Enable EXYNOS5250 SoC support
-
-config SOC_EXYNOS5420
-	bool "SAMSUNG EXYNOS5420"
-	default y
-	depends on ARCH_EXYNOS5
-	select PM_GENERIC_DOMAINS if PM
-	select S5P_PM if PM
-	select S5P_SLEEP if PM
-	help
-	  Enable EXYNOS5420 SoC support
-
 config SOC_EXYNOS5440
 	bool "SAMSUNG EXYNOS5440"
 	default y
 	depends on ARCH_EXYNOS5
 	select ARCH_DMA_ADDR_T_64BIT if ARM_LPAE
-	select ARCH_HAS_BANDGAP
 	select ARCH_HAS_OPP
 	select HAVE_ARM_ARCH_TIMER
 	select AUTO_ZRELADDR
@@ -119,4 +53,19 @@ config SOC_EXYNOS5440
 
 endmenu
 
+config CPU_EXYNOS4210
+	bool
+
+config SOC_EXYNOS4212
+	bool
+
+config SOC_EXYNOS4412
+	bool
+
+config SOC_EXYNOS5250
+	bool
+
+config SOC_EXYNOS5420
+	bool
+
 endif
-- 
1.7.9.5
