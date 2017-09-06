From: Jaechul Lee <jcsing.lee@samsung.com>
Subject: [PATCH v2 3/3] ASoC: samsung: Fix invalid argument when
 devm_gpiod_get is called
Date: Wed, 06 Sep 2017 10:04:15 +0900
Message-ID: <20170906010415.26952-4-jcsing.lee@samsung.com>
References: <20170906010415.26952-1-jcsing.lee@samsung.com>
        <CGME20170906010417epcas2p1fa15cc68a8fb034f087b8103f6767f29@epcas2p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170906010415.26952-1-jcsing.lee@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, galaxyra@gmail.com, Jaechul Lee <jcsing.lee@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

devm_gpiod_get is called with GPIOF_OUT_INIT_LOW but the function doesn't
allow the parameters. Unluckily, GPIOF_OUT_INIT_LOW is same value as
GPIOD_ASIS and gpio direction isn't set properly.

Muted stream comes up when I try recording some sounds on TM2. mic-bias
gpiod state can't be changed because the gpiod is created with the invalid
parameter. The gpio should be set GPIOD_OUT_HIGH.

Fixes: 1bfbc260a5b4 ("ASoC: samsung: Add machine driver for Exynos5433 based TM2 board")
Signed-off-by: Jaechul Lee <jcsing.lee@samsung.com>
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
