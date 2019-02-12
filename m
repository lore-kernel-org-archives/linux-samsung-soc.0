From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 03/21] ASoC: samsung: i2s: Add widgets and routes for
 DPCM support
Date: Tue, 12 Feb 2019 19:03:24 +0100
Message-ID: <20190212180342.32040-4-s.nawrocki@samsung.com>
References: <20190212180342.32040-1-s.nawrocki@samsung.com>
        <CGME20190212180449epcas1p232598bff05255c7f9c582a16b27797c7@epcas1p2.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190212180342.32040-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds DAPM widgets required to model the internal mixer
of the I2S controller merging audio streams from the primary and
from the secondary PCM interface.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/samsung/i2s.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index fffc76ab60da..29bcfca20572 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1116,8 +1116,31 @@ static const struct snd_soc_dai_ops samsung_i2s_dai_ops = {
 	.delay = i2s_delay,
 };
 
+static const struct snd_soc_dapm_widget samsung_i2s_widgets[] = {
+	/* Backend DAI  */
+	SND_SOC_DAPM_AIF_OUT("Mixer DAI TX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("Mixer DAI RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+
+	/* Playback Mixer */
+	SND_SOC_DAPM_MIXER("Playback Mixer", SND_SOC_NOPM, 0, 0, NULL, 0),
+};
+
+static const struct snd_soc_dapm_route samsung_i2s_dapm_routes[] = {
+	{ "Playback Mixer", NULL, "Primary" },
+	{ "Playback Mixer", NULL, "Secondary" },
+
+	{ "Mixer DAI TX", NULL, "Playback Mixer" },
+	{ "Playback Mixer", NULL, "Mixer DAI RX" },
+};
+
 static const struct snd_soc_component_driver samsung_i2s_component = {
-	.name		= "samsung-i2s",
+	.name = "samsung-i2s",
+
+	.dapm_widgets = samsung_i2s_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(samsung_i2s_widgets),
+
+	.dapm_routes = samsung_i2s_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(samsung_i2s_dapm_routes),
 };
 
 #define SAMSUNG_I2S_FMTS	(SNDRV_PCM_FMTBIT_S8 | \
@@ -1129,6 +1152,7 @@ static int i2s_alloc_dais(struct samsung_i2s_priv *priv,
 			  int num_dais)
 {
 	static const char *dai_names[] = { "samsung-i2s", "samsung-i2s-sec" };
+	static const char *stream_names[] = { "Primary", "Secondary" };
 	struct snd_soc_dai_driver *dai_drv;
 	struct i2s_dai *dai;
 	int i;
@@ -1158,6 +1182,7 @@ static int i2s_alloc_dais(struct samsung_i2s_priv *priv,
 		dai_drv->playback.channels_max = 2;
 		dai_drv->playback.rates = i2s_dai_data->pcm_rates;
 		dai_drv->playback.formats = SAMSUNG_I2S_FMTS;
+		dai_drv->playback.stream_name = stream_names[i];
 
 		dai_drv->id = i + 1;
 		dai_drv->name = dai_names[i];
-- 
2.20.1
