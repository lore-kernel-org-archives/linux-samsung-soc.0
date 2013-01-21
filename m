From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v4 7/7] ARM: Exynos: move mct driver to drivers/clocksource
Date: Mon, 21 Jan 2013 02:02:22 -0800
Message-ID: <1358762542-19008-8-git-send-email-thomas.abraham@linaro.org>
References: <1358762542-19008-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:55685 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752230Ab3AUKDJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jan 2013 05:03:09 -0500
Received: by mail-pa0-f45.google.com with SMTP id bg2so3300276pad.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jan 2013 02:03:09 -0800 (PST)
In-Reply-To: <1358762542-19008-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, t.figa@samsung.com, chaos.youn@samsung.com, sylvester.nawrocki@gmail.com, olof@lixom.net, swarren@nvidia.com

Move the multi core timer (mct) driver from mach-exynos to
drivers/clocksource and update the Kconfig and makefiles.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/Kconfig                                   |    2 +-
 arch/arm/mach-exynos/Kconfig                       |    6 ------
 arch/arm/mach-exynos/Makefile                      |    2 --
 drivers/clocksource/Kconfig                        |    5 +++++
 drivers/clocksource/Makefile                       |    1 +
 .../mct.c => drivers/clocksource/exynos_mct.c      |    0
 6 files changed, 7 insertions(+), 9 deletions(-)
 rename arch/arm/mach-exynos/mct.c => drivers/clocksource/exynos_mct.c (100%)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 67874b8..10676e9 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1624,7 +1624,7 @@ config LOCAL_TIMERS
 	bool "Use local timer interrupts"
 	depends on SMP
 	default y
-	select HAVE_ARM_TWD if (!ARCH_MSM_SCORPIONMP && !EXYNOS4_MCT)
+	select HAVE_ARM_TWD if (!ARCH_MSM_SCORPIONMP && !CLKSRC_EXYNOS_MCT)
 	help
 	  Enable support for local timers on SMP platforms, rather then the
 	  legacy IPI broadcast method.  Local timers allows the system
diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 8bdeaa5..ef06ef5 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -79,12 +79,6 @@ config SOC_EXYNOS5440
 	help
 	  Enable EXYNOS5440 SoC support
 
-config EXYNOS4_MCT
-	bool
-	default y
-	help
-	  Use MCT (Multi Core Timer) as kernel timers
-
 config EXYNOS_DEV_DMA
 	bool
 	help
diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
index 7e53a3a..5141963 100644
--- a/arch/arm/mach-exynos/Makefile
+++ b/arch/arm/mach-exynos/Makefile
@@ -26,8 +26,6 @@ obj-$(CONFIG_ARCH_EXYNOS)	+= pmu.o
 
 obj-$(CONFIG_SMP)		+= platsmp.o headsmp.o
 
-obj-$(CONFIG_EXYNOS4_MCT)	+= mct.o
-
 obj-$(CONFIG_HOTPLUG_CPU)	+= hotplug.o
 
 obj-$(CONFIG_ARCH_EXYNOS)	+= exynos-smc.o
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index a32b7a9..84bf4de 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -61,3 +61,8 @@ config CLKSRC_ARM_GENERIC
 	def_bool y if ARM64
 	help
 	  This option enables support for the ARM generic timer.
+
+config CLKSRC_EXYNOS_MCT
+	def_bool y if ARCH_EXYNOS
+	help
+	  Support for Multi Core Timer controller on Exynos SoCs.
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index a33f792..248a856 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -17,5 +17,6 @@ obj-$(CONFIG_CLKSRC_DBX500_PRCMU)	+= clksrc-dbx500-prcmu.o
 obj-$(CONFIG_ARMADA_370_XP_TIMER)	+= time-armada-370-xp.o
 obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835_timer.o
 obj-$(CONFIG_SUNXI_TIMER)	+= sunxi_timer.o
+obj-$(CONFIG_CLKSRC_EXYNOS_MCT)	+= exynos_mct.o
 
 obj-$(CONFIG_CLKSRC_ARM_GENERIC)	+= arm_generic.o
diff --git a/arch/arm/mach-exynos/mct.c b/drivers/clocksource/exynos_mct.c
similarity index 100%
rename from arch/arm/mach-exynos/mct.c
rename to drivers/clocksource/exynos_mct.c
-- 
1.7.5.4
