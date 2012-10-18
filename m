From: Eunki Kim <eunki_kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: use devm_ functions for ADC driver
Date: Thu, 18 Oct 2012 16:28:32 +0900
Message-ID: <001701cdad02$2d511200$87f33600$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39171 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751042Ab2JRH2e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Oct 2012 03:28:34 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MC2000VLVFCO3O0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 18 Oct 2012 16:28:32 +0900 (KST)
Received: from DOEUNKIKIM03 ([12.23.118.132])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MC200ET0VFKCKB1@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 18 Oct 2012 16:28:32 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, eunki_kim@samsung.com

This patch uses devm_* functions for probe function in ADC driver.
It reduces code size and simplifies the code.

Signed-off-by: Eunki Kim <eunki_kim@samsung.com>
---
 arch/arm/plat-samsung/adc.c |   48 +++++++++++-------------------------------
 1 files changed, 13 insertions(+), 35 deletions(-)

diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
index b1e05cc..37542c2 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -344,7 +344,7 @@ static int s3c_adc_probe(struct platform_device *pdev)
 	int ret;
 	unsigned tmp;
 
-	adc = kzalloc(sizeof(struct adc_device), GFP_KERNEL);
+	adc = devm_kzalloc(dev, sizeof(struct adc_device), GFP_KERNEL);
 	if (adc == NULL) {
 		dev_err(dev, "failed to allocate adc_device\n");
 		return -ENOMEM;
@@ -355,50 +355,46 @@ static int s3c_adc_probe(struct platform_device *pdev)
 	adc->pdev = pdev;
 	adc->prescale = S3C2410_ADCCON_PRSCVL(49);
 
-	adc->vdd = regulator_get(dev, "vdd");
+	adc->vdd = devm_regulator_get(dev, "vdd");
 	if (IS_ERR(adc->vdd)) {
 		dev_err(dev, "operating without regulator \"vdd\" .\n");
-		ret = PTR_ERR(adc->vdd);
-		goto err_alloc;
+		return PTR_ERR(adc->vdd);
 	}
 
 	adc->irq = platform_get_irq(pdev, 1);
 	if (adc->irq <= 0) {
 		dev_err(dev, "failed to get adc irq\n");
-		ret = -ENOENT;
-		goto err_reg;
+		return -ENOENT;
 	}
 
-	ret = request_irq(adc->irq, s3c_adc_irq, 0, dev_name(dev), adc);
+	ret = devm_request_irq(dev, adc->irq, s3c_adc_irq, 0, dev_name(dev),
+				adc);
 	if (ret < 0) {
 		dev_err(dev, "failed to attach adc irq\n");
-		goto err_reg;
+		return ret;
 	}
 
-	adc->clk = clk_get(dev, "adc");
+	adc->clk = devm_clk_get(dev, "adc");
 	if (IS_ERR(adc->clk)) {
 		dev_err(dev, "failed to get adc clock\n");
-		ret = PTR_ERR(adc->clk);
-		goto err_irq;
+		return PTR_ERR(adc->clk);
 	}
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!regs) {
 		dev_err(dev, "failed to find registers\n");
-		ret = -ENXIO;
-		goto err_clk;
+		return -ENXIO;
 	}
 
-	adc->regs = ioremap(regs->start, resource_size(regs));
+	adc->regs = devm_request_and_ioremap(dev, regs);
 	if (!adc->regs) {
 		dev_err(dev, "failed to map registers\n");
-		ret = -ENXIO;
-		goto err_clk;
+		return -ENXIO;
 	}
 
 	ret = regulator_enable(adc->vdd);
 	if (ret)
-		goto err_ioremap;
+		return ret;
 
 	clk_enable(adc->clk);
 
@@ -418,32 +414,14 @@ static int s3c_adc_probe(struct platform_device *pdev)
 	adc_dev = adc;
 
 	return 0;
-
- err_ioremap:
-	iounmap(adc->regs);
- err_clk:
-	clk_put(adc->clk);
-
- err_irq:
-	free_irq(adc->irq, adc);
- err_reg:
-	regulator_put(adc->vdd);
- err_alloc:
-	kfree(adc);
-	return ret;
 }
 
 static int __devexit s3c_adc_remove(struct platform_device *pdev)
 {
 	struct adc_device *adc = platform_get_drvdata(pdev);
 
-	iounmap(adc->regs);
-	free_irq(adc->irq, adc);
 	clk_disable(adc->clk);
 	regulator_disable(adc->vdd);
-	regulator_put(adc->vdd);
-	clk_put(adc->clk);
-	kfree(adc);
 
 	return 0;
 }
-- 
1.7.1
