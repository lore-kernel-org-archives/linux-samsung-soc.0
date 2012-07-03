From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ASoC: Samsung: Convert to use snd_soc_register_card()
Date: Tue,  3 Jul 2012 14:04:04 +0530
Message-ID: <1341304444-11188-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f51.google.com ([209.85.213.51]:52841 "EHLO
	mail-yw0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750710Ab2GCIqX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jul 2012 04:46:23 -0400
Received: by yhnn12 with SMTP id n12so6939268yhn.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Jul 2012 01:46:22 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org
Cc: linux-samsung-soc@vger.kernel.org, broonie@opensource.wolfsonmicro.com, sbkim73@samsung.com, kgene.kim@samsung.com, tiwai@suse.de, sachin.kamat@linaro.org, patches@linaro.org

Current method for machine driver to register with the ASoC core is to use
snd_soc_register_card() instead of creating a "soc-audio" platform device.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 sound/soc/samsung/smdk_wm8994.c |   36 +++++++++++++++++++++++-------------
 1 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 8eb309f..3ea3098 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -149,31 +149,41 @@ static struct snd_soc_card smdk = {
 	.num_links = ARRAY_SIZE(smdk_dai),
 };
 
-static struct platform_device *smdk_snd_device;
 
-static int __init smdk_audio_init(void)
+static int __devinit smdk_audio_probe(struct platform_device *pdev)
 {
 	int ret;
+	struct snd_soc_card *card = &smdk;
 
-	smdk_snd_device = platform_device_alloc("soc-audio", -1);
-	if (!smdk_snd_device)
-		return -ENOMEM;
+	card->dev = &pdev->dev;
+	ret = snd_soc_register_card(card);
 
-	platform_set_drvdata(smdk_snd_device, &smdk);
-
-	ret = platform_device_add(smdk_snd_device);
 	if (ret)
-		platform_device_put(smdk_snd_device);
+		dev_err(&pdev->dev, "snd_soc_register_card() failed:%d\n", ret);
 
 	return ret;
 }
-module_init(smdk_audio_init);
 
-static void __exit smdk_audio_exit(void)
+static int __devexit smdk_audio_remove(struct platform_device *pdev)
 {
-	platform_device_unregister(smdk_snd_device);
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+
+	snd_soc_unregister_card(card);
+
+	return 0;
 }
-module_exit(smdk_audio_exit);
+
+static struct platform_driver smdk_audio_driver = {
+	.driver		= {
+		.name	= "smdk-audio",
+		.owner	= THIS_MODULE,
+	},
+	.probe		= smdk_audio_probe,
+	.remove		= __devexit_p(smdk_audio_remove),
+};
+
+module_platform_driver(smdk_audio_driver);
 
 MODULE_DESCRIPTION("ALSA SoC SMDK WM8994");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:smdk-audio");
-- 
1.7.4.1
