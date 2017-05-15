From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 6/6] clk: samsung: s5pv210-audss: Convert to the new clk_hw
 API
Date: Mon, 15 May 2017 08:51:04 +0200
Message-ID: <1494831064-10278-1-git-send-email-m.szyprowski@samsung.com>
References: <1493016143-21569-7-git-send-email-m.szyprowski@samsung.com>
 <CGME20170515065110eucas1p1b558e1c1ce24852219aa7d98e3b57dff@eucas1p1.samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1493016143-21569-7-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Clock providers should use the new struct clk_hw based API, so convert
Samsung S5PV210 Audio Subsystem clock provider to the new approach.

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
 drivers/clk/samsung/clk-s5pv210-audss.c | 52 +++++++++++++++++----------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/samsung/clk-s5pv210-audss.c b/drivers/clk/samsung/clk-s5pv210-audss.c
index c66ed2d1450e..b9641414ddc6 100644
--- a/drivers/clk/samsung/clk-s5pv210-audss.c
+++ b/drivers/clk/samsung/clk-s5pv210-audss.c
@@ -24,9 +24,8 @@
 #include <dt-bindings/clock/s5pv210-audss.h>
 
 static DEFINE_SPINLOCK(lock);
-static struct clk **clk_table;
 static void __iomem *reg_base;
-static struct clk_onecell_data clk_data;
+static struct clk_hw_onecell_data *clk_data;
 
 #define ASS_CLK_SRC 0x0
 #define ASS_CLK_DIV 0x4
@@ -71,6 +70,7 @@ static int s5pv210_audss_clk_probe(struct platform_device *pdev)
 	const char *mout_audss_p[2];
 	const char *mout_i2s_p[3];
 	const char *hclk_p;
+	struct clk_hw **clk_table;
 	struct clk *hclk, *pll_ref, *pll_in, *cdclk, *sclk_audio;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -80,14 +80,16 @@ static int s5pv210_audss_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(reg_base);
 	}
 
