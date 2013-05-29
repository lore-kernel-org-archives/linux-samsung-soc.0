From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 5/5] clk: samsung: Add EPLL and VPLL freq table for exynos5250 SoC
Date: Wed, 29 May 2013 19:07:57 +0530
Message-ID: <1369834677-20312-6-git-send-email-vikas.sajjan@linaro.org>
References: <1369834677-20312-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:57633 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966078Ab3E2Nio (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 May 2013 09:38:44 -0400
Received: by mail-pd0-f173.google.com with SMTP id v14so7680557pde.32
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 May 2013 06:38:43 -0700 (PDT)
In-Reply-To: <1369834677-20312-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, yadi.brar01@gmail.com, dianders@chromium.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, thomas.abraham@linaro.org, patches@linaro.org, linaro-kernel@lists.linaro.org

Adds the EPLL and VPLL freq table for exynos5250 SoC.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 drivers/clk/samsung/clk-exynos5250.c |   20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index ddf10ca..bf61091 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -469,6 +469,22 @@ static __initdata struct of_device_id ext_clk_match[] = {
 	{ },
 };
 
+static const struct samsung_pll_rate_table vpll_tbl[] = {
+	PLL_36XX_RATE(70500000, 94, 2, 4, 0),
+};
+
+static const struct samsung_pll_rate_table epll_tbl[] = {
+	/* sorted in descending order */
+	PLL_36XX_RATE(192000000, 48, 3, 1, 0),
+	PLL_36XX_RATE(180633600, 45, 3, 1, 10381),
+	PLL_36XX_RATE(180000000, 45, 3, 1, 0),
+	PLL_36XX_RATE(73728000, 73, 3, 3, 47710),
+	PLL_36XX_RATE(67737600, 90, 4, 3, 20762),
+	PLL_36XX_RATE(49152000, 49, 3, 3, 9962),
+	PLL_36XX_RATE(45158400, 45, 3, 3, 10381),
+	PLL_36XX_RATE(32768000, 131, 3, 5, 4719),
+};
+
 /* register exynox5250 clocks */
 void __init exynos5250_clk_init(struct device_node *np)
 {
@@ -501,9 +517,9 @@ void __init exynos5250_clk_init(struct device_node *np)
 	cpll = samsung_clk_register_pll35xx("fout_cpll", "fin_pll",
 			reg_base + 0x10020, NULL, 0);
 	epll = samsung_clk_register_pll36xx("fout_epll", "fin_pll",
-			reg_base + 0x10030, NULL, 0);
+			reg_base + 0x10030, epll_tbl, ARRAY_SIZE(epll_tbl));
 	vpll = samsung_clk_register_pll36xx("fout_vpll", "mout_vpllsrc",
-			reg_base + 0x10040, NULL, 0);
+			reg_base + 0x10040, vpll_tbl, ARRAY_SIZE(vpll_tbl));
 
 	samsung_clk_register_fixed_rate(exynos5250_fixed_rate_clks,
 			ARRAY_SIZE(exynos5250_fixed_rate_clks));
-- 
1.7.9.5
