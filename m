From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: i2s: Fix DAPM routes for capture stream
Date: Wed, 06 Mar 2019 11:24:45 +0100
Message-ID: <20190306102445.1640-1-s.nawrocki@samsung.com>
References: <CGME20190306102457epcas2p136fcb099d5635ee498eefd17979fc880@epcas2p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: sbkim73@samsung.com, krzk@kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch sets missing stream_name of capture part of the DAI driver
so we can define DAPM routing properly also for the capture stream.

While at it "Playback" suffix is added to the playback stream names
to clearly identify playback/capture.

Together with related dts patch this fixes NULL pointer dereference
when opening ALSA device for recording on Odroid XU3.

Fixes: 64aba9bca5bd ("ASoC: samsung: i2s: Add widgets and routes for DPCM support")
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 4231001226f4..ab471d550d17 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1130,11 +1130,11 @@ static const struct snd_soc_dapm_widget samsung_i2s_widgets[] = {
 };
 
 static const struct snd_soc_dapm_route samsung_i2s_dapm_routes[] = {
-	{ "Playback Mixer", NULL, "Primary" },
-	{ "Playback Mixer", NULL, "Secondary" },
+	{ "Playback Mixer", NULL, "Primary Playback" },
+	{ "Playback Mixer", NULL, "Secondary Playback" },
 
 	{ "Mixer DAI TX", NULL, "Playback Mixer" },
-	{ "Playback Mixer", NULL, "Mixer DAI RX" },
+	{ "Primary Capture", NULL, "Mixer DAI RX" },
 };
 
 static const struct snd_soc_component_driver samsung_i2s_component = {
@@ -1155,7 +1155,8 @@ static int i2s_alloc_dais(struct samsung_i2s_priv *priv,
 			  int num_dais)
 {
 	static const char *dai_names[] = { "samsung-i2s", "samsung-i2s-sec" };
-	static const char *stream_names[] = { "Primary", "Secondary" };
+	static const char *stream_names[] = { "Primary Playback",
+					      "Secondary Playback" };
 	struct snd_soc_dai_driver *dai_drv;
 	struct i2s_dai *dai;
 	int i;
@@ -1201,6 +1202,7 @@ static int i2s_alloc_dais(struct samsung_i2s_priv *priv,
 	dai_drv->capture.channels_max = 2;
 	dai_drv->capture.rates = i2s_dai_data->pcm_rates;
 	dai_drv->capture.formats = SAMSUNG_I2S_FMTS;
+	dai_drv->capture.stream_name = "Primary Capture";
 
 	return 0;
 }
-- 
2.17.1
