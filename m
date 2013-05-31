From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v3 5/6] clk: samsung: Add alias for mout_vpllsrc and reorder MUX registration for it
Date: Fri, 31 May 2013 18:01:35 +0530
Message-ID: <1370003496-19288-6-git-send-email-vikas.sajjan@linaro.org>
References: <1370003496-19288-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:55251 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754952Ab3EaMcY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 May 2013 08:32:24 -0400
Received: by mail-pd0-f172.google.com with SMTP id 10so2135919pdi.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 May 2013 05:32:23 -0700 (PDT)
In-Reply-To: <1370003496-19288-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, yadi.brar01@gmail.com, dianders@chromium.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, thomas.abraham@linaro.org, patches@linaro.org, linaro-kernel@lists.linaro.org

While trying to get rate of "mout_vpllsrc" MUX (parent) for registering the
"fout_vpll" (child), we found get rate was failing.

So this patch moves the mout_vpllsrc MUX out of the existing common list
and registers the mout_vpllsrc MUX before the PLL registrations.
Its also adds the alias for the mout_vpllsrc MUX.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
---
 drivers/clk/samsung/clk-exynos5250.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index ddf10ca..b0e6680 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -207,6 +207,11 @@ struct samsung_fixed_factor_clock exynos5250_fixed_factor_clks[] __initdata = {
 	FFACTOR(none, "fout_bplldiv2", "fout_bpll", 1, 2, 0),
 };
 
+struct samsung_mux_clock exynos5250_pll_pmux_clks[] __initdata = {
+	MUX_A(none, "mout_vpllsrc", mout_vpllsrc_p, SRC_TOP2, 0, 1,
+			"mout_vpllsrc"),
+};
+
 struct samsung_mux_clock exynos5250_mux_clks[] __initdata = {
 	MUX(none, "mout_apll", mout_apll_p, SRC_CPU, 0, 1),
 	MUX(none, "mout_cpu", mout_cpu_p, SRC_CPU, 16, 1),
@@ -214,7 +219,6 @@ struct samsung_mux_clock exynos5250_mux_clks[] __initdata = {
 	MUX(none, "sclk_mpll", mout_mpll_p, SRC_CORE1, 8, 1),
 	MUX(none, "mout_bpll_fout", mout_bpll_fout_p, PLL_DIV2_SEL, 0, 1),
 	MUX(none, "sclk_bpll", mout_bpll_p, SRC_CDREX, 0, 1),
-	MUX(none, "mout_vpllsrc", mout_vpllsrc_p, SRC_TOP2, 0, 1),
 	MUX(none, "sclk_vpll", mout_vpll_p, SRC_TOP2, 16, 1),
 	MUX(none, "sclk_epll", mout_epll_p, SRC_TOP2, 12, 1),
 	MUX(none, "sclk_cpll", mout_cpll_p, SRC_TOP2, 8, 1),
@@ -490,6 +494,9 @@ void __init exynos5250_clk_init(struct device_node *np)
 			ARRAY_SIZE(exynos5250_fixed_rate_ext_clks),
 			ext_clk_match);
 
+	samsung_clk_register_mux(exynos5250_pll_pmux_clks,
+			ARRAY_SIZE(exynos5250_pll_pmux_clks));
+
 	apll = samsung_clk_register_pll35xx("fout_apll", "fin_pll",
 			reg_base, NULL, 0);
 	mpll = samsung_clk_register_pll35xx("fout_mpll", "fin_pll",
-- 
1.7.9.5
