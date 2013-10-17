From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 4/8] clk: max77686: Make max77686_clk_register() return struct
 clk *
Date: Thu, 17 Oct 2013 18:30:38 +0200
Message-ID: <1382027442-1992-5-git-send-email-t.figa@samsung.com>
References: <1382027442-1992-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51885 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757830Ab3JQQbD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 12:31:03 -0400
In-reply-to: <1382027442-1992-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

As a preparation for further patches, this patch modifies the clock
registration helper function to return a pointer to the newly registered
clock. No functional change is done to the driver.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/clk-max77686.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-max77686.c b/drivers/clk/clk-max77686.c
index 5d78460..2e6ba0e 100644
--- a/drivers/clk/clk-max77686.c
+++ b/drivers/clk/clk-max77686.c
@@ -112,27 +112,26 @@ static struct clk_init_data max77686_clks_init[MAX77686_CLKS_NUM] = {
 	},
 };
 
-static int max77686_clk_register(struct device *dev,
+static struct clk *max77686_clk_register(struct device *dev,
 				struct max77686_clk *max77686)
 {
 	struct clk *clk;
 	struct clk_hw *hw = &max77686->hw;
 
 	clk = clk_register(dev, hw);
-
 	if (IS_ERR(clk))
-		return -ENOMEM;
+		return clk;
 
 	max77686->lookup = kzalloc(sizeof(struct clk_lookup), GFP_KERNEL);
 	if (!max77686->lookup)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	max77686->lookup->con_id = hw->init->name;
 	max77686->lookup->clk = clk;
 
 	clkdev_add(max77686->lookup);
 
-	return 0;
+	return clk;
 }
 
 static int max77686_clk_probe(struct platform_device *pdev)
@@ -154,12 +153,16 @@ static int max77686_clk_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < MAX77686_CLKS_NUM; i++) {
+		struct clk *clk;
+
 		max77686_clks[i]->iodev = iodev;
 		max77686_clks[i]->mask = 1 << i;
 		max77686_clks[i]->hw.init = &max77686_clks_init[i];
 
-		ret = max77686_clk_register(&pdev->dev, max77686_clks[i]);
-		if (ret) {
+		clk = max77686_clk_register(&pdev->dev, max77686_clks[i]);
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
+
 			switch (i) {
 			case MAX77686_CLK_AP:
 				dev_err(&pdev->dev, "Fail to register CLK_AP\n");
-- 
1.8.3.2
