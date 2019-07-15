From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 05/50] clk: samsung: add IDs to aclk400_isp in Exynos5420
Date: Mon, 15 Jul 2019 14:43:32 +0200
Message-ID: <20190715124417.4787-6-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124437eucas1p2d817f0c1fcf4b523c7910218a6e557d9@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add clock IDs to MUXes related to ACLK400_ISP for managing them from DT
devices.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 8f1d39cb2f1e..74276875bc3e 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -461,7 +461,8 @@ static const struct samsung_fixed_factor_clock
 };
 
 static const struct samsung_mux_clock exynos5800_mux_clks[] __initconst = {
-	MUX(0, "mout_aclk400_isp", mout_group3_5800_p, SRC_TOP0, 0, 3),
+	MUX(CLK_MOUT_ACLK400_ISP, "mout_aclk400_isp", mout_group3_5800_p,
+			SRC_TOP0, 0, 3),
 	MUX(CLK_MOUT_ACLK400_MSCL, "mout_aclk400_mscl", mout_group3_5800_p,
 			SRC_TOP0, 4, 3),
 	MUX(CLK_MOUT_ACLK400_WCORE, "mout_aclk400_wcore", mout_group2_5800_p,
@@ -548,7 +549,8 @@ static const struct samsung_mux_clock exynos5420_mux_clks[] __initconst = {
 	MUX(0, "mout_aclk400_wcore_bpll", mout_aclk400_wcore_bpll_p,
 				TOP_SPARE2, 4, 1),
 
-	MUX(0, "mout_aclk400_isp", mout_group1_p, SRC_TOP0, 0, 2),
+	MUX(CLK_MOUT_ACLK400_ISP, "mout_aclk400_isp", mout_group1_p,
+			SRC_TOP0, 0, 2),
 	MUX(CLK_MOUT_ACLK400_MSCL, "mout_aclk400_mscl", mout_group1_p,
 			SRC_TOP0, 4, 2),
 	MUX(CLK_MOUT_ACLK400_WCORE, "mout_aclk400_wcore", mout_group1_p,
@@ -670,8 +672,8 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
 	MUX(0, "mout_sclk_dpll", mout_dpll_p, SRC_TOP6, 24, 1),
 	MUX(0, "mout_sclk_cpll", mout_cpll_p, SRC_TOP6, 28, 1),
 
-	MUX(0, "mout_sw_aclk400_isp", mout_sw_aclk400_isp_p,
-			SRC_TOP10, 0, 1),
+	MUX(CLK_MOUT_SW_ACLK400_ISP, "mout_sw_aclk400_isp",
+			mout_sw_aclk400_isp_p, SRC_TOP10, 0, 1),
 	MUX(CLK_MOUT_SW_ACLK400_MSCL, "mout_sw_aclk400_mscl",
 			mout_sw_aclk400_mscl_p,	SRC_TOP10, 4, 1),
 	MUX(CLK_MOUT_SW_ACLK200, "mout_sw_aclk200", mout_sw_aclk200_p,
-- 
2.17.1
