From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 5/8] clk: max77686: Fix clean-up in error and remove paths
Date: Thu, 17 Oct 2013 18:30:39 +0200
Message-ID: <1382027442-1992-6-git-send-email-t.figa@samsung.com>
References: <1382027442-1992-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51885 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757884Ab3JQQbE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 12:31:04 -0400
In-reply-to: <1382027442-1992-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch fixes invalid kfree() and adds missing call to clk_unregister()
in error and remove paths in max77686_clk_probe(). While at it, error
handling is also cleaned up.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/clk-max77686.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/clk-max77686.c b/drivers/clk/clk-max77686.c
index 2e6ba0e..81b3680 100644
--- a/drivers/clk/clk-max77686.c
+++ b/drivers/clk/clk-max77686.c
@@ -162,20 +162,9 @@ static int max77686_clk_probe(struct platform_device *pdev)
 		clk = max77686_clk_register(&pdev->dev, max77686_clks[i]);
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
-
-			switch (i) {
-			case MAX77686_CLK_AP:
-				dev_err(&pdev->dev, "Fail to register CLK_AP\n");
-				goto err_clk_ap;
-				break;
-			case MAX77686_CLK_CP:
-				dev_err(&pdev->dev, "Fail to register CLK_CP\n");
-				goto err_clk_cp;
-				break;
-			case MAX77686_CLK_PMIC:
-				dev_err(&pdev->dev, "Fail to register CLK_PMIC\n");
-				goto err_clk_pmic;
-			}
+			dev_err(&pdev->dev, "failed to register %s\n",
+				max77686_clks[i]->hw.init->name);
+			goto err_clocks;
 		}
 	}
 
@@ -183,13 +172,12 @@ static int max77686_clk_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_clk_pmic:
-	clkdev_drop(max77686_clks[MAX77686_CLK_CP]->lookup);
-	kfree(max77686_clks[MAX77686_CLK_CP]->hw.clk);
-err_clk_cp:
-	clkdev_drop(max77686_clks[MAX77686_CLK_AP]->lookup);
-	kfree(max77686_clks[MAX77686_CLK_AP]->hw.clk);
-err_clk_ap:
+err_clocks:
+	for (--i; i >= 0; --i) {
+		clkdev_drop(max77686_clks[i]->lookup);
+		clk_unregister(max77686_clks[i]->hw.clk);
+	}
+
 	return ret;
 }
 
@@ -200,7 +188,7 @@ static int max77686_clk_remove(struct platform_device *pdev)
 
 	for (i = 0; i < MAX77686_CLKS_NUM; i++) {
 		clkdev_drop(max77686_clks[i]->lookup);
-		kfree(max77686_clks[i]->hw.clk);
+		clk_unregister(max77686_clks[i]->hw.clk);
 	}
 	return 0;
 }
-- 
1.8.3.2
