From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 08/16] pinctrl: samsung: Hold pointer to driver data in bank
 struct
Date: Mon, 08 Oct 2012 10:39:08 +0200
Message-ID: <1349685556-23718-9-git-send-email-t.figa@samsung.com>
References: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49549 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753971Ab2JHIkE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Oct 2012 04:40:04 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBK00J1IFZAC2S0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 17:40:04 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBK0094QG1I1U90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 17:40:03 +0900 (KST)
In-reply-to: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

The pointer will be used by further extensions added to the driver.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 drivers/pinctrl/pinctrl-samsung.c | 20 +++++++++++---------
 drivers/pinctrl/pinctrl-samsung.h |  2 ++
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index c988a4e..63c76ec 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -870,11 +870,12 @@ static int samsung_pinctrl_parse_dt_bank(struct samsung_pin_bank *bank,
 
 /* retrieve the soc specific data */
 static struct samsung_pin_ctrl *samsung_pinctrl_get_soc_data(
-				struct platform_device *pdev)
+					struct platform_device *pdev,
+					struct samsung_pinctrl_drv_data *d)
 {
 	int id;
 	const struct of_device_id *match;
-	const struct device_node *node = pdev->dev.of_node;
+	struct device_node *node = pdev->dev.of_node;
 	struct device_node *bank_np;
 	struct samsung_pin_ctrl *ctrl;
 	struct samsung_pin_bank *banks, *b;
@@ -884,7 +885,7 @@ static struct samsung_pin_ctrl *samsung_pinctrl_get_soc_data(
 	u32 val;
 	int ret;
 
-	id = of_alias_get_id(pdev->dev.of_node, "pinctrl");
+	id = of_alias_get_id(node, "pinctrl");
 	if (id < 0) {
 		dev_err(&pdev->dev, "failed to get alias id\n");
 		return NULL;
@@ -922,6 +923,7 @@ static struct samsung_pin_ctrl *samsung_pinctrl_get_soc_data(
 			continue;
 		if (samsung_pinctrl_parse_dt_bank(b, bank_np))
 			return NULL;
+		b->drvdata = d;
 		b->pin_base = ctrl->nr_pins;
 		ctrl->nr_pins += b->nr_pins;
 		if (b->eint_type == EINT_TYPE_GPIO) {
@@ -979,18 +981,18 @@ static int __devinit samsung_pinctrl_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ctrl = samsung_pinctrl_get_soc_data(pdev);
-	if (!ctrl) {
-		dev_err(&pdev->dev, "driver data not available\n");
-		return -EINVAL;
-	}
-
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata) {
 		dev_err(dev, "failed to allocate memory for driver's "
 				"private data\n");
 		return -ENOMEM;
 	}
+
+	ctrl = samsung_pinctrl_get_soc_data(pdev, drvdata);
+	if (!ctrl) {
+		dev_err(&pdev->dev, "driver data not available\n");
+		return -EINVAL;
+	}
 	drvdata->ctrl = ctrl;
 	drvdata->dev = dev;
 
diff --git a/drivers/pinctrl/pinctrl-samsung.h b/drivers/pinctrl/pinctrl-samsung.h
index b7b74cc..9e30081 100644
--- a/drivers/pinctrl/pinctrl-samsung.h
+++ b/drivers/pinctrl/pinctrl-samsung.h
@@ -112,6 +112,7 @@ struct samsung_pinctrl_drv_data;
  * @irq_base: starting controller local irq number of the bank.
  * @name: name to be prefixed for each pin in this pin bank.
  * @of_node: node of pin bank in device tree
+ * @drvdata: link to controller driver data
  */
 struct samsung_pin_bank {
 	u32		pctl_offset;
@@ -128,6 +129,7 @@ struct samsung_pin_bank {
 	const char	*name;
 
 	struct device_node *of_node;
+	struct samsung_pinctrl_drv_data *drvdata;
 };
 
 /**
-- 
1.7.12
