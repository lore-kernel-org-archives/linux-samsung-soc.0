From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 3/7] clk: samsung: exynos5260: fix PLL rates
Date: Fri, 16 Feb 2018 15:57:50 +0100
Message-ID: <20180216145754.14428-4-a.hajda@samsung.com>
References: <20180216145754.14428-1-a.hajda@samsung.com>
        <CGME20180216145805eucas1p14670777cd5339fda26b95c71b726f866@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34613 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758049AbeBPO6N (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 09:58:13 -0500
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
 drivers/clk/samsung/clk-exynos5260.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5260.c b/drivers/clk/samsung/clk-exynos5260.c
index fd1d9bfc151b..8eae1752d700 100644
--- a/drivers/clk/samsung/clk-exynos5260.c
+++ b/drivers/clk/samsung/clk-exynos5260.c
@@ -65,7 +65,7 @@ static const struct samsung_pll_rate_table pll2650_24mhz_tbl[] __initconst = {
 	PLL_36XX_RATE(480000000, 160, 2, 2, 0),
 	PLL_36XX_RATE(432000000, 144, 2, 2, 0),
 	PLL_36XX_RATE(400000000, 200, 3, 2, 0),
-	PLL_36XX_RATE(394073130, 459, 7, 2, 49282),
+	PLL_36XX_RATE(394073128, 459, 7, 2, 49282),
 	PLL_36XX_RATE(333000000, 111, 2, 2, 0),
 	PLL_36XX_RATE(300000000, 100, 2, 2, 0),
 	PLL_36XX_RATE(266000000, 266, 3, 3, 0),
-- 
2.16.1
