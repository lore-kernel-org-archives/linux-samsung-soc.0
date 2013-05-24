From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [RESEND PATCH 5/5] clk: samsung: Add EPLL and VPLL freq table for exynos5250 SoC
Date: Fri, 24 May 2013 11:25:19 +0530
Message-ID: <1369374919-6214-6-git-send-email-vikas.sajjan@linaro.org>
References: <1369374919-6214-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:36940 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752581Ab3EXFzn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 May 2013 01:55:43 -0400
Received: by mail-pd0-f171.google.com with SMTP id z11so3752022pdj.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 May 2013 22:55:42 -0700 (PDT)
Received: from localhost.localdomain ([115.113.119.130])
        by mx.google.com with ESMTPSA id kr16sm15955475pab.23.2013.05.23.22.55.40
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
        Thu, 23 May 2013 22:55:41 -0700 (PDT)
In-Reply-To: <1369374919-6214-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Adds the EPLL and VPLL freq table for exynos5250 SoC.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 drivers/clk/samsung/clk-exynos5250.c |   19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index ddf10ca..00d1fa6 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -469,6 +469,21 @@ static __initdata struct of_device_id ext_clk_match[] = {
 	{ },
 };
 
+static struct samsung_pll_rate_table vpll_tbl[] = {
+	PLL_36XX_RATE(70500000, 2, 94, 4, 0),
+};
+
+static struct samsung_pll_rate_table epll_tbl[] = {
+	PLL_36XX_RATE(192000000, 48, 3, 1, 0),
+	PLL_36XX_RATE(180000000, 45, 3, 1, 0),
+	PLL_36XX_RATE(73728000, 73, 3, 3, 47710),
+	PLL_36XX_RATE(67737600, 90, 4, 3, 20762),
+	PLL_36XX_RATE(49152000, 49, 3, 3, 9961),
+	PLL_36XX_RATE(45158400, 45, 3, 3, 10381),
+	PLL_36XX_RATE(180633600, 45, 3, 1, 10381),
+	PLL_36XX_RATE(32768000, 131, 3, 5, 4719),
+};
+
 /* register exynox5250 clocks */
 void __init exynos5250_clk_init(struct device_node *np)
 {
@@ -501,9 +516,9 @@ void __init exynos5250_clk_init(struct device_node *np)
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
