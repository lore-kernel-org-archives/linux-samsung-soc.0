From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 04/17] ASoC: samsung: no more support for S5P6440 and S5P6450
 SoCs
Date: Tue, 01 Jul 2014 06:32:14 +0900
Message-ID: <1404163947-3105-5-git-send-email-kgene.kim@samsung.com>
References: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62589 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752868AbaF3NTK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 09:19:10 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7Z00GIKGZU1570@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Jun 2014 22:19:06 +0900 (KST)
In-reply-to: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@linaro.org>

This patch removes s5p64x0 related WM8580 because of removing support
for s5p64x0 SoCs.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Mark Brown <broonie@linaro.org>
---
 sound/soc/samsung/Kconfig          |    2 +-
 sound/soc/samsung/smdk_wm8580pcm.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 753b8c9..c639e2e 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -63,7 +63,7 @@ config SND_SOC_SAMSUNG_JIVE_WM8750
 
 config SND_SOC_SAMSUNG_SMDK_WM8580
 	tristate "SoC I2S Audio support for WM8580 on SMDK"
-	depends on SND_SOC_SAMSUNG && (MACH_SMDK6410 || MACH_SMDKC100 || MACH_SMDK6440 || MACH_SMDK6450 || MACH_SMDKV210 || MACH_SMDKC110)
+	depends on SND_SOC_SAMSUNG && (MACH_SMDK6410 || MACH_SMDKC100 || MACH_SMDKV210 || MACH_SMDKC110)
 	depends on REGMAP_I2C
 	select SND_SOC_WM8580
 	select SND_SAMSUNG_I2S
diff --git a/sound/soc/samsung/smdk_wm8580pcm.c b/sound/soc/samsung/smdk_wm8580pcm.c
index e119aaa..63d0793 100644
--- a/sound/soc/samsung/smdk_wm8580pcm.c
+++ b/sound/soc/samsung/smdk_wm8580pcm.c
@@ -25,7 +25,7 @@
  *  o '0' means 'OFF'
  *  o 'X' means 'Don't care'
  *
- * SMDK6410, SMDK6440, SMDK6450 Base B/D: CFG1-0000, CFG2-1111
+ * SMDK6410 Base B/D: CFG1-0000, CFG2-1111
  * SMDKC110, SMDKV210: CFGB11-100100, CFGB12-0000
  */
 
-- 
1.7.10.4
