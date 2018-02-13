From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 7/7] clk: samsung: add compile time PLL rate validators
Date: Tue, 13 Feb 2018 14:40:32 +0100
Message-ID: <20180213134032.30235-8-a.hajda@samsung.com>
References: <20180213134032.30235-1-a.hajda@samsung.com>
        <CGME20180213134104eucas1p133aff142a675b378c5d531ca20ef29c8@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58376 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964942AbeBMNlI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 08:41:08 -0500
In-reply-to: <20180213134032.30235-1-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "moderated list:SAMSUNG SOC CLOCK
        DRIVERS" <linux-samsung-soc@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>

Rates declared in PLL rate tables should match exactly rates calculated
from PLL coefficients. To avoid possible mistakes we can use compile
time validation.
The patch introduces such validators and expands all initializers
with additional input frequency parameter, required to validate rates.
Since S3C24xx PLLs requires different validators two new macros have
been introduced to deal with it.
As the patch adds only compile time validators it should not have impact
on compiled code.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/clk/samsung/clk-exynos3250.c | 114 +++++++++++++++++------------------
 drivers/clk/samsung/clk-exynos4.c    | 102 +++++++++++++++----------------
 drivers/clk/samsung/clk-exynos5250.c |  54 ++++++++---------
 drivers/clk/samsung/clk-exynos5260.c |  90 +++++++++++++--------------
 drivers/clk/samsung/clk-exynos5410.c |  20 +++---
 drivers/clk/samsung/clk-exynos5420.c |  62 +++++++++----------
 drivers/clk/samsung/clk-exynos5433.c | 114 +++++++++++++++++------------------
 drivers/clk/samsung/clk-exynos7.c    |   2 +-
 drivers/clk/samsung/clk-pll.h        |  55 ++++++++++++++---
 drivers/clk/samsung/clk-s3c2410.c    | 108 ++++++++++++++++-----------------
 10 files changed, 378 insertions(+), 343 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index ed36728424a2..27c9d23657b3 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -670,73 +670,73 @@ static const struct samsung_gate_clock gate_clks[] __initconst = {
 
 /* APLL & MPLL & BPLL & UPLL */
 static const struct samsung_pll_rate_table exynos3250_pll_rates[] __initconst = {
-	PLL_35XX_RATE(1200000000, 400, 4, 1),
-	PLL_35XX_RATE(1100000000, 275, 3, 1),
-	PLL_35XX_RATE(1066000000, 533, 6, 1),
-	PLL_35XX_RATE(1000000000, 250, 3, 1),
-	PLL_35XX_RATE( 960000000, 320, 4, 1),
-	PLL_35XX_RATE( 900000000, 300, 4, 1),
-	PLL_35XX_RATE( 850000000, 425, 6, 1),
-	PLL_35XX_RATE( 800000000, 200, 3, 1),
-	PLL_35XX_RATE( 700000000, 175, 3, 1),
-	PLL_35XX_RATE( 667000000, 667, 12, 1),
-	PLL_35XX_RATE( 600000000, 400, 4, 2),
-	PLL_35XX_RATE( 533000000, 533, 6, 2),
-	PLL_35XX_RATE( 520000000, 260, 3, 2),
-	PLL_35XX_RATE( 500000000, 250, 3, 2),
-	PLL_35XX_RATE( 400000000, 200, 3, 2),
-	PLL_35XX_RATE( 200000000, 200, 3, 3),
-	PLL_35XX_RATE( 100000000, 200, 3, 4),
+	PLL_35XX_RATE(24 * MHZ, 1200000000, 400, 4, 1),
+	PLL_35XX_RATE(24 * MHZ, 1100000000, 275, 3, 1),
+	PLL_35XX_RATE(24 * MHZ, 1066000000, 533, 6, 1),
+	PLL_35XX_RATE(24 * MHZ, 1000000000, 250, 3, 1),
+	PLL_35XX_RATE(24 * MHZ,  960000000, 320, 4, 1),
+	PLL_35XX_RATE(24 * MHZ,  900000000, 300, 4, 1),
+	PLL_35XX_RATE(24 * MHZ,  850000000, 425, 6, 1),
+	PLL_35XX_RATE(24 * MHZ,  800000000, 200, 3, 1),
+	PLL_35XX_RATE(24 * MHZ,  700000000, 175, 3, 1),
+	PLL_35XX_RATE(24 * MHZ,  667000000, 667, 12, 1),
+	PLL_35XX_RATE(24 * MHZ,  600000000, 400, 4, 2),
+	PLL_35XX_RATE(24 * MHZ,  533000000, 533, 6, 2),
+	PLL_35XX_RATE(24 * MHZ,  520000000, 260, 3, 2),
+	PLL_35XX_RATE(24 * MHZ,  500000000, 250, 3, 2),
+	PLL_35XX_RATE(24 * MHZ,  400000000, 200, 3, 2),
+	PLL_35XX_RATE(24 * MHZ,  200000000, 200, 3, 3),
+	PLL_35XX_RATE(24 * MHZ,  100000000, 200, 3, 4),
 	{ /* sentinel */ }
 };
 
 /* EPLL */
 static const struct samsung_pll_rate_table exynos3250_epll_rates[] __initconst = {
-	PLL_36XX_RATE(800000000, 200, 3, 1,     0),
-	PLL_36XX_RATE(288000000,  96, 2, 2,     0),
-	PLL_36XX_RATE(192000000, 128, 2, 3,     0),
-	PLL_36XX_RATE(144000000,  96, 2, 3,     0),
-	PLL_36XX_RATE( 96000000, 128, 2, 4,     0),
-	PLL_36XX_RATE( 84000000, 112, 2, 4,     0),
-	PLL_36XX_RATE( 80000003, 106, 2, 4, 43691),
-	PLL_36XX_RATE( 73728000,  98, 2, 4, 19923),
-	PLL_36XX_RATE( 67737598, 270, 3, 5, 62285),
-	PLL_36XX_RATE( 65535999, 174, 2, 5, 49982),
-	PLL_36XX_RATE( 50000000, 200, 3, 5,     0),
-	PLL_36XX_RATE( 49152002, 131, 2, 5,  4719),
-	PLL_36XX_RATE( 48000000, 128, 2, 5,     0),
-	PLL_36XX_RATE( 45158401, 180, 3, 5, 41524),
+	PLL_36XX_RATE(24 * MHZ, 800000000, 200, 3, 1,     0),
+	PLL_36XX_RATE(24 * MHZ, 288000000,  96, 2, 2,     0),
+	PLL_36XX_RATE(24 * MHZ, 192000000, 128, 2, 3,     0),
+	PLL_36XX_RATE(24 * MHZ, 144000000,  96, 2, 3,     0),
+	PLL_36XX_RATE(24 * MHZ,  96000000, 128, 2, 4,     0),
+	PLL_36XX_RATE(24 * MHZ,  84000000, 112, 2, 4,     0),
+	PLL_36XX_RATE(24 * MHZ,  80000003, 106, 2, 4, 43691),
+	PLL_36XX_RATE(24 * MHZ,  73728000,  98, 2, 4, 19923),
+	PLL_36XX_RATE(24 * MHZ,  67737598, 270, 3, 5, 62285),
+	PLL_36XX_RATE(24 * MHZ,  65535999, 174, 2, 5, 49982),
+	PLL_36XX_RATE(24 * MHZ,  50000000, 200, 3, 5,     0),
+	PLL_36XX_RATE(24 * MHZ,  49152002, 131, 2, 5,  4719),
+	PLL_36XX_RATE(24 * MHZ,  48000000, 128, 2, 5,     0),
+	PLL_36XX_RATE(24 * MHZ,  45158401, 180, 3, 5, 41524),
 	{ /* sentinel */ }
 };
 
 /* VPLL */
 static const struct samsung_pll_rate_table exynos3250_vpll_rates[] __initconst = {
-	PLL_36XX_RATE(600000000, 100, 2, 1,     0),
-	PLL_36XX_RATE(533000000, 266, 3, 2, 32768),
-	PLL_36XX_RATE(519230987, 173, 2, 2,  5046),
-	PLL_36XX_RATE(500000000, 250, 3, 2,     0),
-	PLL_36XX_RATE(445500000, 148, 2, 2, 32768),
-	PLL_36XX_RATE(445055007, 148, 2, 2, 23047),
-	PLL_36XX_RATE(400000000, 200, 3, 2,     0),
-	PLL_36XX_RATE(371250000, 123, 2, 2, 49152),
-	PLL_36XX_RATE(370878997, 185, 3, 2, 28803),
-	PLL_36XX_RATE(340000000, 170, 3, 2,     0),
-	PLL_36XX_RATE(335000015, 111, 2, 2, 43691),
-	PLL_36XX_RATE(333000000, 111, 2, 2,     0),
-	PLL_36XX_RATE(330000000, 110, 2, 2,     0),
-	PLL_36XX_RATE(320000015, 106, 2, 2, 43691),
-	PLL_36XX_RATE(300000000, 100, 2, 2,     0),
-	PLL_36XX_RATE(275000000, 275, 3, 3,     0),
-	PLL_36XX_RATE(222750000, 148, 2, 3, 32768),
-	PLL_36XX_RATE(222528007, 148, 2, 3, 23069),
-	PLL_36XX_RATE(160000000, 160, 3, 3,     0),
-	PLL_36XX_RATE(148500000,  99, 2, 3,     0),
-	PLL_36XX_RATE(148352005,  98, 2, 3, 59070),
-	PLL_36XX_RATE(108000000, 144, 2, 4,     0),
-	PLL_36XX_RATE( 74250000,  99, 2, 4,     0),
-	PLL_36XX_RATE( 74176002,  98, 2, 4, 59070),
-	PLL_36XX_RATE( 54054000, 216, 3, 5, 14156),
-	PLL_36XX_RATE( 54000000, 144, 2, 5,     0),
+	PLL_36XX_RATE(24 * MHZ, 600000000, 100, 2, 1,     0),
+	PLL_36XX_RATE(24 * MHZ, 533000000, 266, 3, 2, 32768),
+	PLL_36XX_RATE(24 * MHZ, 519230987, 173, 2, 2,  5046),
+	PLL_36XX_RATE(24 * MHZ, 500000000, 250, 3, 2,     0),
+	PLL_36XX_RATE(24 * MHZ, 445500000, 148, 2, 2, 32768),
+	PLL_36XX_RATE(24 * MHZ, 445055007, 148, 2, 2, 23047),
+	PLL_36XX_RATE(24 * MHZ, 400000000, 200, 3, 2,     0),
+	PLL_36XX_RATE(24 * MHZ, 371250000, 123, 2, 2, 49152),
+	PLL_36XX_RATE(24 * MHZ, 370878997, 185, 3, 2, 28803),
+	PLL_36XX_RATE(24 * MHZ, 340000000, 170, 3, 2,     0),
+	PLL_36XX_RATE(24 * MHZ, 335000015, 111, 2, 2, 43691),
+	PLL_36XX_RATE(24 * MHZ, 333000000, 111, 2, 2,     0),
+	PLL_36XX_RATE(24 * MHZ, 330000000, 110, 2, 2,     0),
+	PLL_36XX_RATE(24 * MHZ, 320000015, 106, 2, 2, 43691),
+	PLL_36XX_RATE(24 * MHZ, 300000000, 100, 2, 2,     0),
+	PLL_36XX_RATE(24 * MHZ, 275000000, 275, 3, 3,     0),
+	PLL_36XX_RATE(24 * MHZ, 222750000, 148, 2, 3, 32768),
+	PLL_36XX_RATE(24 * MHZ, 222528007, 148, 2, 3, 23069),
+	PLL_36XX_RATE(24 * MHZ, 160000000, 160, 3, 3,     0),
+	PLL_36XX_RATE(24 * MHZ, 148500000,  99, 2, 3,     0),
+	PLL_36XX_RATE(24 * MHZ, 148352005,  98, 2, 3, 59070),
+	PLL_36XX_RATE(24 * MHZ, 108000000, 144, 2, 4,     0),
+	PLL_36XX_RATE(24 * MHZ,  74250000,  99, 2, 4,     0),
+	PLL_36XX_RATE(24 * MHZ,  74176002,  98, 2, 4, 59070),
+	PLL_36XX_RATE(24 * MHZ,  54054000, 216, 3, 5, 14156),
+	PLL_36XX_RATE(24 * MHZ,  54000000, 144, 2, 5,     0),
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 134f25f2a913..9ae27828e3ad 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1266,77 +1266,77 @@ static const struct of_device_id ext_clk_match[] __initconst = {
 
 /* PLLs PMS values */
 static const struct samsung_pll_rate_table exynos4210_apll_rates[] __initconst = {
-	PLL_45XX_RATE(1200000000, 150,  3, 1, 28),
-	PLL_45XX_RATE(1000000000, 250,  6, 1, 28),
-	PLL_45XX_RATE( 800000000, 200,  6, 1, 28),
-	PLL_45XX_RATE( 666857142, 389, 14, 1, 13),
-	PLL_45XX_RATE( 600000000, 100,  4, 1, 13),
-	PLL_45XX_RATE( 533000000, 533, 24, 1,  5),
-	PLL_45XX_RATE( 500000000, 250,  6, 2, 28),
-	PLL_45XX_RATE( 400000000, 200,  6, 2, 28),
-	PLL_45XX_RATE( 200000000, 200,  6, 3, 28),
+	PLL_45XX_RATE(24 * MHZ, 1200000000, 150,  3, 1, 28),
+	PLL_45XX_RATE(24 * MHZ, 1000000000, 250,  6, 1, 28),
+	PLL_45XX_RATE(24 * MHZ,  800000000, 200,  6, 1, 28),
+	PLL_45XX_RATE(24 * MHZ,  666857142, 389, 14, 1, 13),
+	PLL_45XX_RATE(24 * MHZ,  600000000, 100,  4, 1, 13),
+	PLL_45XX_RATE(24 * MHZ,  533000000, 533, 24, 1,  5),
+	PLL_45XX_RATE(24 * MHZ,  500000000, 250,  6, 2, 28),
+	PLL_45XX_RATE(24 * MHZ,  400000000, 200,  6, 2, 28),
+	PLL_45XX_RATE(24 * MHZ,  200000000, 200,  6, 3, 28),
 	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_rate_table exynos4210_epll_rates[] __initconst = {
-	PLL_4600_RATE(192000000, 48, 3, 1,     0, 0),
-	PLL_4600_RATE(180633605, 45, 3, 1, 10381, 0),
-	PLL_4600_RATE(180000000, 45, 3, 1,     0, 0),
-	PLL_4600_RATE( 73727996, 73, 3, 3, 47710, 1),
-	PLL_4600_RATE( 67737602, 90, 4, 3, 20762, 1),
-	PLL_4600_RATE( 49151992, 49, 3, 3,  9961, 0),
-	PLL_4600_RATE( 45158401, 45, 3, 3, 10381, 0),
+	PLL_4600_RATE(24 * MHZ, 192000000, 48, 3, 1,     0, 0),
+	PLL_4600_RATE(24 * MHZ, 180633605, 45, 3, 1, 10381, 0),
+	PLL_4600_RATE(24 * MHZ, 180000000, 45, 3, 1,     0, 0),
+	PLL_4600_RATE(24 * MHZ,  73727996, 73, 3, 3, 47710, 1),
+	PLL_4600_RATE(24 * MHZ,  67737602, 90, 4, 3, 20762, 1),
+	PLL_4600_RATE(24 * MHZ,  49151992, 49, 3, 3,  9961, 0),
+	PLL_4600_RATE(24 * MHZ,  45158401, 45, 3, 3, 10381, 0),
 	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_rate_table exynos4210_vpll_rates[] __initconst = {
-	PLL_4650_RATE(360000000, 44, 3, 0, 1024, 0, 14, 0),
-	PLL_4650_RATE(324000000, 53, 2, 1, 1024, 1,  1, 1),
-	PLL_4650_RATE(259617187, 63, 3, 1, 1950, 0, 20, 1),
-	PLL_4650_RATE(110000000, 53, 3, 2, 2048, 0, 17, 0),
-	PLL_4650_RATE( 55360351, 53, 3, 3, 2417, 0, 17, 0),
+	PLL_4650_RATE(24 * MHZ, 360000000, 44, 3, 0, 1024, 0, 14, 0),
+	PLL_4650_RATE(24 * MHZ, 324000000, 53, 2, 1, 1024, 1,  1, 1),
+	PLL_4650_RATE(24 * MHZ, 259617187, 63, 3, 1, 1950, 0, 20, 1),
+	PLL_4650_RATE(24 * MHZ, 110000000, 53, 3, 2, 2048, 0, 17, 0),
+	PLL_4650_RATE(24 * MHZ,  55360351, 53, 3, 3, 2417, 0, 17, 0),
 	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_rate_table exynos4x12_apll_rates[] __initconst = {
-	PLL_35XX_RATE(1704000000, 213, 3, 0),
-	PLL_35XX_RATE(1600000000, 200, 3, 0),
-	PLL_35XX_RATE(1500000000, 250, 4, 0),
-	PLL_35XX_RATE(1400000000, 175, 3, 0),
-	PLL_35XX_RATE(1300000000, 325, 6, 0),
-	PLL_35XX_RATE(1200000000, 200, 4, 0),
-	PLL_35XX_RATE(1100000000, 275, 6, 0),
-	PLL_35XX_RATE(1000000000, 125, 3, 0),
-	PLL_35XX_RATE( 900000000, 150, 4, 0),
-	PLL_35XX_RATE( 800000000, 100, 3, 0),
-	PLL_35XX_RATE( 700000000, 175, 3, 1),
-	PLL_35XX_RATE( 600000000, 200, 4, 1),
-	PLL_35XX_RATE( 500000000, 125, 3, 1),
-	PLL_35XX_RATE( 400000000, 100, 3, 1),
-	PLL_35XX_RATE( 300000000, 200, 4, 2),
-	PLL_35XX_RATE( 200000000, 100, 3, 2),
+	PLL_35XX_RATE(24 * MHZ, 1704000000, 213, 3, 0),
+	PLL_35XX_RATE(24 * MHZ, 1600000000, 200, 3, 0),
+	PLL_35XX_RATE(24 * MHZ, 1500000000, 250, 4, 0),
+	PLL_35XX_RATE(24 * MHZ, 1400000000, 175, 3, 0),
+	PLL_35XX_RATE(24 * MHZ, 1300000000, 325, 6, 0),
+	PLL_35XX_RATE(24 * MHZ, 1200000000, 200, 4, 0),
+	PLL_35XX_RATE(24 * MHZ, 1100000000, 275, 6, 0),
+	PLL_35XX_RATE(24 * MHZ, 1000000000, 125, 3, 0),
+	PLL_35XX_RATE(24 * MHZ,  900000000, 150, 4, 0),
+	PLL_35XX_RATE(24 * MHZ,  800000000, 100, 3, 0),
+	PLL_35XX_RATE(24 * MHZ,  700000000, 175, 3, 1),
+	PLL_35XX_RATE(24 * MHZ,  600000000, 200, 4, 1),
+	PLL_35XX_RATE(24 * MHZ,  500000000, 125, 3, 1),
+	PLL_35XX_RATE(24 * MHZ,  400000000, 100, 3, 1),
+	PLL_35XX_RATE(24 * MHZ,  300000000, 200, 4, 2),
+	PLL_35XX_RATE(24 * MHZ,  200000000, 100, 3, 2),
 	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_rate_table exynos4x12_epll_rates[] __initconst = {
-	PLL_36XX_RATE(192000000, 48, 3, 1,     0),
-	PLL_36XX_RATE(180633605, 45, 3, 1, 10381),
-	PLL_36XX_RATE(180000000, 45, 3, 1,     0),
-	PLL_36XX_RATE( 73727996, 73, 3, 3, 47710),
-	PLL_36XX_RATE( 67737602, 90, 4, 3, 20762),
-	PLL_36XX_RATE( 49151992, 49, 3, 3,  9961),
-	PLL_36XX_RATE( 45158401, 45, 3, 3, 10381),
+	PLL_36XX_RATE(24 * MHZ, 192000000, 48, 3, 1,     0),
+	PLL_36XX_RATE(24 * MHZ, 180633605, 45, 3, 1, 10381),
+	PLL_36XX_RATE(24 * MHZ, 180000000, 45, 3, 1,     0),
+	PLL_36XX_RATE(24 * MHZ,  73727996, 73, 3, 3, 47710),
+	PLL_36XX_RATE(24 * MHZ,  67737602, 90, 4, 3, 20762),
+	PLL_36XX_RATE(24 * MHZ,  49151992, 49, 3, 3,  9961),
+	PLL_36XX_RATE(24 * MHZ,  45158401, 45, 3, 3, 10381),
 	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_rate_table exynos4x12_vpll_rates[] __initconst = {
-	PLL_36XX_RATE(533000000, 133, 3, 1, 16384),
-	PLL_36XX_RATE(440000000, 110, 3, 1,     0),
-	PLL_36XX_RATE(350000000, 175, 3, 2,     0),
-	PLL_36XX_RATE(266000000, 133, 3, 2,     0),
-	PLL_36XX_RATE(160000000, 160, 3, 3,     0),
-	PLL_36XX_RATE(106031250,  53, 3, 2,  1024),
-	PLL_36XX_RATE( 53015625,  53, 3, 3,  1024),
+	PLL_36XX_RATE(24 * MHZ, 533000000, 133, 3, 1, 16384),
+	PLL_36XX_RATE(24 * MHZ, 440000000, 110, 3, 1,     0),
+	PLL_36XX_RATE(24 * MHZ, 350000000, 175, 3, 2,     0),
+	PLL_36XX_RATE(24 * MHZ, 266000000, 133, 3, 2,     0),
+	PLL_36XX_RATE(24 * MHZ, 160000000, 160, 3, 3,     0),
+	PLL_36XX_RATE(24 * MHZ, 106031250,  53, 3, 2,  1024),
+	PLL_36XX_RATE(24 * MHZ,  53015625,  53, 3, 3,  1024),
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 923c608b1b95..1b3a8f9cd519 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -701,45 +701,45 @@ static const struct samsung_gate_clock exynos5250_gate_clks[] __initconst = {
 static const struct samsung_pll_rate_table vpll_24mhz_tbl[] __initconst = {
 	/* sorted in descending order */
 	/* PLL_36XX_RATE(rate, m, p, s, k) */
-	PLL_36XX_RATE(266000000, 266, 3, 3, 0),
+	PLL_36XX_RATE(24 * MHZ, 266000000, 266, 3, 3, 0),
 	/* Not in UM, but need for eDP on snow */
-	PLL_36XX_RATE(70500000, 94, 2, 4, 0),
+	PLL_36XX_RATE(24 * MHZ, 70500000, 94, 2, 4, 0),
 	{ },
 };
 
 static const struct samsung_pll_rate_table epll_24mhz_tbl[] __initconst = {
 	/* sorted in descending order */
 	/* PLL_36XX_RATE(rate, m, p, s, k) */
-	PLL_36XX_RATE(192000000, 64, 2, 2, 0),
-	PLL_36XX_RATE(180633605, 90, 3, 2, 20762),
-	PLL_36XX_RATE(180000000, 90, 3, 2, 0),
-	PLL_36XX_RATE(73728000, 98, 2, 4, 19923),
-	PLL_36XX_RATE(67737602, 90, 2, 4, 20762),
-	PLL_36XX_RATE(49152000, 98, 3, 4, 19923),
-	PLL_36XX_RATE(45158401, 90, 3, 4, 20762),
-	PLL_36XX_RATE(32768001, 131, 3, 5, 4719),
+	PLL_36XX_RATE(24 * MHZ, 192000000, 64, 2, 2, 0),
+	PLL_36XX_RATE(24 * MHZ, 180633605, 90, 3, 2, 20762),
+	PLL_36XX_RATE(24 * MHZ, 180000000, 90, 3, 2, 0),
+	PLL_36XX_RATE(24 * MHZ, 73728000, 98, 2, 4, 19923),
+	PLL_36XX_RATE(24 * MHZ, 67737602, 90, 2, 4, 20762),
+	PLL_36XX_RATE(24 * MHZ, 49152000, 98, 3, 4, 19923),
+	PLL_36XX_RATE(24 * MHZ, 45158401, 90, 3, 4, 20762),
+	PLL_36XX_RATE(24 * MHZ, 32768001, 131, 3, 5, 4719),
 	{ },
 };
 
 static const struct samsung_pll_rate_table apll_24mhz_tbl[] __initconst = {
 	/* sorted in descending order */
-	/* PLL_35XX_RATE(rate, m, p, s) */
-	PLL_35XX_RATE(1700000000, 425, 6, 0),
-	PLL_35XX_RATE(1600000000, 200, 3, 0),
-	PLL_35XX_RATE(1500000000, 250, 4, 0),
-	PLL_35XX_RATE(1400000000, 175, 3, 0),
-	PLL_35XX_RATE(1300000000, 325, 6, 0),
-	PLL_35XX_RATE(1200000000, 200, 4, 0),
-	PLL_35XX_RATE(1100000000, 275, 6, 0),
-	PLL_35XX_RATE(1000000000, 125, 3, 0),
-	PLL_35XX_RATE(900000000, 150, 4, 0),
-	PLL_35XX_RATE(800000000, 100, 3, 0),
-	PLL_35XX_RATE(700000000, 175, 3, 1),
-	PLL_35XX_RATE(600000000, 200, 4, 1),
-	PLL_35XX_RATE(500000000, 125, 3, 1),
-	PLL_35XX_RATE(400000000, 100, 3, 1),
-	PLL_35XX_RATE(300000000, 200, 4, 2),
-	PLL_35XX_RATE(200000000, 100, 3, 2),
+	/* PLL_35XX_RATE(fin, rate, m, p, s) */
+	PLL_35XX_RATE(24 * MHZ, 1700000000, 425, 6, 0),
+	PLL_35XX_RATE(24 * MHZ, 1600000000, 200, 3, 0),
+	PLL_35XX_RATE(24 * MHZ, 1500000000, 250, 4, 0),
+	PLL_35XX_RATE(24 * MHZ, 1400000000, 175, 3, 0),
+	PLL_35XX_RATE(24 * MHZ, 1300000000, 325, 6, 0),
+	PLL_35XX_RATE(24 * MHZ, 1200000000, 200, 4, 0),
+	PLL_35XX_RATE(24 * MHZ, 1100000000, 275, 6, 0),
+	PLL_35XX_RATE(24 * MHZ, 1000000000, 125, 3, 0),
+	PLL_35XX_RATE(24 * MHZ, 900000000, 150, 4, 0),
+	PLL_35XX_RATE(24 * MHZ, 800000000, 100, 3, 0),
+	PLL_35XX_RATE(24 * MHZ, 700000000, 175, 3, 1),
+	PLL_35XX_RATE(24 * MHZ, 600000000, 200, 4, 1),
+	PLL_35XX_RATE(24 * MHZ, 500000000, 125, 3, 1),
+	PLL_35XX_RATE(24 * MHZ, 400000000, 100, 3, 1),
+	PLL_35XX_RATE(24 * MHZ, 300000000, 200, 4, 2),
+	PLL_35XX_RATE(24 * MHZ, 200000000, 100, 3, 2),
 };
 
 static struct samsung_pll_clock exynos5250_plls[nr_plls] __initdata = {
diff --git a/drivers/clk/samsung/clk-exynos5260.c b/drivers/clk/samsung/clk-exynos5260.c
index 8eae1752d700..2cc2583abd87 100644
--- a/drivers/clk/samsung/clk-exynos5260.c
+++ b/drivers/clk/samsung/clk-exynos5260.c
@@ -23,57 +23,57 @@
  * DISP_PLL, EGL_PLL, KFC_PLL, MEM_PLL, BUS_PLL, MEDIA_PLL, G3D_PLL.
  */
 static const struct samsung_pll_rate_table pll2550_24mhz_tbl[] __initconst = {
-	PLL_35XX_RATE(1700000000, 425, 6, 0),
-	PLL_35XX_RATE(1600000000, 200, 3, 0),
-	PLL_35XX_RATE(1500000000, 250, 4, 0),
-	PLL_35XX_RATE(1400000000, 175, 3, 0),
-	PLL_35XX_RATE(1300000000, 325, 6, 0),
-	PLL_35XX_RATE(1200000000, 400, 4, 1),
-	PLL_35XX_RATE(1100000000, 275, 3, 1),
-	PLL_35XX_RATE(1000000000, 250, 3, 1),
-	PLL_35XX_RATE(933000000, 311, 4, 1),
-	PLL_35XX_RATE(900000000, 300, 4, 1),
-	PLL_35XX_RATE(800000000, 200, 3, 1),
-	PLL_35XX_RATE(733000000, 733, 12, 1),
-	PLL_35XX_RATE(700000000, 175, 3, 1),
-	PLL_35XX_RATE(667000000, 667, 12, 1),
-	PLL_35XX_RATE(633000000, 211, 4, 1),
-	PLL_35XX_RATE(620000000, 310, 3, 2),
-	PLL_35XX_RATE(600000000, 400, 4, 2),
-	PLL_35XX_RATE(543000000, 362, 4, 2),
-	PLL_35XX_RATE(533000000, 533, 6, 2),
-	PLL_35XX_RATE(500000000, 250, 3, 2),
-	PLL_35XX_RATE(450000000, 300, 4, 2),
-	PLL_35XX_RATE(400000000, 200, 3, 2),
-	PLL_35XX_RATE(350000000, 175, 3, 2),
-	PLL_35XX_RATE(300000000, 400, 4, 3),
-	PLL_35XX_RATE(266000000, 266, 3, 3),
-	PLL_35XX_RATE(200000000, 200, 3, 3),
-	PLL_35XX_RATE(160000000, 160, 3, 3),
+	PLL_35XX_RATE(24 * MHZ, 1700000000, 425, 6, 0),
+	PLL_35XX_RATE(24 * MHZ, 1600000000, 200, 3, 0),
+	PLL_35XX_RATE(24 * MHZ, 1500000000, 250, 4, 0),
+	PLL_35XX_RATE(24 * MHZ, 1400000000, 175, 3, 0),
+	PLL_35XX_RATE(24 * MHZ, 1300000000, 325, 6, 0),
+	PLL_35XX_RATE(24 * MHZ, 1200000000, 400, 4, 1),
+	PLL_35XX_RATE(24 * MHZ, 1100000000, 275, 3, 1),
+	PLL_35XX_RATE(24 * MHZ, 1000000000, 250, 3, 1),
+	PLL_35XX_RATE(24 * MHZ, 933000000, 311, 4, 1),
+	PLL_35XX_RATE(24 * MHZ, 900000000, 300, 4, 1),
+	PLL_35XX_RATE(24 * MHZ, 800000000, 200, 3, 1),
+	PLL_35XX_RATE(24 * MHZ, 733000000, 733, 12, 1),
+	PLL_35XX_RATE(24 * MHZ, 700000000, 175, 3, 1),
+	PLL_35XX_RATE(24 * MHZ, 667000000, 667, 12, 1),
+	PLL_35XX_RATE(24 * MHZ, 633000000, 211, 4, 1),
+	PLL_35XX_RATE(24 * MHZ, 620000000, 310, 3, 2),
+	PLL_35XX_RATE(24 * MHZ, 600000000, 400, 4, 2),
+	PLL_35XX_RATE(24 * MHZ, 543000000, 362, 4, 2),
+	PLL_35XX_RATE(24 * MHZ, 533000000, 533, 6, 2),
+	PLL_35XX_RATE(24 * MHZ, 500000000, 250, 3, 2),
+	PLL_35XX_RATE(24 * MHZ, 450000000, 300, 4, 2),
+	PLL_35XX_RATE(24 * MHZ, 400000000, 200, 3, 2),
+	PLL_35XX_RATE(24 * MHZ, 350000000, 175, 3, 2),
+	PLL_35XX_RATE(24 * MHZ, 300000000, 400, 4, 3),
+	PLL_35XX_RATE(24 * MHZ, 266000000, 266, 3, 3),
+	PLL_35XX_RATE(24 * MHZ, 200000000, 200, 3, 3),
+	PLL_35XX_RATE(24 * MHZ, 160000000, 160, 3, 3),
 };
 
 /*
  * Applicable for 2650 Type PLL for AUD_PLL.
  */
 static const struct samsung_pll_rate_table pll2650_24mhz_tbl[] __initconst = {
-	PLL_36XX_RATE(1600000000, 200, 3, 0, 0),
-	PLL_36XX_RATE(1200000000, 100, 2, 0, 0),
-	PLL_36XX_RATE(1000000000, 250, 3, 1, 0),
-	PLL_36XX_RATE(800000000, 200, 3, 1, 0),
-	PLL_36XX_RATE(600000000, 100, 2, 1, 0),
-	PLL_36XX_RATE(532000000, 266, 3, 2, 0),
-	PLL_36XX_RATE(480000000, 160, 2, 2, 0),
-	PLL_36XX_RATE(432000000, 144, 2, 2, 0),
-	PLL_36XX_RATE(400000000, 200, 3, 2, 0),
-	PLL_36XX_RATE(394073128, 459, 7, 2, 49282),
-	PLL_36XX_RATE(333000000, 111, 2, 2, 0),
-	PLL_36XX_RATE(300000000, 100, 2, 2, 0),
-	PLL_36XX_RATE(266000000, 266, 3, 3, 0),
-	PLL_36XX_RATE(200000000, 200, 3, 3, 0),
-	PLL_36XX_RATE(166000000, 166, 3, 3, 0),
-	PLL_36XX_RATE(133000000, 266, 3, 4, 0),
-	PLL_36XX_RATE(100000000, 200, 3, 4, 0),
-	PLL_36XX_RATE(66000000, 176, 2, 5, 0),
+	PLL_36XX_RATE(24 * MHZ, 1600000000, 200, 3, 0, 0),
+	PLL_36XX_RATE(24 * MHZ, 1200000000, 100, 2, 0, 0),
+	PLL_36XX_RATE(24 * MHZ, 1000000000, 250, 3, 1, 0),
+	PLL_36XX_RATE(24 * MHZ, 800000000, 200, 3, 1, 0),
+	PLL_36XX_RATE(24 * MHZ, 600000000, 100, 2, 1, 0),
+	PLL_36XX_RATE(24 * MHZ, 532000000, 266, 3, 2, 0),
+	PLL_36XX_RATE(24 * MHZ, 480000000, 160, 2, 2, 0),
+	PLL_36XX_RATE(24 * MHZ, 432000000, 144, 2, 2, 0),
+	PLL_36XX_RATE(24 * MHZ, 400000000, 200, 3, 2, 0),
+	PLL_36XX_RATE(24 * MHZ, 394073128, 459, 7, 2, 49282),
+	PLL_36XX_RATE(24 * MHZ, 333000000, 111, 2, 2, 0),
+	PLL_36XX_RATE(24 * MHZ, 300000000, 100, 2, 2, 0),
+	PLL_36XX_RATE(24 * MHZ, 266000000, 266, 3, 3, 0),
+	PLL_36XX_RATE(24 * MHZ, 200000000, 200, 3, 3, 0),
+	PLL_36XX_RATE(24 * MHZ, 166000000, 166, 3, 3, 0),
+	PLL_36XX_RATE(24 * MHZ, 133000000, 266, 3, 4, 0),
+	PLL_36XX_RATE(24 * MHZ, 100000000, 200, 3, 4, 0),
+	PLL_36XX_RATE(24 * MHZ, 66000000, 176, 2, 5, 0),
 };
 
 /* CMU_AUD */
diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
index fc471a49e8f4..0a0b09591e6f 100644
--- a/drivers/clk/samsung/clk-exynos5410.c
+++ b/drivers/clk/samsung/clk-exynos5410.c
@@ -226,16 +226,16 @@ static const struct samsung_gate_clock exynos5410_gate_clks[] __initconst = {
 };
 
 static const struct samsung_pll_rate_table exynos5410_pll2550x_24mhz_tbl[] __initconst = {
-	PLL_36XX_RATE(400000000U, 200, 3, 2, 0),
-	PLL_36XX_RATE(333000000U, 111, 2, 2, 0),
-	PLL_36XX_RATE(300000000U, 100, 2, 2, 0),
-	PLL_36XX_RATE(266000000U, 266, 3, 3, 0),
-	PLL_36XX_RATE(200000000U, 200, 3, 3, 0),
-	PLL_36XX_RATE(192000000U, 192, 3, 3, 0),
-	PLL_36XX_RATE(166000000U, 166, 3, 3, 0),
-	PLL_36XX_RATE(133000000U, 266, 3, 4, 0),
-	PLL_36XX_RATE(100000000U, 200, 3, 4, 0),
-	PLL_36XX_RATE(66000000U,  176, 2, 5, 0),
+	PLL_36XX_RATE(24 * MHZ, 400000000U, 200, 3, 2, 0),
+	PLL_36XX_RATE(24 * MHZ, 333000000U, 111, 2, 2, 0),
+	PLL_36XX_RATE(24 * MHZ, 300000000U, 100, 2, 2, 0),
+	PLL_36XX_RATE(24 * MHZ, 266000000U, 266, 3, 3, 0),
+	PLL_36XX_RATE(24 * MHZ, 200000000U, 200, 3, 3, 0),
+	PLL_36XX_RATE(24 * MHZ, 192000000U, 192, 3, 3, 0),
+	PLL_36XX_RATE(24 * MHZ, 166000000U, 166, 3, 3, 0),
+	PLL_36XX_RATE(24 * MHZ, 133000000U, 266, 3, 4, 0),
+	PLL_36XX_RATE(24 * MHZ, 100000000U, 200, 3, 4, 0),
+	PLL_36XX_RATE(24 * MHZ, 66000000U,  176, 2, 5, 0),
 };
 
 static struct samsung_pll_clock exynos5410_plls[nr_plls] __initdata = {
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 45d34f601e9e..6b10b70f7d72 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1263,40 +1263,40 @@ static const struct samsung_gate_clock exynos5x_gate_clks[] __initconst = {
 };
 
 static const struct samsung_pll_rate_table exynos5420_pll2550x_24mhz_tbl[] __initconst = {
-	PLL_35XX_RATE(2000000000, 250, 3, 0),
-	PLL_35XX_RATE(1900000000, 475, 6, 0),
-	PLL_35XX_RATE(1800000000, 225, 3, 0),
-	PLL_35XX_RATE(1700000000, 425, 6, 0),
-	PLL_35XX_RATE(1600000000, 200, 3, 0),
-	PLL_35XX_RATE(1500000000, 250, 4, 0),
-	PLL_35XX_RATE(1400000000, 175, 3, 0),
-	PLL_35XX_RATE(1300000000, 325, 6, 0),
-	PLL_35XX_RATE(1200000000, 200, 2, 1),
-	PLL_35XX_RATE(1100000000, 275, 3, 1),
-	PLL_35XX_RATE(1000000000, 250, 3, 1),
-	PLL_35XX_RATE(900000000,  150, 2, 1),
-	PLL_35XX_RATE(800000000,  200, 3, 1),
-	PLL_35XX_RATE(700000000,  175, 3, 1),
-	PLL_35XX_RATE(600000000,  200, 2, 2),
-	PLL_35XX_RATE(500000000,  250, 3, 2),
-	PLL_35XX_RATE(400000000,  200, 3, 2),
-	PLL_35XX_RATE(300000000,  200, 2, 3),
-	PLL_35XX_RATE(200000000,  200, 3, 3),
+	PLL_35XX_RATE(24 * MHZ, 2000000000, 250, 3, 0),
+	PLL_35XX_RATE(24 * MHZ, 1900000000, 475, 6, 0),
+	PLL_35XX_RATE(24 * MHZ, 1800000000, 225, 3, 0),
+	PLL_35XX_RATE(24 * MHZ, 1700000000, 425, 6, 0),
+	PLL_35XX_RATE(24 * MHZ, 1600000000, 200, 3, 0),
+	PLL_35XX_RATE(24 * MHZ, 1500000000, 250, 4, 0),
+	PLL_35XX_RATE(24 * MHZ, 1400000000, 175, 3, 0),
+	PLL_35XX_RATE(24 * MHZ, 1300000000, 325, 6, 0),
+	PLL_35XX_RATE(24 * MHZ, 1200000000, 200, 2, 1),
+	PLL_35XX_RATE(24 * MHZ, 1100000000, 275, 3, 1),
+	PLL_35XX_RATE(24 * MHZ, 1000000000, 250, 3, 1),
+	PLL_35XX_RATE(24 * MHZ, 900000000,  150, 2, 1),
+	PLL_35XX_RATE(24 * MHZ, 800000000,  200, 3, 1),
+	PLL_35XX_RATE(24 * MHZ, 700000000,  175, 3, 1),
+	PLL_35XX_RATE(24 * MHZ, 600000000,  200, 2, 2),
+	PLL_35XX_RATE(24 * MHZ, 500000000,  250, 3, 2),
+	PLL_35XX_RATE(24 * MHZ, 400000000,  200, 3, 2),
+	PLL_35XX_RATE(24 * MHZ, 300000000,  200, 2, 3),
+	PLL_35XX_RATE(24 * MHZ, 200000000,  200, 3, 3),
 };
 
 static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
-	PLL_36XX_RATE(600000000U, 100, 2, 1, 0),
-	PLL_36XX_RATE(400000000U, 200, 3, 2, 0),
-	PLL_36XX_RATE(393216003U, 197, 3, 2, -25690),
-	PLL_36XX_RATE(361267218U, 301, 5, 2, 3671),
-	PLL_36XX_RATE(200000000U, 200, 3, 3, 0),
-	PLL_36XX_RATE(196608001U, 197, 3, 3, -25690),
-	PLL_36XX_RATE(180633609U, 301, 5, 3, 3671),
-	PLL_36XX_RATE(131072006U, 131, 3, 3, 4719),
-	PLL_36XX_RATE(100000000U, 200, 3, 4, 0),
-	PLL_36XX_RATE( 65536003U, 131, 3, 4, 4719),
-	PLL_36XX_RATE( 49152000U, 197, 3, 5, -25690),
-	PLL_36XX_RATE( 32768001U, 131, 3, 5, 4719),
+	PLL_36XX_RATE(24 * MHZ, 600000000U, 100, 2, 1, 0),
+	PLL_36XX_RATE(24 * MHZ, 400000000U, 200, 3, 2, 0),
+	PLL_36XX_RATE(24 * MHZ, 393216003U, 197, 3, 2, -25690),
+	PLL_36XX_RATE(24 * MHZ, 361267218U, 301, 5, 2, 3671),
+	PLL_36XX_RATE(24 * MHZ, 200000000U, 200, 3, 3, 0),
+	PLL_36XX_RATE(24 * MHZ, 196608001U, 197, 3, 3, -25690),
+	PLL_36XX_RATE(24 * MHZ, 180633609U, 301, 5, 3, 3671),
+	PLL_36XX_RATE(24 * MHZ, 131072006U, 131, 3, 3, 4719),
+	PLL_36XX_RATE(24 * MHZ, 100000000U, 200, 3, 4, 0),
+	PLL_36XX_RATE(24 * MHZ,  65536003U, 131, 3, 4, 4719),
+	PLL_36XX_RATE(24 * MHZ,  49152000U, 197, 3, 5, -25690),
+	PLL_36XX_RATE(24 * MHZ,  32768001U, 131, 3, 5, 4719),
 };
 
 static struct samsung_pll_clock exynos5x_plls[nr_plls] __initdata = {
diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 335bebfa21c0..03a8e29bb697 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -703,68 +703,68 @@ static const struct samsung_gate_clock top_gate_clks[] __initconst = {
  * & MPHY_PLL & G3D_PLL & DISP_PLL & ISP_PLL
  */
 static const struct samsung_pll_rate_table exynos5433_pll_rates[] __initconst = {
-	PLL_35XX_RATE(2500000000U, 625, 6,  0),
-	PLL_35XX_RATE(2400000000U, 500, 5,  0),
-	PLL_35XX_RATE(2300000000U, 575, 6,  0),
-	PLL_35XX_RATE(2200000000U, 550, 6,  0),
-	PLL_35XX_RATE(2100000000U, 350, 4,  0),
-	PLL_35XX_RATE(2000000000U, 500, 6,  0),
-	PLL_35XX_RATE(1900000000U, 475, 6,  0),
-	PLL_35XX_RATE(1800000000U, 375, 5,  0),
-	PLL_35XX_RATE(1700000000U, 425, 6,  0),
-	PLL_35XX_RATE(1600000000U, 400, 6,  0),
-	PLL_35XX_RATE(1500000000U, 250, 4,  0),
-	PLL_35XX_RATE(1400000000U, 350, 6,  0),
-	PLL_35XX_RATE(1332000000U, 222, 4,  0),
-	PLL_35XX_RATE(1300000000U, 325, 6,  0),
-	PLL_35XX_RATE(1200000000U, 500, 5,  1),
-	PLL_35XX_RATE(1100000000U, 550, 6,  1),
-	PLL_35XX_RATE(1086000000U, 362, 4,  1),
-	PLL_35XX_RATE(1066000000U, 533, 6,  1),
-	PLL_35XX_RATE(1000000000U, 500, 6,  1),
-	PLL_35XX_RATE(933000000U,  311, 4,  1),
-	PLL_35XX_RATE(921000000U,  307, 4,  1),
-	PLL_35XX_RATE(900000000U,  375, 5,  1),
-	PLL_35XX_RATE(825000000U,  275, 4,  1),
-	PLL_35XX_RATE(800000000U,  400, 6,  1),
-	PLL_35XX_RATE(733000000U,  733, 12, 1),
-	PLL_35XX_RATE(700000000U,  175, 3,  1),
-	PLL_35XX_RATE(666000000U,  222, 4,  1),
-	PLL_35XX_RATE(633000000U,  211, 4,  1),
-	PLL_35XX_RATE(600000000U,  500, 5,  2),
-	PLL_35XX_RATE(552000000U,  460, 5,  2),
-	PLL_35XX_RATE(550000000U,  550, 6,  2),
-	PLL_35XX_RATE(543000000U,  362, 4,  2),
-	PLL_35XX_RATE(533000000U,  533, 6,  2),
-	PLL_35XX_RATE(500000000U,  500, 6,  2),
-	PLL_35XX_RATE(444000000U,  370, 5,  2),
-	PLL_35XX_RATE(420000000U,  350, 5,  2),
-	PLL_35XX_RATE(400000000U,  400, 6,  2),
-	PLL_35XX_RATE(350000000U,  350, 6,  2),
-	PLL_35XX_RATE(333000000U,  222, 4,  2),
-	PLL_35XX_RATE(300000000U,  500, 5,  3),
-	PLL_35XX_RATE(278000000U,  556, 6,  3),
-	PLL_35XX_RATE(266000000U,  532, 6,  3),
-	PLL_35XX_RATE(250000000U,  500, 6,  3),
-	PLL_35XX_RATE(200000000U,  400, 6,  3),
-	PLL_35XX_RATE(166000000U,  332, 6,  3),
-	PLL_35XX_RATE(160000000U,  320, 6,  3),
-	PLL_35XX_RATE(133000000U,  532, 6,  4),
-	PLL_35XX_RATE(100000000U,  400, 6,  4),
+	PLL_35XX_RATE(24 * MHZ, 2500000000U, 625, 6,  0),
+	PLL_35XX_RATE(24 * MHZ, 2400000000U, 500, 5,  0),
+	PLL_35XX_RATE(24 * MHZ, 2300000000U, 575, 6,  0),
+	PLL_35XX_RATE(24 * MHZ, 2200000000U, 550, 6,  0),
+	PLL_35XX_RATE(24 * MHZ, 2100000000U, 350, 4,  0),
+	PLL_35XX_RATE(24 * MHZ, 2000000000U, 500, 6,  0),
+	PLL_35XX_RATE(24 * MHZ, 1900000000U, 475, 6,  0),
+	PLL_35XX_RATE(24 * MHZ, 1800000000U, 375, 5,  0),
+	PLL_35XX_RATE(24 * MHZ, 1700000000U, 425, 6,  0),
+	PLL_35XX_RATE(24 * MHZ, 1600000000U, 400, 6,  0),
+	PLL_35XX_RATE(24 * MHZ, 1500000000U, 250, 4,  0),
+	PLL_35XX_RATE(24 * MHZ, 1400000000U, 350, 6,  0),
+	PLL_35XX_RATE(24 * MHZ, 1332000000U, 222, 4,  0),
+	PLL_35XX_RATE(24 * MHZ, 1300000000U, 325, 6,  0),
+	PLL_35XX_RATE(24 * MHZ, 1200000000U, 500, 5,  1),
+	PLL_35XX_RATE(24 * MHZ, 1100000000U, 550, 6,  1),
+	PLL_35XX_RATE(24 * MHZ, 1086000000U, 362, 4,  1),
+	PLL_35XX_RATE(24 * MHZ, 1066000000U, 533, 6,  1),
+	PLL_35XX_RATE(24 * MHZ, 1000000000U, 500, 6,  1),
+	PLL_35XX_RATE(24 * MHZ, 933000000U,  311, 4,  1),
+	PLL_35XX_RATE(24 * MHZ, 921000000U,  307, 4,  1),
+	PLL_35XX_RATE(24 * MHZ, 900000000U,  375, 5,  1),
+	PLL_35XX_RATE(24 * MHZ, 825000000U,  275, 4,  1),
+	PLL_35XX_RATE(24 * MHZ, 800000000U,  400, 6,  1),
+	PLL_35XX_RATE(24 * MHZ, 733000000U,  733, 12, 1),
+	PLL_35XX_RATE(24 * MHZ, 700000000U,  175, 3,  1),
+	PLL_35XX_RATE(24 * MHZ, 666000000U,  222, 4,  1),
+	PLL_35XX_RATE(24 * MHZ, 633000000U,  211, 4,  1),
+	PLL_35XX_RATE(24 * MHZ, 600000000U,  500, 5,  2),
+	PLL_35XX_RATE(24 * MHZ, 552000000U,  460, 5,  2),
+	PLL_35XX_RATE(24 * MHZ, 550000000U,  550, 6,  2),
+	PLL_35XX_RATE(24 * MHZ, 543000000U,  362, 4,  2),
+	PLL_35XX_RATE(24 * MHZ, 533000000U,  533, 6,  2),
+	PLL_35XX_RATE(24 * MHZ, 500000000U,  500, 6,  2),
+	PLL_35XX_RATE(24 * MHZ, 444000000U,  370, 5,  2),
+	PLL_35XX_RATE(24 * MHZ, 420000000U,  350, 5,  2),
+	PLL_35XX_RATE(24 * MHZ, 400000000U,  400, 6,  2),
+	PLL_35XX_RATE(24 * MHZ, 350000000U,  350, 6,  2),
+	PLL_35XX_RATE(24 * MHZ, 333000000U,  222, 4,  2),
+	PLL_35XX_RATE(24 * MHZ, 300000000U,  500, 5,  3),
+	PLL_35XX_RATE(24 * MHZ, 278000000U,  556, 6,  3),
+	PLL_35XX_RATE(24 * MHZ, 266000000U,  532, 6,  3),
+	PLL_35XX_RATE(24 * MHZ, 250000000U,  500, 6,  3),
+	PLL_35XX_RATE(24 * MHZ, 200000000U,  400, 6,  3),
+	PLL_35XX_RATE(24 * MHZ, 166000000U,  332, 6,  3),
+	PLL_35XX_RATE(24 * MHZ, 160000000U,  320, 6,  3),
+	PLL_35XX_RATE(24 * MHZ, 133000000U,  532, 6,  4),
+	PLL_35XX_RATE(24 * MHZ, 100000000U,  400, 6,  4),
 	{ /* sentinel */ }
 };
 
 /* AUD_PLL */
 static const struct samsung_pll_rate_table exynos5433_aud_pll_rates[] __initconst = {
-	PLL_36XX_RATE(400000000U, 200, 3, 2,      0),
-	PLL_36XX_RATE(393216003U, 197, 3, 2, -25690),
-	PLL_36XX_RATE(384000000U, 128, 2, 2,      0),
-	PLL_36XX_RATE(368639991U, 246, 4, 2, -15729),
-	PLL_36XX_RATE(361507202U, 181, 3, 2, -16148),
-	PLL_36XX_RATE(338687988U, 113, 2, 2,  -6816),
-	PLL_36XX_RATE(294912002U,  98, 1, 3,  19923),
-	PLL_36XX_RATE(288000000U,  96, 1, 3,      0),
-	PLL_36XX_RATE(252000000U,  84, 1, 3,      0),
+	PLL_36XX_RATE(24 * MHZ, 400000000U, 200, 3, 2,      0),
+	PLL_36XX_RATE(24 * MHZ, 393216003U, 197, 3, 2, -25690),
+	PLL_36XX_RATE(24 * MHZ, 384000000U, 128, 2, 2,      0),
+	PLL_36XX_RATE(24 * MHZ, 368639991U, 246, 4, 2, -15729),
+	PLL_36XX_RATE(24 * MHZ, 361507202U, 181, 3, 2, -16148),
+	PLL_36XX_RATE(24 * MHZ, 338687988U, 113, 2, 2,  -6816),
+	PLL_36XX_RATE(24 * MHZ, 294912002U,  98, 1, 3,  19923),
+	PLL_36XX_RATE(24 * MHZ, 288000000U,  96, 1, 3,      0),
+	PLL_36XX_RATE(24 * MHZ, 252000000U,  84, 1, 3,      0),
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index bbfa57b4e017..492d51691080 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -140,7 +140,7 @@ static const struct samsung_div_clock topc_div_clks[] __initconst = {
 };
 
 static const struct samsung_pll_rate_table pll1460x_24mhz_tbl[] __initconst = {
-	PLL_36XX_RATE(491519897, 20, 1, 0, 31457),
+	PLL_36XX_RATE(24 * MHZ, 491519897, 20, 1, 0, 31457),
 	{},
 };
 
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 61eb8abbfd9c..b1ee0e801d3e 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -41,35 +41,69 @@ enum samsung_pll_type {
 	pll_1460x,
 };
 
-#define PLL_35XX_RATE(_rate, _m, _p, _s)			\
+/*
+ * To validate PLL rates we need compile time checker.
+ * Since BUILD_BUG_ON does work with initializers, we need some replacement.
+ * Macro returns true if _exp is false, if _exp is true compilation fails.
+ * */
+#define BUILD_BUG_INIT(_exp) (sizeof(char[-!!(_exp)]) >= 0)
+#define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
+	((u64)(_fin) * (BIT(_ks) * (_m) + (_k)) / BIT(_ks) / ((_p) << (_s)))
+#define PLL_VALID_RATE(_fin, _fout, _m, _p, _s, _k, _ks) \
+	(BUILD_BUG_INIT(PLL_RATE(_fin, _m, _p, _s, _k, _ks) != (_fout)) \
+		? (_fout) : 0 )
+
+#define PLL_35XX_RATE(_fin, _rate, _m, _p, _s)			\
+	{							\
+		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
+				_m, _p, _s, 0, 16),		\
+		.mdiv	=	(_m),				\
+		.pdiv	=	(_p),				\
+		.sdiv	=	(_s),				\
+	}
+
+#define PLL_S3C2410_MPLL_RATE(_fin, _rate, _m, _p, _s)		\
+	{							\
+		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
+				_m + 8, _p + 2, _s, 0, 16),	\
+		.mdiv	=	(_m),				\
+		.pdiv	=	(_p),				\
+		.sdiv	=	(_s),				\
+	}
+
+#define PLL_S3C2440_MPLL_RATE(_fin, _rate, _m, _p, _s)		\
 	{							\
-		.rate	=	(_rate),				\
+		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
+				_m + 8, _p + 2, _s - 1, 0, 16),	\
 		.mdiv	=	(_m),				\
 		.pdiv	=	(_p),				\
 		.sdiv	=	(_s),				\
 	}
 
-#define PLL_36XX_RATE(_rate, _m, _p, _s, _k)			\
+#define PLL_36XX_RATE(_fin, _rate, _m, _p, _s, _k)		\
 	{							\
-		.rate	=	(_rate),				\
+		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
+				_m, _p, _s, _k, 16),		\
 		.mdiv	=	(_m),				\
 		.pdiv	=	(_p),				\
 		.sdiv	=	(_s),				\
 		.kdiv	=	(_k),				\
 	}
 
-#define PLL_45XX_RATE(_rate, _m, _p, _s, _afc)			\
+#define PLL_45XX_RATE(_fin, _rate, _m, _p, _s, _afc)		\
 	{							\
-		.rate	=	(_rate),			\
+		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
+				_m, _p, _s - 1, 0, 16),		\
 		.mdiv	=	(_m),				\
 		.pdiv	=	(_p),				\
 		.sdiv	=	(_s),				\
 		.afc	=	(_afc),				\
 	}
 
-#define PLL_4600_RATE(_rate, _m, _p, _s, _k, _vsel)		\
+#define PLL_4600_RATE(_fin, _rate, _m, _p, _s, _k, _vsel)	\
 	{							\
-		.rate	=	(_rate),			\
+		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
+				_m, _p, _s, _k, 16),		\
 		.mdiv	=	(_m),				\
 		.pdiv	=	(_p),				\
 		.sdiv	=	(_s),				\
@@ -77,9 +111,10 @@ enum samsung_pll_type {
 		.vsel	=	(_vsel),			\
 	}
 
-#define PLL_4650_RATE(_rate, _m, _p, _s, _k, _mfr, _mrr, _vsel)	\
+#define PLL_4650_RATE(_fin, _rate, _m, _p, _s, _k, _mfr, _mrr, _vsel) \
 	{							\
-		.rate	=	(_rate),			\
+		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
+				_m, _p, _s, _k, 10),		\
 		.mdiv	=	(_m),				\
 		.pdiv	=	(_p),				\
 		.sdiv	=	(_s),				\
diff --git a/drivers/clk/samsung/clk-s3c2410.c b/drivers/clk/samsung/clk-s3c2410.c
index d8e58a659467..0c6aa3e51336 100644
--- a/drivers/clk/samsung/clk-s3c2410.c
+++ b/drivers/clk/samsung/clk-s3c2410.c
@@ -162,34 +162,34 @@ struct samsung_clock_alias s3c2410_common_aliases[] __initdata = {
 static struct samsung_pll_rate_table pll_s3c2410_12mhz_tbl[] __initdata = {
 	/* sorted in descending order */
 	/* 2410A extras */
-	PLL_35XX_RATE(270000000, 127, 1, 1),
-	PLL_35XX_RATE(268000000, 126, 1, 1),
-	PLL_35XX_RATE(266000000, 125, 1, 1),
-	PLL_35XX_RATE(226000000, 105, 1, 1),
-	PLL_35XX_RATE(210000000, 132, 2, 1),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 270000000, 127, 1, 1),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 268000000, 126, 1, 1),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 266000000, 125, 1, 1),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 226000000, 105, 1, 1),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 210000000, 132, 2, 1),
 	/* 2410 common */
-	PLL_35XX_RATE(202800000, 161, 3, 1),
-	PLL_35XX_RATE(192000000, 88, 1, 1),
-	PLL_35XX_RATE(186000000, 85, 1, 1),
-	PLL_35XX_RATE(180000000, 82, 1, 1),
-	PLL_35XX_RATE(170000000, 77, 1, 1),
-	PLL_35XX_RATE(158000000, 71, 1, 1),
-	PLL_35XX_RATE(152000000, 68, 1, 1),
-	PLL_35XX_RATE(147000000, 90, 2, 1),
-	PLL_35XX_RATE(135000000, 82, 2, 1),
-	PLL_35XX_RATE(124000000, 116, 1, 2),
-	PLL_35XX_RATE(118500000, 150, 2, 2),
-	PLL_35XX_RATE(113000000, 105, 1, 2),
-	PLL_35XX_RATE(101250000, 127, 2, 2),
-	PLL_35XX_RATE(90000000, 112, 2, 2),
-	PLL_35XX_RATE(84750000, 105, 2, 2),
-	PLL_35XX_RATE(79000000, 71, 1, 2),
-	PLL_35XX_RATE(67500000, 82, 2, 2),
-	PLL_35XX_RATE(56250000, 142, 2, 3),
-	PLL_35XX_RATE(48000000, 120, 2, 3),
-	PLL_35XX_RATE(50700000, 161, 3, 3),
-	PLL_35XX_RATE(45000000, 82, 1, 3),
-	PLL_35XX_RATE(33750000, 82, 2, 3),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 202800000, 161, 3, 1),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 192000000, 88, 1, 1),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 186000000, 85, 1, 1),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 180000000, 82, 1, 1),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 170000000, 77, 1, 1),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 158000000, 71, 1, 1),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 152000000, 68, 1, 1),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 147000000, 90, 2, 1),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 135000000, 82, 2, 1),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 124000000, 116, 1, 2),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 118500000, 150, 2, 2),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 113000000, 105, 1, 2),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 101250000, 127, 2, 2),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 90000000, 112, 2, 2),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 84750000, 105, 2, 2),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 79000000, 71, 1, 2),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 67500000, 82, 2, 2),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 56250000, 142, 2, 3),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 48000000, 120, 2, 3),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 50700000, 161, 3, 3),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 45000000, 82, 1, 3),
+	PLL_S3C2410_MPLL_RATE(12 * MHZ, 33750000, 82, 2, 3),
 	{ /* sentinel */ },
 };
 
