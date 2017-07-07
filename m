From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: i2s: Support more resolution rates" to the asoc tree
Date: Fri, 07 Jul 2017 13:52:01 +0100
Message-ID: <E1dTSjp-0002oF-N4@finisterre>
References: <20170707013110.7060-1-jcsing.lee@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37786 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750726AbdGGMwP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Jul 2017 08:52:15 -0400
In-Reply-To: <20170707013110.7060-1-jcsing.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaechul Lee <jcsing.lee@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel <alsa-devel@alsa-project.org>, linux-samsung-soc@vger.kernel.org, Jaechul Lee <galaxyra@gmail.com>, linux-kernel@vger.kernel.orgalsa-devel@alsa-project.org

The patch

   ASoC: samsung: i2s: Support more resolution rates

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 558176fd32e0db20469de4c6ae5e7580bdd41185 Mon Sep 17 00:00:00 2001
From: Jaechul Lee <jcsing.lee@samsung.com>
Date: Fri, 7 Jul 2017 10:31:10 +0900
Subject: [PATCH] ASoC: samsung: i2s: Support more resolution rates

This driver can support more frequencies over 96KHz. There are no reasons
to limit the frequency range below 96KHz. If codecs/amps or something else
can't support higher resolution rates, the constraints would be set rates
properly because each drivers have its own limits.

I added the 'pcm_rates' field to the dai_data to be set rates by the
compatibilities. As a result, rates will be set each devices respectively.
For example of exynos5433, rates will be set from 8KHz to 192KHz.

Signed-off-by: Jaechul Lee <jcsing.lee@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/i2s.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index af3ba4d4ccc5..c9f87f7bae99 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -50,6 +50,7 @@ struct samsung_i2s_variant_regs {
 
 struct samsung_i2s_dai_data {
 	u32 quirks;
+	unsigned int pcm_rates;
 	const struct samsung_i2s_variant_regs *i2s_variant_regs;
 };
 
@@ -1076,13 +1077,13 @@ static const struct snd_soc_component_driver samsung_i2s_component = {
 	.name		= "samsung-i2s",
 };
 
-#define SAMSUNG_I2S_RATES	SNDRV_PCM_RATE_8000_96000
-
 #define SAMSUNG_I2S_FMTS	(SNDRV_PCM_FMTBIT_S8 | \
 					SNDRV_PCM_FMTBIT_S16_LE | \
 					SNDRV_PCM_FMTBIT_S24_LE)
 
-static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
+static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev,
+				const struct samsung_i2s_dai_data *i2s_dai_data,
+				bool sec)
 {
 	struct i2s_dai *i2s;
 
@@ -1101,13 +1102,13 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
 	i2s->i2s_dai_drv.resume = i2s_resume;
 	i2s->i2s_dai_drv.playback.channels_min = 1;
 	i2s->i2s_dai_drv.playback.channels_max = 2;
-	i2s->i2s_dai_drv.playback.rates = SAMSUNG_I2S_RATES;
+	i2s->i2s_dai_drv.playback.rates = i2s_dai_data->pcm_rates;
 	i2s->i2s_dai_drv.playback.formats = SAMSUNG_I2S_FMTS;
 
 	if (!sec) {
 		i2s->i2s_dai_drv.capture.channels_min = 1;
 		i2s->i2s_dai_drv.capture.channels_max = 2;
-		i2s->i2s_dai_drv.capture.rates = SAMSUNG_I2S_RATES;
+		i2s->i2s_dai_drv.capture.rates = i2s_dai_data->pcm_rates;
 		i2s->i2s_dai_drv.capture.formats = SAMSUNG_I2S_FMTS;
 	}
 	return i2s;
@@ -1242,7 +1243,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		i2s_dai_data = (struct samsung_i2s_dai_data *)
 				platform_get_device_id(pdev)->driver_data;
 
-	pri_dai = i2s_alloc_dai(pdev, false);
+	pri_dai = i2s_alloc_dai(pdev, i2s_dai_data, false);
 	if (!pri_dai) {
 		dev_err(&pdev->dev, "Unable to alloc I2S_pri\n");
 		return -ENOMEM;
@@ -1316,7 +1317,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 
 	if (quirks & QUIRK_SEC_DAI) {
-		sec_dai = i2s_alloc_dai(pdev, true);
+		sec_dai = i2s_alloc_dai(pdev, i2s_dai_data, true);
 		if (!sec_dai) {
 			dev_err(&pdev->dev, "Unable to alloc I2S_sec\n");
 			ret = -ENOMEM;
@@ -1452,29 +1453,34 @@ static const struct samsung_i2s_variant_regs i2sv5_i2s1_regs = {
 
 static const struct samsung_i2s_dai_data i2sv3_dai_type = {
 	.quirks = QUIRK_NO_MUXPSR,
+	.pcm_rates = SNDRV_PCM_RATE_8000_96000,
 	.i2s_variant_regs = &i2sv3_regs,
 };
 
 static const struct samsung_i2s_dai_data i2sv5_dai_type = {
 	.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR |
 			QUIRK_SUPPORTS_IDMA,
+	.pcm_rates = SNDRV_PCM_RATE_8000_96000,
 	.i2s_variant_regs = &i2sv3_regs,
 };
 
 static const struct samsung_i2s_dai_data i2sv6_dai_type = {
 	.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR |
 			QUIRK_SUPPORTS_TDM | QUIRK_SUPPORTS_IDMA,
+	.pcm_rates = SNDRV_PCM_RATE_8000_96000,
 	.i2s_variant_regs = &i2sv6_regs,
 };
 
 static const struct samsung_i2s_dai_data i2sv7_dai_type = {
 	.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR |
 			QUIRK_SUPPORTS_TDM,
+	.pcm_rates = SNDRV_PCM_RATE_8000_192000,
 	.i2s_variant_regs = &i2sv7_regs,
 };
 
 static const struct samsung_i2s_dai_data i2sv5_dai_type_i2s1 = {
 	.quirks = QUIRK_PRI_6CHAN | QUIRK_NEED_RSTCLR,
+	.pcm_rates = SNDRV_PCM_RATE_8000_96000,
 	.i2s_variant_regs = &i2sv5_i2s1_regs,
 };
 
-- 
2.13.2
