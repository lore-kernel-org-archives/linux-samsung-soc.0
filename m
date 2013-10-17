From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 6/8] clk: max77686: Refactor driver data handling
Date: Thu, 17 Oct 2013 18:30:40 +0200
Message-ID: <1382027442-1992-7-git-send-email-t.figa@samsung.com>
References: <1382027442-1992-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51885 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757897Ab3JQQbF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 12:31:05 -0400
In-reply-to: <1382027442-1992-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

As a prerequisite for further patch adding OF clock provider support to
the driver, this patch changes the driver to store an array of struct
clk * as driver data.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/clk-max77686.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-max77686.c b/drivers/clk/clk-max77686.c
index 81b3680..3cf38dc 100644
--- a/drivers/clk/clk-max77686.c
+++ b/drivers/clk/clk-max77686.c
@@ -137,12 +137,13 @@ static struct clk *max77686_clk_register(struct device *dev,
 static int max77686_clk_probe(struct platform_device *pdev)
 {
 	struct max77686_dev *iodev = dev_get_drvdata(pdev->dev.parent);
-	struct max77686_clk **max77686_clks;
+	struct max77686_clk *max77686_clks[MAX77686_CLKS_NUM];
+	struct clk **clocks;
 	int i, ret;
 
-	max77686_clks = devm_kzalloc(&pdev->dev, sizeof(struct max77686_clk *)
+	clocks = devm_kzalloc(&pdev->dev, sizeof(struct clk *)
 					* MAX77686_CLKS_NUM, GFP_KERNEL);
-	if (!max77686_clks)
+	if (!clocks)
 		return -ENOMEM;
 
 	for (i = 0; i < MAX77686_CLKS_NUM; i++) {
@@ -153,22 +154,20 @@ static int max77686_clk_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < MAX77686_CLKS_NUM; i++) {
-		struct clk *clk;
-
 		max77686_clks[i]->iodev = iodev;
 		max77686_clks[i]->mask = 1 << i;
 		max77686_clks[i]->hw.init = &max77686_clks_init[i];
 
-		clk = max77686_clk_register(&pdev->dev, max77686_clks[i]);
-		if (IS_ERR(clk)) {
-			ret = PTR_ERR(clk);
+		clocks[i] = max77686_clk_register(&pdev->dev, max77686_clks[i]);
+		if (IS_ERR(clocks[i])) {
+			ret = PTR_ERR(clocks[i]);
 			dev_err(&pdev->dev, "failed to register %s\n",
 				max77686_clks[i]->hw.init->name);
 			goto err_clocks;
 		}
 	}
 
-	platform_set_drvdata(pdev, max77686_clks);
+	platform_set_drvdata(pdev, clocks);
 
 	return 0;
 
@@ -183,12 +182,15 @@ err_clocks:
 
 static int max77686_clk_remove(struct platform_device *pdev)
 {
-	struct max77686_clk **max77686_clks = platform_get_drvdata(pdev);
+	struct clk **clocks = platform_get_drvdata(pdev);
 	int i;
 
 	for (i = 0; i < MAX77686_CLKS_NUM; i++) {
-		clkdev_drop(max77686_clks[i]->lookup);
-		clk_unregister(max77686_clks[i]->hw.clk);
+		struct clk_hw *hw = __clk_get_hw(clocks[i]);
+		struct max77686_clk *max77686 = to_max77686_clk(hw);
+
+		clkdev_drop(max77686->lookup);
+		clk_unregister(clocks[i]);
 	}
 	return 0;
 }
-- 
1.8.3.2
