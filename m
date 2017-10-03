From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 6/9] clk: samsung: Rework clkdev alias handling in
 Exynos5440 driver
Date: Tue, 03 Oct 2017 12:00:13 +0200
Message-ID: <20171003100016.32029-7-m.szyprowski@samsung.com>
References: <20171003100016.32029-1-m.szyprowski@samsung.com>
        <CGME20171003100031eucas1p145edaae6b857c194139d594ebdc9447e@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44533 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751515AbdJCKAe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Oct 2017 06:00:34 -0400
In-reply-to: <20171003100016.32029-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Exynos5440 still uses old, non-dt CPUfreq driver, which requires clkdev
aliases to get access to proper clocks. Create those aliases using
samsung_clk_register_alias() function instead of using *_A clock macros,
which will be removed soon.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5440.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5440.c b/drivers/clk/samsung/clk-exynos5440.c
index a80f3ef20801..b08bd54c5e76 100644
--- a/drivers/clk/samsung/clk-exynos5440.c
+++ b/drivers/clk/samsung/clk-exynos5440.c
@@ -53,8 +53,7 @@ static const struct samsung_fixed_factor_clock exynos5440_fixed_factor_clks[] __
 /* mux clocks */
 static const struct samsung_mux_clock exynos5440_mux_clks[] __initconst = {
 	MUX(0, "mout_spi", mout_spi_p, MISC_DOUT1, 5, 1),
-	MUX_A(CLK_ARM_CLK, "arm_clk", mout_armclk_p,
-			CPU_CLK_STATUS, 0, 1, "armclk"),
+	MUX(CLK_ARM_CLK, "arm_clk", mout_armclk_p, CPU_CLK_STATUS, 0, 1),
 };
 
 /* divider clocks */
@@ -117,6 +116,13 @@ static const struct samsung_pll_clock exynos5440_plls[] __initconst = {
 	PLL(pll_2550x, CLK_CPLLB, "cpllb", "xtal", 0, 0x50, NULL),
 };
 
+/*
+ * Clock aliases for legacy clkdev look-up.
+ */
+static const struct samsung_clock_alias exynos5440_aliases[] __initconst = {
+	ALIAS(CLK_ARM_CLK, NULL, "armclk"),
+};
+
 /* register exynos5440 clocks */
 static void __init exynos5440_clk_init(struct device_node *np)
 {
@@ -147,6 +153,8 @@ static void __init exynos5440_clk_init(struct device_node *np)
 			ARRAY_SIZE(exynos5440_div_clks));
 	samsung_clk_register_gate(ctx, exynos5440_gate_clks,
 			ARRAY_SIZE(exynos5440_gate_clks));
+	samsung_clk_register_alias(ctx, exynos5440_aliases,
+						ARRAY_SIZE(exynos5440_aliases));
 
 	samsung_clk_of_add_provider(np, ctx);
 
-- 
2.14.2
