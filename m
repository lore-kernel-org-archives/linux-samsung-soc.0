From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: samsung: Enable COMPILE_TEST builds
Date: Mon, 15 Jul 2013 18:11:24 +0100
Message-ID: <1373908284-14305-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:58664 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751585Ab3GORL4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jul 2013 13:11:56 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Platform using OF and some others don't have any dependencies on arch/arm
so can be built on any platform. Enable that for better compile coverage
when COMPILE_TEST is enabled.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 sound/soc/samsung/Kconfig | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 9855dfc..df28dc8 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -1,6 +1,6 @@
 config SND_SOC_SAMSUNG
 	tristate "ASoC support for Samsung"
-	depends on PLAT_SAMSUNG
+	depends on PLAT_SAMSUNG || COMPILE_TEST
 	select S3C64XX_DMA if ARCH_S3C64XX
 	select S3C2410_DMA if ARCH_S3C24XX
 	help
@@ -150,7 +150,7 @@ config SND_SOC_SMARTQ
 
 config SND_SOC_GONI_AQUILA_WM8994
 	tristate "SoC I2S Audio support for AQUILA/GONI - WM8994"
-	depends on SND_SOC_SAMSUNG && (MACH_GONI || MACH_AQUILA)
+	depends on SND_SOC_SAMSUNG && (MACH_GONI || MACH_AQUILA || COMPILE_TEST)
 	depends on I2C=y && GENERIC_HARDIRQS
 	select SND_SAMSUNG_I2S
 	select MFD_WM8994
@@ -186,7 +186,7 @@ config SND_SOC_SMDK_WM8994_PCM
 
 config SND_SOC_SPEYSIDE
 	tristate "Audio support for Wolfson Speyside"
-	depends on SND_SOC_SAMSUNG && MACH_WLF_CRAGG_6410
+	depends on SND_SOC_SAMSUNG && (MACH_WLF_CRAGG_6410 || COMPILE_TEST)
 	select SND_SAMSUNG_I2S
 	select SND_SOC_WM8996
 	select SND_SOC_WM9081
@@ -195,13 +195,13 @@ config SND_SOC_SPEYSIDE
 
 config SND_SOC_TOBERMORY
 	tristate "Audio support for Wolfson Tobermory"
-	depends on SND_SOC_SAMSUNG && MACH_WLF_CRAGG_6410
+	depends on SND_SOC_SAMSUNG && (MACH_WLF_CRAGG_6410 || COMPILE_TEST)
 	select SND_SAMSUNG_I2S
 	select SND_SOC_WM8962
 
 config SND_SOC_BELLS
 	tristate "Audio support for Wolfson Bells"
-	depends on SND_SOC_SAMSUNG && MACH_WLF_CRAGG_6410
+	depends on SND_SOC_SAMSUNG && (MACH_WLF_CRAGG_6410 || COMPILE_TEST)
 	select SND_SAMSUNG_I2S
 	select SND_SOC_WM5102
 	select SND_SOC_WM5110
@@ -211,14 +211,14 @@ config SND_SOC_BELLS
 
 config SND_SOC_LOWLAND
 	tristate "Audio support for Wolfson Lowland"
-	depends on SND_SOC_SAMSUNG && MACH_WLF_CRAGG_6410
+	depends on SND_SOC_SAMSUNG && (MACH_WLF_CRAGG_6410 || COMPILE_TEST)
 	select SND_SAMSUNG_I2S
 	select SND_SOC_WM5100
 	select SND_SOC_WM9081
 
 config SND_SOC_LITTLEMILL
 	tristate "Audio support for Wolfson Littlemill"
-	depends on SND_SOC_SAMSUNG && MACH_WLF_CRAGG_6410
+	depends on SND_SOC_SAMSUNG && (MACH_WLF_CRAGG_6410 || COMPILE_TEST)
 	select SND_SAMSUNG_I2S
 	select MFD_WM8994
 	select SND_SOC_WM8994
-- 
1.8.3.2
