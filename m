From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 09/12] ARM: EXYNOS: Kconfig: Fix abuse of CONFIG_PM
Date: Thu, 06 Feb 2014 20:12:54 +0100
Message-ID: <1391713977-22300-10-git-send-email-t.figa@samsung.com>
References: <1391713977-22300-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:13291 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756838AbaBFTNL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 14:13:11 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N0L008669DXT1B0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Feb 2014 19:13:09 +0000 (GMT)
In-reply-to: <1391713977-22300-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <t.figa@samsung.com>

CONFIG_PM means that at least one of CONFIG_PM_SLEEP and
CONFIG_PM_RUNTIME is enabled, while multiple entries in
mach-exynos/Kconfig abused it to enable sleep- and runtime-specific
functionality.

This patch fixes this abuse by replacing dependencies on CONFIG_PM with
appropriate dependencies on either CONFIG_PM_SLEEP or CONFIG_PM_RUNTIME,
whichever is appropriate.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 4c414af..0964d97 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -24,7 +24,7 @@ config ARCH_EXYNOS4
 	select HAVE_SMP
 	select MIGHT_HAVE_CACHE_L2X0
 	select PINCTRL
-	select PM_GENERIC_DOMAINS if PM
+	select PM_GENERIC_DOMAINS if PM_RUNTIME
 	select S5P_DEV_MFC
 	help
 	  Samsung EXYNOS4 SoCs based systems
@@ -47,10 +47,10 @@ config CPU_EXYNOS4210
 	default y
 	depends on ARCH_EXYNOS4
 	select ARCH_HAS_BANDGAP
-	select ARM_CPU_SUSPEND if PM
+	select ARM_CPU_SUSPEND if PM_SLEEP
 	select PINCTRL_EXYNOS
-	select S5P_PM if PM
-	select S5P_SLEEP if PM
+	select S5P_PM if PM_SLEEP
+	select S5P_SLEEP if PM_SLEEP
 	select SAMSUNG_DMADEV
 	help
 	  Enable EXYNOS4210 CPU support
@@ -61,8 +61,8 @@ config SOC_EXYNOS4212
 	depends on ARCH_EXYNOS4
 	select ARCH_HAS_BANDGAP
 	select PINCTRL_EXYNOS
-	select S5P_PM if PM
-	select S5P_SLEEP if PM
+	select S5P_PM if PM_SLEEP
+	select S5P_SLEEP if PM_SLEEP
 	select SAMSUNG_DMADEV
 	help
 	  Enable EXYNOS4212 SoC support
@@ -83,9 +83,9 @@ config SOC_EXYNOS5250
 	depends on ARCH_EXYNOS5
 	select ARCH_HAS_BANDGAP
 	select PINCTRL_EXYNOS
-	select PM_GENERIC_DOMAINS if PM
-	select S5P_PM if PM
-	select S5P_SLEEP if PM
+	select PM_GENERIC_DOMAINS if PM_RUNTIME
+	select S5P_PM if PM_SLEEP
+	select S5P_SLEEP if PM_SLEEP
 	select S5P_DEV_MFC
 	select SAMSUNG_DMADEV
 	help
@@ -95,9 +95,9 @@ config SOC_EXYNOS5420
 	bool "SAMSUNG EXYNOS5420"
 	default y
 	depends on ARCH_EXYNOS5
-	select PM_GENERIC_DOMAINS if PM
-	select S5P_PM if PM
-	select S5P_SLEEP if PM
+	select PM_GENERIC_DOMAINS if PM_RUNTIME
+	select S5P_PM if PM_SLEEP
+	select S5P_SLEEP if PM_SLEEP
 	help
 	  Enable EXYNOS5420 SoC support
 
-- 
1.8.5.2
