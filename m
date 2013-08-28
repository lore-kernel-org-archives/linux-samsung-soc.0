From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 2/2] clk: samsung: Add APLL, KPLL, EPLL and VPLL freq table for exynos5420 SoC
Date: Wed, 28 Aug 2013 19:09:58 +0530
Message-ID: <1377697198-19097-3-git-send-email-vikas.sajjan@linaro.org>
References: <1377697198-19097-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:57047 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752961Ab3H1NkS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 09:40:18 -0400
Received: by mail-pa0-f42.google.com with SMTP id lj1so6295397pab.29
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2013 06:40:18 -0700 (PDT)
In-Reply-To: <1377697198-19097-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, mturquette@linaro.org, patches@linaro.org, linaro-kernel@lists.linaro.org, joshi@samsung.com

Adds APLL, KPLL, EPLL and VPLL freq table for exynos5420 SoC.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 drivers/clk/samsung/clk-exynos5420.c |   78 ++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index e035fd0..5cbe313 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -757,6 +757,76 @@ static struct of_device_id ext_clk_match[] __initdata = {
 	{ },
 };
 
+static struct samsung_pll_rate_table apll_24mhz_tbl[] __initdata = {
+	/* sorted in descending order */
+	/* PLL_35XX_RATE(rate, m, p, s) */
+	PLL_35XX_RATE(2000000000, 250, 3, 0),
+	PLL_35XX_RATE(1900000000, 475, 6, 0),
+	PLL_35XX_RATE(1800000000, 225, 3, 0),
+	PLL_35XX_RATE(1700000000, 425, 6, 0),
+	PLL_35XX_RATE(1600000000, 200, 3, 0),
+	PLL_35XX_RATE(1500000000, 250, 4, 0),
+	PLL_35XX_RATE(1400000000, 175, 3, 0),
+	PLL_35XX_RATE(1300000000, 325, 6, 0),
+	PLL_35XX_RATE(1200000000, 200, 2, 1),
+	PLL_35XX_RATE(1100000000, 275, 3, 1),
+	PLL_35XX_RATE(1000000000, 250, 3, 1),
+	PLL_35XX_RATE(900000000, 150, 2, 1),
+	PLL_35XX_RATE(800000000, 200, 3, 1),
+	PLL_35XX_RATE(700000000, 175, 3, 1),
+	PLL_35XX_RATE(600000000, 200, 2, 2),
+	PLL_35XX_RATE(500000000, 250, 3, 2),
+	PLL_35XX_RATE(400000000, 200, 3, 2),
+	PLL_35XX_RATE(300000000, 400, 4, 3),
+	PLL_35XX_RATE(200000000, 200, 3, 3),
+	{ },
+};
+
+static struct samsung_pll_rate_table kpll_24mhz_tbl[] __initdata = {
+	/* sorted in descending order */
+	/* PLL_35XX_RATE(rate, m, p, s) */
+	PLL_35XX_RATE(1300000000, 325, 6, 0),
+	PLL_35XX_RATE(1200000000, 200, 2, 1),
+	PLL_35XX_RATE(1100000000, 275, 3, 1),
+	PLL_35XX_RATE(1000000000, 250, 3, 1),
+	PLL_35XX_RATE(900000000, 150, 2, 1),
+	PLL_35XX_RATE(800000000, 200, 3, 1),
+	PLL_35XX_RATE(700000000, 175, 3, 1),
+	PLL_35XX_RATE(600000000, 200, 2, 2),
+	PLL_35XX_RATE(500000000, 250, 3, 2),
+	PLL_35XX_RATE(400000000, 200, 3, 2),
+	PLL_35XX_RATE(300000000, 400, 4, 3),
+	PLL_35XX_RATE(200000000, 200, 3, 3),
+	{ },
+};
+
+static struct samsung_pll_rate_table epll_24mhz_tbl[] __initdata = {
+	/* sorted in descending order */
+	/* PLL_36XX_RATE(rate, m, p, s, k) */
+	PLL_36XX_RATE(192000000, 64, 2, 2, 0),
+	PLL_36XX_RATE(180633605, 45, 3, 1, 10381),
+	PLL_36XX_RATE(180000000, 45, 3, 1, 0),
+	PLL_36XX_RATE(73728000, 98, 2, 4, 19923),
+	PLL_36XX_RATE(67737602, 90, 2, 4, 20762),
+	PLL_36XX_RATE(49152000, 98, 3, 4, 19923),
+	PLL_36XX_RATE(45158401, 90, 3, 4, 20762),
+	PLL_36XX_RATE(32768001, 131, 3, 5, 4719),
+	{ },
+};
+
+static struct samsung_pll_rate_table vpll_24mhz_tbl[] __initdata = {
+	/* sorted in descending order */
+	/* PLL_35XX_RATE(rate, m, p, s) */
+	PLL_35XX_RATE(533000000, 533, 6, 2),
+	PLL_35XX_RATE(480000000, 160, 2, 2),
+	PLL_35XX_RATE(420000000, 140, 2, 2),
+	PLL_35XX_RATE(350000000, 175, 3, 2),
+	PLL_35XX_RATE(266000000, 266, 3, 3),
+	PLL_35XX_RATE(177000000, 118, 2, 3),
+	PLL_35XX_RATE(100000000, 200, 3, 4),
+	{ },
+};
+
 /* register exynos5420 clocks */
 static void __init exynos5420_clk_init(struct device_node *np)
 {
@@ -776,6 +846,14 @@ static void __init exynos5420_clk_init(struct device_node *np)
 	samsung_clk_of_register_fixed_ext(exynos5420_fixed_rate_ext_clks,
 			ARRAY_SIZE(exynos5420_fixed_rate_ext_clks),
 			ext_clk_match);
+
+	if (_get_rate("fin_pll") == 24 * MHZ) {
+		exynos5420_plls[apll].rate_table = apll_24mhz_tbl;
+		exynos5420_plls[kpll].rate_table = kpll_24mhz_tbl;
+		exynos5420_plls[epll].rate_table = epll_24mhz_tbl;
+		exynos5420_plls[vpll].rate_table = vpll_24mhz_tbl;
+	}
+
 	samsung_clk_register_pll(exynos5420_plls, ARRAY_SIZE(exynos5420_plls),
 					reg_base);
 	samsung_clk_register_fixed_rate(exynos5420_fixed_rate_clks,
-- 
1.7.9.5
