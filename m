From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 4/6] clk: samsung: exynos-audss: Convert to the new clk_hw
 API
Date: Mon, 15 May 2017 08:50:47 +0200
Message-ID: <1494831047-10235-1-git-send-email-m.szyprowski@samsung.com>
References: <1493016143-21569-5-git-send-email-m.szyprowski@samsung.com>
 <CGME20170515065111eucas1p2127c41dc0fa0d069d5f09bc222f5bd55@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:26309 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932651AbdEOGvP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 May 2017 02:51:15 -0400
In-reply-to: <1493016143-21569-5-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Clock providers should use the new struct clk_hw based API, so convert
Exynos Audio Subsystem clock provider to the new approach.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
Sylwester, if possible, please replace v2 with this fixed version in your tree,
as it has not been merged yet to clk-next nor to linux-next.

Changelog
v3:
- fixed clock data parameter passed to of_clk_add_hw_provider() - after conversion
  clk_data is a pointer, so passing it as &clk_data is wrong and causes serious issues

---
 drivers/clk/samsung/clk-exynos-audss.c | 57 +++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index cb7df358a27d..85edeb738853 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -22,9 +22,8 @@
 #include <dt-bindings/clock/exynos-audss-clk.h>
 
 static DEFINE_SPINLOCK(lock);
-static struct clk **clk_table;
 static void __iomem *reg_base;
