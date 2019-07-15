From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 08/50] clk: samsung: change aclk266_isp clocks
 definitions Exynos5420
Date: Mon, 15 Jul 2019 14:43:35 +0200
Message-ID: <20190715124417.4787-9-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124440eucas1p10bb25e412f32f0da95761f96831893e6@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The ACLK266_ISP has different topology in Exynos5420 and 5422/5800.  In
Exynos5420 this clock does not have dedicated MUX which chooses PLL instead
it takes the clock from 2-level mux from ACLK266.  In Exynos5422 there is a
dedicated clock tree and the PLL can be chosen.  The patch adds needed
MUXes in the exynos5800_mux_cloks, updates exynos5x_mux_clks and
exynos5420_mux_clks properly. It also adds IDs to mange these clocks from
DT.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 9d54856dbcda..5f251279b4c8 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -432,6 +432,10 @@ PNAME(mout_group16_5800_p)	= { "dout_osc_div", "mout_mau_epll_clk" };
 PNAME(mout_mx_mspll_ccore_phy_p) = { "sclk_bpll", "mout_sclk_dpll",
 					"mout_sclk_mpll", "ff_dout_spll2",
 					"mout_sclk_spll", "mout_sclk_epll"};
+PNAME(mout_group17_5800_p)	= { "dout_aclk266_isp", "dout_sclk_sw" };
+PNAME(mout_group18_5800_p)	= { "dout_osc_div", "mout_sw_aclk266_isp" };
+PNAME(mout_group19_5800_p)	= { "mout_sclk_cpll", "mout_sclk_dpll",
+					"mout_sclk_mpll", "mout_sclk_ipll"};
 
 /* fixed rate clocks generated outside the soc */
 static struct samsung_fixed_rate_clock
@@ -494,6 +498,8 @@ static const struct samsung_mux_clock exynos5800_mux_clks[] __initconst = {
 	MUX(CLK_SCLK_BPLL, "sclk_bpll", mout_bpll_p, SRC_TOP7, 24, 1),
 	MUX(0, "mout_epll2", mout_epll2_5800_p, SRC_TOP7, 28, 1),
 
+	MUX(CLK_MOUT_ACLK266_ISP, "mout_aclk266_isp", mout_group19_5800_p,
+			SRC_TOP8, 12, 2),
 	MUX(0, "mout_aclk550_cam", mout_group3_5800_p, SRC_TOP8, 16, 3),
 	MUX(0, "mout_aclkfl1_550_cam", mout_group3_5800_p, SRC_TOP8, 20, 3),
 	MUX(0, "mout_aclk432_cam", mout_group6_5800_p, SRC_TOP8, 24, 2),
@@ -501,6 +507,8 @@ static const struct samsung_mux_clock exynos5800_mux_clks[] __initconst = {
 
 	MUX_F(CLK_MOUT_USER_MAU_EPLL, "mout_user_mau_epll", mout_group16_5800_p,
 			SRC_TOP9, 8, 1, CLK_SET_RATE_PARENT, 0),
+	MUX(CLK_MOUT_USER_ACLK266_ISP, "mout_user_aclk266_isp",
+			mout_group18_5800_p, SRC_TOP9, 12, 1),
 	MUX(0, "mout_user_aclk550_cam", mout_group15_5800_p,
 							SRC_TOP9, 16, 1),
 	MUX(0, "mout_user_aclkfl1_550_cam", mout_group13_5800_p,
@@ -510,6 +518,8 @@ static const struct samsung_mux_clock exynos5800_mux_clks[] __initconst = {
 	MUX(0, "mout_user_aclk432_scaler", mout_group9_5800_p,
 							SRC_TOP9, 28, 1),
 
+	MUX(CLK_MOUT_SW_ACLK266_ISP, "mout_sw_aclk266_isp", mout_group17_5800_p,
+			SRC_TOP13, 12, 1),
 	MUX(0, "mout_sw_aclk550_cam", mout_group14_5800_p, SRC_TOP13, 16, 1),
 	MUX(0, "mout_sw_aclkfl1_550_cam", mout_group12_5800_p,
 							SRC_TOP13, 20, 1),
@@ -524,6 +534,8 @@ static const struct samsung_mux_clock exynos5800_mux_clks[] __initconst = {
 static const struct samsung_div_clock exynos5800_div_clks[] __initconst = {
 	DIV(CLK_DOUT_ACLK400_WCORE, "dout_aclk400_wcore",
 			"mout_aclk400_wcore", DIV_TOP0, 16, 3),
+	DIV(CLK_DOUT_ACLK266_ISP, "dout_aclk266_isp", "mout_aclk266_isp",
+				DIV_TOP8, 12, 3),
 	DIV(0, "dout_aclk550_cam", "mout_aclk550_cam",
 				DIV_TOP8, 16, 3),
 	DIV(0, "dout_aclkfl1_550_cam", "mout_aclkfl1_550_cam",
@@ -574,6 +586,9 @@ static const struct samsung_mux_clock exynos5420_mux_clks[] __initconst = {
 	MUX(0, "mout_aclk300_disp1", mout_group1_p, SRC_TOP2, 24, 2),
 	MUX(0, "mout_aclk300_gscl", mout_group1_p, SRC_TOP2, 28, 2),
 
+	MUX(CLK_MOUT_USER_ACLK266_ISP, "mout_user_aclk266_isp",
+			mout_user_aclk266_isp_p, SRC_TOP4, 16, 1),
+
 	MUX(CLK_MOUT_MX_MSPLL_CCORE, "mout_mx_mspll_ccore",
 			mout_group5_5800_p, SRC_TOP7, 16, 2),
 	MUX_F(0, "mout_mau_epll_clk", mout_mau_epll_clk_p, SRC_TOP7, 20, 2,
@@ -641,8 +656,6 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
 			SRC_TOP4, 8, 1),
 	MUX(0, "mout_user_aclk333_432_isp0", mout_user_aclk333_432_isp0_p,
 			SRC_TOP4, 12, 1),
-	MUX(0, "mout_user_aclk266_isp", mout_user_aclk266_isp_p,
-			SRC_TOP4, 16, 1),
 	MUX(0, "mout_user_aclk266", mout_user_aclk266_p, SRC_TOP4, 20, 1),
 	MUX(0, "mout_user_aclk166", mout_user_aclk166_p, SRC_TOP4, 24, 1),
 	MUX(CLK_MOUT_USER_ACLK333, "mout_user_aclk333", mout_user_aclk333_p,
-- 
2.17.1
