From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: samsung: Rename DMA platform registration functions
Date: Mon, 19 Aug 2013 22:59:57 +0100
Message-ID: <1376949597-28470-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:47245 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750900Ab3HSWAH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Aug 2013 18:00:07 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

The current naming with a simple asoc_ prefix is too generic for use in
multiplatform kernels.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 sound/soc/samsung/ac97.c | 4 ++--
 sound/soc/samsung/dma.c  | 8 ++++----
 sound/soc/samsung/dma.h  | 4 ++--
 sound/soc/samsung/i2s.c  | 6 +++---
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/samsung/ac97.c b/sound/soc/samsung/ac97.c
index c732df9..2acf987 100644
--- a/sound/soc/samsung/ac97.c
+++ b/sound/soc/samsung/ac97.c
@@ -457,7 +457,7 @@ static int s3c_ac97_probe(struct platform_device *pdev)
 	if (ret)
 		goto err5;
 
-	ret = asoc_dma_platform_register(&pdev->dev);
+	ret = samsung_asoc_dma_platform_register(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to get register DMA: %d\n", ret);
 		goto err6;
@@ -480,7 +480,7 @@ static int s3c_ac97_remove(struct platform_device *pdev)
 {
 	struct resource *irq_res;
 
-	asoc_dma_platform_unregister(&pdev->dev);
+	samsung_asoc_dma_platform_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
 
 	irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
diff --git a/sound/soc/samsung/dma.c b/sound/soc/samsung/dma.c
index d54df85..9338d11 100644
--- a/sound/soc/samsung/dma.c
+++ b/sound/soc/samsung/dma.c
@@ -444,17 +444,17 @@ static struct snd_soc_platform_driver samsung_asoc_platform = {
 	.pcm_free	= dma_free_dma_buffers,
 };
 
-int asoc_dma_platform_register(struct device *dev)
+int samsung_asoc_dma_platform_register(struct device *dev)
 {
 	return snd_soc_register_platform(dev, &samsung_asoc_platform);
 }
-EXPORT_SYMBOL_GPL(asoc_dma_platform_register);
+EXPORT_SYMBOL_GPL(samsung_asoc_dma_platform_register);
 
-void asoc_dma_platform_unregister(struct device *dev)
+void samsung_asoc_dma_platform_unregister(struct device *dev)
 {
 	snd_soc_unregister_platform(dev);
 }
-EXPORT_SYMBOL_GPL(asoc_dma_platform_unregister);
+EXPORT_SYMBOL_GPL(samsung_asoc_dma_platform_unregister);
 
 MODULE_AUTHOR("Ben Dooks, <ben@simtec.co.uk>");
 MODULE_DESCRIPTION("Samsung ASoC DMA Driver");
diff --git a/sound/soc/samsung/dma.h b/sound/soc/samsung/dma.h
index 189a7a6..0e86315 100644
--- a/sound/soc/samsung/dma.h
+++ b/sound/soc/samsung/dma.h
@@ -22,7 +22,7 @@ struct s3c_dma_params {
 	char *ch_name;
 };
 
-int asoc_dma_platform_register(struct device *dev);
-void asoc_dma_platform_unregister(struct device *dev);
+int samsung_asoc_dma_platform_register(struct device *dev);
+void samsung_asoc_dma_platform_unregister(struct device *dev);
 
 #endif
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index ce487c2..b302f3b 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1146,7 +1146,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		snd_soc_register_component(&sec_dai->pdev->dev,
 					   &samsung_i2s_component,
 					   &sec_dai->i2s_dai_drv, 1);
-		asoc_dma_platform_register(&pdev->dev);
+		samsung_asoc_dma_platform_register(&pdev->dev);
 		return 0;
 	}
 
@@ -1263,7 +1263,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
-	asoc_dma_platform_register(&pdev->dev);
+	samsung_asoc_dma_platform_register(&pdev->dev);
 
 	return 0;
 err:
@@ -1293,7 +1293,7 @@ static int samsung_i2s_remove(struct platform_device *pdev)
 	i2s->pri_dai = NULL;
 	i2s->sec_dai = NULL;
 
-	asoc_dma_platform_unregister(&pdev->dev);
+	samsung_asoc_dma_platform_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
 
 	return 0;
-- 
1.8.4.rc3
