From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] clk: exynos4: Register custom fixed rate clocks conditionally
Date: Tue, 20 May 2014 16:08:28 +0200
Message-ID: <1400594908-11941-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:17585 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753217AbaETOI4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 May 2014 10:08:56 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5V007TZLYT3C80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 May 2014 23:08:53 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: t.figa@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Use the Exynos custom fixed rate clocks registration (for oscillators
connected to the XXTI or XUSBXTI pins) only if "fixed-rate-clocks"
node is found in device tree. This allows to handle new dtbs with those
clocks described in a generic way and having the "fixed-rate-clocks"
node removed.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c |   24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 05fc93c..f0b8420 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1045,7 +1045,7 @@ static unsigned long exynos4_get_xom(void)
 	return xom;
 }
 
-static void __init exynos4_clk_register_finpll(void)
+static void __init exynos4_clk_register_finpll(struct device_node *np)
 {
 	struct samsung_fixed_rate_clock fclk;
 	struct clk *clk;
@@ -1054,7 +1054,10 @@ static void __init exynos4_clk_register_finpll(void)
 	unsigned int xom = exynos4_get_xom();
 
 	parent_name = xom & 1 ? "xusbxti" : "xxti";
-	clk = clk_get(NULL, parent_name);
+	if (np)
+		clk = of_clk_get_by_name(np, parent_name);
+	else
+		clk = clk_get(NULL, parent_name);
 	if (IS_ERR(clk)) {
 		pr_err("%s: failed to lookup parent clock %s, assuming "
 			"fin_pll clock frequency is 24MHz\n", __func__,
@@ -1193,11 +1196,18 @@ static void __init exynos4_clk_init(struct device_node *np,
 
 	samsung_clk_init(np, reg_base, CLK_NR_CLKS);
 
-	samsung_clk_of_register_fixed_ext(exynos4_fixed_rate_ext_clks,
-			ARRAY_SIZE(exynos4_fixed_rate_ext_clks),
-			ext_clk_match);
-
-	exynos4_clk_register_finpll();
+	if (of_find_node_by_name(np, "fixed-rate-clocks")) {
+		/*
+		 * Exynos custom fixed clock registration, only for
+		 * compatibility with legacy dtbs.
+		 */
+		samsung_clk_of_register_fixed_ext(exynos4_fixed_rate_ext_clks,
+					ARRAY_SIZE(exynos4_fixed_rate_ext_clks),
+					ext_clk_match);
+		exynos4_clk_register_finpll(NULL);
+	} else {
+		exynos4_clk_register_finpll(np);
+	}
 
 	if (exynos4_soc == EXYNOS4210) {
 		samsung_clk_register_mux(exynos4210_mux_early,
-- 
1.7.9.5