@@ -229,33 +229,33 @@ struct samsung_clock_alias s3c2410_aliases[] __initdata = {
 
 static struct samsung_pll_rate_table pll_s3c244x_12mhz_tbl[] __initdata = {
 	/* sorted in descending order */
-	PLL_35XX_RATE(400000000, 0x5c, 1, 1),
-	PLL_35XX_RATE(390000000, 0x7a, 2, 1),
-	PLL_35XX_RATE(380000000, 0x57, 1, 1),
-	PLL_35XX_RATE(370000000, 0xb1, 4, 1),
-	PLL_35XX_RATE(360000000, 0x70, 2, 1),
-	PLL_35XX_RATE(350000000, 0xa7, 4, 1),
-	PLL_35XX_RATE(340000000, 0x4d, 1, 1),
-	PLL_35XX_RATE(330000000, 0x66, 2, 1),
-	PLL_35XX_RATE(320000000, 0x98, 4, 1),
-	PLL_35XX_RATE(310000000, 0x93, 4, 1),
-	PLL_35XX_RATE(300000000, 0x75, 3, 1),
-	PLL_35XX_RATE(240000000, 0x70, 1, 2),
-	PLL_35XX_RATE(230000000, 0x6b, 1, 2),
-	PLL_35XX_RATE(220000000, 0x66, 1, 2),
-	PLL_35XX_RATE(210000000, 0x84, 2, 2),
-	PLL_35XX_RATE(200000000, 0x5c, 1, 2),
-	PLL_35XX_RATE(190000000, 0x57, 1, 2),
-	PLL_35XX_RATE(180000000, 0x70, 2, 2),
-	PLL_35XX_RATE(170000000, 0x4d, 1, 2),
-	PLL_35XX_RATE(160000000, 0x98, 4, 2),
-	PLL_35XX_RATE(150000000, 0x75, 3, 2),
-	PLL_35XX_RATE(120000000, 0x70, 1, 3),
-	PLL_35XX_RATE(110000000, 0x66, 1, 3),
-	PLL_35XX_RATE(100000000, 0x5c, 1, 3),
-	PLL_35XX_RATE(90000000, 0x70, 2, 3),
-	PLL_35XX_RATE(80000000, 0x98, 4, 3),
-	PLL_35XX_RATE(75000000, 0x75, 3, 3),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 400000000, 0x5c, 1, 1),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 390000000, 0x7a, 2, 1),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 380000000, 0x57, 1, 1),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 370000000, 0xb1, 4, 1),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 360000000, 0x70, 2, 1),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 350000000, 0xa7, 4, 1),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 340000000, 0x4d, 1, 1),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 330000000, 0x66, 2, 1),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 320000000, 0x98, 4, 1),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 310000000, 0x93, 4, 1),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 300000000, 0x75, 3, 1),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 240000000, 0x70, 1, 2),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 230000000, 0x6b, 1, 2),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 220000000, 0x66, 1, 2),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 210000000, 0x84, 2, 2),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 200000000, 0x5c, 1, 2),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 190000000, 0x57, 1, 2),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 180000000, 0x70, 2, 2),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 170000000, 0x4d, 1, 2),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 160000000, 0x98, 4, 2),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 150000000, 0x75, 3, 2),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 120000000, 0x70, 1, 3),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 110000000, 0x66, 1, 3),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 100000000, 0x5c, 1, 3),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 90000000, 0x70, 2, 3),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 80000000, 0x98, 4, 3),
+	PLL_S3C2440_MPLL_RATE(12 * MHZ, 75000000, 0x75, 3, 3),
 	{ /* sentinel */ },
 };
 
-- 
2.16.1
