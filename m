From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 6/7] clk: samsung: s3c2410: fix PLL rates
Date: Fri, 16 Feb 2018 15:57:53 +0100
Message-ID: <20180216145754.14428-7-a.hajda@samsung.com>
References: <20180216145754.14428-1-a.hajda@samsung.com>
        <CGME20180216145807eucas1p2260082a8178bc746dc8110982f2b0c2b@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34618 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758054AbeBPO6O (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 09:58:14 -0500
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
 drivers/clk/samsung/clk-s3c2410.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/samsung/clk-s3c2410.c b/drivers/clk/samsung/clk-s3c2410.c
index e0650c33863b..d8e58a659467 100644
--- a/drivers/clk/samsung/clk-s3c2410.c
+++ b/drivers/clk/samsung/clk-s3c2410.c
@@ -168,7 +168,7 @@ static struct samsung_pll_rate_table pll_s3c2410_12mhz_tbl[] __initdata = {
 	PLL_35XX_RATE(226000000, 105, 1, 1),
 	PLL_35XX_RATE(210000000, 132, 2, 1),
 	/* 2410 common */
-	PLL_35XX_RATE(203000000, 161, 3, 1),
+	PLL_35XX_RATE(202800000, 161, 3, 1),
 	PLL_35XX_RATE(192000000, 88, 1, 1),
 	PLL_35XX_RATE(186000000, 85, 1, 1),
 	PLL_35XX_RATE(180000000, 82, 1, 1),
@@ -178,18 +178,18 @@ static struct samsung_pll_rate_table pll_s3c2410_12mhz_tbl[] __initdata = {
 	PLL_35XX_RATE(147000000, 90, 2, 1),
 	PLL_35XX_RATE(135000000, 82, 2, 1),
 	PLL_35XX_RATE(124000000, 116, 1, 2),
-	PLL_35XX_RATE(118000000, 150, 2, 2),
+	PLL_35XX_RATE(118500000, 150, 2, 2),
 	PLL_35XX_RATE(113000000, 105, 1, 2),
-	PLL_35XX_RATE(101000000, 127, 2, 2),
+	PLL_35XX_RATE(101250000, 127, 2, 2),
 	PLL_35XX_RATE(90000000, 112, 2, 2),
-	PLL_35XX_RATE(85000000, 105, 2, 2),
+	PLL_35XX_RATE(84750000, 105, 2, 2),
 	PLL_35XX_RATE(79000000, 71, 1, 2),
-	PLL_35XX_RATE(68000000, 82, 2, 2),
-	PLL_35XX_RATE(56000000, 142, 2, 3),
+	PLL_35XX_RATE(67500000, 82, 2, 2),
+	PLL_35XX_RATE(56250000, 142, 2, 3),
 	PLL_35XX_RATE(48000000, 120, 2, 3),
-	PLL_35XX_RATE(51000000, 161, 3, 3),
+	PLL_35XX_RATE(50700000, 161, 3, 3),
 	PLL_35XX_RATE(45000000, 82, 1, 3),
-	PLL_35XX_RATE(34000000, 82, 2, 3),
+	PLL_35XX_RATE(33750000, 82, 2, 3),
 	{ /* sentinel */ },
 };
 
-- 
2.16.1
