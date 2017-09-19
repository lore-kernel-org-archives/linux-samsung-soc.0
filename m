From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 RESEND] clk: samsung: exynos4: Enable VPLL and EPLL
 clocks for suspend/resume cycle
Date: Tue, 19 Sep 2017 12:01:08 +0200
Message-ID: <1505815279-19097-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170919100345eucas1p1391a495dab09faecdc2acf9635e4c42d@eucas1p1.samsung.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Commit 6edfa11cb396 ("clk: samsung: Add enable/disable operation for
PLL36XX clocks") added enable/disable operations to PLL clocks. Prior that
VPLL and EPPL clocks were always enabled because the enable bit was never
touched. Those clocks have to be enabled during suspend/resume cycle,
because otherwise board fails to enter sleep mode. This patch enables them
unconditionally before entering system suspend state. System restore
function will set them to the previous state saved in the register cache
done before that unconditional enable.

Fixes: 6edfa11cb396 ("clk: samsung: Add enable/disable operation for PLL36XX clocks")
CC: stable@vger.kernel.org # v4.13
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index e40b77583c47..d8d3cb67b402 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -294,6 +294,18 @@ enum exynos4_plls {
 #define PLL_ENABLED	(1 << 31)
 #define PLL_LOCKED	(1 << 29)
 
+static void exynos4_clk_enable_pll(u32 reg)
+{
+	u32 pll_con = readl(reg_base + reg);
+	pll_con |= PLL_ENABLED;
+	writel(pll_con, reg_base + reg);
+
+	while (!(pll_con & PLL_LOCKED)) {
+		cpu_relax();
+		pll_con = readl(reg_base + reg);
+	}
+}
+
 static void exynos4_clk_wait_for_pll(u32 reg)
 {
 	u32 pll_con;
@@ -315,6 +327,9 @@ static int exynos4_clk_suspend(void)
 	samsung_clk_save(reg_base, exynos4_save_pll,
 				ARRAY_SIZE(exynos4_clk_pll_regs));
 
+	exynos4_clk_enable_pll(EPLL_CON0);
+	exynos4_clk_enable_pll(VPLL_CON0);
+
 	if (exynos4_soc == EXYNOS4210) {
 		samsung_clk_save(reg_base, exynos4_save_soc,
 					ARRAY_SIZE(exynos4210_clk_save));
-- 
1.9.1
