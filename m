From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: samsung: Provide helper for DMA init
Date: Tue, 12 Nov 2013 13:48:39 +0000
Message-ID: <1384264120-24750-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Liam Girdwood <lgirdwood@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@linaro.org>, linaro-kernel@lists.linaro.org, Padmavathi Venna <padma.v@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Mark Brown <broonie@linaro.org>

In preparation for using the dmaengine helpers in ASoC rather than the
dmaengine wrappers for the Samsung API wrap the configuration of dma_data.
The dmaengine code expects different data to that used by the legacy API.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 sound/soc/samsung/ac97.c | 51 +++++++++++++++---------------------------------
 sound/soc/samsung/dma.c  |  8 ++++++++
 sound/soc/samsung/dma.h  |  3 +++
 sound/soc/samsung/i2s.c  |  2 +-
 sound/soc/samsung/pcm.c  | 18 +++++++++--------
 5 files changed, 38 insertions(+), 44 deletions(-)

diff --git a/sound/soc/samsung/ac97.c b/sound/soc/samsung/ac97.c
index 350ba23..4a88e36 100644
--- a/sound/soc/samsung/ac97.c
+++ b/sound/soc/samsung/ac97.c
@@ -221,24 +221,6 @@ static struct snd_ac97_bus_ops s3c_ac97_ops = {
 	.reset      = s3c_ac97_cold_reset,
 };
 
