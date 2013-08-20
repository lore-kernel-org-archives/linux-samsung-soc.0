From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 16/16] clk: samsung: exynos5250: Simplify registration of PLL
 rate tables
Date: Tue, 20 Aug 2013 19:31:43 +0200
Message-ID: <1377019903-14614-17-git-send-email-t.figa@samsung.com>
References: <1377019903-14614-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41662 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751848Ab3HTRcM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 13:32:12 -0400
In-reply-to: <1377019903-14614-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Kumar Gala <galak@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Since the _get_rate() helper has been modified to use __clk_lookup()
internally, checking of PLL input rates can be done using it and so the
registration code can be simplified.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos5250.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index a9916a4..00a80e4 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -543,8 +543,6 @@ static struct of_device_id ext_clk_match[] __initdata = {
 static void __init exynos5250_clk_init(struct device_node *np)
 {
 	void __iomem *reg_base;
-	struct clk *vpllsrc;
-	unsigned long fin_pll_rate, mout_vpllsrc_rate = 0;
 
 	if (np) {
 		reg_base = of_iomap(np, 0);
@@ -563,16 +561,10 @@ static void __init exynos5250_clk_init(struct device_node *np)
 	samsung_clk_register_mux(exynos5250_pll_pmux_clks,
 				ARRAY_SIZE(exynos5250_pll_pmux_clks));
 
-	fin_pll_rate = _get_rate("fin_pll");
-
-	if (fin_pll_rate == 24 * MHZ)
+	if (_get_rate("fin_pll") == 24 * MHZ)
 		exynos5250_plls[epll].rate_table = epll_24mhz_tbl;
 
-	vpllsrc = __clk_lookup("mout_vpllsrc");
-	if (vpllsrc)
-		mout_vpllsrc_rate = clk_get_rate(vpllsrc);
-
-	if (mout_vpllsrc_rate == 24 * MHZ)
+	if (_get_rate("mout_vpllsrc") == 24 * MHZ)
 		exynos5250_plls[vpll].rate_table =  vpll_24mhz_tbl;
 
 	samsung_clk_register_pll(exynos5250_plls, ARRAY_SIZE(exynos5250_plls),
-- 
1.8.3.2
