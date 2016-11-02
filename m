From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: spdif: Conversion to use devm_ioremap_resource()
Date: Wed, 02 Nov 2016 12:13:02 +0100
Message-ID: <1478085182-30923-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34935 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751830AbcKBLNP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Nov 2016 07:13:15 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OG000D1ZHTV0N80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Nov 2016 20:13:13 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: krzk@kernel.org, m.szyprowski@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This simplifies the code a bit and removes a hard coded IO memory
region size.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/spdif.c | 54 +++++++++++------------------------------------
 1 file changed, 12 insertions(+), 42 deletions(-)

diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 779504f..5fe214f 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -366,14 +366,6 @@ static int spdif_probe(struct platform_device *pdev)
 
 	spdif_pdata = pdev->dev.platform_data;
 
-	dev_dbg(&pdev->dev, "Entered %s\n", __func__);
-
-	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem_res) {
-		dev_err(&pdev->dev, "Unable to get register resource.\n");
-		return -ENXIO;
-	}
-
 	if (spdif_pdata && spdif_pdata->cfg_gpio
 			&& spdif_pdata->cfg_gpio(pdev)) {
 		dev_err(&pdev->dev, "Unable to configure GPIO pins\n");
@@ -385,11 +377,15 @@ static int spdif_probe(struct platform_device *pdev)
 
 	spin_lock_init(&spdif->lock);
 
+	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	spdif->regs = devm_ioremap_resource(&pdev->dev, mem_res);
+	if (IS_ERR(spdif->regs))
+		return PTR_ERR(spdif->regs);
+
 	spdif->pclk = devm_clk_get(&pdev->dev, "spdif");
 	if (IS_ERR(spdif->pclk)) {
 		dev_err(&pdev->dev, "failed to get peri-clock\n");
-		ret = -ENOENT;
-		goto err0;
+		return PTR_ERR(spdif->pclk);
 	}
 	clk_prepare_enable(spdif->pclk);
 
@@ -397,25 +393,10 @@ static int spdif_probe(struct platform_device *pdev)
 	if (IS_ERR(spdif->sclk)) {
 		dev_err(&pdev->dev, "failed to get internal source clock\n");
 		ret = -ENOENT;
-		goto err1;
+		goto err_dis_pclk;
 	}
 	clk_prepare_enable(spdif->sclk);
 
-	/* Request S/PDIF Register's memory region */
-	if (!request_mem_region(mem_res->start,
-				resource_size(mem_res), "samsung-spdif")) {
-		dev_err(&pdev->dev, "Unable to request register region\n");
-		ret = -EBUSY;
-		goto err2;
-	}
-
-	spdif->regs = ioremap(mem_res->start, 0x100);
-	if (spdif->regs == NULL) {
-		dev_err(&pdev->dev, "Cannot ioremap registers\n");
-		ret = -ENXIO;
-		goto err3;
-	}
-
 	spdif_stereo_out.addr_width = 2;
 	spdif_stereo_out.addr = mem_res->start + DATA_OUTBUF;
 	filter = NULL;
@@ -429,7 +410,7 @@ static int spdif_probe(struct platform_device *pdev)
 						 NULL, NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register DMA: %d\n", ret);
-		goto err4;
+		goto err_dis_sclk;
 	}
 
 	dev_set_drvdata(&pdev->dev, spdif);
@@ -438,32 +419,21 @@ static int spdif_probe(struct platform_device *pdev)
 			&samsung_spdif_component, &samsung_spdif_dai, 1);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "fail to register dai\n");
-		goto err4;
+		goto err_dis_sclk;
 	}
 
 	return 0;
-err4:
-	iounmap(spdif->regs);
-err3:
-	release_mem_region(mem_res->start, resource_size(mem_res));
-err2:
+
+err_dis_sclk:
 	clk_disable_unprepare(spdif->sclk);
-err1:
+err_dis_pclk:
 	clk_disable_unprepare(spdif->pclk);
-err0:
 	return ret;
 }
 
 static int spdif_remove(struct platform_device *pdev)
 {
 	struct samsung_spdif_info *spdif = &spdif_info;
-	struct resource *mem_res;
-
-	iounmap(spdif->regs);
-
-	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (mem_res)
-		release_mem_region(mem_res->start, resource_size(mem_res));
 
 	clk_disable_unprepare(spdif->sclk);
 	clk_disable_unprepare(spdif->pclk);
-- 
1.9.1
