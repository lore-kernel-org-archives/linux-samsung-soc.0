From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] clk: samsung: exynos5420: The EPLL rate table corrections
Date: Fri, 21 Jul 2017 13:19:50 +0200
Message-ID: <1500635990-19474-1-git-send-email-s.nawrocki@samsung.com>
References: <CGME20170721112008epcas5p1eb75e4eb00d1dbad130460d2cbc0ce0c@epcas5p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org
Cc: cw00.choi@samsung.com, krzk@kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch fixes values of the EPLL K coefficient and changes
the EPLL output frequency values to match exactly what is
possible to achieve with given M, P, S, K coefficients.
This allows to avoid rounding errors and unexpected frequency
being set with clk_set_rate(), due to recalc_rate returning
different values than the PLL rate specified in the
exynos5420_epll_24mhz_tbl table. E.g. this prevents a case
where two consecutive clk_set_rate() calls with same argument
result in different PLL output frequency.

The PLL output frequencies have been calculated with formula:

f = fxtal * (M * 2^16 + K) / (P * 2^S) / 2^16

where fxtal = 24000000.

Fixes: 9842452acd ("clk: samsung: exynos542x: Add EPLL rate table")
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 0748a0b..9a6476a 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1283,16 +1283,16 @@ static void __init exynos5420_clk_sleep_init(void) {}
 static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
 	PLL_36XX_RATE(600000000U, 100, 2, 1, 0),
 	PLL_36XX_RATE(400000000U, 200, 3, 2, 0),
-	PLL_36XX_RATE(393216000U, 197, 3, 2, 25690),
-	PLL_36XX_RATE(361267200U, 301, 5, 2, 3671),
+	PLL_36XX_RATE(393216003U, 197, 3, 2, -25690),
+	PLL_36XX_RATE(361267218U, 301, 5, 2, 3671),
 	PLL_36XX_RATE(200000000U, 200, 3, 3, 0),
-	PLL_36XX_RATE(196608000U, 197, 3, 3, -25690),
-	PLL_36XX_RATE(180633600U, 301, 5, 3, 3671),
-	PLL_36XX_RATE(131072000U, 131, 3, 3, 4719),
+	PLL_36XX_RATE(196608001U, 197, 3, 3, -25690),
+	PLL_36XX_RATE(180633609U, 301, 5, 3, 3671),
+	PLL_36XX_RATE(131072006U, 131, 3, 3, 4719),
 	PLL_36XX_RATE(100000000U, 200, 3, 4, 0),
-	PLL_36XX_RATE(65536000U, 131, 3, 4, 4719),
-	PLL_36XX_RATE(49152000U, 197, 3, 5, 25690),
-	PLL_36XX_RATE(32768000U, 131, 3, 5, 4719),
+	PLL_36XX_RATE( 65536003U, 131, 3, 4, 4719),
+	PLL_36XX_RATE( 49152000U, 197, 3, 5, -25690),
+	PLL_36XX_RATE( 32768001U, 131, 3, 5, 4719),
 };
 
 static struct samsung_pll_clock exynos5x_plls[nr_plls] __initdata = {
-- 
1.9.1
