From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] clk: samsung: pll: Add enable/disable support for PLL35XX
 clocks
Date: Wed, 25 Jan 2017 12:52:32 +0100
Message-ID: <1485345152-3140-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170125115241eucas1p25f7244ee4c79f42de48d91a2f659ce8c@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57566 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752116AbdAYLwo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 06:52:44 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OKC00EDN3NUO910@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jan 2017 11:52:43 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Some PLLs might be disabled by default after turning off and then on a
power domain which they belongs to. To avoid configuring a disabled PLL,
add proper code for handling PLL enable/disable.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This patchset is a next step to add support for all power domains on
Exynos5433 SoCs. This patchset contains patches for initial clocks
configuration on TM2/TM2e boards. Till now all PLLs worked only
because they were enabled by the bootloader. However when power domains
are added, such configuration might be lost if the display power domain
get turned off before clock controller's probe.

Patches have been generated on top of linux-next from 25th January 2017.

This is a part of a larger task, which goal is to add support for power
domains on Exynos5433 SoCs / TM2 boards. All patches needed to get it
working have been pushed to the following git repo:
https://git.linaro.org/people/marek.szyprowski/linux-srpol.git v4.10-next-tm2-pd

This patch was also tested on Exynos4412-based Odroid U3 board, which also
uses some PLL35XX clocks.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland
---
 drivers/clk/samsung/clk-pll.c | 45 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 9617825daabb..52290894857a 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -136,11 +136,39 @@ static unsigned long samsung_pll3000_recalc_rate(struct clk_hw *hw,
 #define PLL35XX_MDIV_MASK       (0x3FF)
 #define PLL35XX_PDIV_MASK       (0x3F)
 #define PLL35XX_SDIV_MASK       (0x7)
-#define PLL35XX_LOCK_STAT_MASK	(0x1)
 #define PLL35XX_MDIV_SHIFT      (16)
 #define PLL35XX_PDIV_SHIFT      (8)
 #define PLL35XX_SDIV_SHIFT      (0)
 #define PLL35XX_LOCK_STAT_SHIFT	(29)
+#define PLL35XX_ENABLE_SHIFT	(31)
+
+static int samsung_pll35xx_enable(struct clk_hw *hw)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 tmp;
+
+	tmp = readl_relaxed(pll->con_reg);
+	tmp |= BIT(PLL35XX_ENABLE_SHIFT);
+	writel_relaxed(tmp, pll->con_reg);
+
+	/* wait_lock_time */
+	do {
+		cpu_relax();
+		tmp = readl_relaxed(pll->con_reg);
+	} while (!(tmp & BIT(PLL35XX_LOCK_STAT_SHIFT)));
+
+	return 0;
+}
+
+static void samsung_pll35xx_disable(struct clk_hw *hw)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 tmp;
+
+	tmp = readl_relaxed(pll->con_reg);
+	tmp &= ~BIT(PLL35XX_ENABLE_SHIFT);
+	writel_relaxed(tmp, pll->con_reg);
+}
 
 static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
 				unsigned long parent_rate)
@@ -210,12 +238,13 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 			(rate->sdiv << PLL35XX_SDIV_SHIFT);
 	writel_relaxed(tmp, pll->con_reg);
 
-	/* wait_lock_time */
-	do {
-		cpu_relax();
-		tmp = readl_relaxed(pll->con_reg);
-	} while (!(tmp & (PLL35XX_LOCK_STAT_MASK
-				<< PLL35XX_LOCK_STAT_SHIFT)));
+	/* wait_lock_time if enabled */
+	if (tmp & BIT(PLL35XX_ENABLE_SHIFT)) {
+		do {
+			cpu_relax();
+			tmp = readl_relaxed(pll->con_reg);
+		} while (!(tmp & BIT(PLL35XX_LOCK_STAT_SHIFT)));
+	}
 	return 0;
 }
 
@@ -223,6 +252,8 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	.recalc_rate = samsung_pll35xx_recalc_rate,
 	.round_rate = samsung_pll_round_rate,
 	.set_rate = samsung_pll35xx_set_rate,
+	.enable = samsung_pll35xx_enable,
+	.disable = samsung_pll35xx_disable,
 };
 
 static const struct clk_ops samsung_pll35xx_clk_min_ops = {
-- 
1.9.1
