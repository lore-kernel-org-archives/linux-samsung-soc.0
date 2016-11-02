From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: pcm: Conversion to use devm_ioremap_resource()
Date: Wed, 02 Nov 2016 12:28:17 +0100
Message-ID: <1478086097-24523-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:41058 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750763AbcKBL2d (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Nov 2016 07:28:33 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OG001TEDIJIJB30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Nov 2016 20:28:30 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: krzk@kernel.org, m.szyprowski@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This simplifies the code a bit and removes a hard coded IO memory
region size.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/pcm.c | 60 +++++++++++++------------------------------------
 1 file changed, 16 insertions(+), 44 deletions(-)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index c484985..d50a637 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -499,13 +499,6 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 
 	pcm_pdata = pdev->dev.platform_data;
 
-	/* Check for availability of necessary resource */
-	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem_res) {
-		dev_err(&pdev->dev, "Unable to get register resource\n");
-		return -ENXIO;
-	}
-
 	if (pcm_pdata && pcm_pdata->cfg_gpio && pcm_pdata->cfg_gpio(pdev)) {
 		dev_err(&pdev->dev, "Unable to configure gpio\n");
 		return -EINVAL;
@@ -519,36 +512,26 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 	/* Default is 128fs */
 	pcm->sclk_per_fs = 128;
 
+	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	pcm->regs = devm_ioremap_resource(&pdev->dev, mem_res);
+	if (IS_ERR(pcm->regs))
+		return PTR_ERR(pcm->regs);
+
 	pcm->cclk = devm_clk_get(&pdev->dev, "audio-bus");
 	if (IS_ERR(pcm->cclk)) {
-		dev_err(&pdev->dev, "failed to get audio-bus\n");
-		ret = PTR_ERR(pcm->cclk);
-		goto err1;
+		dev_err(&pdev->dev, "failed to get audio-bus clock\n");
+		return PTR_ERR(pcm->cclk);
 	}
 	clk_prepare_enable(pcm->cclk);
 
 	/* record our pcm structure for later use in the callbacks */
 	dev_set_drvdata(&pdev->dev, pcm);
 
-	if (!request_mem_region(mem_res->start,
-				resource_size(mem_res), "samsung-pcm")) {
-		dev_err(&pdev->dev, "Unable to request register region\n");
-		ret = -EBUSY;
-		goto err2;
-	}
-
-	pcm->regs = ioremap(mem_res->start, 0x100);
-	if (pcm->regs == NULL) {
-		dev_err(&pdev->dev, "cannot ioremap registers\n");
-		ret = -ENXIO;
-		goto err3;
-	}
-
 	pcm->pclk = devm_clk_get(&pdev->dev, "pcm");
 	if (IS_ERR(pcm->pclk)) {
-		dev_err(&pdev->dev, "failed to get pcm_clock\n");
-		ret = -ENOENT;
-		goto err4;
+		dev_err(&pdev->dev, "failed to get pcm clock\n");
+		ret = PTR_ERR(pcm->pclk);
+		goto err_dis_cclk;
 	}
 	clk_prepare_enable(pcm->pclk);
 
@@ -569,7 +552,7 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 						 NULL, NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to get register DMA: %d\n", ret);
-		goto err5;
+		goto err_dis_pclk;
 	}
 
 	pm_runtime_enable(&pdev->dev);
@@ -578,36 +561,25 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 					 &s3c_pcm_dai[pdev->id], 1);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "failed to get register DAI: %d\n", ret);
-		goto err6;
+		goto err_dis_pm;
 	}
 
 	return 0;
-err6:
+
+err_dis_pm:
 	pm_runtime_disable(&pdev->dev);
-err5:
+err_dis_pclk:
 	clk_disable_unprepare(pcm->pclk);
-err4:
-	iounmap(pcm->regs);
-err3:
-	release_mem_region(mem_res->start, resource_size(mem_res));
-err2:
+err_dis_cclk:
 	clk_disable_unprepare(pcm->cclk);
-err1:
 	return ret;
 }
 
 static int s3c_pcm_dev_remove(struct platform_device *pdev)
 {
 	struct s3c_pcm_info *pcm = &s3c_pcm[pdev->id];
-	struct resource *mem_res;
 
 	pm_runtime_disable(&pdev->dev);
-
-	iounmap(pcm->regs);
-
-	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	release_mem_region(mem_res->start, resource_size(mem_res));
-
 	clk_disable_unprepare(pcm->cclk);
 	clk_disable_unprepare(pcm->pclk);
 
-- 
1.9.1
