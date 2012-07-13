From: Guenter Roeck <linux@roeck-us.net>
Subject: [sachin.kamat@linaro.org: [PATCH] hwmon: exynos4_tmu: Use devm_*
 functions]
Date: Fri, 13 Jul 2012 09:58:06 -0700
Message-ID: <20120713165806.GA10558@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:58337 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933344Ab2GMQ6I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 12:58:08 -0400
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Amit Daniel Kachhap' <amit.daniel@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Fyi.

Guenter

----- Forwarded message from Sachin Kamat <sachin.kamat@linaro.org> -----

Date: Fri, 13 Jul 2012 14:16:27 +0530
From: Sachin Kamat <sachin.kamat@linaro.org>
To: lm-sensors@lm-sensors.org
Cc: khali@linux-fr.org, linux@roeck-us.net, sachin.kamat@linaro.org, patches@linaro.org
Subject: [PATCH] hwmon: exynos4_tmu: Use devm_* functions
X-Mailer: git-send-email 1.7.4.1

devm_* functions are used to replace kzalloc, request_mem_region, ioremap
and request_irq functions in probe call. With the usage of devm_* functions
explicit freeing and unmapping is not required.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/hwmon/exynos4_tmu.c |   44 ++++++++----------------------------------
 1 files changed, 9 insertions(+), 35 deletions(-)

diff --git a/drivers/hwmon/exynos4_tmu.c b/drivers/hwmon/exynos4_tmu.c
index e912059..ee6e26c 100644
--- a/drivers/hwmon/exynos4_tmu.c
+++ b/drivers/hwmon/exynos4_tmu.c
@@ -356,7 +356,8 @@ static int __devinit exynos4_tmu_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	data = kzalloc(sizeof(struct exynos4_tmu_data), GFP_KERNEL);
+	data = devm_kzalloc(&pdev->dev, sizeof(struct exynos4_tmu_data),
+								GFP_KERNEL);
 	if (!data) {
 		dev_err(&pdev->dev, "Failed to allocate driver structure\n");
 		return -ENOMEM;
@@ -364,48 +365,36 @@ static int __devinit exynos4_tmu_probe(struct platform_device *pdev)
 
 	data->irq = platform_get_irq(pdev, 0);
 	if (data->irq < 0) {
-		ret = data->irq;
 		dev_err(&pdev->dev, "Failed to get platform irq\n");
-		goto err_free;
+		return data->irq;
 	}
 
 	INIT_WORK(&data->irq_work, exynos4_tmu_work);
 
 	data->mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!data->mem) {
-		ret = -ENOENT;
 		dev_err(&pdev->dev, "Failed to get platform resource\n");
-		goto err_free;
+		return -ENOENT;
 	}
 
-	data->mem = request_mem_region(data->mem->start,
-			resource_size(data->mem), pdev->name);
-	if (!data->mem) {
-		ret = -ENODEV;
-		dev_err(&pdev->dev, "Failed to request memory region\n");
-		goto err_free;
-	}
-
-	data->base = ioremap(data->mem->start, resource_size(data->mem));
+	data->base = devm_request_and_ioremap(&pdev->dev, data->mem);
 	if (!data->base) {
-		ret = -ENODEV;
 		dev_err(&pdev->dev, "Failed to ioremap memory\n");
-		goto err_mem_region;
+		return -ENODEV;
 	}
 
-	ret = request_irq(data->irq, exynos4_tmu_irq,
+	ret = devm_request_irq(&pdev->dev, data->irq, exynos4_tmu_irq,
 		IRQF_TRIGGER_RISING,
 		"exynos4-tmu", data);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request irq: %d\n", data->irq);
-		goto err_io_remap;
+		return ret;
 	}
 
 	data->clk = clk_get(NULL, "tmu_apbif");
 	if (IS_ERR(data->clk)) {
-		ret = PTR_ERR(data->clk);
 		dev_err(&pdev->dev, "Failed to get clock\n");
-		goto err_irq;
+		return PTR_ERR(data->clk);
 	}
 
 	data->pdata = pdata;
@@ -440,14 +429,6 @@ err_create_group:
 err_clk:
 	platform_set_drvdata(pdev, NULL);
 	clk_put(data->clk);
-err_irq:
-	free_irq(data->irq, data);
-err_io_remap:
-	iounmap(data->base);
-err_mem_region:
-	release_mem_region(data->mem->start, resource_size(data->mem));
-err_free:
-	kfree(data);
 
 	return ret;
 }
@@ -463,15 +444,8 @@ static int __devexit exynos4_tmu_remove(struct platform_device *pdev)
 
 	clk_put(data->clk);
 
-	free_irq(data->irq, data);
-
-	iounmap(data->base);
-	release_mem_region(data->mem->start, resource_size(data->mem));
-
 	platform_set_drvdata(pdev, NULL);
 
-	kfree(data);
-
 	return 0;
 }
 
-- 
1.7.4.1



----- End forwarded message -----
