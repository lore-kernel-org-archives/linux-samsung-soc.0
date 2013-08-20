From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 15/16] clk: samsung: exynos4: Register PLL rate tables for
 Exynos4x12
Date: Tue, 20 Aug 2013 19:31:42 +0200
Message-ID: <1377019903-14614-16-git-send-email-t.figa@samsung.com>
References: <1377019903-14614-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41662 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751420Ab3HTRcL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 13:32:11 -0400
In-reply-to: <1377019903-14614-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Kumar Gala <galak@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch adds rate tables for PLLs that can be reconfigured at runtime
for Exynos4x12 SoCs. Provided tables contain PLL coefficients for
input clock of 24 MHz and so are registered only in this case. MPLL does
not need runtime reconfiguration and so table for it is not provided.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 49 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index e18cfae..8ab86f8 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1026,6 +1026,46 @@ static struct samsung_pll_rate_table exynos4210_vpll_rates[] = {
 	{ /* sentinel */ }
 };
 
+static struct samsung_pll_rate_table exynos4x12_apll_rates[] = {
+	PLL_35XX_RATE(1500000000, 250, 4, 0),
+	PLL_35XX_RATE(1400000000, 175, 3, 0),
+	PLL_35XX_RATE(1300000000, 325, 6, 0),
+	PLL_35XX_RATE(1200000000, 200, 4, 0),
+	PLL_35XX_RATE(1100000000, 275, 6, 0),
+	PLL_35XX_RATE(1000000000, 125, 3, 0),
+	PLL_35XX_RATE( 900000000, 150, 4, 0),
+	PLL_35XX_RATE( 800000000, 100, 3, 0),
+	PLL_35XX_RATE( 700000000, 175, 3, 1),
+	PLL_35XX_RATE( 600000000, 200, 4, 1),
+	PLL_35XX_RATE( 500000000, 125, 3, 1),
+	PLL_35XX_RATE( 400000000, 100, 3, 1),
+	PLL_35XX_RATE( 300000000, 200, 4, 2),
+	PLL_35XX_RATE( 200000000, 100, 3, 2),
+	{ /* sentinel */ }
+};
+
+static struct samsung_pll_rate_table exynos4x12_epll_rates[] = {
+	PLL_36XX_RATE(192000000, 48, 3, 1,     0),
+	PLL_36XX_RATE(180633605, 45, 3, 1, 10381),
+	PLL_36XX_RATE(180000000, 45, 3, 1,     0),
+	PLL_36XX_RATE( 73727996, 73, 3, 3, 47710),
+	PLL_36XX_RATE( 67737602, 90, 4, 3, 20762),
+	PLL_36XX_RATE( 49151992, 49, 3, 3,  9961),
+	PLL_36XX_RATE( 45158401, 45, 3, 3, 10381),
+	{ /* sentinel */ }
+};
+
+static struct samsung_pll_rate_table exynos4x12_vpll_rates[] = {
+	PLL_36XX_RATE(533000000, 133, 3, 1, 16384),
+	PLL_36XX_RATE(440000000, 110, 3, 1,     0),
+	PLL_36XX_RATE(350000000, 175, 3, 2,     0),
+	PLL_36XX_RATE(266000000, 133, 3, 2,     0),
+	PLL_36XX_RATE(160000000, 160, 3, 3,     0),
+	PLL_36XX_RATE(106031250,  53, 3, 2,  1024),
+	PLL_36XX_RATE( 53015625,  53, 3, 3,  1024),
+	{ /* sentinel */ }
+};
+
 static struct __initdata samsung_pll_clock exynos4210_plls[nr_plls] = {
 	[apll] = PLL_A(pll_4508, fout_apll, "fout_apll", "fin_pll", APLL_LOCK,
 		APLL_CON0, "fout_apll", NULL),
@@ -1090,6 +1130,15 @@ static void __init exynos4_clk_init(struct device_node *np,
 		samsung_clk_register_pll(exynos4210_plls,
 					ARRAY_SIZE(exynos4210_plls), reg_base);
 	} else {
+		if (_get_rate("fin_pll") == 24000000) {
+			exynos4x12_plls[apll].rate_table =
+							exynos4x12_apll_rates;
+			exynos4x12_plls[epll].rate_table =
+							exynos4x12_epll_rates;
+			exynos4x12_plls[vpll].rate_table =
+							exynos4x12_vpll_rates;
+		}
+
 		samsung_clk_register_pll(exynos4x12_plls,
 					ARRAY_SIZE(exynos4x12_plls), reg_base);
 	}
-- 
1.8.3.2
