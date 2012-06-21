From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: EXYNOS: Fix EXYNOS_DEV_DMA Kconfig entry
Date: Thu, 21 Jun 2012 17:25:01 +0530
Message-ID: <1340279701-22822-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:47314 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757123Ab2FUMGq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jun 2012 08:06:46 -0400
Received: by pbbrp8 with SMTP id rp8so2008111pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Jun 2012 05:06:45 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, boojin.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Commit 20ef9e08 ("ARM: EXYNOS: Support DMA for EXYNOS5250 SoC")
renamed EXYNOS4_DEV_DMA to EXYNOS_DEV_DMA. But some machine entries
still had EXYNOS4_DEV_DMA. Changed them to EXYNOS_DEV_DMA.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/Kconfig |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index f5fb6ea..498596b 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -213,7 +213,7 @@ config MACH_SMDKV310
 	select EXYNOS_DEV_SYSMMU
 	select EXYNOS4_DEV_AHCI
 	select SAMSUNG_DEV_KEYPAD
-	select EXYNOS4_DEV_DMA
+	select EXYNOS_DEV_DMA
 	select SAMSUNG_DEV_PWM
 	select EXYNOS4_DEV_USB_OHCI
 	select EXYNOS4_SETUP_FIMD0
@@ -265,7 +265,7 @@ config MACH_UNIVERSAL_C210
 	select S5P_DEV_ONENAND
 	select S5P_DEV_TV
 	select EXYNOS_DEV_SYSMMU
-	select EXYNOS4_DEV_DMA
+	select EXYNOS_DEV_DMA
 	select EXYNOS_DEV_DRM
 	select EXYNOS4_SETUP_FIMD0
 	select EXYNOS4_SETUP_I2C1
@@ -304,7 +304,7 @@ config MACH_NURI
 	select S5P_DEV_MFC
 	select S5P_DEV_USB_EHCI
 	select S5P_SETUP_MIPIPHY
-	select EXYNOS4_DEV_DMA
+	select EXYNOS_DEV_DMA
 	select EXYNOS_DEV_DRM
 	select EXYNOS4_SETUP_FIMC
 	select EXYNOS4_SETUP_FIMD0
@@ -343,7 +343,7 @@ config MACH_ORIGEN
 	select SAMSUNG_DEV_PWM
 	select EXYNOS_DEV_DRM
 	select EXYNOS_DEV_SYSMMU
-	select EXYNOS4_DEV_DMA
+	select EXYNOS_DEV_DMA
 	select EXYNOS4_DEV_USB_OHCI
 	select EXYNOS4_SETUP_FIMD0
 	select EXYNOS4_SETUP_SDHCI
-- 
1.7.4.1
