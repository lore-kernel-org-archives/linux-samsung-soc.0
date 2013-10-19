From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: dmaengine: Support custom channel names
Date: Sat, 19 Oct 2013 17:43:51 +0100
Message-ID: <1382201032-13538-2-git-send-email-broonie@kernel.org>
References: <1382201032-13538-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:54710 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751401Ab3JSQoa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Oct 2013 12:44:30 -0400
In-Reply-To: <1382201032-13538-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <t.figa@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Some devices have more than just simple TX and RX DMA channels, for example
modern Samsung I2S IPs support a secondary transmit DMA stream which is
mixed into the primary stream during playback. Allow such devices to
specify the names of the channels to be requested in their dma_data.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 include/sound/dmaengine_pcm.h         |  6 ++++++
 sound/soc/soc-generic-dmaengine-pcm.c | 13 ++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index 83b2c3e..1501731 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -61,6 +61,7 @@ struct dma_chan *snd_dmaengine_pcm_get_chan(struct snd_pcm_substream *substream)
  * @slave_id: Slave requester id for the DMA channel.
  * @filter_data: Custom DMA channel filter data, this will usually be used when
  * requesting the DMA channel.
+ * @chan_name: Custom channel name to use when requesting DMA channel.
  * @fifo_size: FIFO size of the DAI controller in bytes
  */
 struct snd_dmaengine_dai_dma_data {
@@ -69,6 +70,7 @@ struct snd_dmaengine_dai_dma_data {
 	u32 maxburst;
 	unsigned int slave_id;
 	void *filter_data;
+	const char *chan_name;
 	unsigned int fifo_size;
 };
 
@@ -98,6 +100,10 @@ void snd_dmaengine_pcm_set_config_from_dai_data(
  * playback.
  */
 #define SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX BIT(3)
+/*
+ * The PCM streams have custom channel names specified.
+ */
+#define SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME BIT(4)
 
 /**
  * struct snd_dmaengine_pcm_config - Configuration data for dmaengine based PCM
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 2eea2e0..0c469cb 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -186,6 +186,8 @@ static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
 {
 	struct dmaengine_pcm *pcm = soc_platform_to_pcm(rtd->platform);
 	const struct snd_dmaengine_pcm_config *config = pcm->config;
+	struct device *dev = rtd->platform->dev;
+	struct snd_dmaengine_dai_dma_data *dma_data;
 	struct snd_pcm_substream *substream;
 	size_t prealloc_buffer_size;
 	size_t max_buffer_size;
@@ -206,6 +208,13 @@ static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
 		if (!substream)
 			continue;
 
+		dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+
+		if (!pcm->chan[i] &&
+		    (pcm->flags & SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME))
+			pcm->chan[i] = dma_request_slave_channel(dev,
+				dma_data->chan_name);
+
 		if (!pcm->chan[i] && (pcm->flags & SND_DMAENGINE_PCM_FLAG_COMPAT)) {
 			pcm->chan[i] = dmaengine_pcm_compat_request_channel(rtd,
 				substream);
@@ -278,7 +287,9 @@ static void dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
 {
 	unsigned int i;
 
-	if ((pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_DT) || !dev->of_node)
+	if ((pcm->flags & (SND_DMAENGINE_PCM_FLAG_NO_DT |
+			   SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME)) ||
+	    !dev->of_node)
 		return;
 
 	if (pcm->flags & SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX) {
-- 
1.8.4.rc3