-static int s3c_ac97_hw_params(struct snd_pcm_substream *substream,
-				  struct snd_pcm_hw_params *params,
-				  struct snd_soc_dai *dai)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct s3c_dma_params *dma_data;
-
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		dma_data = &s3c_ac97_pcm_out;
-	else
-		dma_data = &s3c_ac97_pcm_in;
-
-	snd_soc_dai_set_dma_data(cpu_dai, substream, dma_data);
-
-	return 0;
-}
-
 static int s3c_ac97_trigger(struct snd_pcm_substream *substream, int cmd,
 				struct snd_soc_dai *dai)
 {
@@ -279,21 +261,6 @@ static int s3c_ac97_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-static int s3c_ac97_hw_mic_params(struct snd_pcm_substream *substream,
-				      struct snd_pcm_hw_params *params,
-				      struct snd_soc_dai *dai)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		return -ENODEV;
-	else
-		snd_soc_dai_set_dma_data(cpu_dai, substream, &s3c_ac97_mic_in);
-
-	return 0;
-}
-
 static int s3c_ac97_mic_trigger(struct snd_pcm_substream *substream,
 				    int cmd, struct snd_soc_dai *dai)
 {
@@ -329,15 +296,27 @@ static int s3c_ac97_mic_trigger(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops s3c_ac97_dai_ops = {
-	.hw_params	= s3c_ac97_hw_params,
 	.trigger	= s3c_ac97_trigger,
 };
 
 static const struct snd_soc_dai_ops s3c_ac97_mic_dai_ops = {
-	.hw_params	= s3c_ac97_hw_mic_params,
 	.trigger	= s3c_ac97_mic_trigger,
 };
 
+static int s3c_ac97_dai_probe(struct snd_soc_dai *dai)
+{
+	samsung_asoc_init_dma_data(dai, &s3c_ac97_pcm_out, &s3c_ac97_pcm_in);
+
+	return 0;
+}
+
+static int s3c_ac97_mic_dai_probe(struct snd_soc_dai *dai)
+{
+	samsung_asoc_init_dma_data(dai, NULL, &s3c_ac97_mic_in);
+
+	return 0;
+}
+
 static struct snd_soc_dai_driver s3c_ac97_dai[] = {
 	[S3C_AC97_DAI_PCM] = {
 		.name =	"samsung-ac97",
@@ -354,6 +333,7 @@ static struct snd_soc_dai_driver s3c_ac97_dai[] = {
 			.channels_max = 2,
 			.rates = SNDRV_PCM_RATE_8000_48000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,},
+		.probe = s3c_ac97_dai_probe,
 		.ops = &s3c_ac97_dai_ops,
 	},
 	[S3C_AC97_DAI_MIC] = {
@@ -365,6 +345,7 @@ static struct snd_soc_dai_driver s3c_ac97_dai[] = {
 			.channels_max = 1,
 			.rates = SNDRV_PCM_RATE_8000_48000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,},
+		.probe = s3c_ac97_mic_dai_probe,
 		.ops = &s3c_ac97_mic_dai_ops,
 	},
 };
diff --git a/sound/soc/samsung/dma.c b/sound/soc/samsung/dma.c
index fe2748b..ee23194 100644
--- a/sound/soc/samsung/dma.c
+++ b/sound/soc/samsung/dma.c
@@ -441,6 +441,14 @@ static struct snd_soc_platform_driver samsung_asoc_platform = {
 	.pcm_free	= dma_free_dma_buffers,
 };
 
+void samsung_asoc_init_dma_data(struct snd_soc_dai *dai,
+				struct s3c_dma_params *playback,
+				struct s3c_dma_params *capture)
+{
+	snd_soc_dai_init_dma_data(dai, playback, capture);
+}
+EXPORT_SYMBOL_GPL(samsung_asoc_init_dma_data);
+
 int samsung_asoc_dma_platform_register(struct device *dev)
 {
 	return snd_soc_register_platform(dev, &samsung_asoc_platform);
diff --git a/sound/soc/samsung/dma.h b/sound/soc/samsung/dma.h
index 0e86315..fb09a1c 100644
--- a/sound/soc/samsung/dma.h
+++ b/sound/soc/samsung/dma.h
@@ -22,6 +22,9 @@ struct s3c_dma_params {
 	char *ch_name;
 };
 
+void samsung_asoc_init_dma_data(struct snd_soc_dai *dai,
+				struct s3c_dma_params *playback,
+				struct s3c_dma_params *capture);
 int samsung_asoc_dma_platform_register(struct device *dev);
 void samsung_asoc_dma_platform_unregister(struct device *dev);
 
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index a5cbdb4..67d9fa9 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -963,7 +963,7 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 	}
 	clk_prepare_enable(i2s->clk);
 
-	snd_soc_dai_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);
+	samsung_asoc_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);
 
 	if (other) {
 		other->addr = i2s->addr;
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index e54256f..6a5e4bf 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -275,7 +275,6 @@ static int s3c_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(rtd->cpu_dai);
-	struct s3c_dma_params *dma_data;
 	void __iomem *regs = pcm->regs;
 	struct clk *clk;
 	int sclk_div, sync_div;
@@ -284,13 +283,6 @@ static int s3c_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	dev_dbg(pcm->dev, "Entered %s\n", __func__);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		dma_data = pcm->dma_playback;
-	else
-		dma_data = pcm->dma_capture;
-
-	snd_soc_dai_set_dma_data(rtd->cpu_dai, substream, dma_data);
-
 	/* Strictly check for sample size */
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
@@ -461,10 +453,20 @@ static const struct snd_soc_dai_ops s3c_pcm_dai_ops = {
 	.set_fmt	= s3c_pcm_set_fmt,
 };
 
+static int s3c_pcm_dai_probe(struct snd_soc_dai *dai)
+{
+	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(dai);
+
+	snd_soc_dai_init_dma_data(dai, pcm->dma_playback, pcm->dma_capture);
+
+	return 0;
+}
+
 #define S3C_PCM_RATES  SNDRV_PCM_RATE_8000_96000
 
 #define S3C_PCM_DAI_DECLARE			\
 	.symmetric_rates = 1,					\
+	.probe = s3c_pcm_dai_probe,				\
 	.ops = &s3c_pcm_dai_ops,				\
 	.playback = {						\
 		.channels_min	= 2,				\
-- 
1.8.4.3
