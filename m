From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 3/8] clk: max77686: Refactor successful exit of probe
 function
Date: Thu, 12 Dec 2013 17:07:16 +0100
Message-ID: <1386864441-19561-4-git-send-email-t.figa@samsung.com>
References: <1386864441-19561-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:51639 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751552Ab3LLQHq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Dec 2013 11:07:46 -0500
In-reply-to: <1386864441-19561-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Mike Turquette <mturquette@linaro.org>, Lee Jones <lee.jones@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>

The function can simply return 0, without jumping to a separate label,
which does exactly the same. This patch does not introduce any
functional change, just a clean-up.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/clk-max77686.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk-max77686.c b/drivers/clk/clk-max77686.c
index e40ecdb..5d78460 100644
--- a/drivers/clk/clk-max77686.c
+++ b/drivers/clk/clk-max77686.c
@@ -178,7 +178,7 @@ static int max77686_clk_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, max77686_clks);
 
-	goto out;
+	return 0;
 
 err_clk_pmic:
 	clkdev_drop(max77686_clks[MAX77686_CLK_CP]->lookup);
@@ -187,7 +187,6 @@ err_clk_cp:
 	clkdev_drop(max77686_clks[MAX77686_CLK_AP]->lookup);
 	kfree(max77686_clks[MAX77686_CLK_AP]->hw.clk);
 err_clk_ap:
-out:
 	return ret;
 }
 
-- 
1.8.4.3
