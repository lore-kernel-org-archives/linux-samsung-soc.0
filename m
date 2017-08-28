From: Jaechul Lee <jcsing.lee@samsung.com>
Subject: [PATCH 3/3] ASoC: samsung: Fix invalid argument when
 devm_gpiod_get is called
Date: Mon, 28 Aug 2017 19:01:02 +0900
Message-ID: <20170828100102.17591-4-jcsing.lee@samsung.com>
References: <20170828100102.17591-1-jcsing.lee@samsung.com>
 <CGME20170828100105epcas2p3b528f17ba89532835e9b1735a0016215@epcas2p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <20170828100102.17591-1-jcsing.lee@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, galaxyra@gmail.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Jaechul Lee <jcsing.lee@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

devm_gpiod_get is called with GPIOF_OUT_INIT_LOW but the function doesn't
allow the parameters. Unluckily, GPIOF_OUT_INIT_LOW is same value as
GPIOD_IN so it works like input gpio.

Muted stream comes up when I try recording some sounds on TM2. mic-bias
gpiod state can't be changed because the gpiod is created with the invalid
parameter. The gpio should be set GPIOD_OUT_HIGH.

Fixes: 1bfbc260a5b4 ("ASoC: samsung: Add machine driver for Exynos5433 based TM2 board")
Signed-off-by: Jaechul Lee <jcsing.lee@samsung.com>
---
 sound/soc/samsung/tm2_wm5110.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index f467ad06e827..76abe45ed537 100644
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
