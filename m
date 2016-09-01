From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] pinctrl: samsung: Remove an always false dev->of_node test
Date: Thu, 01 Sep 2016 13:59:00 +0200
Message-ID: <1472731140-18034-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41103 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932232AbcIAMA0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 08:00:26 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linus.walleij@linaro.org
Cc: tomasz.figa@gmail.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

samsung_pinctrl_probe() can be called only after matching
the driver by the compatible string so this already implies
a non null dev->of_node.  Remove the always false test
and related error trace. While at it drop another error log
in case of memory allocation failure - any errors are logged
by the memory subsystem.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 513fe6b..620727f 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1041,17 +1041,9 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret;
 
-	if (!dev->of_node) {
-		dev_err(dev, "device tree node not found\n");
-		return -ENODEV;
-	}
-
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata) {
-		dev_err(dev, "failed to allocate memory for driver's "
-				"private data\n");
+	if (!drvdata)
 		return -ENOMEM;
-	}
 
 	ctrl = samsung_pinctrl_get_soc_data(drvdata, pdev);
 	if (IS_ERR(ctrl)) {
-- 
1.9.1
