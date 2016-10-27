From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ASoC: samsung: get access to DMA engine early to defer probe
 properly
Date: Thu, 27 Oct 2016 12:34:02 +0200
Message-ID: <1477564442-19772-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20161027103418eucas1p1628aa0c578b8470d537abaa92c6bf10c@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:24435 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S942400AbcJ0Opa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 10:45:30 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OFP007MYC17L420@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Oct 2016 11:34:19 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

ASoC Samsung sub-drivers tried to get access to their DMA engine
controllers as a last step in driver probe. If a DMA engine was not
available yet, samsung_asoc_dma_platform_register() function ended in
-EPROBE_DEFER, but the driver already registered its component to ASoC
core. This patch moves samsung_asoc_dma_platform_register() call before
registering any components, to the common place, where driver was gathering
all needed resources.

In case of Samsung Exynos i2s driver the issue was even worse. The driver
managed already to register its secondary DAI platform device before
even getting the DMA engine access. That together with -EPROBE_DEFER error
code from samsung_i2s_probe() immediately triggered another round of
deferred probe retry and in turn endless loop of driver probing.

This patch fixes broken boot on Odroid XU3 and other Exynos5422-based
boards.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 sound/soc/samsung/ac97.c        | 10 +++++-----
 sound/soc/samsung/i2s.c         | 19 ++++++++++---------
 sound/soc/samsung/pcm.c         | 19 ++++++++++---------
 sound/soc/samsung/s3c2412-i2s.c | 16 ++++++++--------
 sound/soc/samsung/s3c24xx-i2s.c | 14 +++++++-------
 sound/soc/samsung/spdif.c       | 14 +++++++-------
 6 files changed, 47 insertions(+), 45 deletions(-)

diff --git a/sound/soc/samsung/ac97.c b/sound/soc/samsung/ac97.c
index 97d6700b1009..cbc0023c2bc8 100644
--- a/sound/soc/samsung/ac97.c
+++ b/sound/soc/samsung/ac97.c
@@ -383,11 +383,6 @@ static int s3c_ac97_probe(struct platform_device *pdev)
 		goto err4;
 	}
 
-	ret = devm_snd_soc_register_component(&pdev->dev, &s3c_ac97_component,
-					 s3c_ac97_dai, ARRAY_SIZE(s3c_ac97_dai));
-	if (ret)
-		goto err5;
-
 	ret = samsung_asoc_dma_platform_register(&pdev->dev,
 						 ac97_pdata->dma_filter,
 						 NULL, NULL);
@@ -396,6 +391,11 @@ static int s3c_ac97_probe(struct platform_device *pdev)
 		goto err5;
 	}
 
+	ret = devm_snd_soc_register_component(&pdev->dev, &s3c_ac97_component,
+					 s3c_ac97_dai, ARRAY_SIZE(s3c_ac97_dai));
+	if (ret)
+		goto err5;
+
 	return 0;
 err5:
 	free_irq(irq_res->start, NULL);
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 7e32cf4581f8..7825bff45ae3 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1237,14 +1237,14 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Unable to get drvdata\n");
 			return -EFAULT;
 		}
-		ret = devm_snd_soc_register_component(&sec_dai->pdev->dev,
-						&samsung_i2s_component,
-						&sec_dai->i2s_dai_drv, 1);
+		ret = samsung_asoc_dma_platform_register(&pdev->dev,
+					sec_dai->filter, "tx-sec", NULL);
 		if (ret != 0)
 			return ret;
 
-		return samsung_asoc_dma_platform_register(&pdev->dev,
-					sec_dai->filter, "tx-sec", NULL);
+		return devm_snd_soc_register_component(&sec_dai->pdev->dev,
+						&samsung_i2s_component,
+						&sec_dai->i2s_dai_drv, 1);
 	}
 
 	pri_dai = i2s_alloc_dai(pdev, false);
@@ -1314,6 +1314,11 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	if (quirks & QUIRK_PRI_6CHAN)
 		pri_dai->i2s_dai_drv.playback.channels_max = 6;
 
