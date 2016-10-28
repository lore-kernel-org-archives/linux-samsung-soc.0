From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/2] ASoC: Revert
 "samsung: Remove unneeded initialization of chan_name"
Date: Fri, 28 Oct 2016 18:05:08 +0200
Message-ID: <1477670708-471-2-git-send-email-s.nawrocki@samsung.com>
References: <1477670708-471-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:46032 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755847AbcJ1QFt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Oct 2016 12:05:49 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OFR015NIM1NCSC0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 29 Oct 2016 01:05:47 +0900 (KST)
In-reply-to: <1477670708-471-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, linux-samsung-soc@vger.kernel.org
Cc: lars@metafoo.de, lgirdwood@gmail.com, alsa-devel@alsa-project.org, arnd@arndb.de, b.zolnierkie@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This reverts commit cdaf9af1eaeb539e32bfd6da6310b41ad6c3ba23
which breaks I2S support on non-DT platforms since default
"tx", "rx" DMA channel names for playback and capture streams
or custom channel names in struct snd_dmaengine_pcm_config
are supported in the ASoC dmaengine module only for DT case.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/dmaengine.c   | 8 ++++++--
 sound/soc/samsung/i2s.c         | 3 +++
 sound/soc/samsung/s3c2412-i2s.c | 2 ++
 sound/soc/samsung/s3c24xx-i2s.c | 2 ++
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/dmaengine.c b/sound/soc/samsung/dmaengine.c
index cda656e..9104c98 100644
--- a/sound/soc/samsung/dmaengine.c
+++ b/sound/soc/samsung/dmaengine.c
@@ -37,8 +37,12 @@ int samsung_asoc_dma_platform_register(struct device *dev, dma_filter_fn filter,
 	pcm_conf->prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config;
 	pcm_conf->compat_filter_fn = filter;
 
-	pcm_conf->chan_names[SNDRV_PCM_STREAM_PLAYBACK] = tx;
-	pcm_conf->chan_names[SNDRV_PCM_STREAM_CAPTURE] = rx;
+	if (dev->of_node) {
+		pcm_conf->chan_names[SNDRV_PCM_STREAM_PLAYBACK] = tx;
+		pcm_conf->chan_names[SNDRV_PCM_STREAM_CAPTURE] = rx;
+	} else {
+		flags |= SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME;
+	}
 
 	return devm_snd_dmaengine_pcm_register(dev, pcm_conf, flags);
 }
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 7a9ee48..7e32cf4 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1304,6 +1304,8 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	}
 	pri_dai->dma_playback.addr = regs_base + I2STXD;
 	pri_dai->dma_capture.addr = regs_base + I2SRXD;
+	pri_dai->dma_playback.chan_name = "tx";
+	pri_dai->dma_capture.chan_name = "rx";
 	pri_dai->dma_playback.addr_width = 4;
 	pri_dai->dma_capture.addr_width = 4;
 	pri_dai->quirks = quirks;
@@ -1323,6 +1325,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		sec_dai->lock = &pri_dai->spinlock;
 		sec_dai->variant_regs = pri_dai->variant_regs;
 		sec_dai->dma_playback.addr = regs_base + I2STXDS;
+		sec_dai->dma_playback.chan_name = "tx-sec";
 
 		if (!np) {
 			sec_dai->dma_playback.filter_data = i2s_pdata->dma_play_sec;
diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index 40331a0..3e89fbc 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -35,10 +35,12 @@
 #include <linux/platform_data/asoc-s3c.h>
 
 static struct snd_dmaengine_dai_dma_data s3c2412_i2s_pcm_stereo_out = {
+	.chan_name	= "tx",
 	.addr_width	= 4,
 };
 
 static struct snd_dmaengine_dai_dma_data s3c2412_i2s_pcm_stereo_in = {
+	.chan_name	= "rx",
 	.addr_width	= 4,
 };
 
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index d59a47d..c78a936 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -33,10 +33,12 @@
 #include <linux/platform_data/asoc-s3c.h>
 
 static struct snd_dmaengine_dai_dma_data s3c24xx_i2s_pcm_stereo_out = {
+	.chan_name	= "tx",
 	.addr_width	= 2,
 };
 
 static struct snd_dmaengine_dai_dma_data s3c24xx_i2s_pcm_stereo_in = {
+	.chan_name	= "rx",
 	.addr_width	= 2,
 };
 
-- 
1.9.1
