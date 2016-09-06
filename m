From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 3/7] clk: samsung: Use common registration function for
 pll2550x
Date: Tue, 06 Sep 2016 14:04:52 +0200
Message-ID: <1473163496-17820-4-git-send-email-s.nawrocki@samsung.com>
References: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:38382 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932721AbcIFMFh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 08:05:37 -0400
In-reply-to: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

There is no such significant differences in pll2550x PLL type
to justify a separate registration function.  This patch adapts
exynos5440 driver to use the common function and removes
samsung_clk_register_pll2550x().

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
This patch is untested as I don't have access to any exynos5440
SoC based board.
---
 drivers/clk/samsung/clk-exynos5440.c   |  9 ++++--
 drivers/clk/samsung/clk-pll.c          | 52 ++++------------------------------
 drivers/clk/samsung/clk-pll.h          |  1 +
 include/dt-bindings/clock/exynos5440.h |  2 ++
 4 files changed, 15 insertions(+), 49 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5440.c b/drivers/clk/samsung/clk-exynos5440.c
index a57d01b..a80f3ef 100644
--- a/drivers/clk/samsung/clk-exynos5440.c
+++ b/drivers/clk/samsung/clk-exynos5440.c
@@ -112,6 +112,11 @@ static struct notifier_block exynos5440_clk_restart_handler = {
 	.priority = 128,
 };
 
+static const struct samsung_pll_clock exynos5440_plls[] __initconst = {
+	PLL(pll_2550x, CLK_CPLLA, "cplla", "xtal", 0, 0x4c, NULL),
+	PLL(pll_2550x, CLK_CPLLB, "cpllb", "xtal", 0, 0x50, NULL),
+};
+
 /* register exynos5440 clocks */
 static void __init exynos5440_clk_init(struct device_node *np)
 {
@@ -129,8 +134,8 @@ static void __init exynos5440_clk_init(struct device_node *np)
 	samsung_clk_of_register_fixed_ext(ctx, exynos5440_fixed_rate_ext_clks,
 		ARRAY_SIZE(exynos5440_fixed_rate_ext_clks), ext_clk_match);
 
-	samsung_clk_register_pll2550x("cplla", "xtal", reg_base + 0x1c, 0x10);
-	samsung_clk_register_pll2550x("cpllb", "xtal", reg_base + 0x20, 0x10);
+	samsung_clk_register_pll(ctx, exynos5440_plls,
+			ARRAY_SIZE(exynos5440_plls), ctx->reg_base);
 
 	samsung_clk_register_fixed_rate(ctx, exynos5440_fixed_rate_clks,
 			ARRAY_SIZE(exynos5440_fixed_rate_clks));
diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 48139bd..b5ab055 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -890,22 +890,14 @@ static const struct clk_ops samsung_s3c2440_mpll_clk_ops = {
 #define PLL2550X_M_SHIFT      (4)
 #define PLL2550X_S_SHIFT      (0)
 
-struct samsung_clk_pll2550x {
-	struct clk_hw		hw;
-	const void __iomem	*reg_base;
-	unsigned long		offset;
-};
-
-#define to_clk_pll2550x(_hw) container_of(_hw, struct samsung_clk_pll2550x, hw)
-
 static unsigned long samsung_pll2550x_recalc_rate(struct clk_hw *hw,
 				unsigned long parent_rate)
 {
-	struct samsung_clk_pll2550x *pll = to_clk_pll2550x(hw);
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
 	u32 r, p, m, s, pll_stat;
 	u64 fvco = parent_rate;
 
-	pll_stat = readl_relaxed(pll->reg_base + pll->offset * 3);
+	pll_stat = readl_relaxed(pll->con_reg);
 	r = (pll_stat >> PLL2550X_R_SHIFT) & PLL2550X_R_MASK;
 	if (!r)
 		return 0;
@@ -923,43 +915,6 @@ static const struct clk_ops samsung_pll2550x_clk_ops = {
 	.recalc_rate = samsung_pll2550x_recalc_rate,
 };
 
-struct clk * __init samsung_clk_register_pll2550x(const char *name,
-			const char *pname, const void __iomem *reg_base,
-			const unsigned long offset)
-{
-	struct samsung_clk_pll2550x *pll;
-	struct clk *clk;
-	struct clk_init_data init;
-
-	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
-	if (!pll) {
-		pr_err("%s: could not allocate pll clk %s\n", __func__, name);
-		return NULL;
-	}
-
-	init.name = name;
-	init.ops = &samsung_pll2550x_clk_ops;
-	init.flags = CLK_GET_RATE_NOCACHE;
-	init.parent_names = &pname;
-	init.num_parents = 1;
-
-	pll->hw.init = &init;
-	pll->reg_base = reg_base;
-	pll->offset = offset;
-
-	clk = clk_register(NULL, &pll->hw);
-	if (IS_ERR(clk)) {
-		pr_err("%s: failed to register pll clock %s\n", __func__,
-				name);
-		kfree(pll);
-	}
-
-	if (clk_register_clkdev(clk, name, NULL))
-		pr_err("%s: failed to register lookup for %s", __func__, name);
-
-	return clk;
-}
-
 /*
  * PLL2550xx Clock Type
  */
@@ -1263,6 +1218,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		else
 			init.ops = &samsung_s3c2440_mpll_clk_ops;
 		break;
+	case pll_2550x:
+		init.ops = &samsung_pll2550x_clk_ops;
+		break;
 	case pll_2550xx:
 		if (!pll->rate_table)
 			init.ops = &samsung_pll2550xx_clk_min_ops;
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 213de9a..df4ad8a 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -31,6 +31,7 @@ enum samsung_pll_type {
 	pll_s3c2410_mpll,
 	pll_s3c2410_upll,
 	pll_s3c2440_mpll,
+	pll_2550x,
 	pll_2550xx,
 	pll_2650xx,
 	pll_1450x,
diff --git a/include/dt-bindings/clock/exynos5440.h b/include/dt-bindings/clock/exynos5440.h
index c66fc40..842cdc0 100644
--- a/include/dt-bindings/clock/exynos5440.h
+++ b/include/dt-bindings/clock/exynos5440.h
@@ -14,6 +14,8 @@
 
 #define CLK_XTAL		1
 #define CLK_ARM_CLK		2
+#define CLK_CPLLA		3
+#define CLK_CPLLB		4
 #define CLK_SPI_BAUD		16
 #define CLK_PB0_250		17
 #define CLK_PR0_250		18
-- 
1.9.1