-static struct clk_onecell_data clk_data;
+static struct clk_hw_onecell_data *clk_data;
 /*
  * On Exynos5420 this will be a clock which has to be enabled before any
  * access to audss registers. Typically a child of EPLL.
@@ -110,18 +109,18 @@ static void exynos_audss_clk_teardown(void)
 	int i;
 
 	for (i = EXYNOS_MOUT_AUDSS; i < EXYNOS_DOUT_SRP; i++) {
-		if (!IS_ERR(clk_table[i]))
-			clk_unregister_mux(clk_table[i]);
+		if (!IS_ERR(clk_data->hws[i]))
+			clk_hw_unregister_mux(clk_data->hws[i]);
 	}
 
 	for (; i < EXYNOS_SRP_CLK; i++) {
-		if (!IS_ERR(clk_table[i]))
-			clk_unregister_divider(clk_table[i]);
+		if (!IS_ERR(clk_data->hws[i]))
+			clk_hw_unregister_divider(clk_data->hws[i]);
 	}
 
-	for (; i < clk_data.clk_num; i++) {
-		if (!IS_ERR(clk_table[i]))
-			clk_unregister_gate(clk_table[i]);
+	for (; i < clk_data->num; i++) {
+		if (!IS_ERR(clk_data->hws[i]))
+			clk_hw_unregister_gate(clk_data->hws[i]);
 	}
 }
 
@@ -133,6 +132,7 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 	const char *sclk_pcm_p = "sclk_pcm0";
 	struct clk *pll_ref, *pll_in, *cdclk, *sclk_audio, *sclk_pcm_in;
 	const struct exynos_audss_clk_drvdata *variant;
+	struct clk_hw **clk_table;
 	struct resource *res;
 	int i, ret = 0;
 
@@ -149,14 +149,15 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 
 	epll = ERR_PTR(-ENODEV);
 
-	clk_table = devm_kzalloc(&pdev->dev,
-				sizeof(struct clk *) * EXYNOS_AUDSS_MAX_CLKS,
+	clk_data = devm_kzalloc(&pdev->dev,
+				sizeof(*clk_data) +
+				sizeof(*clk_data->hws) * EXYNOS_AUDSS_MAX_CLKS,
 				GFP_KERNEL);
-	if (!clk_table)
+	if (!clk_data)
 		return -ENOMEM;
 
-	clk_data.clks = clk_table;
-	clk_data.clk_num = variant->num_clks;
+	clk_data->num = variant->num_clks;
+	clk_table = clk_data->hws;
 
 	pll_ref = devm_clk_get(&pdev->dev, "pll_ref");
 	pll_in = devm_clk_get(&pdev->dev, "pll_in");
@@ -176,7 +177,7 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 			}
 		}
 	}
-	clk_table[EXYNOS_MOUT_AUDSS] = clk_register_mux(NULL, "mout_audss",
+	clk_table[EXYNOS_MOUT_AUDSS] = clk_hw_register_mux(NULL, "mout_audss",
 				mout_audss_p, ARRAY_SIZE(mout_audss_p),
 				CLK_SET_RATE_NO_REPARENT,
 				reg_base + ASS_CLK_SRC, 0, 1, 0, &lock);
@@ -187,53 +188,53 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 		mout_i2s_p[1] = __clk_get_name(cdclk);
 	if (!IS_ERR(sclk_audio))
 		mout_i2s_p[2] = __clk_get_name(sclk_audio);
-	clk_table[EXYNOS_MOUT_I2S] = clk_register_mux(NULL, "mout_i2s",
+	clk_table[EXYNOS_MOUT_I2S] = clk_hw_register_mux(NULL, "mout_i2s",
 				mout_i2s_p, ARRAY_SIZE(mout_i2s_p),
 				CLK_SET_RATE_NO_REPARENT,
 				reg_base + ASS_CLK_SRC, 2, 2, 0, &lock);
 
-	clk_table[EXYNOS_DOUT_SRP] = clk_register_divider(NULL, "dout_srp",
+	clk_table[EXYNOS_DOUT_SRP] = clk_hw_register_divider(NULL, "dout_srp",
 				"mout_audss", 0, reg_base + ASS_CLK_DIV, 0, 4,
 				0, &lock);
 
-	clk_table[EXYNOS_DOUT_AUD_BUS] = clk_register_divider(NULL,
+	clk_table[EXYNOS_DOUT_AUD_BUS] = clk_hw_register_divider(NULL,
 				"dout_aud_bus", "dout_srp", 0,
 				reg_base + ASS_CLK_DIV, 4, 4, 0, &lock);
 
-	clk_table[EXYNOS_DOUT_I2S] = clk_register_divider(NULL, "dout_i2s",
+	clk_table[EXYNOS_DOUT_I2S] = clk_hw_register_divider(NULL, "dout_i2s",
 				"mout_i2s", 0, reg_base + ASS_CLK_DIV, 8, 4, 0,
 				&lock);
 
-	clk_table[EXYNOS_SRP_CLK] = clk_register_gate(NULL, "srp_clk",
+	clk_table[EXYNOS_SRP_CLK] = clk_hw_register_gate(NULL, "srp_clk",
 				"dout_srp", CLK_SET_RATE_PARENT,
 				reg_base + ASS_CLK_GATE, 0, 0, &lock);
 
-	clk_table[EXYNOS_I2S_BUS] = clk_register_gate(NULL, "i2s_bus",
+	clk_table[EXYNOS_I2S_BUS] = clk_hw_register_gate(NULL, "i2s_bus",
 				"dout_aud_bus", CLK_SET_RATE_PARENT,
 				reg_base + ASS_CLK_GATE, 2, 0, &lock);
 
-	clk_table[EXYNOS_SCLK_I2S] = clk_register_gate(NULL, "sclk_i2s",
+	clk_table[EXYNOS_SCLK_I2S] = clk_hw_register_gate(NULL, "sclk_i2s",
 				"dout_i2s", CLK_SET_RATE_PARENT,
 				reg_base + ASS_CLK_GATE, 3, 0, &lock);
 
-	clk_table[EXYNOS_PCM_BUS] = clk_register_gate(NULL, "pcm_bus",
+	clk_table[EXYNOS_PCM_BUS] = clk_hw_register_gate(NULL, "pcm_bus",
 				 "sclk_pcm", CLK_SET_RATE_PARENT,
 				reg_base + ASS_CLK_GATE, 4, 0, &lock);
 
 	sclk_pcm_in = devm_clk_get(&pdev->dev, "sclk_pcm_in");
 	if (!IS_ERR(sclk_pcm_in))
 		sclk_pcm_p = __clk_get_name(sclk_pcm_in);
-	clk_table[EXYNOS_SCLK_PCM] = clk_register_gate(NULL, "sclk_pcm",
+	clk_table[EXYNOS_SCLK_PCM] = clk_hw_register_gate(NULL, "sclk_pcm",
 				sclk_pcm_p, CLK_SET_RATE_PARENT,
 				reg_base + ASS_CLK_GATE, 5, 0, &lock);
 
 	if (variant->has_adma_clk) {
-		clk_table[EXYNOS_ADMA] = clk_register_gate(NULL, "adma",
+		clk_table[EXYNOS_ADMA] = clk_hw_register_gate(NULL, "adma",
 				"dout_srp", CLK_SET_RATE_PARENT,
 				reg_base + ASS_CLK_GATE, 9, 0, &lock);
 	}
 
-	for (i = 0; i < clk_data.clk_num; i++) {
+	for (i = 0; i < clk_data->num; i++) {
 		if (IS_ERR(clk_table[i])) {
 			dev_err(&pdev->dev, "failed to register clock %d\n", i);
 			ret = PTR_ERR(clk_table[i]);
@@ -241,8 +242,8 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = of_clk_add_provider(pdev->dev.of_node, of_clk_src_onecell_get,
-					&clk_data);
+	ret = of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_onecell_get,
+				     clk_data);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to add clock provider\n");
 		goto unregister;
-- 
1.9.1
