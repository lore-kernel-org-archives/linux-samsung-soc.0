From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/2] ASoC: Revert
 "Drop SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag"
Date: Fri, 28 Oct 2016 18:05:07 +0200
Message-ID: <1477670708-471-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55318 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752947AbcJ1QFX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Oct 2016 12:05:23 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OFR033OUM0UHQC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 29 Oct 2016 01:05:20 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, linux-samsung-soc@vger.kernel.org
Cc: lars@metafoo.de, lgirdwood@gmail.com, alsa-devel@alsa-project.org, arnd@arndb.de, b.zolnierkie@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This reverts commit c6644119a3f80ea644bde10009d5e1013b5aff29 and
restores the ability to specify DMA channel names per DAI dma_data.
Unfortunately the functionality removed in the patch being reverted
cannot be entirely replaced by DMA channel names specified in
struct snd_dmaengine_pcm_config as that doesn't cover devices with
more than 2 DMA channels.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 include/sound/dmaengine_pcm.h         |  6 ++++++
 sound/soc/soc-generic-dmaengine-pcm.c | 12 +++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index 1c8f9e1..67be244 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -71,6 +71,7 @@ struct dma_chan *snd_dmaengine_pcm_request_channel(dma_filter_fn filter_fn,
  * @slave_id: Slave requester id for the DMA channel.
  * @filter_data: Custom DMA channel filter data, this will usually be used when
  * requesting the DMA channel.
+ * @chan_name: Custom channel name to use when requesting DMA channel.
  * @fifo_size: FIFO size of the DAI controller in bytes
  * @flags: PCM_DAI flags, only SND_DMAENGINE_PCM_DAI_FLAG_PACK for now
  */
@@ -80,6 +81,7 @@ struct snd_dmaengine_dai_dma_data {
 	u32 maxburst;
 	unsigned int slave_id;
 	void *filter_data;
+	const char *chan_name;
 	unsigned int fifo_size;
 	unsigned int flags;
 };
@@ -105,6 +107,10 @@ void snd_dmaengine_pcm_set_config_from_dai_data(
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
index 17eb149..d537864 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -263,6 +263,7 @@ static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
 	struct dmaengine_pcm *pcm = soc_platform_to_pcm(rtd->platform);
 	const struct snd_dmaengine_pcm_config *config = pcm->config;
 	struct device *dev = rtd->platform->dev;
+	struct snd_dmaengine_dai_dma_data *dma_data;
 	struct snd_pcm_substream *substream;
 	size_t prealloc_buffer_size;
 	size_t max_buffer_size;
@@ -282,6 +283,13 @@ static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
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
@@ -350,7 +358,9 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
 	const char *name;
 	struct dma_chan *chan;
 
-	if ((pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_DT) || !dev->of_node)
+	if ((pcm->flags & (SND_DMAENGINE_PCM_FLAG_NO_DT |
+			   SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME)) ||
+	    !dev->of_node)
 		return 0;
 
 	if (config && config->dma_dev) {
-- 
1.9.1
