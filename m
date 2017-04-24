From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 3/6] clk: samsung: Convert common drivers to the new clk_hw
 API
Date: Mon, 24 Apr 2017 08:42:20 +0200
Message-ID: <1493016143-21569-4-git-send-email-m.szyprowski@samsung.com>
References: <1493016143-21569-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170424064229eucas1p2f2feb95623d6c4ac8db01ff519a53fa9@eucas1p2.samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1493016143-21569-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Clock providers should use the new struct clk_hw based API, so convert
Samsung clock providers and their helper functions to the new approach.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-cpu.c          |  8 ++-
 drivers/clk/samsung/clk-pll.c          | 14 +++---
 drivers/clk/samsung/clk-s3c2410-dclk.c | 75 ++++++++++++++--------------
 drivers/clk/samsung/clk.c              | 91 +++++++++++++++-------------------
 drivers/clk/samsung/clk.h              |  9 ++--
 5 files changed, 92 insertions(+), 105 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index 6e1c6007e721..fbf0154b81a5 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -411,7 +411,6 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 	struct exynos_cpuclk *cpuclk;
 	struct clk_init_data init;
 	struct clk *parent_clk;
-	struct clk *clk;
 	int ret = 0;
 
 	cpuclk = kzalloc(sizeof(*cpuclk), GFP_KERNEL);
@@ -464,14 +463,13 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 		goto unregister_clk_nb;
 	}
 
