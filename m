From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: Fix invalid argument when devm_gpiod_get is called" to the asoc tree
Date: Tue, 19 Sep 2017 15:59:28 +0100
Message-ID: <E1duJzk-0002CY-3Y@debutante>
References: <20170828100102.17591-4-jcsing.lee@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52764 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750862AbdISO7l (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Sep 2017 10:59:41 -0400
In-Reply-To: <20170828100102.17591-4-jcsing.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaechul Lee <jcsing.lee@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, Chanwoo Choi <cw00.choi@samsung.com>, galaxyra@gmail.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.orgalsa-devel@alsa-project.org

The patch

   ASoC: samsung: Fix invalid argument when devm_gpiod_get is called

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

>From 975b6a93088e83a41ba2f0dec2f086678fdb2a7a Mon Sep 17 00:00:00 2001
From: Jaechul Lee <jcsing.lee@samsung.com>
Date: Wed, 6 Sep 2017 10:04:15 +0900
Subject: [PATCH] ASoC: samsung: Fix invalid argument when devm_gpiod_get is
 called

devm_gpiod_get is called with GPIOF_OUT_INIT_LOW but the function doesn't
allow the parameters. Unluckily, GPIOF_OUT_INIT_LOW is same value as
GPIOD_ASIS and gpio direction isn't set properly.

Muted stream comes up when I try recording some sounds on TM2. mic-bias
gpiod state can't be changed because the gpiod is created with the invalid
parameter. The gpio should be set GPIOD_OUT_HIGH.

Fixes: 1bfbc260a5b4 ("ASoC: samsung: Add machine driver for Exynos5433 based TM2 board")
Signed-off-by: Jaechul Lee <jcsing.lee@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/tm2_wm5110.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 710e2151141f..a55d18703fe7 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -439,8 +439,7 @@ static int tm2_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(card, priv);
 	card->dev = dev;
 
-	priv->gpio_mic_bias = devm_gpiod_get(dev, "mic-bias",
-						GPIOF_OUT_INIT_LOW);
+	priv->gpio_mic_bias = devm_gpiod_get(dev, "mic-bias", GPIOD_OUT_HIGH);
 	if (IS_ERR(priv->gpio_mic_bias)) {
 		dev_err(dev, "Failed to get mic bias gpio\n");
 		return PTR_ERR(priv->gpio_mic_bias);
-- 
2.14.1
