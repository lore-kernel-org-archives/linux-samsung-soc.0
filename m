From: Giridhar Maruthy <giridhar.maruthy@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Enable WM8994 MFD on I2S selection
Date: Tue, 31 May 2011 11:10:36 +0530
Message-ID: <1306820436-16569-1-git-send-email-giridhar.maruthy@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:50110 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750907Ab1EaFkv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 May 2011 01:40:51 -0400
Received: by pwi15 with SMTP id 15so1894344pwi.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 May 2011 22:40:51 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: angus.ainslie@linaro.org, kgene.kim@samsung.com, samsung@lists.linaro.org, jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, Giridhar Maruthy <giridhar.maruthy@linaro.org>

Whenever I2S is selected, select MFD for WM8994 and I2C
to avoid manual enabling of the codec and I2C.

Signed-off-by: Giridhar Maruthy <giridhar.maruthy@linaro.org>
Signed-off-by: Angus Ainslie <angus.ainslie@linaro.org>
---
 arch/arm/mach-exynos4/Kconfig |    1 +
 sound/soc/samsung/Kconfig     |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index e849f67..da00863 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -12,6 +12,7 @@ if ARCH_EXYNOS4
 config CPU_EXYNOS4210
 	bool
 	select S3C_PL330_DMA
+	select I2C_S3C2410 if MFD_WM8994
 	help
 	  Enable EXYNOS4210 CPU support
 
diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index a3fdfb6..d8654c6 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -65,6 +65,8 @@ config SND_SOC_SAMSUNG_SMDK_WM8994
 	tristate "SoC I2S Audio support for WM8994 on SMDK"
 	depends on SND_SOC_SAMSUNG && (MACH_SMDKV310 || MACH_SMDKC210)
 	select SND_SOC_WM8994
+	select MFD_SUPPORT
+	select MFD_WM8994
 	select SND_SAMSUNG_I2S
 	help
 		Say Y if you want to add support for SoC audio on the SMDKs.
-- 
1.7.1
