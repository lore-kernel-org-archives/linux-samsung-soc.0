From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 08/15] pinctrl: samsung: Hold pointer to driver data in bank
 struct
Date: Thu, 11 Oct 2012 10:11:14 +0200
Message-ID: <1349943081-27939-9-git-send-email-t.figa@samsung.com>
References: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12530 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932450Ab2JKIMK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Oct 2012 04:12:10 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBP005P8YRAMOI0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Oct 2012 17:12:09 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBP005FVYR04E50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Oct 2012 17:12:09 +0900 (KST)
In-reply-to: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, tony@atomide.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This patch is a preparation for converting the pinctrl-samsung driver to
one GPIO chip and IRQ domain per bank. It allows one having only
a pointer to particular bank struct to access driver data struct.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 drivers/pinctrl/pinctrl-samsung.c | 18 ++++++++++--------
 drivers/pinctrl/pinctrl-samsung.h |  2 ++
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index f266710..53493c3 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -789,17 +789,18 @@ static const struct of_device_id samsung_pinctrl_dt_match[];
 
 /* retrieve the soc specific data */
 static struct samsung_pin_ctrl *samsung_pinctrl_get_soc_data(
+				struct samsung_pinctrl_drv_data *d,
 				struct platform_device *pdev)
 {
 	int id;
 	const struct of_device_id *match;
-	const struct device_node *node = pdev->dev.of_node;
+	struct device_node *node = pdev->dev.of_node;
 	struct device_node *np;
 	struct samsung_pin_ctrl *ctrl;
 	struct samsung_pin_bank *bank;
 	int i;
 
-	id = of_alias_get_id(pdev->dev.of_node, "pinctrl");
+	id = of_alias_get_id(node, "pinctrl");
 	if (id < 0) {
 		dev_err(&pdev->dev, "failed to get alias id\n");
 		return NULL;
@@ -809,6 +810,7 @@ static struct samsung_pin_ctrl *samsung_pinctrl_get_soc_data(
 
 	bank = ctrl->pin_banks;
 	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
+		bank->drvdata = d;
 		bank->pin_base = ctrl->nr_pins;
 		ctrl->nr_pins += bank->nr_pins;
 		if (bank->eint_type == EINT_TYPE_GPIO) {
@@ -848,18 +850,18 @@ static int __devinit samsung_pinctrl_probe(struct platform_device *pdev)
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
+	ctrl = samsung_pinctrl_get_soc_data(drvdata, pdev);
+	if (!ctrl) {
+		dev_err(&pdev->dev, "driver data not available\n");
+		return -EINVAL;
+	}
 	drvdata->ctrl = ctrl;
 	drvdata->dev = dev;
 
diff --git a/drivers/pinctrl/pinctrl-samsung.h b/drivers/pinctrl/pinctrl-samsung.h
index 5c53f32..ea5dadd 100644
--- a/drivers/pinctrl/pinctrl-samsung.h
+++ b/drivers/pinctrl/pinctrl-samsung.h
@@ -112,6 +112,7 @@ struct samsung_pinctrl_drv_data;
  * @irq_base: starting controller local irq number of the bank.
  * @name: name to be prefixed for each pin in this pin bank.
  * @of_node: OF node of the bank.
+ * @drvdata: link to controller driver data
  */
 struct samsung_pin_bank {
 	u32		pctl_offset;
@@ -126,6 +127,7 @@ struct samsung_pin_bank {
 	u32		irq_base;
 	char		*name;
 	struct device_node *of_node;
+	struct samsung_pinctrl_drv_data *drvdata;
 };
 
 /**
-- 
1.7.12
