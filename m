From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 1/7] clk: samsung: exynos3250: fix PLL rates
Date: Fri, 16 Feb 2018 15:57:48 +0100
Message-ID: <20180216145754.14428-2-a.hajda@samsung.com>
References: <20180216145754.14428-1-a.hajda@samsung.com>
        <CGME20180216145804eucas1p2cbe4de00131e6b7bbd946d349dfc2b2d@eucas1p2.samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20180216145754.14428-1-a.hajda@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "moderated list:SAMSUNG SOC CLOCK
        DRIVERS" <linux-samsung-soc@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Rates declared in PLL rate tables should match exactly rates calculated
from PLL coefficients. If that is not the case, rate of parent might be being
set not as expected. For instance, if in the PLL rates table we have
a 393216000 Hz entry and the real value as returned by the PLL's recalc_rate
callback is 393216003, after setting PLL's clk rate to 393216000 clk_get_rate
will return 393216003. If we now attempt to set rate of a PLL's child divider
clock to 393216000/2 its rate will be 131072001, rather than 196608000.
That is the divider will be set to 3 instead of 2, because 393216003/2 is
greater than 196608000.

To fix this issue declared rates are changed to exactly match rates generated
by a PLL, as calculated from the P, M, S, K coefficients.

In this patch an erroneous P value for 74176002 output frequency is also
corrected.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/clk/samsung/clk-exynos3250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index 1b81e283f605..ed36728424a2 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -698,7 +698,7 @@ static const struct samsung_pll_rate_table exynos3250_epll_rates[] __initconst =
 	PLL_36XX_RATE(144000000,  96, 2, 3,     0),
 	PLL_36XX_RATE( 96000000, 128, 2, 4,     0),
 	PLL_36XX_RATE( 84000000, 112, 2, 4,     0),
-	PLL_36XX_RATE( 80000004, 106, 2, 4, 43691),
+	PLL_36XX_RATE( 80000003, 106, 2, 4, 43691),
 	PLL_36XX_RATE( 73728000,  98, 2, 4, 19923),
 	PLL_36XX_RATE( 67737598, 270, 3, 5, 62285),
 	PLL_36XX_RATE( 65535999, 174, 2, 5, 49982),
@@ -734,7 +734,7 @@ static const struct samsung_pll_rate_table exynos3250_vpll_rates[] __initconst =
 	PLL_36XX_RATE(148352005,  98, 2, 3, 59070),
 	PLL_36XX_RATE(108000000, 144, 2, 4,     0),
 	PLL_36XX_RATE( 74250000,  99, 2, 4,     0),
-	PLL_36XX_RATE( 74176002,  98, 3, 4, 59070),
+	PLL_36XX_RATE( 74176002,  98, 2, 4, 59070),
 	PLL_36XX_RATE( 54054000, 216, 3, 5, 14156),
 	PLL_36XX_RATE( 54000000, 144, 2, 5,     0),
 	{ /* sentinel */ }
-- 
2.16.1

