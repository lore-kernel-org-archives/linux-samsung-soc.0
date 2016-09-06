From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 5/7] clk: samsung: clk-exynos-audss: controller variant
 handling rework
Date: Tue, 06 Sep 2016 14:04:54 +0200
Message-ID: <1473163496-17820-6-git-send-email-s.nawrocki@samsung.com>
References: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59268 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932358AbcIFMFm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 08:05:42 -0400
In-reply-to: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Then variant handling is reworked to make the code simpler when
more variants are added.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos-audss.c | 64 ++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index bdf8b97..7d4026b 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -14,18 +14,13 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/syscore_ops.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/clock/exynos-audss-clk.h>
 
-enum exynos_audss_clk_type {
-	TYPE_EXYNOS4210,
-	TYPE_EXYNOS5250,
-	TYPE_EXYNOS5420,
-};
-
 static DEFINE_SPINLOCK(lock);
 static struct clk **clk_table;
 static void __iomem *reg_base;
@@ -73,14 +68,34 @@ static struct syscore_ops exynos_audss_clk_syscore_ops = {
 };
 #endif /* CONFIG_PM_SLEEP */
 
+struct exynos_audss_clk_drvdata {
+	unsigned int has_adma_clk:1;
+	unsigned int enable_epll:1;
+	unsigned int num_clks;
+};
+
+static const struct exynos_audss_clk_drvdata exynos4210_drvdata = {
+	.num_clks	= EXYNOS_AUDSS_MAX_CLKS - 1,
+};
+
+static const struct exynos_audss_clk_drvdata exynos5420_drvdata = {
+	.num_clks	= EXYNOS_AUDSS_MAX_CLKS,
+	.has_adma_clk	= 1,
+	.enable_epll	= 1,
+};
+
 static const struct of_device_id exynos_audss_clk_of_match[] = {
-	{ .compatible = "samsung,exynos4210-audss-clock",
-	  .data = (void *)TYPE_EXYNOS4210, },
-	{ .compatible = "samsung,exynos5250-audss-clock",
-	  .data = (void *)TYPE_EXYNOS5250, },
-	{ .compatible = "samsung,exynos5420-audss-clock",
-	  .data = (void *)TYPE_EXYNOS5420, },
-	{},
+	{
+		.compatible	= "samsung,exynos4210-audss-clock",
+		.data		= &exynos4210_drvdata,
+	}, {
+		.compatible	= "samsung,exynos5250-audss-clock",
+		.data		= &exynos4210_drvdata,
+	}, {
+		.compatible	= "samsung,exynos5420-audss-clock",
+		.data		= &exynos5420_drvdata,
+	},
+	{ },
 };
 
 static void exynos_audss_clk_teardown(void)
@@ -106,19 +121,17 @@ static void exynos_audss_clk_teardown(void)
 /* register exynos_audss clocks */
 static int exynos_audss_clk_probe(struct platform_device *pdev)
 {
-	int i, ret = 0;
-	struct resource *res;
 	const char *mout_audss_p[] = {"fin_pll", "fout_epll"};
 	const char *mout_i2s_p[] = {"mout_audss", "cdclk0", "sclk_audio0"};
 	const char *sclk_pcm_p = "sclk_pcm0";
 	struct clk *pll_ref, *pll_in, *cdclk, *sclk_audio, *sclk_pcm_in;
-	const struct of_device_id *match;
-	enum exynos_audss_clk_type variant;
+	const struct exynos_audss_clk_drvdata *variant;
+	struct resource *res;
+	int i, ret = 0;
 
-	match = of_match_node(exynos_audss_clk_of_match, pdev->dev.of_node);
-	if (!match)
+	variant = of_device_get_match_data(&pdev->dev);
+	if (!variant)
 		return -EINVAL;
-	variant = (enum exynos_audss_clk_type)match->data;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	reg_base = devm_ioremap_resource(&pdev->dev, res);
@@ -126,7 +139,7 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to map audss registers\n");
 		return PTR_ERR(reg_base);
 	}
-	/* EPLL don't have to be enabled for boards other than Exynos5420 */
+
 	epll = ERR_PTR(-ENODEV);
 
 	clk_table = devm_kzalloc(&pdev->dev,
@@ -136,10 +149,7 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	clk_data.clks = clk_table;
-	if (variant == TYPE_EXYNOS5420)
-		clk_data.clk_num = EXYNOS_AUDSS_MAX_CLKS;
-	else
-		clk_data.clk_num = EXYNOS_AUDSS_MAX_CLKS - 1;
+	clk_data.clk_num = variant->num_clks;
 
 	pll_ref = devm_clk_get(&pdev->dev, "pll_ref");
 	pll_in = devm_clk_get(&pdev->dev, "pll_in");
@@ -148,7 +158,7 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 	if (!IS_ERR(pll_in)) {
 		mout_audss_p[1] = __clk_get_name(pll_in);
 
-		if (variant == TYPE_EXYNOS5420) {
+		if (variant->enable_epll) {
 			epll = pll_in;
 
 			ret = clk_prepare_enable(epll);
@@ -210,7 +220,7 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 				sclk_pcm_p, CLK_SET_RATE_PARENT,
 				reg_base + ASS_CLK_GATE, 5, 0, &lock);
 
-	if (variant == TYPE_EXYNOS5420) {
+	if (variant->has_adma_clk) {
 		clk_table[EXYNOS_ADMA] = clk_register_gate(NULL, "adma",
 				"dout_srp", CLK_SET_RATE_PARENT,
 				reg_base + ASS_CLK_GATE, 9, 0, &lock);
-- 
1.9.1
