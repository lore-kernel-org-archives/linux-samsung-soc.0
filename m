From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: EXYNOS: remove CONFIG_MACH_EXYNOS[4,5]_DT config options
Date: Fri, 13 Sep 2013 11:28:31 +0200
Message-ID: <3809234.0NkWBIjRC9@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40805 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754701Ab3IMJ2q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Sep 2013 05:28:46 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MT2009RN4ZIX3L0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Sep 2013 18:28:44 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com

EXYNOS is now Device Tree (DT) only platform so it makes no sense to have
config options responsible for enabling platform specific DT support.

Moreover the kernel image won't even link if neither CONFIG_MACH_EXYNOS4_DT
nor CONFIG_MACH_EXYNOS5_DT config option is enabled (linker fails with "no
machine record defined" error).

Remove CONFIG_MACH_EXYNOS[4,5]_DT config options and just use the standard
CONFIG_ARCH_EXYNOS[4,5] ones instead.

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/configs/exynos_defconfig |  1 -
 arch/arm/mach-exynos/Kconfig      | 38 +++++++++-----------------------------
 arch/arm/mach-exynos/Makefile     |  4 ++--
 3 files changed, 11 insertions(+), 32 deletions(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index ad7dfbb..5181d0d 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -11,7 +11,6 @@ CONFIG_ARCH_EXYNOS=y
 CONFIG_S3C_LOWLEVEL_UART_PORT=3
 CONFIG_S3C24XX_PWM=y
 CONFIG_ARCH_EXYNOS5=y
-CONFIG_MACH_EXYNOS4_DT=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
 CONFIG_PREEMPT=y
diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index cb36807..b810f2f 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -14,19 +14,28 @@ menu "SAMSUNG EXYNOS SoCs Support"
 config ARCH_EXYNOS4
 	bool "SAMSUNG EXYNOS4"
 	default y
+	select ARM_AMBA
+	select CLKSRC_OF
+	select CLKSRC_SAMSUNG_PWM if CPU_EXYNOS4210
+	select CPU_EXYNOS4210
 	select GIC_NON_BANKED
+	select KEYBOARD_SAMSUNG if INPUT_KEYBOARD
 	select HAVE_ARM_SCU if SMP
 	select HAVE_SMP
 	select MIGHT_HAVE_CACHE_L2X0
 	select PINCTRL
+	select S5P_DEV_MFC
 	help
 	  Samsung EXYNOS4 SoCs based systems
 
 config ARCH_EXYNOS5
 	bool "SAMSUNG EXYNOS5"
+	select ARM_AMBA
+	select CLKSRC_OF
 	select HAVE_ARM_SCU if SMP
 	select HAVE_SMP
 	select PINCTRL
+	select USB_ARCH_HAS_XHCI
 	help
 	  Samsung EXYNOS5 (Cortex-A15) SoC based systems
 
@@ -110,35 +119,6 @@ config SOC_EXYNOS5440
 	help
 	  Enable EXYNOS5440 SoC support
 
-comment "Flattened Device Tree based board for EXYNOS SoCs"
-
-config MACH_EXYNOS4_DT
-	bool "Samsung Exynos4 Machine using device tree"
-	default y
-	depends on ARCH_EXYNOS4
-	select ARM_AMBA
-	select CLKSRC_OF
-	select CLKSRC_SAMSUNG_PWM if CPU_EXYNOS4210
-	select CPU_EXYNOS4210
-	select KEYBOARD_SAMSUNG if INPUT_KEYBOARD
-	select S5P_DEV_MFC
-	help
-	  Machine support for Samsung Exynos4 machine with device tree enabled.
-	  Select this if a fdt blob is available for the Exynos4 SoC based board.
-	  Note: This is under development and not all peripherals can be supported
-	  with this machine file.
-
-config MACH_EXYNOS5_DT
-	bool "SAMSUNG EXYNOS5 Machine using device tree"
-	default y
-	depends on ARCH_EXYNOS5
-	select ARM_AMBA
-	select CLKSRC_OF
-	select USB_ARCH_HAS_XHCI
-	help
-	  Machine support for Samsung EXYNOS5 machine with device tree enabled.
-	  Select this if a fdt blob is available for the EXYNOS5 SoC based board.
-
 endmenu
 
 endif
diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
index 5369615..8930b66 100644
--- a/arch/arm/mach-exynos/Makefile
+++ b/arch/arm/mach-exynos/Makefile
@@ -32,5 +32,5 @@ AFLAGS_exynos-smc.o		:=-Wa,-march=armv7-a$(plus_sec)
 
 # machine support
 
-obj-$(CONFIG_MACH_EXYNOS4_DT)		+= mach-exynos4-dt.o
-obj-$(CONFIG_MACH_EXYNOS5_DT)		+= mach-exynos5-dt.o
+obj-$(CONFIG_ARCH_EXYNOS4)	+= mach-exynos4-dt.o
+obj-$(CONFIG_ARCH_EXYNOS5)	+= mach-exynos5-dt.o
-- 
1.8.2.3
