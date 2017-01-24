From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: Revert "Drop SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag"" to the asoc tree
Date: Tue, 24 Jan 2017 18:39:16 +0000
Message-ID: <E1cW5zw-0006YJ-6g@debutante>
References: <1477670708-471-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:34828 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750708AbdAXSjZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2017 13:39:25 -0500
In-Reply-To: <1477670708-471-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mark Brown <broonie@kernel.org>broonie@kernel.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de, arnd@arndb.de, b.zolnierkie@samsung.com, lgirdwood@gmail.comalsa-devel@alsa-project.org

The patch

   ASoC: Revert "Drop SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag"

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

>From 9bfa24e90956cc79362572391657b84cf54a559a Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Tue, 17 Jan 2017 14:16:41 +0100
Subject: [PATCH] ASoC: Revert "Drop SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME
 flag"

This reverts commit c6644119a3f80ea644bde10009d5e1013b5aff29 and
restores the ability to specify DMA channel names per DAI dma_data.
Unfortunately the functionality removed in the patch being reverted
cannot be entirely replaced by specifying DMA channel names in struct
snd_dmaengine_pcm_config as that does not cover devices with more than
2 DMA channels.

Together with patch "ASoC: Revert "samsung: Remove unneeded
initialization of chan_name"" this fixes broken sound on the s3c24xx
SoC platforms.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/dmaengine_pcm.h         |  6 ++++++
 sound/soc/soc-generic-dmaengine-pcm.c | 12 +++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index 1c8f9e1ef2a5..67be2445941a 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -71,6 +71,7 @@ struct dma_chan *snd_dmaengine_pcm_get_chan(struct snd_pcm_substream *substream)
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
index 17eb14935577..d53786498b61 100644
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
2.11.0
