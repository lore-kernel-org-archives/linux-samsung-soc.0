From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/2] ASoC: samsung: Specify DMA channels through struct
 snd_dmaengine_pcm_config
Date: Thu, 21 Jul 2016 20:03:50 +0200
Message-ID: <1469124230-8583-3-git-send-email-s.nawrocki@samsung.com>
References: <1469124230-8583-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39047 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884AbcGUSFA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 14:05:00 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OAO02BU6FHGTQ40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Jul 2016 03:04:58 +0900 (KST)
In-reply-to: <1469124230-8583-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

The DMA channel names are specified through struct snd_dmaengine_pcm_config
rather than using SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag when
booting with devicetree in order to properly support deferred probing.
Without this change the sound machine driver initialization can complete
successfully with unavailable DMA resources.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/ac97.c        |  3 ++-
 sound/soc/samsung/dma.h         |  9 ++++++---
 sound/soc/samsung/dmaengine.c   | 31 ++++++++++++++++++++-----------
 sound/soc/samsung/i2s.c         |  5 +++--
 sound/soc/samsung/pcm.c         |  3 ++-
 sound/soc/samsung/s3c2412-i2s.c |  3 ++-
 sound/soc/samsung/s3c24xx-i2s.c |  3 ++-
 sound/soc/samsung/spdif.c       |  3 ++-
 8 files changed, 39 insertions(+), 21 deletions(-)

diff --git a/sound/soc/samsung/ac97.c b/sound/soc/samsung/ac97.c
index 4a7a503..547d310 100644
--- a/sound/soc/samsung/ac97.c
+++ b/sound/soc/samsung/ac97.c
@@ -389,7 +389,8 @@ static int s3c_ac97_probe(struct platform_device *pdev)
 		goto err5;
 
 	ret = samsung_asoc_dma_platform_register(&pdev->dev,
-						 ac97_pdata->dma_filter);
+						 ac97_pdata->dma_filter,
+						 NULL, NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to get register DMA: %d\n", ret);
 		goto err5;
diff --git a/sound/soc/samsung/dma.h b/sound/soc/samsung/dma.h
index a7616cc..3830f29 100644
--- a/sound/soc/samsung/dma.h
+++ b/sound/soc/samsung/dma.h
@@ -26,7 +26,10 @@ struct s3c_dma_params {
 void samsung_asoc_init_dma_data(struct snd_soc_dai *dai,
 				struct s3c_dma_params *playback,
 				struct s3c_dma_params *capture);
-int samsung_asoc_dma_platform_register(struct device *dev,
-				       dma_filter_fn fn);
-
+/*
+ * @tx, @rx arguments can be NULL if the DMA channel names are "tx", "rx",
+ * otherwise actual DMA channel names must be passed to this function.
+ */
+int samsung_asoc_dma_platform_register(struct device *dev, dma_filter_fn filter,
+				       const char *tx, const char *rx);
 #endif
diff --git a/sound/soc/samsung/dmaengine.c b/sound/soc/samsung/dmaengine.c
index 0631259..2c87f38 100644
--- a/sound/soc/samsung/dmaengine.c
+++ b/sound/soc/samsung/dmaengine.c
@@ -28,10 +28,6 @@
 
 #include "dma.h"
 
-static struct snd_dmaengine_pcm_config samsung_dmaengine_pcm_config = {
-	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
-};
-
 void samsung_asoc_init_dma_data(struct snd_soc_dai *dai,
 				struct s3c_dma_params *playback,
 				struct s3c_dma_params *capture)
@@ -58,15 +54,28 @@ void samsung_asoc_init_dma_data(struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(samsung_asoc_init_dma_data);
 
-int samsung_asoc_dma_platform_register(struct device *dev,
-				       dma_filter_fn filter)
+int samsung_asoc_dma_platform_register(struct device *dev, dma_filter_fn filter,
+				       const char *tx, const char *rx)
 {
-	samsung_dmaengine_pcm_config.compat_filter_fn = filter;
+	unsigned int flags = SND_DMAENGINE_PCM_FLAG_COMPAT;
+
+	struct snd_dmaengine_pcm_config *pcm_conf;
+
+	pcm_conf = devm_kzalloc(dev, sizeof(*pcm_conf), GFP_KERNEL);
+	if (!pcm_conf)
+		return -ENOMEM;
+
+	pcm_conf->prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config;
+	pcm_conf->compat_filter_fn = filter;
+
+	if (dev->of_node) {
+		pcm_conf->chan_names[SNDRV_PCM_STREAM_PLAYBACK] = tx;
+		pcm_conf->chan_names[SNDRV_PCM_STREAM_CAPTURE] = rx;
+	} else {
+		flags |= SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME;
+	}
 
-	return devm_snd_dmaengine_pcm_register(dev,
-			&samsung_dmaengine_pcm_config,
-			SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME |
-			SND_DMAENGINE_PCM_FLAG_COMPAT);
+	return devm_snd_dmaengine_pcm_register(dev, pcm_conf, flags);
 }
 EXPORT_SYMBOL_GPL(samsung_asoc_dma_platform_register);
 
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 2bb3550..50635ee 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1244,7 +1244,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 			return ret;
 
 		return samsung_asoc_dma_platform_register(&pdev->dev,
-							  sec_dai->filter);
+					sec_dai->filter, "tx-sec", NULL);
 	}
 
 	pri_dai = i2s_alloc_dai(pdev, false);
@@ -1351,7 +1351,8 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_free_dai;
 
-	ret = samsung_asoc_dma_platform_register(&pdev->dev, pri_dai->filter);
+	ret = samsung_asoc_dma_platform_register(&pdev->dev, pri_dai->filter,
+						 NULL, NULL);
 	if (ret < 0)
 		goto err_free_dai;
 
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 498f563..490c1a8 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -576,7 +576,8 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 		goto err5;
 	}
 
-	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter);
+	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
+						 NULL, NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to get register DMA: %d\n", ret);
 		goto err5;
diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index 204029d..d45dffb 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -177,7 +177,8 @@ static int s3c2412_iis_dev_probe(struct platform_device *pdev)
 	}
 
 	ret = samsung_asoc_dma_platform_register(&pdev->dev,
-						 pdata->dma_filter);
+						 pdata->dma_filter,
+						 NULL, NULL);
 	if (ret)
 		pr_err("failed to register the DMA: %d\n", ret);
 
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index b3a475d..3e76f2a 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -482,7 +482,8 @@ static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
 	}
 
 	ret = samsung_asoc_dma_platform_register(&pdev->dev,
-						 pdata->dma_filter);
+						 pdata->dma_filter,
+						 NULL, NULL);
 	if (ret)
 		pr_err("failed to register the dma: %d\n", ret);
 
diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 4687f52..0cb9c85 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -435,7 +435,8 @@ static int spdif_probe(struct platform_device *pdev)
 
 	spdif->dma_playback = &spdif_stereo_out;
 
-	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter);
+	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
+						 NULL, NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register DMA: %d\n", ret);
 		goto err4;
-- 
1.9.1
