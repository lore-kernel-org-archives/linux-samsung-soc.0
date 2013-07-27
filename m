From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] ASoC: smdk_wm8994: Make driver name more unique
Date: Sat, 27 Jul 2013 12:53:23 +0100
Message-ID: <1374926005-2400-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:56728 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751538Ab3G0Lxw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 27 Jul 2013 07:53:52 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Avoid collisions with other SMDK audio by using the CODEC name.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 sound/soc/samsung/smdk_wm8994.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 581ea4a..05c479c 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -200,7 +200,7 @@ MODULE_DEVICE_TABLE(of, samsung_wm8994_of_match);
 
 static struct platform_driver smdk_audio_driver = {
 	.driver		= {
-		.name	= "smdk-audio",
+		.name	= "smdk-audio-wm8894",
 		.owner	= THIS_MODULE,
 		.of_match_table = of_match_ptr(samsung_wm8994_of_match),
 	},
@@ -212,4 +212,4 @@ module_platform_driver(smdk_audio_driver);
 
 MODULE_DESCRIPTION("ALSA SoC SMDK WM8994");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:smdk-audio");
+MODULE_ALIAS("platform:smdk-audio-wm8994");
-- 
1.8.3.2
