From: Jonghwan Choi <jhbird.choi@gmail.com>
Subject: [PATCH] ARM: EXYNOS: Fix compile error in pm.c
Date: Fri,  6 Apr 2012 19:18:36 -0400
Message-ID: <1333754316-9194-1-git-send-email-jhbird.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:51068 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752169Ab2DFXSk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Apr 2012 19:18:40 -0400
Received: by dake40 with SMTP id e40so3183557dak.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Apr 2012 16:18:40 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Jonghwan Choi <jhbird.choi@samsung.com>

Fix compile error when ARCH_EXYNOS5 is only enabled without ARCH_EXYNOS4.

arch/arm/mach-exynos/built-in.o: In function `exynos4_pm_prepare':
linux/arch/arm/mach-exynos/pm.c:185: undefined reference to `exynos4_sys_powerdown_conf'
arch/arm/mach-exynos/built-in.o: In function `__virt_to_phys':
linux/arch/arm/include/asm/memory.h:175: undefined reference to `s3c_cpu_resume'
linux/arch/arm/include/asm/memory.h:175: undefined reference to `s3c_cpu_resume'
arch/arm/plat-samsung/built-in.o: In function `s3c_irqext_wake':
linux/arch/arm/plat-samsung/pm.c:151: undefined reference to `s3c_irqwake_eintallow'
arch/arm/plat-samsung/built-in.o: In function `s3c_pm_enter':
linux/arch/arm/plat-samsung/pm.c:274: undefined reference to `s3c_pm_save_core'
linux/arch/arm/plat-samsung/pm.c:278: undefined reference to `s3c_pm_configure_extint'
linux/arch/arm/plat-samsung/pm.c:307: undefined reference to `s3c_pm_restore_core'
linux/arch/arm/plat-samsung/pm.c:329: undefined reference to `s3c_irqwake_intallow'
linux/arch/arm/plat-samsung/pm.c:329: undefined reference to `s3c_irqwake_eintallow'

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 arch/arm/mach-exynos/Kconfig  |    2 ++
 arch/arm/mach-exynos/Makefile |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 0491cee..676d3fa 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -61,6 +61,8 @@ config SOC_EXYNOS5250
 	bool "SAMSUNG EXYNOS5250"
 	default y
 	depends on ARCH_EXYNOS5
+	select S5P_PM if PM
+	select S5P_SLEEP if PM
 	help
 	  Enable EXYNOS5250 SoC support
 
diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
index 8631840..1524efb 100644
--- a/arch/arm/mach-exynos/Makefile
+++ b/arch/arm/mach-exynos/Makefile
@@ -22,7 +22,7 @@ obj-$(CONFIG_PM)		+= pm.o
 obj-$(CONFIG_PM_GENERIC_DOMAINS) += pm_domains.o
 obj-$(CONFIG_CPU_IDLE)		+= cpuidle.o
 
-obj-$(CONFIG_ARCH_EXYNOS4)	+= pmu.o
+obj-$(CONFIG_ARCH_EXYNOS)	+= pmu.o
 
 obj-$(CONFIG_SMP)		+= platsmp.o headsmp.o
 
-- 
1.7.0.4