+	ret = samsung_asoc_dma_platform_register(&pdev->dev, pri_dai->filter,
+						 NULL, NULL);
+	if (ret < 0)
+		goto err_disable_clk;
+
 	if (quirks & QUIRK_SEC_DAI) {
 		sec_dai = i2s_alloc_dai(pdev, true);
 		if (!sec_dai) {
@@ -1353,10 +1358,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_free_dai;
 
-	ret = samsung_asoc_dma_platform_register(&pdev->dev, pri_dai->filter,
-						 NULL, NULL);
-	if (ret < 0)
-		goto err_free_dai;
 
 	pm_runtime_enable(&pdev->dev);
 
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 43e367a9acc3..c484985812ed 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -565,24 +565,25 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 	pcm->dma_capture = &s3c_pcm_stereo_in[pdev->id];
 	pcm->dma_playback = &s3c_pcm_stereo_out[pdev->id];
 
+	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
+						 NULL, NULL);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to get register DMA: %d\n", ret);
+		goto err5;
+	}
+
 	pm_runtime_enable(&pdev->dev);
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &s3c_pcm_component,
 					 &s3c_pcm_dai[pdev->id], 1);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "failed to get register DAI: %d\n", ret);
-		goto err5;
-	}
-
-	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
-						 NULL, NULL);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to get register DMA: %d\n", ret);
-		goto err5;
+		goto err6;
 	}
 
 	return 0;
-
+err6:
+	pm_runtime_disable(&pdev->dev);
 err5:
 	clk_disable_unprepare(pcm->pclk);
 err4:
diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index 3e89fbc0c51d..0a4718207e6e 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -168,19 +168,19 @@ static int s3c2412_iis_dev_probe(struct platform_device *pdev)
 	s3c2412_i2s_pcm_stereo_in.addr = res->start + S3C2412_IISRXD;
 	s3c2412_i2s_pcm_stereo_in.filter_data = pdata->dma_capture;
 
-	ret = s3c_i2sv2_register_component(&pdev->dev, -1,
-					   &s3c2412_i2s_component,
-					   &s3c2412_i2s_dai);
+	ret = samsung_asoc_dma_platform_register(&pdev->dev,
+						 pdata->dma_filter,
+						 NULL, NULL);
 	if (ret) {
-		pr_err("failed to register the dai\n");
+		pr_err("failed to register the DMA: %d\n", ret);
 		return ret;
 	}
 
-	ret = samsung_asoc_dma_platform_register(&pdev->dev,
-						 pdata->dma_filter,
-						 NULL, NULL);
+	ret = s3c_i2sv2_register_component(&pdev->dev, -1,
+					   &s3c2412_i2s_component,
+					   &s3c2412_i2s_dai);
 	if (ret)
-		pr_err("failed to register the DMA: %d\n", ret);
+		pr_err("failed to register the dai\n");
 
 	return ret;
 }
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index c78a936a3099..9052f6a7073e 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -474,18 +474,18 @@ static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
 	s3c24xx_i2s_pcm_stereo_in.addr = res->start + S3C2410_IISFIFO;
 	s3c24xx_i2s_pcm_stereo_in.filter_data = pdata->dma_capture;
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-			&s3c24xx_i2s_component, &s3c24xx_i2s_dai, 1);
+	ret = samsung_asoc_dma_platform_register(&pdev->dev,
+						 pdata->dma_filter,
+						 NULL, NULL);
 	if (ret) {
-		pr_err("failed to register the dai\n");
+		pr_err("failed to register the dma: %d\n", ret);
 		return ret;
 	}
 
-	ret = samsung_asoc_dma_platform_register(&pdev->dev,
-						 pdata->dma_filter,
-						 NULL, NULL);
+	ret = devm_snd_soc_register_component(&pdev->dev,
+			&s3c24xx_i2s_component, &s3c24xx_i2s_dai, 1);
 	if (ret)
-		pr_err("failed to register the dma: %d\n", ret);
+		pr_err("failed to register the dai\n");
 
 	return ret;
 }
diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 26c1fbed4d35..704b7b12bf8b 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -416,6 +416,13 @@ static int spdif_probe(struct platform_device *pdev)
 		goto err3;
 	}
 
+	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
+						 NULL, NULL);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register DMA: %d\n", ret);
+		goto err4;
+	}
+
 	dev_set_drvdata(&pdev->dev, spdif);
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
@@ -435,13 +442,6 @@ static int spdif_probe(struct platform_device *pdev)
 
 	spdif->dma_playback = &spdif_stereo_out;
 
-	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
-						 NULL, NULL);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register DMA: %d\n", ret);
-		goto err4;
-	}
-
 	return 0;
 err4:
 	iounmap(spdif->regs);
-- 
1.9.1
