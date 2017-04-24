From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 5/6] clk: samsung: exynos-clkout: Convert to the new clk_hw
 API
Date: Mon, 24 Apr 2017 08:42:22 +0200
Message-ID: <1493016143-21569-6-git-send-email-m.szyprowski@samsung.com>
References: <1493016143-21569-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170424064231eucas1p2edd27880b5adc7c884e00db54c100cc2@eucas1p2.samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1493016143-21569-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Clock providers should use the new struct clk_hw based API, so convert
Exynos CLKOUT clock provider to the new approach.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
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

