From: Jaechul Lee <jcsing.lee@samsung.com>
Subject: [PATCH] ASoC: samsung: i2s: Supported high resolution rates
Date: Wed, 05 Jul 2017 14:58:32 +0900
Message-ID: <20170705055832.4893-1-jcsing.lee@samsung.com>
References: <CGME20170705055835epcas5p32d60ee0f1acaf4e04c8a80d49bc2a730@epcas5p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:30841 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751444AbdGEF6i (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2017 01:58:38 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel <alsa-devel@alsa-project.org>
Cc: Jaechul Lee <jcsing.lee@samsung.com>, Jaechul Lee <galaxyra@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

This driver can support more frequencies over 96KHz. There are no reasons
to limit the frequency range below 96KHz. If codecs/amps or something else
can't support high resolution rates, the constraints would be set rates
properly because each drivers have its own limits.

Signed-off-by: Jaechul Lee <jcsing.lee@samsung.com>
---
 sound/soc/samsung/i2s.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index af3ba4d4ccc5..fc34af6a2c1e 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -50,6 +50,7 @@ struct samsung_i2s_variant_regs {
 
 struct samsung_i2s_dai_data {
 	u32 quirks;
+	unsigned int rates;
 	const struct samsung_i2s_variant_regs *i2s_variant_regs;
 };
 
@@ -1076,20 +1077,25 @@ static const struct snd_soc_component_driver samsung_i2s_component = {
 	.name		= "samsung-i2s",
 };
 
-#define SAMSUNG_I2S_RATES	SNDRV_PCM_RATE_8000_96000
-
 #define SAMSUNG_I2S_FMTS	(SNDRV_PCM_FMTBIT_S8 | \
 					SNDRV_PCM_FMTBIT_S16_LE | \
 					SNDRV_PCM_FMTBIT_S24_LE)
 
 static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
 {
+	const struct samsung_i2s_dai_data *i2s_dai_data;
 	struct i2s_dai *i2s;
 
 	i2s = devm_kzalloc(&pdev->dev, sizeof(struct i2s_dai), GFP_KERNEL);
 	if (i2s == NULL)
 		return NULL;
 
+	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node)
+		i2s_dai_data = of_device_get_match_data(&pdev->dev);
+	else
+		i2s_dai_data = (struct samsung_i2s_dai_data *)
+				platform_get_device_id(pdev)->driver_data;
+
 	i2s->pdev = pdev;
 	i2s->pri_dai = NULL;
 	i2s->sec_dai = NULL;
@@ -1101,13 +1107,13 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
 	i2s->i2s_dai_drv.resume = i2s_resume;
 	i2s->i2s_dai_drv.playback.channels_min = 1;
 	i2s->i2s_dai_drv.playback.channels_max = 2;
-	i2s->i2s_dai_drv.playback.rates = SAMSUNG_I2S_RATES;
+	i2s->i2s_dai_drv.playback.rates = i2s_dai_data->rates;
 	i2s->i2s_dai_drv.playback.formats = SAMSUNG_I2S_FMTS;
 
 	if (!sec) {
 		i2s->i2s_dai_drv.capture.channels_min = 1;
 		i2s->i2s_dai_drv.capture.channels_max = 2;
-		i2s->i2s_dai_drv.capture.rates = SAMSUNG_I2S_RATES;
+		i2s->i2s_dai_drv.capture.rates = i2s_dai_data->rates;
 		i2s->i2s_dai_drv.capture.formats = SAMSUNG_I2S_FMTS;
 	}
 	return i2s;
@@ -1452,29 +1458,34 @@ static const struct samsung_i2s_variant_regs i2sv5_i2s1_regs = {
 
 static const struct samsung_i2s_dai_data i2sv3_dai_type = {
 	.quirks = QUIRK_NO_MUXPSR,
+	.rates = SNDRV_PCM_RATE_8000_96000,
 	.i2s_variant_regs = &i2sv3_regs,
 };
 
 static const struct samsung_i2s_dai_data i2sv5_dai_type = {
 	.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR |
 			QUIRK_SUPPORTS_IDMA,
+	.rates = SNDRV_PCM_RATE_8000_96000,
 	.i2s_variant_regs = &i2sv3_regs,
 };
 
 static const struct samsung_i2s_dai_data i2sv6_dai_type = {
 	.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR |
 			QUIRK_SUPPORTS_TDM | QUIRK_SUPPORTS_IDMA,
+	.rates = SNDRV_PCM_RATE_8000_96000,
 	.i2s_variant_regs = &i2sv6_regs,
 };
 
 static const struct samsung_i2s_dai_data i2sv7_dai_type = {
 	.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR |
 			QUIRK_SUPPORTS_TDM,
+	.rates = SNDRV_PCM_RATE_8000_192000,
 	.i2s_variant_regs = &i2sv7_regs,
 };
 
 static const struct samsung_i2s_dai_data i2sv5_dai_type_i2s1 = {
 	.quirks = QUIRK_PRI_6CHAN | QUIRK_NEED_RSTCLR,
+	.rates = SNDRV_PCM_RATE_8000_96000,
 	.i2s_variant_regs = &i2sv5_i2s1_regs,
 };
 
-- 
2.11.0
