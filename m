From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 1/3] clk: samsung: Add enable/disable operation for
 PLL36XX clocks
Date: Fri, 09 Jun 2017 12:38:29 +0200
Message-ID: <1497004711-24052-1-git-send-email-s.nawrocki@samsung.com>
References: <CGME20170609103849epcas5p397e85db2388d4d91f5a775996cb9541d@epcas5p3.samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: cw00.choi@samsung.com, krzk@kernel.org, b.zolnierkie@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The existing enable/disable ops for PLL35XX are made more generic
and used also for PLL36XX. This fixes issues in the kernel with
PLL36XX PLLs when the PLL has not been already enabled by bootloader.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - none

 drivers/clk/samsung/clk-pll.c | 87 +++++++++++++++++++++++++------------------
 1 file changed, 50 insertions(+), 37 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index db68057..037c614 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -23,6 +23,10 @@ struct samsung_clk_pll {
 	struct clk_hw		hw;
 	void __iomem		*lock_reg;
 	void __iomem		*con_reg;
+	/* PLL enable control bit offset in @con_reg register */
+	unsigned short		enable_offs;
+	/* PLL lock status bit offset in @con_reg register */
+	unsigned short		lock_offs;
 	enum samsung_pll_type	type;
 	unsigned int		rate_count;
 	const struct samsung_pll_rate_table *rate_table;
@@ -61,6 +65,34 @@ static long samsung_pll_round_rate(struct clk_hw *hw,
 	return rate_table[i - 1].rate;
 }

+static int samsung_pll3xxx_enable(struct clk_hw *hw)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 tmp;
+
+	tmp = readl_relaxed(pll->con_reg);
+	tmp |= BIT(pll->enable_offs);
+	writel_relaxed(tmp, pll->con_reg);
+
+	/* wait lock time */
+	do {
+		cpu_relax();
+		tmp = readl_relaxed(pll->con_reg);
+	} while (!(tmp & BIT(pll->lock_offs)));
+
+	return 0;
+}
+
+static void samsung_pll3xxx_disable(struct clk_hw *hw)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 tmp;
+
+	tmp = readl_relaxed(pll->con_reg);
+	tmp &= ~BIT(pll->enable_offs);
+	writel_relaxed(tmp, pll->con_reg);
+}
+
 /*
  * PLL2126 Clock Type
  */
@@ -142,34 +174,6 @@ static unsigned long samsung_pll3000_recalc_rate(struct clk_hw *hw,
 #define PLL35XX_LOCK_STAT_SHIFT	(29)
 #define PLL35XX_ENABLE_SHIFT	(31)

-static int samsung_pll35xx_enable(struct clk_hw *hw)
-{
-	struct samsung_clk_pll *pll = to_clk_pll(hw);
-	u32 tmp;
-
-	tmp = readl_relaxed(pll->con_reg);
-	tmp |= BIT(PLL35XX_ENABLE_SHIFT);
-	writel_relaxed(tmp, pll->con_reg);
-
-	/* wait_lock_time */
-	do {
-		cpu_relax();
-		tmp = readl_relaxed(pll->con_reg);
-	} while (!(tmp & BIT(PLL35XX_LOCK_STAT_SHIFT)));
-
-	return 0;
-}
-
-static void samsung_pll35xx_disable(struct clk_hw *hw)
-{
-	struct samsung_clk_pll *pll = to_clk_pll(hw);
-	u32 tmp;
-
-	tmp = readl_relaxed(pll->con_reg);
-	tmp &= ~BIT(PLL35XX_ENABLE_SHIFT);
-	writel_relaxed(tmp, pll->con_reg);
-}
-
 static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
 				unsigned long parent_rate)
 {
@@ -238,12 +242,12 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 			(rate->sdiv << PLL35XX_SDIV_SHIFT);
 	writel_relaxed(tmp, pll->con_reg);

-	/* wait_lock_time if enabled */
-	if (tmp & BIT(PLL35XX_ENABLE_SHIFT)) {
+	/* Wait until the PLL is locked if it is enabled. */
+	if (tmp & BIT(pll->enable_offs)) {
 		do {
 			cpu_relax();
 			tmp = readl_relaxed(pll->con_reg);
-		} while (!(tmp & BIT(PLL35XX_LOCK_STAT_SHIFT)));
+		} while (!(tmp & BIT(pll->lock_offs)));
 	}
 	return 0;
 }
@@ -252,8 +256,8 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	.recalc_rate = samsung_pll35xx_recalc_rate,
 	.round_rate = samsung_pll_round_rate,
 	.set_rate = samsung_pll35xx_set_rate,
-	.enable = samsung_pll35xx_enable,
-	.disable = samsung_pll35xx_disable,
+	.enable = samsung_pll3xxx_enable,
+	.disable = samsung_pll3xxx_disable,
 };

 static const struct clk_ops samsung_pll35xx_clk_min_ops = {
@@ -275,6 +279,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 #define PLL36XX_SDIV_SHIFT	(0)
 #define PLL36XX_KDIV_SHIFT	(0)
 #define PLL36XX_LOCK_STAT_SHIFT	(29)
+#define PLL36XX_ENABLE_SHIFT	(31)

 static unsigned long samsung_pll36xx_recalc_rate(struct clk_hw *hw,
 				unsigned long parent_rate)
@@ -354,10 +359,12 @@ static int samsung_pll36xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	writel_relaxed(pll_con1, pll->con_reg + 4);

 	/* wait_lock_time */
-	do {
-		cpu_relax();
-		tmp = readl_relaxed(pll->con_reg);
-	} while (!(tmp & (1 << PLL36XX_LOCK_STAT_SHIFT)));
+	if (pll_con0 & BIT(pll->enable_offs)) {
+		do {
+			cpu_relax();
+			tmp = readl_relaxed(pll->con_reg);
+		} while (!(tmp & BIT(pll->lock_offs)));
+	}

 	return 0;
 }
@@ -366,6 +373,8 @@ static int samsung_pll36xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	.recalc_rate = samsung_pll36xx_recalc_rate,
 	.set_rate = samsung_pll36xx_set_rate,
 	.round_rate = samsung_pll_round_rate,
+	.enable = samsung_pll3xxx_enable,
+	.disable = samsung_pll3xxx_disable,
 };

 static const struct clk_ops samsung_pll36xx_clk_min_ops = {
@@ -1287,6 +1296,8 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1450x:
 	case pll_1451x:
 	case pll_1452x:
+		pll->enable_offs = PLL35XX_ENABLE_SHIFT;
+		pll->lock_offs = PLL35XX_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
 			init.ops = &samsung_pll35xx_clk_min_ops;
 		else
@@ -1305,6 +1316,8 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	/* clk_ops for 36xx and 2650 are similar */
 	case pll_36xx:
 	case pll_2650:
+		pll->enable_offs = PLL36XX_ENABLE_SHIFT;
+		pll->lock_offs = PLL36XX_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
 			init.ops = &samsung_pll36xx_clk_min_ops;
 		else
--
1.9.1

