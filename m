From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH RESEND 1/2] clk: s2mps11: Add missing of_node_put and
 of_clk_del_provider
Date: Mon, 07 Apr 2014 09:10:43 +0200
Message-ID: <1396854644-7409-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:15637 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753408AbaDGHLJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Apr 2014 03:11:09 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, linux-kernel@vger.kernel.org
Cc: Tushar Behera <tushar.behera@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Add of_clk_del_provider to remove previously registered clock provider.
Add of_node_put to decrement the ref count of clock nodes.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/clk-s2mps11.c |   16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index f2f62a1bf61a..843ec3646501 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -44,6 +44,7 @@ enum {
 
 struct s2mps11_clk {
 	struct sec_pmic_dev *iodev;
+	struct device_node *clk_np;
 	struct clk_hw hw;
 	struct clk *clk;
 	struct clk_lookup *lookup;
@@ -156,7 +157,6 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
 	struct s2mps11_clk *s2mps11_clks, *s2mps11_clk;
-	struct device_node *clk_np = NULL;
 	unsigned int s2mps11_reg;
 	int i, ret = 0;
 	u32 val;
@@ -168,9 +168,10 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 
 	s2mps11_clk = s2mps11_clks;
 
-	clk_np = s2mps11_clk_parse_dt(pdev);
-	if (IS_ERR(clk_np))
-		return PTR_ERR(clk_np);
+	/* Store clocks of_node in first element of s2mps11_clks array */
+	s2mps11_clks->clk_np = s2mps11_clk_parse_dt(pdev);
+	if (IS_ERR(s2mps11_clks->clk_np))
+		return PTR_ERR(s2mps11_clks->clk_np);
 
 	switch(platform_get_device_id(pdev)->driver_data) {
 	case S2MPS11X:
@@ -225,7 +226,8 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 
 		clk_data.clks = clk_table;
 		clk_data.clk_num = S2MPS11_CLKS_NUM;
-		of_clk_add_provider(clk_np, of_clk_src_onecell_get, &clk_data);
+		of_clk_add_provider(s2mps11_clks->clk_np,
+				of_clk_src_onecell_get, &clk_data);
 	}
 
 	platform_set_drvdata(pdev, s2mps11_clks);
@@ -250,6 +252,10 @@ static int s2mps11_clk_remove(struct platform_device *pdev)
 	struct s2mps11_clk *s2mps11_clks = platform_get_drvdata(pdev);
 	int i;
 
+	of_clk_del_provider(s2mps11_clks[0].clk_np);
+	/* Drop the reference obtained in s2mps11_clk_parse_dt */
+	of_node_put(s2mps11_clks[0].clk_np);
+
 	for (i = 0; i < S2MPS11_CLKS_NUM; i++)
 		clkdev_drop(s2mps11_clks[i].lookup);
 
-- 
1.7.9.5