-	clk_table = devm_kzalloc(&pdev->dev,
-				sizeof(struct clk *) * AUDSS_MAX_CLKS,
+	clk_data = devm_kzalloc(&pdev->dev,
+				sizeof(*clk_data) +
+				sizeof(*clk_data->hws) * AUDSS_MAX_CLKS,
 				GFP_KERNEL);
-	if (!clk_table)
+
+	if (!clk_data)
 		return -ENOMEM;
 
-	clk_data.clks = clk_table;
-	clk_data.clk_num = AUDSS_MAX_CLKS;
+	clk_data->num = AUDSS_MAX_CLKS;
+	clk_table = clk_data->hws;
 
 	hclk = devm_clk_get(&pdev->dev, "hclk");
 	if (IS_ERR(hclk)) {
@@ -116,7 +118,7 @@ static int s5pv210_audss_clk_probe(struct platform_device *pdev)
 	else
 		mout_audss_p[0] = "xxti";
 	mout_audss_p[1] = __clk_get_name(pll_in);
-	clk_table[CLK_MOUT_AUDSS] = clk_register_mux(NULL, "mout_audss",
+	clk_table[CLK_MOUT_AUDSS] = clk_hw_register_mux(NULL, "mout_audss",
 				mout_audss_p, ARRAY_SIZE(mout_audss_p),
 				CLK_SET_RATE_NO_REPARENT,
 				reg_base + ASS_CLK_SRC, 0, 1, 0, &lock);
@@ -127,44 +129,44 @@ static int s5pv210_audss_clk_probe(struct platform_device *pdev)
 	else
 		mout_i2s_p[1] = "iiscdclk0";
 	mout_i2s_p[2] = __clk_get_name(sclk_audio);
-	clk_table[CLK_MOUT_I2S_A] = clk_register_mux(NULL, "mout_i2s_audss",
+	clk_table[CLK_MOUT_I2S_A] = clk_hw_register_mux(NULL, "mout_i2s_audss",
 				mout_i2s_p, ARRAY_SIZE(mout_i2s_p),
 				CLK_SET_RATE_NO_REPARENT,
 				reg_base + ASS_CLK_SRC, 2, 2, 0, &lock);
 
-	clk_table[CLK_DOUT_AUD_BUS] = clk_register_divider(NULL,
+	clk_table[CLK_DOUT_AUD_BUS] = clk_hw_register_divider(NULL,
 				"dout_aud_bus", "mout_audss", 0,
 				reg_base + ASS_CLK_DIV, 0, 4, 0, &lock);
-	clk_table[CLK_DOUT_I2S_A] = clk_register_divider(NULL, "dout_i2s_audss",
-				"mout_i2s_audss", 0, reg_base + ASS_CLK_DIV,
-				4, 4, 0, &lock);
+	clk_table[CLK_DOUT_I2S_A] = clk_hw_register_divider(NULL,
+				"dout_i2s_audss", "mout_i2s_audss", 0,
+				reg_base + ASS_CLK_DIV, 4, 4, 0, &lock);
 
-	clk_table[CLK_I2S] = clk_register_gate(NULL, "i2s_audss",
+	clk_table[CLK_I2S] = clk_hw_register_gate(NULL, "i2s_audss",
 				"dout_i2s_audss", CLK_SET_RATE_PARENT,
 				reg_base + ASS_CLK_GATE, 6, 0, &lock);
 
 	hclk_p = __clk_get_name(hclk);
 
-	clk_table[CLK_HCLK_I2S] = clk_register_gate(NULL, "hclk_i2s_audss",
+	clk_table[CLK_HCLK_I2S] = clk_hw_register_gate(NULL, "hclk_i2s_audss",
 				hclk_p, CLK_IGNORE_UNUSED,
 				reg_base + ASS_CLK_GATE, 5, 0, &lock);
-	clk_table[CLK_HCLK_UART] = clk_register_gate(NULL, "hclk_uart_audss",
+	clk_table[CLK_HCLK_UART] = clk_hw_register_gate(NULL, "hclk_uart_audss",
 				hclk_p, CLK_IGNORE_UNUSED,
 				reg_base + ASS_CLK_GATE, 4, 0, &lock);
-	clk_table[CLK_HCLK_HWA] = clk_register_gate(NULL, "hclk_hwa_audss",
+	clk_table[CLK_HCLK_HWA] = clk_hw_register_gate(NULL, "hclk_hwa_audss",
 				hclk_p, CLK_IGNORE_UNUSED,
 				reg_base + ASS_CLK_GATE, 3, 0, &lock);
-	clk_table[CLK_HCLK_DMA] = clk_register_gate(NULL, "hclk_dma_audss",
+	clk_table[CLK_HCLK_DMA] = clk_hw_register_gate(NULL, "hclk_dma_audss",
 				hclk_p, CLK_IGNORE_UNUSED,
 				reg_base + ASS_CLK_GATE, 2, 0, &lock);
-	clk_table[CLK_HCLK_BUF] = clk_register_gate(NULL, "hclk_buf_audss",
+	clk_table[CLK_HCLK_BUF] = clk_hw_register_gate(NULL, "hclk_buf_audss",
 				hclk_p, CLK_IGNORE_UNUSED,
 				reg_base + ASS_CLK_GATE, 1, 0, &lock);
-	clk_table[CLK_HCLK_RP] = clk_register_gate(NULL, "hclk_rp_audss",
+	clk_table[CLK_HCLK_RP] = clk_hw_register_gate(NULL, "hclk_rp_audss",
 				hclk_p, CLK_IGNORE_UNUSED,
 				reg_base + ASS_CLK_GATE, 0, 0, &lock);
 
-	for (i = 0; i < clk_data.clk_num; i++) {
+	for (i = 0; i < clk_data->num; i++) {
 		if (IS_ERR(clk_table[i])) {
 			dev_err(&pdev->dev, "failed to register clock %d\n", i);
 			ret = PTR_ERR(clk_table[i]);
@@ -172,8 +174,8 @@ static int s5pv210_audss_clk_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = of_clk_add_provider(pdev->dev.of_node, of_clk_src_onecell_get,
-					&clk_data);
+	ret = of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_onecell_get,
+				     clk_data);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to add clock provider\n");
 		goto unregister;
@@ -186,9 +188,9 @@ static int s5pv210_audss_clk_probe(struct platform_device *pdev)
 	return 0;
 
 unregister:
-	for (i = 0; i < clk_data.clk_num; i++) {
+	for (i = 0; i < clk_data->num; i++) {
 		if (!IS_ERR(clk_table[i]))
-			clk_unregister(clk_table[i]);
+			clk_hw_unregister(clk_table[i]);
 	}
 
 	return ret;
-- 
1.9.1

