From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH] usb: dwc3 dwc3_exynos_probe() change goto labels to meaningful names
Date: Wed, 11 Jan 2017 09:45:37 -0700
Message-ID: <20170111164537.2981-1-shuahkh@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:40129
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751165AbdAKQpn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Jan 2017 11:45:43 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@kernel.org, gregkh@linuxfoundation.org, kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Change goto labels to meaningful names from a series of errNs.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 drivers/usb/dwc3/dwc3-exynos.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index f7421c2..ea50f74 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -147,53 +147,53 @@ static int dwc3_exynos_probe(struct platform_device *pdev)
 	exynos->vdd33 = devm_regulator_get(dev, "vdd33");
 	if (IS_ERR(exynos->vdd33)) {
 		ret = PTR_ERR(exynos->vdd33);
-		goto err2;
+		goto vdd33_err;
 	}
 	ret = regulator_enable(exynos->vdd33);
 	if (ret) {
 		dev_err(dev, "Failed to enable VDD33 supply\n");
-		goto err2;
+		goto vdd33_err;
 	}
 
 	exynos->vdd10 = devm_regulator_get(dev, "vdd10");
 	if (IS_ERR(exynos->vdd10)) {
 		ret = PTR_ERR(exynos->vdd10);
-		goto err3;
+		goto vdd10_err;
 	}
 	ret = regulator_enable(exynos->vdd10);
 	if (ret) {
 		dev_err(dev, "Failed to enable VDD10 supply\n");
-		goto err3;
+		goto vdd10_err;
 	}
 
 	ret = dwc3_exynos_register_phys(exynos);
 	if (ret) {
 		dev_err(dev, "couldn't register PHYs\n");
-		goto err4;
+		goto phys_err;
 	}
 
 	if (node) {
 		ret = of_platform_populate(node, NULL, NULL, dev);
 		if (ret) {
 			dev_err(dev, "failed to add dwc3 core\n");
-			goto err5;
+			goto populate_err;
 		}
 	} else {
 		dev_err(dev, "no device node, failed to add dwc3 core\n");
 		ret = -ENODEV;
-		goto err5;
+		goto populate_err;
 	}
 
 	return 0;
 
-err5:
+populate_err:
 	platform_device_unregister(exynos->usb2_phy);
 	platform_device_unregister(exynos->usb3_phy);
-err4:
+phys_err:
 	regulator_disable(exynos->vdd10);
-err3:
+vdd10_err:
 	regulator_disable(exynos->vdd33);
-err2:
+vdd33_err:
 	clk_disable_unprepare(exynos->axius_clk);
 axius_clk_err:
 	clk_disable_unprepare(exynos->susp_clk);
-- 
2.7.4
