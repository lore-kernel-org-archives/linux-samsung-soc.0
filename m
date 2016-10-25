From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/3] ASoC: Drop SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag
Date: Tue, 25 Oct 2016 12:56:29 +0200
Message-ID: <1477392991-10604-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45151 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965652AbcJYK4y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Oct 2016 06:56:54 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OFL00LUNNQO1Q10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 Oct 2016 19:56:52 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Since commit 194c7dea00c68c1b1f8ff26304fa937a006f66dd
"ASoC: dmaengine: add custom DMA config to snd_dmaengine_pcm_config"
custom DMA channels can be also specified in chan_names[] field of
struct snd_dmaengine_pcm_config.  This patch drops chan_name field
of struct snd_dmaengine_dai_dma_data and makes soc-generic-dmaengine-pcm
module using config->chan_names instead.  Remaining users of struct
snd_dmaengine_dai_dma_data::chan_name are updated to not require
that field.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 include/sound/dmaengine_pcm.h         |  6 ------
 sound/soc/samsung/dmaengine.c         |  8 ++------
 sound/soc/samsung/i2s.c               |  3 ---
 sound/soc/samsung/s3c2412-i2s.c       |  2 --
 sound/soc/samsung/s3c24xx-i2s.c       |  2 --
 sound/soc/soc-generic-dmaengine-pcm.c | 12 +++---------
 6 files changed, 5 insertions(+), 28 deletions(-)

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
diff --git a/sound/soc/samsung/dmaengine.c b/sound/soc/samsung/dmaengine.c
index 9104c98..cda656e 100644
--- a/sound/soc/samsung/dmaengine.c
+++ b/sound/soc/samsung/dmaengine.c
@@ -37,12 +37,8 @@ int samsung_asoc_dma_platform_register(struct device *dev, dma_filter_fn filter,
 	pcm_conf->prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config;
 	pcm_conf->compat_filter_fn = filter;
 
-	if (dev->of_node) {
-		pcm_conf->chan_names[SNDRV_PCM_STREAM_PLAYBACK] = tx;
-		pcm_conf->chan_names[SNDRV_PCM_STREAM_CAPTURE] = rx;
-	} else {
-		flags |= SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME;
-	}
+	pcm_conf->chan_names[SNDRV_PCM_STREAM_PLAYBACK] = tx;
+	pcm_conf->chan_names[SNDRV_PCM_STREAM_CAPTURE] = rx;
 
 	return devm_snd_dmaengine_pcm_register(dev, pcm_conf, flags);
 }
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 588aa01..e06aa31 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1305,8 +1305,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	}
 	pri_dai->dma_playback.addr = regs_base + I2STXD;
 	pri_dai->dma_capture.addr = regs_base + I2SRXD;
-	pri_dai->dma_playback.chan_name = "tx";
-	pri_dai->dma_capture.chan_name = "rx";
 	pri_dai->dma_playback.addr_width = 4;
 	pri_dai->dma_capture.addr_width = 4;
 	pri_dai->quirks = quirks;
@@ -1326,7 +1324,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		sec_dai->lock = &pri_dai->spinlock;
 		sec_dai->variant_regs = pri_dai->variant_regs;
 		sec_dai->dma_playback.addr = regs_base + I2STXDS;
-		sec_dai->dma_playback.chan_name = "tx-sec";
 
 		if (!np) {
 			sec_dai->dma_playback.filter_data = i2s_pdata->dma_play_sec;
diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index 3e89fbc..40331a0 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -35,12 +35,10 @@
 #include <linux/platform_data/asoc-s3c.h>
 
 static struct snd_dmaengine_dai_dma_data s3c2412_i2s_pcm_stereo_out = {
-	.chan_name	= "tx",
 	.addr_width	= 4,
 };
 
 static struct snd_dmaengine_dai_dma_data s3c2412_i2s_pcm_stereo_in = {
-	.chan_name	= "rx",
 	.addr_width	= 4,
 };
 
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index c78a936..d59a47d 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -33,12 +33,10 @@
 #include <linux/platform_data/asoc-s3c.h>
 
 static struct snd_dmaengine_dai_dma_data s3c24xx_i2s_pcm_stereo_out = {
-	.chan_name	= "tx",
 	.addr_width	= 2,
 };
 
 static struct snd_dmaengine_dai_dma_data s3c24xx_i2s_pcm_stereo_in = {
-	.chan_name	= "rx",
 	.addr_width	= 2,
 };
 
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 6cef397..f2d372d 100644
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
@@ -284,12 +283,9 @@ static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
 		if (!substream)
 			continue;
 
-		dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
-
-		if (!pcm->chan[i] &&
-		    (pcm->flags & SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME))
+		if (!pcm->chan[i] && config->chan_names[i])
 			pcm->chan[i] = dma_request_slave_channel(dev,
-				dma_data->chan_name);
+				config->chan_names[i]);
 
 		if (!pcm->chan[i] && (pcm->flags & SND_DMAENGINE_PCM_FLAG_COMPAT)) {
 			pcm->chan[i] = dmaengine_pcm_compat_request_channel(rtd,
@@ -359,9 +355,7 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
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
