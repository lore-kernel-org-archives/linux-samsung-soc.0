From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/4] clk: samsung: exynos-clkout: Convert to the new clk_hw API
Date: Thu, 20 Apr 2017 15:16:38 +0200
Message-ID: <1492694199-9553-4-git-send-email-m.szyprowski@samsung.com>
References: <1492694199-9553-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170420131647eucas1p27a8e65eb92f64f872bfce611ac031700@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:62203 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S942449AbdDTNRJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 09:17:09 -0400
In-reply-to: <1492694199-9553-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Clock providers should use the new struct clk_hw based API, so convert
Exynos CLKOUT clock provider to the new approach.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos-clkout.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 6c6afb87b4ce..a21aea062bae 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -29,10 +29,9 @@ struct exynos_clkout {
 	struct clk_gate gate;
 	struct clk_mux mux;
 	spinlock_t slock;
-	struct clk_onecell_data data;
-	struct clk *clk_table[EXYNOS_CLKOUT_NR_CLKS];
 	void __iomem *reg;
 	u32 pmu_debug_save;
+	struct clk_hw_onecell_data data;
 };
 
 static struct exynos_clkout *clkout;
@@ -62,7 +61,9 @@ static void __init exynos_clkout_init(struct device_node *node, u32 mux_mask)
 	int ret;
 	int i;
 
-	clkout = kzalloc(sizeof(*clkout), GFP_KERNEL);
+	clkout = kzalloc(sizeof(*clkout) +
+			 sizeof(*clkout->data.hws) * EXYNOS_CLKOUT_NR_CLKS,
+			 GFP_KERNEL);
 	if (!clkout)
 		return;
 
@@ -100,17 +101,16 @@ static void __init exynos_clkout_init(struct device_node *node, u32 mux_mask)
 	clkout->mux.shift = EXYNOS_CLKOUT_MUX_SHIFT;
 	clkout->mux.lock = &clkout->slock;
 
-	clkout->clk_table[0] = clk_register_composite(NULL, "clkout",
+	clkout->data.hws[0] = clk_hw_register_composite(NULL, "clkout",
 				parent_names, parent_count, &clkout->mux.hw,
 				&clk_mux_ops, NULL, NULL, &clkout->gate.hw,
 				&clk_gate_ops, CLK_SET_RATE_PARENT
 				| CLK_SET_RATE_NO_REPARENT);
-	if (IS_ERR(clkout->clk_table[0]))
+	if (IS_ERR(clkout->data.hws[0]))
 		goto err_unmap;
 
-	clkout->data.clks = clkout->clk_table;
-	clkout->data.clk_num = EXYNOS_CLKOUT_NR_CLKS;
-	ret = of_clk_add_provider(node, of_clk_src_onecell_get, &clkout->data);
+	clkout->data.num = EXYNOS_CLKOUT_NR_CLKS;
+	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, &clkout->data);
 	if (ret)
 		goto err_clk_unreg;
 
@@ -119,7 +119,7 @@ static void __init exynos_clkout_init(struct device_node *node, u32 mux_mask)
 	return;
 
 err_clk_unreg:
-	clk_unregister(clkout->clk_table[0]);
+	clk_hw_unregister(clkout->data.hws[0]);
 err_unmap:
 	iounmap(clkout->reg);
 clks_put:
-- 
1.9.1
