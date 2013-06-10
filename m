From: Yadwinder Singh Brar <yadi.brar@samsung.com>
Subject: [PATCH v6 6/7] clk: samsung: Reorder MUX registration for mout_vpllsrc
Date: Mon, 10 Jun 2013 18:54:18 +0530
Message-ID: <1370870659-10929-7-git-send-email-yadi.brar@samsung.com>
References: <1370870659-10929-1-git-send-email-yadi.brar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54151 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756740Ab3FSNcl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 09:32:41 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MON00LJH6YDURV0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Jun 2013 22:32:40 +0900 (KST)
In-reply-to: <1370870659-10929-1-git-send-email-yadi.brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, dianders@chromium.org, t.figa@samsung.com, vikas.sajjan@linaro.org, abrestic@chromium.org, Yadwinder Singh Brar <yadi.brar@samsung.com>

From: Vikas Sajjan <vikas.sajjan@linaro.org>

While trying to get rate of "mout_vpllsrc" MUX (parent) for registering the
"fout_vpll" (child), we found get rate was failing.

So this patch moves the mout_vpllsrc MUX out of the existing common list
and registers the mout_vpllsrc MUX before the PLL registrations.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
---
 drivers/clk/samsung/clk-exynos5250.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 21f5491..6881810 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -228,6 +228,10 @@ struct samsung_fixed_factor_clock exynos5250_fixed_factor_clks[] __initdata = {
 	FFACTOR(none, "fout_bplldiv2", "fout_bpll", 1, 2, 0),
 };
 
+struct samsung_mux_clock exynos5250_pll_pmux_clks[] __initdata = {
+	MUX(none, "mout_vpllsrc", mout_vpllsrc_p, SRC_TOP2, 0, 1),
+};
+
 struct samsung_mux_clock exynos5250_mux_clks[] __initdata = {
 	MUX(none, "mout_apll", mout_apll_p, SRC_CPU, 0, 1),
 	MUX(none, "mout_cpu", mout_cpu_p, SRC_CPU, 16, 1),
@@ -235,7 +239,6 @@ struct samsung_mux_clock exynos5250_mux_clks[] __initdata = {
 	MUX(none, "sclk_mpll", mout_mpll_p, SRC_CORE1, 8, 1),
 	MUX(none, "mout_bpll_fout", mout_bpll_fout_p, PLL_DIV2_SEL, 0, 1),
 	MUX(none, "sclk_bpll", mout_bpll_p, SRC_CDREX, 0, 1),
-	MUX(none, "mout_vpllsrc", mout_vpllsrc_p, SRC_TOP2, 0, 1),
 	MUX(none, "sclk_vpll", mout_vpll_p, SRC_TOP2, 16, 1),
 	MUX(none, "sclk_epll", mout_epll_p, SRC_TOP2, 12, 1),
 	MUX(none, "sclk_cpll", mout_cpll_p, SRC_TOP2, 8, 1),
@@ -526,6 +529,8 @@ void __init exynos5250_clk_init(struct device_node *np)
 	samsung_clk_of_register_fixed_ext(exynos5250_fixed_rate_ext_clks,
 			ARRAY_SIZE(exynos5250_fixed_rate_ext_clks),
 			ext_clk_match);
+	samsung_clk_register_mux(exynos5250_pll_pmux_clks,
+				ARRAY_SIZE(exynos5250_pll_pmux_clks));
 	samsung_clk_register_pll(exynos5250_plls, ARRAY_SIZE(exynos5250_plls),
 					reg_base);
 	samsung_clk_register_fixed_rate(exynos5250_fixed_rate_clks,
-- 
1.7.0.4
