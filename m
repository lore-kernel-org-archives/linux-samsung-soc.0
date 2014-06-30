From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] ARM: Samsung: ADC: Move to clk_prepare_enable/clk_disable_unprepare
Date: Mon, 30 Jun 2014 22:08:08 +0300
Message-ID: <1404155288-2787-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:41002 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753797AbaF3TKi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 15:10:38 -0400
Received: by mail-wg0-f47.google.com with SMTP id k14so8699821wgh.30
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jun 2014 12:10:36 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Use clk_prepare_enable/clk_disable_unprepare to make the driver
work properly with common clock framework.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm/plat-samsung/adc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
index 79690f2..c5831b49 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -389,7 +389,7 @@ static int s3c_adc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	clk_enable(adc->clk);
+	clk_prepare_enable(adc->clk);
 
 	tmp = adc->prescale | S3C2410_ADCCON_PRSCEN;
 
@@ -413,7 +413,7 @@ static int s3c_adc_remove(struct platform_device *pdev)
 {
 	struct adc_device *adc = platform_get_drvdata(pdev);
 
-	clk_disable(adc->clk);
+	clk_disable_unprepare(adc->clk);
 	regulator_disable(adc->vdd);
 
 	return 0;
@@ -436,7 +436,7 @@ static int s3c_adc_suspend(struct device *dev)
 
 	disable_irq(adc->irq);
 	spin_unlock_irqrestore(&adc->lock, flags);
-	clk_disable(adc->clk);
+	clk_disable_unprepare(adc->clk);
 	regulator_disable(adc->vdd);
 
 	return 0;
@@ -454,7 +454,7 @@ static int s3c_adc_resume(struct device *dev)
 	ret = regulator_enable(adc->vdd);
 	if (ret)
 		return ret;
-	clk_enable(adc->clk);
+	clk_prepare_enable(adc->clk);
 	enable_irq(adc->irq);
 
 	tmp = adc->prescale | S3C2410_ADCCON_PRSCEN;
-- 
2.0.0
