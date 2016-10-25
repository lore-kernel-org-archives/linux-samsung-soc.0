From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 1/4] ASoC: samsung: Remove unneeded initialization of
 chan_name
Date: Tue, 25 Oct 2016 17:08:38 +0200
Message-ID: <1477408121-24716-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:38221 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936330AbcJYPJA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Oct 2016 11:09:00 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OFL00Y05ZEN2190@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Oct 2016 00:08:57 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: krzk@kernel.org, lgirdwood@gmail.com, lars@metafoo.de, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch updates the I2S drivers to always use chan_names[] field
of struct snd_dmaengine_pcm_config for specifying DMA channel names,
rather than using struct snd_dmaengine_dai_dma_data.

This allows us to subsequently drop the
SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag, now when the last
use of that flag is removed.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - the framework user changes moved to a separate (this) patch.

 sound/soc/samsung/dmaengine.c   | 8 ++------
 sound/soc/samsung/i2s.c         | 3 ---
 sound/soc/samsung/s3c2412-i2s.c | 2 --
 sound/soc/samsung/s3c24xx-i2s.c | 2 --
 4 files changed, 2 insertions(+), 13 deletions(-)

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

--
1.9.1
