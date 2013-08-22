From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ASoC: samsung: Fix build error with dma function rename
Date: Thu, 22 Aug 2013 18:15:02 +0530
Message-ID: <1377175502-6169-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:40168 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752255Ab3HVNCV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 09:02:21 -0400
Received: by mail-pd0-f177.google.com with SMTP id y10so1843001pdj.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2013 06:02:21 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: broonie@kernel.org, patches@linaro.org

commit 85ff3c29d720 ("ASoC: samsung: Rename DMA platform registration
functions") renames the DMA registration functions. Fix the places where
it was left out.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 sound/soc/samsung/pcm.c         |    4 ++--
 sound/soc/samsung/s3c2412-i2s.c |    4 ++--
 sound/soc/samsung/s3c24xx-i2s.c |    4 ++--
 sound/soc/samsung/spdif.c       |    4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 1566afe..e54256f 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -594,7 +594,7 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 		goto err5;
 	}
 
-	ret = asoc_dma_platform_register(&pdev->dev);
+	ret = samsung_asoc_dma_platform_register(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to get register DMA: %d\n", ret);
 		goto err6;
@@ -623,7 +623,7 @@ static int s3c_pcm_dev_remove(struct platform_device *pdev)
 	struct s3c_pcm_info *pcm = &s3c_pcm[pdev->id];
 	struct resource *mem_res;
 
-	asoc_dma_platform_unregister(&pdev->dev);
+	samsung_asoc_dma_platform_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
 
 	pm_runtime_disable(&pdev->dev);
diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index 47e2386..ea885cb 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -176,7 +176,7 @@ static int s3c2412_iis_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = asoc_dma_platform_register(&pdev->dev);
+	ret = samsung_asoc_dma_platform_register(&pdev->dev);
 	if (ret) {
 		pr_err("failed to register the DMA: %d\n", ret);
 		goto err;
@@ -190,7 +190,7 @@ err:
 
 static int s3c2412_iis_dev_remove(struct platform_device *pdev)
 {
-	asoc_dma_platform_unregister(&pdev->dev);
+	samsung_asoc_dma_platform_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
 	return 0;
 }
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 8b34145..9c8ebd8 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -480,7 +480,7 @@ static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = asoc_dma_platform_register(&pdev->dev);
+	ret = samsung_asoc_dma_platform_register(&pdev->dev);
 	if (ret) {
 		pr_err("failed to register the dma: %d\n", ret);
 		goto err;
@@ -494,7 +494,7 @@ err:
 
 static int s3c24xx_iis_dev_remove(struct platform_device *pdev)
 {
-	asoc_dma_platform_unregister(&pdev->dev);
+	samsung_asoc_dma_platform_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
 	return 0;
 }
diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 5ea70ab..28487dc 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -442,7 +442,7 @@ static int spdif_probe(struct platform_device *pdev)
 
 	spdif->dma_playback = &spdif_stereo_out;
 
-	ret = asoc_dma_platform_register(&pdev->dev);
+	ret = samsung_asoc_dma_platform_register(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register DMA: %d\n", ret);
 		goto err5;
@@ -468,7 +468,7 @@ static int spdif_remove(struct platform_device *pdev)
 	struct samsung_spdif_info *spdif = &spdif_info;
 	struct resource *mem_res;
 
-	asoc_dma_platform_unregister(&pdev->dev);
+	samsung_asoc_dma_platform_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
 
 	iounmap(spdif->regs);
-- 
1.7.9.5
