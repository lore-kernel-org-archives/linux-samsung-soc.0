From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: EXYNOS: Make help message consistent
Date: Fri, 27 Dec 2013 17:09:03 +0530
Message-ID: <1388144343-10956-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:43699 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754495Ab3L0Lme (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Dec 2013 06:42:34 -0500
Received: by mail-pd0-f171.google.com with SMTP id z10so8938885pdj.16
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Dec 2013 03:42:34 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Make the Kconfig help message uniform across SoCs. While
at it enable Exynos5 by default.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/Kconfig |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 35c335de175d..645af90591e0 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -27,10 +27,11 @@ config ARCH_EXYNOS4
 	select PM_GENERIC_DOMAINS if PM
 	select S5P_DEV_MFC
 	help
-	  Samsung EXYNOS4 SoCs based systems
+	  Samsung EXYNOS4 (Cortex-A9) SoC based systems
 
 config ARCH_EXYNOS5
 	bool "SAMSUNG EXYNOS5"
+	default y
 	select ARM_AMBA
 	select CLKSRC_OF
 	select HAVE_ARM_SCU if SMP
@@ -38,7 +39,7 @@ config ARCH_EXYNOS5
 	select PINCTRL
 	select USB_ARCH_HAS_XHCI
 	help
-	  Samsung EXYNOS5 (Cortex-A15) SoC based systems
+	  Samsung EXYNOS5 (Cortex-A15/A7) SoC based systems
 
 comment "EXYNOS SoCs"
 
@@ -53,7 +54,7 @@ config CPU_EXYNOS4210
 	select S5P_SLEEP if PM
 	select SAMSUNG_DMADEV
 	help
-	  Enable EXYNOS4210 CPU support
+	  Enable EXYNOS4210 SoC support
 
 config SOC_EXYNOS4212
 	bool "SAMSUNG EXYNOS4212"
-- 
1.7.9.5
