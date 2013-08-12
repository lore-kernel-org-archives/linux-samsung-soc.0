From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 1/2] clk: samsung: Add GPLL freq table for exynos5250 SoC
Date: Mon, 12 Aug 2013 15:32:13 +0530
Message-ID: <1376301734-21847-2-git-send-email-vikas.sajjan@linaro.org>
References: <1376301734-21847-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:53627 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756027Ab3HLKCd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Aug 2013 06:02:33 -0400
Received: by mail-pd0-f182.google.com with SMTP id r10so3220060pdi.41
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Aug 2013 03:02:32 -0700 (PDT)
In-Reply-To: <1376301734-21847-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: mturquette@linaro.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, dianders@chromium.org, patches@linaro.org, linaro-kernel@lists.linaro.org

Adds GPLL freq table for exynos5250 SoC.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 drivers/clk/samsung/clk-exynos5250.c |   19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index a9916a4..c400e82 100644
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
+	PLL_35XX_RATE(667000000, 389, 7, 1),  /* for 333MHz, 222MHz, 166MHz */
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
@@ -565,8 +580,10 @@ static void __init exynos5250_clk_init(struct device_node *np)
 
 	fin_pll_rate = _get_rate("fin_pll");
 
-	if (fin_pll_rate == 24 * MHZ)
+	if (fin_pll_rate == 24 * MHZ) {
 		exynos5250_plls[epll].rate_table = epll_24mhz_tbl;
+		exynos5250_plls[gpll].rate_table = gpll_24mhz_tbl;
+	}
 
 	vpllsrc = __clk_lookup("mout_vpllsrc");
 	if (vpllsrc)
-- 
1.7.9.5