-	clk = clk_register(NULL, &cpuclk->hw);
-	if (IS_ERR(clk)) {
+	ret = clk_hw_register(NULL, &cpuclk->hw);
+	if (ret) {
 		pr_err("%s: could not register cpuclk %s\n", __func__,	name);
-		ret = PTR_ERR(clk);
 		goto free_cpuclk_data;
 	}
 
-	samsung_clk_add_lookup(ctx, clk, lookup_id);
+	samsung_clk_add_lookup(ctx, &cpuclk->hw, lookup_id);
 	return 0;
 
 free_cpuclk_data:
diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 52290894857a..db680575a9bd 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1244,7 +1244,6 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 				void __iomem *base)
 {
 	struct samsung_clk_pll *pll;
-	struct clk *clk;
 	struct clk_init_data init;
 	int ret, len;
 
@@ -1376,20 +1375,21 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	pll->lock_reg = base + pll_clk->lock_offset;
 	pll->con_reg = base + pll_clk->con_offset;
 
-	clk = clk_register(NULL, &pll->hw);
-	if (IS_ERR(clk)) {
-		pr_err("%s: failed to register pll clock %s : %ld\n",
-			__func__, pll_clk->name, PTR_ERR(clk));
+	ret = clk_hw_register(NULL, &pll->hw);
+	if (ret) {
+		pr_err("%s: failed to register pll clock %s : %d\n",
+			__func__, pll_clk->name, ret);
 		kfree(pll);
 		return;
 	}
 
-	samsung_clk_add_lookup(ctx, clk, pll_clk->id);
+	samsung_clk_add_lookup(ctx, &pll->hw, pll_clk->id);
 
 	if (!pll_clk->alias)
 		return;
 
-	ret = clk_register_clkdev(clk, pll_clk->alias, pll_clk->dev_name);
+	ret = clk_hw_register_clkdev(&pll->hw, pll_clk->alias,
+				     pll_clk->dev_name);
 	if (ret)
 		pr_err("%s: failed to register lookup for %s : %d",
 			__func__, pll_clk->name, ret);
diff --git a/drivers/clk/samsung/clk-s3c2410-dclk.c b/drivers/clk/samsung/clk-s3c2410-dclk.c
index ae9a595c72d0..077df3e539a7 100644
--- a/drivers/clk/samsung/clk-s3c2410-dclk.c
+++ b/drivers/clk/samsung/clk-s3c2410-dclk.c
@@ -90,13 +90,13 @@ static int s3c24xx_clkout_set_parent(struct clk_hw *hw, u8 index)
 	.determine_rate = __clk_mux_determine_rate,
 };
 
-static struct clk *s3c24xx_register_clkout(struct device *dev, const char *name,
-		const char **parent_names, u8 num_parents,
+static struct clk_hw *s3c24xx_register_clkout(struct device *dev,
+		const char *name, const char **parent_names, u8 num_parents,
 		u8 shift, u32 mask)
 {
 	struct s3c24xx_clkout *clkout;
-	struct clk *clk;
 	struct clk_init_data init;
+	int ret;
 
 	/* allocate the clkout */
 	clkout = kzalloc(sizeof(*clkout), GFP_KERNEL);
@@ -113,9 +113,11 @@ static struct clk *s3c24xx_register_clkout(struct device *dev, const char *name,
 	clkout->mask = mask;
 	clkout->hw.init = &init;
 
-	clk = clk_register(dev, &clkout->hw);
+	ret = clk_hw_register(dev, &clkout->hw);
+	if (ret)
+		return ERR_PTR(ret);
 
-	return clk;
+	return &clkout->hw;
 }
 
 /*
@@ -125,11 +127,12 @@ static struct clk *s3c24xx_register_clkout(struct device *dev, const char *name,
 struct s3c24xx_dclk {
 	struct device *dev;
 	void __iomem *base;
-	struct clk_onecell_data clk_data;
 	struct notifier_block dclk0_div_change_nb;
 	struct notifier_block dclk1_div_change_nb;
 	spinlock_t dclk_lock;
 	unsigned long reg_save;
+	/* clk_data must be the last entry in the structure */
+	struct clk_hw_onecell_data clk_data;
 };
 
 #define to_s3c24xx_dclk0(x) \
@@ -240,28 +243,23 @@ static int s3c24xx_dclk_probe(struct platform_device *pdev)
 {
 	struct s3c24xx_dclk *s3c24xx_dclk;
 	struct resource *mem;
-	struct clk **clk_table;
 	struct s3c24xx_dclk_drv_data *dclk_variant;
+	struct clk_hw **clk_table;
 	int ret, i;
 
-	s3c24xx_dclk = devm_kzalloc(&pdev->dev, sizeof(*s3c24xx_dclk),
-				    GFP_KERNEL);
+	s3c24xx_dclk = devm_kzalloc(&pdev->dev, sizeof(*s3c24xx_dclk) +
+			    sizeof(*s3c24xx_dclk->clk_data.hws) * DCLK_MAX_CLKS,
+			    GFP_KERNEL);
 	if (!s3c24xx_dclk)
 		return -ENOMEM;
 
+	clk_table = s3c24xx_dclk->clk_data.hws;
+
 	s3c24xx_dclk->dev = &pdev->dev;
+	s3c24xx_dclk->clk_data.num = DCLK_MAX_CLKS;
 	platform_set_drvdata(pdev, s3c24xx_dclk);
 	spin_lock_init(&s3c24xx_dclk->dclk_lock);
 
-	clk_table = devm_kzalloc(&pdev->dev,
-				 sizeof(struct clk *) * DCLK_MAX_CLKS,
-				 GFP_KERNEL);
-	if (!clk_table)
-		return -ENOMEM;
-
-	s3c24xx_dclk->clk_data.clks = clk_table;
-	s3c24xx_dclk->clk_data.clk_num = DCLK_MAX_CLKS;
-
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	s3c24xx_dclk->base = devm_ioremap_resource(&pdev->dev, mem);
 	if (IS_ERR(s3c24xx_dclk->base))
@@ -271,29 +269,29 @@ static int s3c24xx_dclk_probe(struct platform_device *pdev)
 				platform_get_device_id(pdev)->driver_data;
 
 
-	clk_table[MUX_DCLK0] = clk_register_mux(&pdev->dev, "mux_dclk0",
+	clk_table[MUX_DCLK0] = clk_hw_register_mux(&pdev->dev, "mux_dclk0",
 				dclk_variant->mux_parent_names,
 				dclk_variant->mux_num_parents, 0,
 				s3c24xx_dclk->base, 1, 1, 0,
 				&s3c24xx_dclk->dclk_lock);
-	clk_table[MUX_DCLK1] = clk_register_mux(&pdev->dev, "mux_dclk1",
+	clk_table[MUX_DCLK1] = clk_hw_register_mux(&pdev->dev, "mux_dclk1",
 				dclk_variant->mux_parent_names,
 				dclk_variant->mux_num_parents, 0,
 				s3c24xx_dclk->base, 17, 1, 0,
 				&s3c24xx_dclk->dclk_lock);
 
-	clk_table[DIV_DCLK0] = clk_register_divider(&pdev->dev, "div_dclk0",
+	clk_table[DIV_DCLK0] = clk_hw_register_divider(&pdev->dev, "div_dclk0",
 				"mux_dclk0", 0, s3c24xx_dclk->base,
 				4, 4, 0, &s3c24xx_dclk->dclk_lock);
-	clk_table[DIV_DCLK1] = clk_register_divider(&pdev->dev, "div_dclk1",
+	clk_table[DIV_DCLK1] = clk_hw_register_divider(&pdev->dev, "div_dclk1",
 				"mux_dclk1", 0, s3c24xx_dclk->base,
 				20, 4, 0, &s3c24xx_dclk->dclk_lock);
 
-	clk_table[GATE_DCLK0] = clk_register_gate(&pdev->dev, "gate_dclk0",
+	clk_table[GATE_DCLK0] = clk_hw_register_gate(&pdev->dev, "gate_dclk0",
 				"div_dclk0", CLK_SET_RATE_PARENT,
 				s3c24xx_dclk->base, 0, 0,
 				&s3c24xx_dclk->dclk_lock);
-	clk_table[GATE_DCLK1] = clk_register_gate(&pdev->dev, "gate_dclk1",
+	clk_table[GATE_DCLK1] = clk_hw_register_gate(&pdev->dev, "gate_dclk1",
 				"div_dclk1", CLK_SET_RATE_PARENT,
 				s3c24xx_dclk->base, 16, 0,
 				&s3c24xx_dclk->dclk_lock);
@@ -312,15 +310,16 @@ static int s3c24xx_dclk_probe(struct platform_device *pdev)
 			goto err_clk_register;
 		}
 
-	ret = clk_register_clkdev(clk_table[MUX_DCLK0], "dclk0", NULL);
+	ret = clk_hw_register_clkdev(clk_table[MUX_DCLK0], "dclk0", NULL);
 	if (!ret)
-		ret = clk_register_clkdev(clk_table[MUX_DCLK1], "dclk1", NULL);
+		ret = clk_hw_register_clkdev(clk_table[MUX_DCLK1], "dclk1",
+					     NULL);
 	if (!ret)
-		ret = clk_register_clkdev(clk_table[MUX_CLKOUT0],
-					  "clkout0", NULL);
+		ret = clk_hw_register_clkdev(clk_table[MUX_CLKOUT0],
+					     "clkout0", NULL);
 	if (!ret)
-		ret = clk_register_clkdev(clk_table[MUX_CLKOUT1],
-					  "clkout1", NULL);
+		ret = clk_hw_register_clkdev(clk_table[MUX_CLKOUT1],
+					     "clkout1", NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register aliases, %d\n", ret);
 		goto err_clk_register;
@@ -332,12 +331,12 @@ static int s3c24xx_dclk_probe(struct platform_device *pdev)
 	s3c24xx_dclk->dclk1_div_change_nb.notifier_call =
 						s3c24xx_dclk1_div_notify;
 
-	ret = clk_notifier_register(clk_table[DIV_DCLK0],
+	ret = clk_notifier_register(clk_table[DIV_DCLK0]->clk,
 				    &s3c24xx_dclk->dclk0_div_change_nb);
 	if (ret)
 		goto err_clk_register;
 
-	ret = clk_notifier_register(clk_table[DIV_DCLK1],
+	ret = clk_notifier_register(clk_table[DIV_DCLK1]->clk,
 				    &s3c24xx_dclk->dclk1_div_change_nb);
 	if (ret)
 		goto err_dclk_notify;
@@ -345,12 +344,12 @@ static int s3c24xx_dclk_probe(struct platform_device *pdev)
 	return 0;
 
 err_dclk_notify:
-	clk_notifier_unregister(clk_table[DIV_DCLK0],
+	clk_notifier_unregister(clk_table[DIV_DCLK0]->clk,
 				&s3c24xx_dclk->dclk0_div_change_nb);
 err_clk_register:
 	for (i = 0; i < DCLK_MAX_CLKS; i++)
 		if (clk_table[i] && !IS_ERR(clk_table[i]))
-			clk_unregister(clk_table[i]);
+			clk_hw_unregister(clk_table[i]);
 
 	return ret;
 }
@@ -358,16 +357,16 @@ static int s3c24xx_dclk_probe(struct platform_device *pdev)
 static int s3c24xx_dclk_remove(struct platform_device *pdev)
 {
 	struct s3c24xx_dclk *s3c24xx_dclk = platform_get_drvdata(pdev);
-	struct clk **clk_table = s3c24xx_dclk->clk_data.clks;
+	struct clk_hw **clk_table = s3c24xx_dclk->clk_data.hws;
 	int i;
 
-	clk_notifier_unregister(clk_table[DIV_DCLK1],
+	clk_notifier_unregister(clk_table[DIV_DCLK1]->clk,
 				&s3c24xx_dclk->dclk1_div_change_nb);
-	clk_notifier_unregister(clk_table[DIV_DCLK0],
+	clk_notifier_unregister(clk_table[DIV_DCLK0]->clk,
 				&s3c24xx_dclk->dclk0_div_change_nb);
 
 	for (i = 0; i < DCLK_MAX_CLKS; i++)
-		clk_unregister(clk_table[i]);
+		clk_hw_unregister(clk_table[i]);
 
 	return 0;
 }
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index b7d87d6db9dc..7ce0fa86c5ff 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -60,23 +60,18 @@ struct samsung_clk_provider *__init samsung_clk_init(struct device_node *np,
 			void __iomem *base, unsigned long nr_clks)
 {
 	struct samsung_clk_provider *ctx;
-	struct clk **clk_table;
 	int i;
 
-	ctx = kzalloc(sizeof(struct samsung_clk_provider), GFP_KERNEL);
+	ctx = kzalloc(sizeof(struct samsung_clk_provider) +
+		      sizeof(*ctx->clk_data.hws) * nr_clks, GFP_KERNEL);
 	if (!ctx)
 		panic("could not allocate clock provider context.\n");
 
-	clk_table = kcalloc(nr_clks, sizeof(struct clk *), GFP_KERNEL);
-	if (!clk_table)
-		panic("could not allocate clock lookup table\n");
-
 	for (i = 0; i < nr_clks; ++i)
-		clk_table[i] = ERR_PTR(-ENOENT);
+		ctx->clk_data.hws[i] = ERR_PTR(-ENOENT);
 
 	ctx->reg_base = base;
-	ctx->clk_data.clks = clk_table;
-	ctx->clk_data.clk_num = nr_clks;
+	ctx->clk_data.num = nr_clks;
 	spin_lock_init(&ctx->lock);
 
 	return ctx;
@@ -86,18 +81,18 @@ void __init samsung_clk_of_add_provider(struct device_node *np,
 				struct samsung_clk_provider *ctx)
 {
 	if (np) {
-		if (of_clk_add_provider(np, of_clk_src_onecell_get,
+		if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
 					&ctx->clk_data))
 			panic("could not register clk provider\n");
 	}
 }
 
 /* add a clock instance to the clock lookup table used for dt based lookup */
-void samsung_clk_add_lookup(struct samsung_clk_provider *ctx, struct clk *clk,
-				unsigned int id)
+void samsung_clk_add_lookup(struct samsung_clk_provider *ctx,
+			    struct clk_hw *clk_hw, unsigned int id)
 {
-	if (ctx->clk_data.clks && id)
-		ctx->clk_data.clks[id] = clk;
+	if (id)
+		ctx->clk_data.hws[id] = clk_hw;
 }
 
 /* register a list of aliases */
@@ -105,14 +100,9 @@ void __init samsung_clk_register_alias(struct samsung_clk_provider *ctx,
 				const struct samsung_clock_alias *list,
 				unsigned int nr_clk)
 {
-	struct clk *clk;
+	struct clk_hw *clk_hw;
 	unsigned int idx, ret;
 
-	if (!ctx->clk_data.clks) {
-		pr_err("%s: clock table missing\n", __func__);
-		return;
-	}
-
 	for (idx = 0; idx < nr_clk; idx++, list++) {
 		if (!list->id) {
 			pr_err("%s: clock id missing for index %d\n", __func__,
@@ -120,14 +110,15 @@ void __init samsung_clk_register_alias(struct samsung_clk_provider *ctx,
 			continue;
 		}
 
-		clk = ctx->clk_data.clks[list->id];
-		if (!clk) {
+		clk_hw = ctx->clk_data.hws[list->id];
+		if (!clk_hw) {
 			pr_err("%s: failed to find clock %d\n", __func__,
 				list->id);
 			continue;
 		}
 
-		ret = clk_register_clkdev(clk, list->alias, list->dev_name);
+		ret = clk_hw_register_clkdev(clk_hw, list->alias,
+					     list->dev_name);
 		if (ret)
 			pr_err("%s: failed to register lookup %s\n",
 					__func__, list->alias);
@@ -139,25 +130,25 @@ void __init samsung_clk_register_fixed_rate(struct samsung_clk_provider *ctx,
 		const struct samsung_fixed_rate_clock *list,
 		unsigned int nr_clk)
 {
-	struct clk *clk;
+	struct clk_hw *clk_hw;
 	unsigned int idx, ret;
 
 	for (idx = 0; idx < nr_clk; idx++, list++) {
-		clk = clk_register_fixed_rate(NULL, list->name,
+		clk_hw = clk_hw_register_fixed_rate(NULL, list->name,
 			list->parent_name, list->flags, list->fixed_rate);
-		if (IS_ERR(clk)) {
+		if (IS_ERR(clk_hw)) {
 			pr_err("%s: failed to register clock %s\n", __func__,
 				list->name);
 			continue;
 		}
 
-		samsung_clk_add_lookup(ctx, clk, list->id);
+		samsung_clk_add_lookup(ctx, clk_hw, list->id);
 
 		/*
 		 * Unconditionally add a clock lookup for the fixed rate clocks.
 		 * There are not many of these on any of Samsung platforms.
 		 */
-		ret = clk_register_clkdev(clk, list->name, NULL);
+		ret = clk_hw_register_clkdev(clk_hw, list->name, NULL);
 		if (ret)
 			pr_err("%s: failed to register clock lookup for %s",
 				__func__, list->name);
@@ -168,19 +159,19 @@ void __init samsung_clk_register_fixed_rate(struct samsung_clk_provider *ctx,
 void __init samsung_clk_register_fixed_factor(struct samsung_clk_provider *ctx,
 		const struct samsung_fixed_factor_clock *list, unsigned int nr_clk)
 {
-	struct clk *clk;
+	struct clk_hw *clk_hw;
 	unsigned int idx;
 
 	for (idx = 0; idx < nr_clk; idx++, list++) {
-		clk = clk_register_fixed_factor(NULL, list->name,
+		clk_hw = clk_hw_register_fixed_factor(NULL, list->name,
 			list->parent_name, list->flags, list->mult, list->div);
-		if (IS_ERR(clk)) {
+		if (IS_ERR(clk_hw)) {
 			pr_err("%s: failed to register clock %s\n", __func__,
 				list->name);
 			continue;
 		}
 
-		samsung_clk_add_lookup(ctx, clk, list->id);
+		samsung_clk_add_lookup(ctx, clk_hw, list->id);
 	}
 }
 
@@ -189,25 +180,25 @@ void __init samsung_clk_register_mux(struct samsung_clk_provider *ctx,
 				const struct samsung_mux_clock *list,
 				unsigned int nr_clk)
 {
-	struct clk *clk;
+	struct clk_hw *clk_hw;
 	unsigned int idx, ret;
 
 	for (idx = 0; idx < nr_clk; idx++, list++) {
-		clk = clk_register_mux(NULL, list->name, list->parent_names,
-			list->num_parents, list->flags,
+		clk_hw = clk_hw_register_mux(NULL, list->name,
+			list->parent_names, list->num_parents, list->flags,
 			ctx->reg_base + list->offset,
 			list->shift, list->width, list->mux_flags, &ctx->lock);
-		if (IS_ERR(clk)) {
+		if (IS_ERR(clk_hw)) {
 			pr_err("%s: failed to register clock %s\n", __func__,
 				list->name);
 			continue;
 		}
 
-		samsung_clk_add_lookup(ctx, clk, list->id);
+		samsung_clk_add_lookup(ctx, clk_hw, list->id);
 
 		/* register a clock lookup only if a clock alias is specified */
 		if (list->alias) {
-			ret = clk_register_clkdev(clk, list->alias,
+			ret = clk_hw_register_clkdev(clk_hw, list->alias,
 						list->dev_name);
 			if (ret)
 				pr_err("%s: failed to register lookup %s\n",
@@ -221,32 +212,32 @@ void __init samsung_clk_register_div(struct samsung_clk_provider *ctx,
 				const struct samsung_div_clock *list,
 				unsigned int nr_clk)
 {
-	struct clk *clk;
+	struct clk_hw *clk_hw;
 	unsigned int idx, ret;
 
 	for (idx = 0; idx < nr_clk; idx++, list++) {
 		if (list->table)
-			clk = clk_register_divider_table(NULL, list->name,
-				list->parent_name, list->flags,
+			clk_hw = clk_hw_register_divider_table(NULL,
+				list->name, list->parent_name, list->flags,
 				ctx->reg_base + list->offset,
 				list->shift, list->width, list->div_flags,
 				list->table, &ctx->lock);
 		else
-			clk = clk_register_divider(NULL, list->name,
+			clk_hw = clk_hw_register_divider(NULL, list->name,
 				list->parent_name, list->flags,
 				ctx->reg_base + list->offset, list->shift,
 				list->width, list->div_flags, &ctx->lock);
-		if (IS_ERR(clk)) {
+		if (IS_ERR(clk_hw)) {
 			pr_err("%s: failed to register clock %s\n", __func__,
 				list->name);
 			continue;
 		}
 
-		samsung_clk_add_lookup(ctx, clk, list->id);
+		samsung_clk_add_lookup(ctx, clk_hw, list->id);
 
 		/* register a clock lookup only if a clock alias is specified */
 		if (list->alias) {
-			ret = clk_register_clkdev(clk, list->alias,
+			ret = clk_hw_register_clkdev(clk_hw, list->alias,
 						list->dev_name);
 			if (ret)
 				pr_err("%s: failed to register lookup %s\n",
@@ -260,14 +251,14 @@ void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
 				const struct samsung_gate_clock *list,
 				unsigned int nr_clk)
 {
-	struct clk *clk;
+	struct clk_hw *clk_hw;
 	unsigned int idx, ret;
 
 	for (idx = 0; idx < nr_clk; idx++, list++) {
-		clk = clk_register_gate(NULL, list->name, list->parent_name,
+		clk_hw = clk_hw_register_gate(NULL, list->name, list->parent_name,
 				list->flags, ctx->reg_base + list->offset,
 				list->bit_idx, list->gate_flags, &ctx->lock);
-		if (IS_ERR(clk)) {
+		if (IS_ERR(clk_hw)) {
 			pr_err("%s: failed to register clock %s\n", __func__,
 				list->name);
 			continue;
@@ -275,14 +266,14 @@ void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
 
 		/* register a clock lookup only if a clock alias is specified */
 		if (list->alias) {
-			ret = clk_register_clkdev(clk, list->alias,
+			ret = clk_hw_register_clkdev(clk_hw, list->alias,
 							list->dev_name);
 			if (ret)
 				pr_err("%s: failed to register lookup %s\n",
 					__func__, list->alias);
 		}
 
-		samsung_clk_add_lookup(ctx, clk, list->id);
+		samsung_clk_add_lookup(ctx, clk_hw, list->id);
 	}
 }
 
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index da3bdebabf1e..b8ca0dd3a38b 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -16,18 +16,17 @@
 #include <linux/clk-provider.h>
 #include "clk-pll.h"
 
-struct clk;
-
 /**
  * struct samsung_clk_provider: information about clock provider
  * @reg_base: virtual address for the register base.
- * @clk_data: holds clock related data like clk* and number of clocks.
  * @lock: maintains exclusion between callbacks for a given clock-provider.
+ * @clk_data: holds clock related data like clk_hw* and number of clocks.
  */
 struct samsung_clk_provider {
 	void __iomem *reg_base;
-	struct clk_onecell_data clk_data;
 	spinlock_t lock;
+	/* clk_data must be the last entry due to variable lenght 'hws' array */
+	struct clk_hw_onecell_data clk_data;
 };
 
 /**
@@ -367,7 +366,7 @@ extern void __init samsung_clk_of_register_fixed_ext(
 			const struct of_device_id *clk_matches);
 
 extern void samsung_clk_add_lookup(struct samsung_clk_provider *ctx,
-			struct clk *clk, unsigned int id);
+			struct clk_hw *clk_hw, unsigned int id);
 
 extern void __init samsung_clk_register_alias(struct samsung_clk_provider *ctx,
 			const struct samsung_clock_alias *list,
-- 
1.9.1

