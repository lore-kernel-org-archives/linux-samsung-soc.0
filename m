From: Yadwinder Singh Brar <yadi.brar@samsung.com>
Subject: [PATCH v7 11/11] clk: samsung: Add EPLL and VPLL freq table for
 exynos5250 SoC
Date: Tue, 11 Jun 2013 15:01:16 +0530
Message-ID: <1370943076-13461-12-git-send-email-yadi.brar@samsung.com>
References: <1370943076-13461-1-git-send-email-yadi.brar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:53596 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965003Ab3FTJj4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 05:39:56 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOO004DXQUIU1X0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Jun 2013 18:39:54 +0900 (KST)
In-reply-to: <1370943076-13461-1-git-send-email-yadi.brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, dianders@chromium.org, t.figa@samsung.com, vikas.sajjan@linaro.org, abrestic@chromium.org, Yadwinder Singh Brar <yadi.brar@samsung.com>

From: Vikas Sajjan <vikas.sajjan@linaro.org>

Adds the EPLL and VPLL freq table for exynos5250 SoC.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
---
 drivers/clk/samsung/clk-exynos5250.c |   38 ++++++++++++++++++++++++++++++++++
 drivers/clk/samsung/clk.h            |    2 +
 2 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 492d119..2aabecb 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -498,6 +498,29 @@ static struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
 	GATE(g3d, "g3d", "aclk_400_g3d", GATE_IP_G3D, 0, 0, 0),
 };
 
+static __initdata struct samsung_pll_rate_table vpll_24mhz_tbl[] = {
+	/* sorted in descending order */
+	/* PLL_36XX_RATE(rate, m, p, s, k) */
+	PLL_36XX_RATE(266000000, 266, 3, 3, 0),
+	/* Not in UM, but need for eDP on snow */
+	PLL_36XX_RATE(70500000, 94, 2, 4, 0),
+	{ },
+};
+
+static __initdata struct samsung_pll_rate_table epll_24mhz_tbl[] = {
+	/* sorted in descending order */
+	/* PLL_36XX_RATE(rate, m, p, s, k) */
+	PLL_36XX_RATE(192000000, 64, 2, 2, 0),
+	PLL_36XX_RATE(180633600, 90, 3, 2, 20762),
+	PLL_36XX_RATE(180000000, 90, 3, 2, 0),
+	PLL_36XX_RATE(73728000, 98, 2, 4, 19923),
+	PLL_36XX_RATE(67737600, 90, 2, 4, 20762),
+	PLL_36XX_RATE(49152000, 98, 3, 4, 19923),
+	PLL_36XX_RATE(45158400, 90, 3, 4, 20762),
+	PLL_36XX_RATE(32768000, 131, 3, 5, 4719),
+	{ },
+};
+
 struct __initdata samsung_pll_clock exynos5250_plls[nr_plls] = {
 	[apll] = PLL_A(pll_35xx, fout_apll, "fout_apll", "fin_pll", APLL_LOCK,
 		APLL_CON0, "fout_apll", NULL),
@@ -524,6 +547,8 @@ static __initdata struct of_device_id ext_clk_match[] = {
 static void __init exynos5250_clk_init(struct device_node *np)
 {
 	void __iomem *reg_base;
+	struct clk *vpllsrc;
+	unsigned long fin_pll_rate, mout_vpllsrc_rate = 0;
 
 	if (np) {
 		reg_base = of_iomap(np, 0);
@@ -541,6 +566,19 @@ static void __init exynos5250_clk_init(struct device_node *np)
 			ext_clk_match);
 	samsung_clk_register_mux(exynos5250_pll_pmux_clks,
 				ARRAY_SIZE(exynos5250_pll_pmux_clks));
+
+	fin_pll_rate = _get_rate("fin_pll");
+
+	if (fin_pll_rate == 24 * MHZ)
+		exynos5250_plls[epll].rate_table = epll_24mhz_tbl;
+
+	vpllsrc = __clk_lookup("mout_vpllsrc");
+	if (vpllsrc)
+		mout_vpllsrc_rate = clk_get_rate(vpllsrc);
+
+	if (mout_vpllsrc_rate == 24 * MHZ)
+		exynos5250_plls[vpll].rate_table =  vpll_24mhz_tbl;
+
 	samsung_clk_register_pll(exynos5250_plls, ARRAY_SIZE(exynos5250_plls),
 					reg_base);
 	samsung_clk_register_fixed_rate(exynos5250_fixed_rate_clks,
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index 4a003d7..d459ef7 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -40,6 +40,8 @@ struct samsung_clock_alias {
 		.alias		= a,				\
 	}
 
+#define MHZ (1000 * 1000)
+
 /**
  * struct samsung_fixed_rate_clock: information about fixed-rate clock
  * @id: platform specific id of the clock.
-- 
1.7.0.4
