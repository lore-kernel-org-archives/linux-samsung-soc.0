From: Angus Ainslie <angus.ainslie@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Enable WM8994 MFD on I2S selection
Date: Tue, 24 May 2011 22:39:30 -0600
Message-ID: <1306298370-24997-1-git-send-email-angus.ainslie@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:42669 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751233Ab1EYEjs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2011 00:39:48 -0400
Received: by iyb14 with SMTP id 14so5866723iyb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 May 2011 21:39:47 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Giridhar Maruthy <giridhar.maruthy@linaro.org>, samsung@lists.linaro.org, kgene.kim@samsung.com, patches@linaro.org, angus.ainslie@linaro.org

From: Giridhar Maruthy <giridhar.maruthy@linaro.org>

Whenever I2S is selected, select MFD for WM8994 and I2C
to avoid manual enabling of the codec and I2C.

Signed-off-by: Giridhar Maruthy <giridhar.maruthy@linaro.org>
Signed-off-by: Angus Ainslie <angus.ainslie@linaro.org>
---
 sound/soc/samsung/Kconfig |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index a3fdfb6..a80eeb1 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -65,6 +65,9 @@ config SND_SOC_SAMSUNG_SMDK_WM8994
 	tristate "SoC I2S Audio support for WM8994 on SMDK"
 	depends on SND_SOC_SAMSUNG && (MACH_SMDKV310 || MACH_SMDKC210)
 	select SND_SOC_WM8994
+	select MFD_SUPPORT
+	select I2C_S3C2410
+	select MFD_WM8994
 	select SND_SAMSUNG_I2S
 	help
 		Say Y if you want to add support for SoC audio on the SMDKs.
-- 
1.7.4.1
