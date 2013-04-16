From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/3] clk: exynos5250: Staticize local symbols
Date: Tue, 16 Apr 2013 15:35:18 +0530
Message-ID: <1366106719-26342-2-git-send-email-sachin.kamat@linaro.org>
References: <1366106719-26342-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:42434 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964932Ab3DPKRi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Apr 2013 06:17:38 -0400
Received: by mail-pd0-f175.google.com with SMTP id g10so213482pdj.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Apr 2013 03:17:38 -0700 (PDT)
In-Reply-To: <1366106719-26342-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, sachin.kamat@linaro.org, patches@linaro.org

These symbols are used only in this file and hence should
be static.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/clk/samsung/clk-exynos5250.c |   17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 7290faa..9cdee2b 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -191,24 +191,27 @@ PNAME(mout_spdif_p)	= { "sclk_audio0", "sclk_audio1", "sclk_audio2",
 				"spdif_extclk" };
 
 /* fixed rate clocks generated outside the soc */
-struct samsung_fixed_rate_clock exynos5250_fixed_rate_ext_clks[] __initdata = {
+static struct
+samsung_fixed_rate_clock exynos5250_fixed_rate_ext_clks[] __initdata = {
 	FRATE(fin_pll, "fin_pll", NULL, CLK_IS_ROOT, 0),
 };
 
 /* fixed rate clocks generated inside the soc */
-struct samsung_fixed_rate_clock exynos5250_fixed_rate_clks[] __initdata = {
+static struct
+samsung_fixed_rate_clock exynos5250_fixed_rate_clks[] __initdata = {
 	FRATE(none, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 24000000),
 	FRATE(none, "sclk_hdmi27m", NULL, CLK_IS_ROOT, 27000000),
 	FRATE(none, "sclk_dptxphy", NULL, CLK_IS_ROOT, 24000000),
 	FRATE(none, "sclk_uhostphy", NULL, CLK_IS_ROOT, 48000000),
 };
 
-struct samsung_fixed_factor_clock exynos5250_fixed_factor_clks[] __initdata = {
+static struct
+samsung_fixed_factor_clock exynos5250_fixed_factor_clks[] __initdata = {
 	FFACTOR(none, "fout_mplldiv2", "fout_mpll", 1, 2, 0),
 	FFACTOR(none, "fout_bplldiv2", "fout_bpll", 1, 2, 0),
 };
 
-struct samsung_mux_clock exynos5250_mux_clks[] __initdata = {
+static struct samsung_mux_clock exynos5250_mux_clks[] __initdata = {
 	MUX(none, "mout_apll", mout_apll_p, SRC_CPU, 0, 1),
 	MUX(none, "mout_cpu", mout_cpu_p, SRC_CPU, 16, 1),
 	MUX(none, "mout_mpll_fout", mout_mpll_fout_p, PLL_DIV2_SEL, 4, 1),
@@ -254,7 +257,7 @@ struct samsung_mux_clock exynos5250_mux_clks[] __initdata = {
 	MUX(none, "mout_spi2", mout_group1_p, SRC_PERIC1, 24, 4),
 };
 
-struct samsung_div_clock exynos5250_div_clks[] __initdata = {
+static struct samsung_div_clock exynos5250_div_clks[] __initdata = {
 	DIV(none, "div_arm", "mout_cpu", DIV_CPU0, 0, 3),
 	DIV(none, "sclk_apll", "mout_apll", DIV_CPU0, 24, 3),
 	DIV(none, "aclk66_pre", "sclk_mpll_user", DIV_TOP1, 24, 3),
@@ -314,7 +317,7 @@ struct samsung_div_clock exynos5250_div_clks[] __initdata = {
 			DIV_PERIC2, 8, 8, CLK_SET_RATE_PARENT, 0),
 };
 
-struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
+static struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
 	GATE(gscl0, "gscl0", "none", GATE_IP_GSCL, 0, 0, 0),
 	GATE(gscl1, "gscl1", "none", GATE_IP_GSCL, 1, 0, 0),
 	GATE(gscl2, "gscl2", "aclk266", GATE_IP_GSCL, 2, 0, 0),
@@ -471,7 +474,7 @@ static __initdata struct of_device_id ext_clk_match[] = {
 };
 
 /* register exynox5250 clocks */
-void __init exynos5250_clk_init(struct device_node *np)
+static void __init exynos5250_clk_init(struct device_node *np)
 {
 	void __iomem *reg_base;
 	struct clk *apll, *mpll, *epll, *vpll, *bpll, *gpll, *cpll;
-- 
1.7.9.5
