From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 15/50] clk: samsung: add MPLL rate table in Exynos5420
Date: Mon, 15 Jul 2019 14:43:42 +0200
Message-ID: <20190715124417.4787-16-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124446eucas1p1de55fe42ed5555c7a09b10f8c3ec3c3e@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The MPLL has fixed frequency left by the bootloader and it is not possible
to change it. With this patch the MPLL gets rate table the same for the
whole PLL family (similar as APLL, KPLL according to RM) so the frequency
might be changed to one of the values defined there.
It is needed for further patches which change the MPLL frequency to feed
the clocks with proper base.
It also sets CLK_IS_CRITICAL for SCLK_MPLL due to some drivers which could
disable master clock, which is then populated higher and tries to disable
PLL, which casues system crash. The flag is needed for this kind of use
cases.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 6d1a0ef9172e..cded46f360f1 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -687,7 +687,8 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_USER_ACLK300_GSCL, "mout_user_aclk300_gscl",
 			mout_user_aclk300_gscl_p, SRC_TOP5, 28, 1),
 
-	MUX(0, "mout_sclk_mpll", mout_mpll_p, SRC_TOP6, 0, 1),
+	MUX_F(CLK_MOUT_SCLK_MPLL, "mout_sclk_mpll", mout_mpll_p, SRC_TOP6, 0, 1,
+			CLK_IS_CRITICAL, 0),
 	MUX(CLK_MOUT_VPLL, "mout_sclk_vpll", mout_vpll_p, SRC_TOP6, 4, 1),
 	MUX(CLK_MOUT_SCLK_SPLL, "mout_sclk_spll", mout_spll_p, SRC_TOP6, 8, 1),
 	MUX(0, "mout_sclk_ipll", mout_ipll_p, SRC_TOP6, 12, 1),
@@ -1518,6 +1519,7 @@ static void __init exynos5x_clk_init(struct device_node *np,
 		exynos5x_plls[dpll].rate_table = exynos5420_pll2550x_24mhz_tbl;
 		exynos5x_plls[epll].rate_table = exynos5420_epll_24mhz_tbl;
 		exynos5x_plls[kpll].rate_table = exynos5420_pll2550x_24mhz_tbl;
+		exynos5x_plls[mpll].rate_table = exynos5420_pll2550x_24mhz_tbl;
 	}
 
 	if (soc == EXYNOS5420)
-- 
2.17.1
