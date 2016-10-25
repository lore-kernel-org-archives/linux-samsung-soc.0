From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 2/4] ASoC: Drop SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME
 flag
Date: Tue, 25 Oct 2016 17:08:39 +0200
Message-ID: <1477408121-24716-2-git-send-email-s.nawrocki@samsung.com>
References: <1477408121-24716-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:38221 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941856AbcJYPJC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Oct 2016 11:09:02 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OFL00Y05ZEN2190@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Oct 2016 00:09:01 +0900 (KST)
In-reply-to: <1477408121-24716-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: krzk@kernel.org, lgirdwood@gmail.com, lars@metafoo.de, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Since commit 194c7dea00c68c1b1f8ff26304fa937a006f66dd
"ASoC: dmaengine: add custom DMA config to snd_dmaengine_pcm_config"
custom DMA channels can be also specified in chan_names[] field of
struct snd_dmaengine_pcm_config.  This patch removes chan_name field
of struct snd_dmaengine_dai_dma_data as it is now unused.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - the framework code changes put in a separate (this) patch.

 include/sound/dmaengine_pcm.h         |  6 ------
 sound/soc/soc-generic-dmaengine-pcm.c | 13 +------------
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index 67be244..1c8f9e1 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -71,7 +71,6 @@ struct dma_chan *snd_dmaengine_pcm_request_channel(dma_filter_fn filter_fn,
  * @slave_id: Slave requester id for the DMA channel.
  * @filter_data: Custom DMA channel filter data, this will usually be used when
  * requesting the DMA channel.
- * @chan_name: Custom channel name to use when requesting DMA channel.
  * @fifo_size: FIFO size of the DAI controller in bytes
  * @flags: PCM_DAI flags, only SND_DMAENGINE_PCM_DAI_FLAG_PACK for now
  */
@@ -81,7 +80,6 @@ struct snd_dmaengine_dai_dma_data {
 	u32 maxburst;
 	unsigned int slave_id;
 	void *filter_data;
-	const char *chan_name;
 	unsigned int fifo_size;
 	unsigned int flags;
 };
@@ -107,10 +105,6 @@ void snd_dmaengine_pcm_set_config_from_dai_data(
  * playback.
  */
 #define SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX BIT(3)
-/*
- * The PCM streams have custom channel names specified.
- */
-#define SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME BIT(4)

 /**
  * struct snd_dmaengine_pcm_config - Configuration data for dmaengine based PCM
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 6cef397..17eb149 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -263,7 +263,6 @@ static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
 	struct dmaengine_pcm *pcm = soc_platform_to_pcm(rtd->platform);
 	const struct snd_dmaengine_pcm_config *config = pcm->config;
 	struct device *dev = rtd->platform->dev;
-	struct snd_dmaengine_dai_dma_data *dma_data;
 	struct snd_pcm_substream *substream;
 	size_t prealloc_buffer_size;
 	size_t max_buffer_size;
@@ -278,19 +277,11 @@ static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
 		max_buffer_size = SIZE_MAX;
 	}

-
 	for (i = SNDRV_PCM_STREAM_PLAYBACK; i <= SNDRV_PCM_STREAM_CAPTURE; i++) {
 		substream = rtd->pcm->streams[i].substream;
 		if (!substream)
 			continue;

-		dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
-
-		if (!pcm->chan[i] &&
-		    (pcm->flags & SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME))
-			pcm->chan[i] = dma_request_slave_channel(dev,
-				dma_data->chan_name);
-
 		if (!pcm->chan[i] && (pcm->flags & SND_DMAENGINE_PCM_FLAG_COMPAT)) {
 			pcm->chan[i] = dmaengine_pcm_compat_request_channel(rtd,
 				substream);
@@ -359,9 +350,7 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
 	const char *name;
 	struct dma_chan *chan;

-	if ((pcm->flags & (SND_DMAENGINE_PCM_FLAG_NO_DT |
-			   SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME)) ||
-	    !dev->of_node)
+	if ((pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_DT) || !dev->of_node)
 		return 0;

 	if (config && config->dma_dev) {
--
1.9.1
