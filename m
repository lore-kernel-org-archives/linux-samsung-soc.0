From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: smdk_wm8994: Use devm_snd_soc_unregister_card()
Date: Mon, 16 Sep 2013 18:03:43 +0100
Message-ID: <1379351023-28996-2-git-send-email-broonie@kernel.org>
References: <1379351023-28996-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:48798 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751387Ab3IPRDw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Sep 2013 13:03:52 -0400
In-Reply-To: <1379351023-28996-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 sound/soc/samsung/smdk_wm8994.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 5fd7a05..831972d 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -193,7 +193,7 @@ static int smdk_audio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, board);
 
-	ret = snd_soc_register_card(card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
 	if (ret)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed:%d\n", ret);
@@ -201,15 +201,6 @@ static int smdk_audio_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int smdk_audio_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-
-	snd_soc_unregister_card(card);
-
-	return 0;
-}
-
 static struct platform_driver smdk_audio_driver = {
 	.driver		= {
 		.name	= "smdk-audio-wm8894",
@@ -217,7 +208,6 @@ static struct platform_driver smdk_audio_driver = {
 		.of_match_table = of_match_ptr(samsung_wm8994_of_match),
 	},
 	.probe		= smdk_audio_probe,
-	.remove		= smdk_audio_remove,
 };
 
 module_platform_driver(smdk_audio_driver);
-- 
1.8.4.rc3
