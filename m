From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH v2] ASoC: Samsung: Update Kconfig for Exynos5250 and Exynos4412
Date: Thu, 27 Sep 2012 15:59:37 +0530
Message-ID: <1348741777-29569-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63448 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755945Ab2I0KY4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Sep 2012 06:24:56 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MB0006QG7KZPDC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Sep 2012 19:24:55 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MB000MXK7L80X20@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Sep 2012 19:24:55 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: padma.v@samsung.com, sbkim73@samsung.com, sangsu4u.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, olofj@google.com

Update Kconfig file to support the Exynos5250 and Exynos4412

Signed-off-by: Sangsu Park <sangsu4u.park@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 sound/soc/samsung/Kconfig |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index fe3995c..430783b 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -1,6 +1,6 @@
 config SND_SOC_SAMSUNG
 	tristate "ASoC support for Samsung"
-	depends on ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PC100 || ARCH_S5PV210 || ARCH_S5P64X0 || ARCH_EXYNOS4
+	depends on PLAT_SAMSUNG
 	select S3C64XX_DMA if ARCH_S3C64XX
 	select S3C2410_DMA if ARCH_S3C24XX
 	help
@@ -63,7 +63,7 @@ config SND_SOC_SAMSUNG_SMDK_WM8580
 
 config SND_SOC_SAMSUNG_SMDK_WM8994
 	tristate "SoC I2S Audio support for WM8994 on SMDK"
-	depends on SND_SOC_SAMSUNG && (MACH_SMDKV310 || MACH_SMDKC210 || MACH_SMDK4212)
+	depends on SND_SOC_SAMSUNG && (MACH_SMDKV310 || MACH_SMDKC210 || MACH_SMDK4212 || MACH_SMDK4412 || MACH_EXYNOS5_DT)
 	depends on I2C=y && GENERIC_HARDIRQS
 	select MFD_WM8994
 	select SND_SOC_WM8994
@@ -162,7 +162,7 @@ config SND_SOC_GONI_AQUILA_WM8994
 
 config SND_SOC_SAMSUNG_SMDK_SPDIF
 	tristate "SoC S/PDIF Audio support for SMDK"
-	depends on SND_SOC_SAMSUNG && (MACH_SMDKC100 || MACH_SMDKC110 || MACH_SMDKV210 || MACH_SMDKV310 || MACH_SMDK4212)
+	depends on SND_SOC_SAMSUNG && (MACH_SMDKC100 || MACH_SMDKC110 || MACH_SMDKV210 || MACH_SMDKV310 || MACH_SMDK4212 || MACH_SMDK4412 || SOC_EXYNOS5250)
 	select SND_SAMSUNG_SPDIF
 	help
 	  Say Y if you want to add support for SoC S/PDIF audio on the SMDK.
@@ -177,7 +177,7 @@ config SND_SOC_SMDK_WM8580_PCM
 
 config SND_SOC_SMDK_WM8994_PCM
 	tristate "SoC PCM Audio support for WM8994 on SMDK"
-	depends on SND_SOC_SAMSUNG && (MACH_SMDKC210 || MACH_SMDKV310 || MACH_SMDK4212)
+	depends on SND_SOC_SAMSUNG && (MACH_SMDKC210 || MACH_SMDKV310 || MACH_SMDK4212 || MACH_SMDK4412 || MACH_EXYNOS5_DT)
 	depends on I2C=y && GENERIC_HARDIRQS
 	select MFD_WM8994
 	select SND_SOC_WM8994
-- 
1.7.4.4
