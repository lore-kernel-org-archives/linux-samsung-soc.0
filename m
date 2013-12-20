From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH] ARM: EXYNOS: Consolidate selection of PM_GENERIC_DOMAINS for Exynos4
Date: Fri, 20 Dec 2013 22:24:56 +0100
Message-ID: <1387574696-26366-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:53621 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751832Ab3LTVZG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 16:25:06 -0500
Received: by mail-wi0-f172.google.com with SMTP id en1so8974673wid.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2013 13:25:05 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Instead of repeating "select PM_GENERIC_DOMAINS" for all Exynos4
variants add relevant entry in the Kconfig section common to the
SoC series.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/mach-exynos/Kconfig |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 1414bc6..35c335d 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -24,6 +24,7 @@ config ARCH_EXYNOS4
 	select HAVE_SMP
 	select MIGHT_HAVE_CACHE_L2X0
 	select PINCTRL
+	select PM_GENERIC_DOMAINS if PM
 	select S5P_DEV_MFC
 	help
 	  Samsung EXYNOS4 SoCs based systems
@@ -48,7 +49,6 @@ config CPU_EXYNOS4210
 	select ARCH_HAS_BANDGAP
 	select ARM_CPU_SUSPEND if PM
 	select PINCTRL_EXYNOS
-	select PM_GENERIC_DOMAINS if PM
 	select S5P_PM if PM
 	select S5P_SLEEP if PM
 	select SAMSUNG_DMADEV
@@ -61,7 +61,6 @@ config SOC_EXYNOS4212
 	depends on ARCH_EXYNOS4
 	select ARCH_HAS_BANDGAP
 	select PINCTRL_EXYNOS
-	select PM_GENERIC_DOMAINS if PM
 	select S5P_PM if PM
 	select S5P_SLEEP if PM
 	select SAMSUNG_DMADEV
@@ -74,7 +73,6 @@ config SOC_EXYNOS4412
 	depends on ARCH_EXYNOS4
 	select ARCH_HAS_BANDGAP
 	select PINCTRL_EXYNOS
-	select PM_GENERIC_DOMAINS if PM
 	select SAMSUNG_DMADEV
 	help
 	  Enable EXYNOS4412 SoC support
-- 
1.7.4.1
