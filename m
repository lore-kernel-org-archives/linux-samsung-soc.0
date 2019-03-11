From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: i2s: Fix DAPM routes for capture stream" to the asoc tree
Date: Mon, 11 Mar 2019 17:23:57 +0000 (GMT)
Message-ID: <20190311172357.85BCB1128896@debutante.sirena.org.uk>
References: <20190306102445.1640-1-s.nawrocki@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190306102445.1640-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mark Brown <broonie@kernel.org>broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, linux-kernel@vger.kernel.org, krzk@kernel.org, m.szyprowski@samsung.comalsa-devel@alsa-project.org
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: samsung: i2s: Fix DAPM routes for capture stream

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

>From 42e4cedd67e4eb2abaa5e684353a55d4a01a913e Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Wed, 6 Mar 2019 11:24:45 +0100
Subject: [PATCH] ASoC: samsung: i2s: Fix DAPM routes for capture stream

This patch sets missing stream_name of capture part of the DAI driver
so we can define DAPM routing properly also for the capture stream.

While at it "Playback" suffix is added to the playback stream names
to clearly identify playback/capture.

Together with related dts patch this fixes NULL pointer dereference
when opening ALSA device for recording on Odroid XU3.

Fixes: 64aba9bca5bd ("ASoC: samsung: i2s: Add widgets and routes for DPCM support")
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1
