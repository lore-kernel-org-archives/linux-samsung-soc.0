From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/3] clk: samsung: exynos5433: prepare for adding CPU clocks
Date: Tue, 24 May 2016 15:19:15 +0200
Message-ID: <1464095957-25851-2-git-send-email-b.zolnierkie@samsung.com>
References: <1464095957-25851-1-git-send-email-b.zolnierkie@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44050 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755276AbcEXNUm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 May 2016 09:20:42 -0400
In-reply-to: <1464095957-25851-1-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com

Open-code samsung_cmu_register_one() calls for CMU_APOLLO and
CMU_ATLAS setup code as a preparation for adding CPU clocks
support for Exynos5433.

There should be no functional change resulting from this patch.

Cc: Kukjin Kim <kgene@kernel.org>
CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 85 +++++++++++++++++++++++-------------
 drivers/clk/samsung/clk.c            | 12 ++---
 drivers/clk/samsung/clk.h            |  4 ++
 3 files changed, 65 insertions(+), 36 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 128527b..6dd81ed 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -11,6 +11,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 
 #include <dt-bindings/clock/exynos5433.h>
 
@@ -3594,23 +3595,35 @@ static struct samsung_gate_clock apollo_gate_clks[] __initdata = {
 			CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
 };
 
-static struct samsung_cmu_info apollo_cmu_info __initdata = {
-	.pll_clks		= apollo_pll_clks,
-	.nr_pll_clks		= ARRAY_SIZE(apollo_pll_clks),
-	.mux_clks		= apollo_mux_clks,
-	.nr_mux_clks		= ARRAY_SIZE(apollo_mux_clks),
-	.div_clks		= apollo_div_clks,
-	.nr_div_clks		= ARRAY_SIZE(apollo_div_clks),
-	.gate_clks		= apollo_gate_clks,
-	.nr_gate_clks		= ARRAY_SIZE(apollo_gate_clks),
-	.nr_clk_ids		= APOLLO_NR_CLK,
-	.clk_regs		= apollo_clk_regs,
-	.nr_clk_regs		= ARRAY_SIZE(apollo_clk_regs),
-};
-
 static void __init exynos5433_cmu_apollo_init(struct device_node *np)
 {
-	samsung_cmu_register_one(np, &apollo_cmu_info);
+	void __iomem *reg_base;
+	struct samsung_clk_provider *ctx;
+
+	reg_base = of_iomap(np, 0);
+	if (!reg_base) {
+		panic("%s: failed to map registers\n", __func__);
+		return;
+	}
+
+	ctx = samsung_clk_init(np, reg_base, APOLLO_NR_CLK);
+	if (!ctx) {
+		panic("%s: unable to allocate ctx\n", __func__);
+		return;
+	}
+
+	samsung_clk_register_pll(ctx, apollo_pll_clks,
+				 ARRAY_SIZE(apollo_pll_clks), reg_base);
+	samsung_clk_register_mux(ctx, apollo_mux_clks,
+				 ARRAY_SIZE(apollo_mux_clks));
+	samsung_clk_register_div(ctx, apollo_div_clks,
+				 ARRAY_SIZE(apollo_div_clks));
+	samsung_clk_register_gate(ctx, apollo_gate_clks,
+				  ARRAY_SIZE(apollo_gate_clks));
+	samsung_clk_sleep_init(reg_base, apollo_clk_regs,
+			       ARRAY_SIZE(apollo_clk_regs));
+
+	samsung_clk_of_add_provider(np, ctx);
 }
 CLK_OF_DECLARE(exynos5433_cmu_apollo, "samsung,exynos5433-cmu-apollo",
 		exynos5433_cmu_apollo_init);
@@ -3806,23 +3819,35 @@ static struct samsung_gate_clock atlas_gate_clks[] __initdata = {
 			CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
 };
 
-static struct samsung_cmu_info atlas_cmu_info __initdata = {
-	.pll_clks		= atlas_pll_clks,
-	.nr_pll_clks		= ARRAY_SIZE(atlas_pll_clks),
-	.mux_clks		= atlas_mux_clks,
-	.nr_mux_clks		= ARRAY_SIZE(atlas_mux_clks),
-	.div_clks		= atlas_div_clks,
-	.nr_div_clks		= ARRAY_SIZE(atlas_div_clks),
-	.gate_clks		= atlas_gate_clks,
-	.nr_gate_clks		= ARRAY_SIZE(atlas_gate_clks),
-	.nr_clk_ids		= ATLAS_NR_CLK,
-	.clk_regs		= atlas_clk_regs,
-	.nr_clk_regs		= ARRAY_SIZE(atlas_clk_regs),
-};
-
 static void __init exynos5433_cmu_atlas_init(struct device_node *np)
 {
-	samsung_cmu_register_one(np, &atlas_cmu_info);
+	void __iomem *reg_base;
+	struct samsung_clk_provider *ctx;
+
+	reg_base = of_iomap(np, 0);
+	if (!reg_base) {
+		panic("%s: failed to map registers\n", __func__);
+		return;
+	}
+
+	ctx = samsung_clk_init(np, reg_base, ATLAS_NR_CLK);
+	if (!ctx) {
+		panic("%s: unable to allocate ctx\n", __func__);
+		return;
+	}
+
+	samsung_clk_register_pll(ctx, atlas_pll_clks,
+				 ARRAY_SIZE(atlas_pll_clks), reg_base);
+	samsung_clk_register_mux(ctx, atlas_mux_clks,
+				 ARRAY_SIZE(atlas_mux_clks));
+	samsung_clk_register_div(ctx, atlas_div_clks,
+				 ARRAY_SIZE(atlas_div_clks));
+	samsung_clk_register_gate(ctx, atlas_gate_clks,
+				  ARRAY_SIZE(atlas_gate_clks));
+	samsung_clk_sleep_init(reg_base, atlas_clk_regs,
+			       ARRAY_SIZE(atlas_clk_regs));
+
+	samsung_clk_of_add_provider(np, ctx);
 }
 CLK_OF_DECLARE(exynos5433_cmu_atlas, "samsung,exynos5433-cmu-atlas",
 		exynos5433_cmu_atlas_init);
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index f38a6c4..f20a15c 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -346,9 +346,9 @@ static struct syscore_ops samsung_clk_syscore_ops = {
 	.resume = samsung_clk_resume,
 };
 
-static void samsung_clk_sleep_init(void __iomem *reg_base,
-		const unsigned long *rdump,
-		unsigned long nr_rdump)
+void samsung_clk_sleep_init(void __iomem *reg_base,
+			const unsigned long *rdump,
+			unsigned long nr_rdump)
 {
 	struct samsung_clock_reg_cache *reg_cache;
 
@@ -370,9 +370,9 @@ static void samsung_clk_sleep_init(void __iomem *reg_base,
 }
 
 #else
-static void samsung_clk_sleep_init(void __iomem *reg_base,
-		const unsigned long *rdump,
-		unsigned long nr_rdump) {}
+void samsung_clk_sleep_init(void __iomem *reg_base,
+			const unsigned long *rdump,
+			unsigned long nr_rdump) {}
 #endif
 
 /*
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index aa872d2..ab2b101 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -399,6 +399,10 @@ extern struct samsung_clk_provider __init *samsung_cmu_register_one(
 
 extern unsigned long _get_rate(const char *clk_name);
 
+extern void samsung_clk_sleep_init(void __iomem *reg_base,
+			const unsigned long *rdump,
+			unsigned long nr_rdump);
+
 extern void samsung_clk_save(void __iomem *base,
 			struct samsung_clk_reg_dump *rd,
 			unsigned int num_regs);
-- 
1.9.1
