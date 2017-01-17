From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/2] ASoC: Revert
 "samsung: Remove unneeded initialization of chan_name"
Date: Tue, 17 Jan 2017 14:16:42 +0100
Message-ID: <1484659002-20200-2-git-send-email-s.nawrocki@samsung.com>
References: <1484659002-20200-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20170117131720epcas1p46266c1038aec2af3e6db23b8314212e6@epcas1p4.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33529 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750892AbdAQNR0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Jan 2017 08:17:26 -0500
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OJX00IK2E8XDQ60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Jan 2017 22:17:21 +0900 (KST)
In-reply-to: <1484659002-20200-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, lars@metafoo.de, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This reverts commit cdaf9af1eaeb539e32bfd6da6310b41ad6c3ba23
which breaks I2S support on the non-DT Samsung SoC platforms,
since the default "tx", "rx" DMA channel names for playback
and capture streams or custom channel names in struct
snd_dmaengine_pcm_config are supported in the ASoC dmaengine
module only for devicetree booting case.

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
index e00974b..85324e6 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1305,6 +1305,8 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	}
 	pri_dai->dma_playback.addr = regs_base + I2STXD;
 	pri_dai->dma_capture.addr = regs_base + I2SRXD;
+	pri_dai->dma_playback.chan_name = "tx";
+	pri_dai->dma_capture.chan_name = "rx";
 	pri_dai->dma_playback.addr_width = 4;
 	pri_dai->dma_capture.addr_width = 4;
 	pri_dai->quirks = quirks;
@@ -1329,6 +1331,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		sec_dai->lock = &pri_dai->spinlock;
 		sec_dai->variant_regs = pri_dai->variant_regs;
 		sec_dai->dma_playback.addr = regs_base + I2STXDS;
+		sec_dai->dma_playback.chan_name = "tx-sec";

 		if (!np) {
 			sec_dai->dma_playback.filter_data = i2s_pdata->dma_play_sec;
diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index 6d0b889..0a47182 100644
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
index 07f5091..91e6871 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -31,10 +31,12 @@
 #include "s3c24xx-i2s.h"

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
