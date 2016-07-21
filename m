From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: Specify DMA channels through struct snd_dmaengine_pcm_config" to the asoc tree
Date: Thu, 21 Jul 2016 19:31:44 +0100
Message-ID: <E1bQIl6-00012s-UB@debutante>
References: <1469124230-8583-3-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:41996 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751928AbcGUSb4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 14:31:56 -0400
In-Reply-To: <1469124230-8583-3-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mark Brown <broonie@kernel.org>broonie@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, k.kozlowski@samsung.com, b.zolnierkie@samsung.com

The patch

   ASoC: samsung: Specify DMA channels through struct snd_dmaengine_pcm_config

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

>From 42a74e77471ea42e6ab44e5be16723ede72b9901 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Thu, 21 Jul 2016 20:03:50 +0200
Subject: [PATCH] ASoC: samsung: Specify DMA channels through struct
 snd_dmaengine_pcm_config

The DMA channel names are specified through struct snd_dmaengine_pcm_config
rather than using SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag when
booting with devicetree in order to properly support deferred probing.
Without this change the sound machine driver initialization can complete
successfully with unavailable DMA resources.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
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
index 4a7a503fe13c..547d31032088 100644
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
index a7616cc9b39e..3830f297e0b6 100644
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
index 063125937311..2c87f380bfc4 100644
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
index 2bb35502b070..50635ee8ff20 100644
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
index 498f563a4c9c..490c1a87fd66 100644
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
index 204029d12f5b..d45dffb297d8 100644
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
index b3a475d73ba7..3e76f2a75a24 100644
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
index 4687f521197c..0cb9c8567546 100644
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
2.8.1
