From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 14/50] clk: samsung: add CLK_MOUT_SCLK_CPLL in the
 Exynos5420
Date: Mon, 15 Jul 2019 14:43:41 +0200
Message-ID: <20190715124417.4787-15-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124445eucas1p1a73385fcbe6205d868ae63b1198ff572@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add ID to mout_sclk_cpll MUX to make possible children connection in
the DT.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 2395b02ce8c5..6d1a0ef9172e 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -696,7 +696,7 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
 			CLK_SET_RATE_PARENT, 0),
 	MUX_F(CLK_MOUT_SCLK_DPLL, "mout_sclk_dpll", mout_dpll_p,
 			SRC_TOP6, 24, 1, CLK_IS_CRITICAL, 0),
-	MUX(0, "mout_sclk_cpll", mout_cpll_p, SRC_TOP6, 28, 1),
+	MUX(CLK_MOUT_SCLK_CPLL, "mout_sclk_cpll", mout_cpll_p, SRC_TOP6, 28, 1),
 
 	MUX(CLK_MOUT_SW_ACLK400_ISP, "mout_sw_aclk400_isp",
 			mout_sw_aclk400_isp_p, SRC_TOP10, 0, 1),
-- 
2.17.1
