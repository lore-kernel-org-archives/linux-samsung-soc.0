From: Mark Brown <broonie@linaro.org>
Subject: [PATCH 2/2] ASoC: samsung-ac97: Convert to devm_ioremap_resource()
Date: Wed, 26 Jun 2013 10:37:43 +0100
Message-ID: <1372239463-14603-2-git-send-email-broonie@linaro.org>
References: <1372239463-14603-1-git-send-email-broonie@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:37098 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752093Ab3FZJhx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Jun 2013 05:37:53 -0400
In-Reply-To: <1372239463-14603-1-git-send-email-broonie@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@linaro.org>

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 sound/soc/samsung/ac97.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/sound/soc/samsung/ac97.c b/sound/soc/samsung/ac97.c
index 1c85999..3e6a1d2 100644
--- a/sound/soc/samsung/ac97.c
+++ b/sound/soc/samsung/ac97.c
@@ -417,8 +417,8 @@ static int s3c_ac97_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	if (!request_mem_region(mem_res->start,
-				resource_size(mem_res), "ac97")) {
+	s3c_ac97.regs = devm_ioremap_resource(&pdev->dev, mem_res);
+	if (!s3c_ac97.regs) {
 		dev_err(&pdev->dev, "Unable to request register region\n");
 		return -EBUSY;
 	}
@@ -433,13 +433,6 @@ static int s3c_ac97_probe(struct platform_device *pdev)
 	init_completion(&s3c_ac97.done);
 	mutex_init(&s3c_ac97.lock);
 
-	s3c_ac97.regs = ioremap(mem_res->start, resource_size(mem_res));
-	if (s3c_ac97.regs == NULL) {
-		dev_err(&pdev->dev, "Unable to ioremap register region\n");
-		ret = -ENXIO;
-		goto err1;
-	}
-
 	s3c_ac97.ac97_clk = devm_clk_get(&pdev->dev, "ac97");
 	if (IS_ERR(s3c_ac97.ac97_clk)) {
 		dev_err(&pdev->dev, "ac97 failed to get ac97_clock\n");
@@ -481,16 +474,13 @@ err4:
 err3:
 	clk_disable_unprepare(s3c_ac97.ac97_clk);
 err2:
-	iounmap(s3c_ac97.regs);
-err1:
-	release_mem_region(mem_res->start, resource_size(mem_res));
 
 	return ret;
 }
 
 static int s3c_ac97_remove(struct platform_device *pdev)
 {
-	struct resource *mem_res, *irq_res;
+	struct resource *irq_res;
 
 	asoc_dma_platform_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
@@ -501,12 +491,6 @@ static int s3c_ac97_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(s3c_ac97.ac97_clk);
 
-	iounmap(s3c_ac97.regs);
-
-	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (mem_res)
-		release_mem_region(mem_res->start, resource_size(mem_res));
-
 	return 0;
 }
 
-- 
1.8.3.1
