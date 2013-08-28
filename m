From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 1/2] clk: samsung: Add GPLL freq table for exynos5250 SoC
Date: Wed, 28 Aug 2013 19:09:57 +0530
Message-ID: <1377697198-19097-2-git-send-email-vikas.sajjan@linaro.org>
References: <1377697198-19097-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:50357 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752961Ab3H1NkO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 09:40:14 -0400
Received: by mail-pb0-f41.google.com with SMTP id rp2so6308856pbb.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2013 06:40:14 -0700 (PDT)
In-Reply-To: <1377697198-19097-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, mturquette@linaro.org, patches@linaro.org, linaro-kernel@lists.linaro.org, joshi@samsung.com

Adds GPLL freq table for exynos5250 SoC.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 drivers/clk/samsung/clk-exynos5250.c |   19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 00a80e4..6b7ad2a 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -494,6 +494,21 @@ static struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
 	GATE(g2d, "g2d", "aclk200", GATE_IP_ACP, 3, 0, 0),
 };
 
+static struct samsung_pll_rate_table gpll_24mhz_tbl[] __initdata = {
+	/* sorted in descending order */
+	/* PLL_35XX_RATE(rate, m, p, s) */
+	PLL_35XX_RATE(1400000000, 175, 3, 0), /* for 466MHz */
+	PLL_35XX_RATE(800000000, 100, 3, 0),  /* for 400MHz, 200MHz */
+	PLL_35XX_RATE(666857142, 389, 7, 1),  /* for 333MHz, 222MHz, 166MHz */
+	PLL_35XX_RATE(600000000, 200, 4, 1),  /* for 300MHz, 200MHz, 150MHz */
+	PLL_35XX_RATE(533000000, 533, 12, 1), /* for 533MHz, 266MHz, 133MHz */
+	PLL_35XX_RATE(450000000, 450, 12, 1), /* for 450Hz */
+	PLL_35XX_RATE(400000000, 100, 3, 1),
+	PLL_35XX_RATE(333000000, 222, 4, 2),
+	PLL_35XX_RATE(200000000, 100, 3, 2),
+	{ },
+};
+
 static struct samsung_pll_rate_table vpll_24mhz_tbl[] __initdata = {
 	/* sorted in descending order */
 	/* PLL_36XX_RATE(rate, m, p, s, k) */
@@ -561,8 +576,10 @@ static void __init exynos5250_clk_init(struct device_node *np)
 	samsung_clk_register_mux(exynos5250_pll_pmux_clks,
 				ARRAY_SIZE(exynos5250_pll_pmux_clks));
 
-	if (_get_rate("fin_pll") == 24 * MHZ)
+	if (_get_rate("fin_pll") == 24 * MHZ) {
 		exynos5250_plls[epll].rate_table = epll_24mhz_tbl;
+		exynos5250_plls[gpll].rate_table = gpll_24mhz_tbl;
+	}
 
 	if (_get_rate("mout_vpllsrc") == 24 * MHZ)
 		exynos5250_plls[vpll].rate_table =  vpll_24mhz_tbl;
-- 
1.7.9.5
