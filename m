From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] clk: samsung: Remove unused mout_user_aclk400_mcuisp_p4x12 variable
Date: Wed, 18 Jul 2018 21:56:20 +0200
Message-ID: <20180718195620.5331-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Remove unused 'mout_user_aclk400_mcuisp_p4x12' variable to fix GCC warning:

    drivers/clk/samsung/clk-exynos4412-isp.c:40:27: warning:
        'mout_user_aclk400_mcuisp_p4x12' defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/samsung/clk-exynos4412-isp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
index d5f1ccb36300..cfaa057035ad 100644
--- a/drivers/clk/samsung/clk-exynos4412-isp.c
+++ b/drivers/clk/samsung/clk-exynos4412-isp.c
@@ -37,8 +37,6 @@ static const unsigned long exynos4x12_clk_isp_save[] __initconst = {
 	E4X12_GATE_ISP1,
 };
 
-PNAME(mout_user_aclk400_mcuisp_p4x12) = { "fin_pll", "div_aclk400_mcuisp", };
-
 static struct samsung_div_clock exynos4x12_isp_div_clks[] = {
 	DIV(CLK_ISP_DIV_ISP0, "div_isp0", "aclk200", E4X12_DIV_ISP0, 0, 3),
 	DIV(CLK_ISP_DIV_ISP1, "div_isp1", "aclk200", E4X12_DIV_ISP0, 4, 3),
-- 
2.14.1
