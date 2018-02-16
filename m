From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 4/7] clk: samsung: exynos5433: fix PLL rates
Date: Fri, 16 Feb 2018 15:57:51 +0100
Message-ID: <20180216145754.14428-5-a.hajda@samsung.com>
References: <20180216145754.14428-1-a.hajda@samsung.com>
        <CGME20180216145805eucas1p28452227465bf275bb00dec65ab5b3978@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38053 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758047AbeBPO6M (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 09:58:12 -0500
In-reply-to: <20180216145754.14428-1-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "moderated list:SAMSUNG SOC CLOCK
        DRIVERS" <linux-samsung-soc@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>

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

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 57a41824ee2e..7985352ceb2f 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -729,7 +729,7 @@ static const struct samsung_pll_rate_table exynos5433_pll_rates[] __initconst =
 	PLL_35XX_RATE(800000000U,  400, 6,  1),
 	PLL_35XX_RATE(733000000U,  733, 12, 1),
 	PLL_35XX_RATE(700000000U,  175, 3,  1),
-	PLL_35XX_RATE(667000000U,  222, 4,  1),
+	PLL_35XX_RATE(666000000U,  222, 4,  1),
 	PLL_35XX_RATE(633000000U,  211, 4,  1),
 	PLL_35XX_RATE(600000000U,  500, 5,  2),
 	PLL_35XX_RATE(552000000U,  460, 5,  2),
@@ -757,12 +757,12 @@ static const struct samsung_pll_rate_table exynos5433_pll_rates[] __initconst =
 /* AUD_PLL */
 static const struct samsung_pll_rate_table exynos5433_aud_pll_rates[] __initconst = {
 	PLL_36XX_RATE(400000000U, 200, 3, 2,      0),
-	PLL_36XX_RATE(393216000U, 197, 3, 2, -25690),
+	PLL_36XX_RATE(393216003U, 197, 3, 2, -25690),
 	PLL_36XX_RATE(384000000U, 128, 2, 2,      0),
-	PLL_36XX_RATE(368640000U, 246, 4, 2, -15729),
-	PLL_36XX_RATE(361507200U, 181, 3, 2, -16148),
-	PLL_36XX_RATE(338688000U, 113, 2, 2,  -6816),
-	PLL_36XX_RATE(294912000U,  98, 1, 3,  19923),
+	PLL_36XX_RATE(368639991U, 246, 4, 2, -15729),
+	PLL_36XX_RATE(361507202U, 181, 3, 2, -16148),
+	PLL_36XX_RATE(338687988U, 113, 2, 2,  -6816),
+	PLL_36XX_RATE(294912002U,  98, 1, 3,  19923),
 	PLL_36XX_RATE(288000000U,  96, 1, 3,      0),
 	PLL_36XX_RATE(252000000U,  84, 1, 3,      0),
 	PLL_36XX_RATE(196608001U, 197, 3, 3, -25690),
-- 
2.16.1
