From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH] clk samsung exynos5420 add CLK_RECALC_NEW_RATES flag to mout_apll and mout_kpll clock.
Date: Fri,  8 May 2015 03:18:55 +0930
Message-ID: <1431020935-5025-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:36114 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750986AbbEGRtc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 May 2015 13:49:32 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>

Addition of CLK_RECALC_NEW_RATES flag to support Exynos5 cpu clk so that
correct divider values are re-calculated after both pre/post
clock notifiers had run for for mout_apll clock and mout_kpll clock.

Depend on https://lkml.org/lkml/2015/4/3/388

Tested on OdroidXU3 Board.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 462aaee..6c7458c 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -618,10 +618,10 @@ static struct samsung_mux_clock exynos5x_mux_clks[] __initdata = {
 	MUX(0, "mout_mspll_cpu", mout_mspll_cpu_p, SRC_TOP7, 12, 2),
 
 	MUX_F(0, "mout_apll", mout_apll_p, SRC_CPU, 0, 1,
-	      CLK_SET_RATE_PARENT, 0),
+	      CLK_SET_RATE_PARENT | CLK_RECALC_NEW_RATES, 0),
 	MUX(0, "mout_cpu", mout_cpu_p, SRC_CPU, 16, 1),
 	MUX_F(0, "mout_kpll", mout_kpll_p, SRC_KFC, 0, 1,
-	      CLK_SET_RATE_PARENT, 0),
+	      CLK_SET_RATE_PARENT | CLK_RECALC_NEW_RATES, 0),
 	MUX(0, "mout_kfc", mout_kfc_p, SRC_KFC, 16, 1),
 
 	MUX(0, "mout_aclk200", mout_group1_p, SRC_TOP0, 8, 2),
-- 
1.9.1
