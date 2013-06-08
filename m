From: Yadwinder Singh Brar <yadi.brar@samsung.com>
Subject: [PATCH v5 4/7] clk: samsung: Add set_rate() clk_ops for PLL35xx
Date: Sat, 08 Jun 2013 23:04:19 +0530
Message-ID: <1370712862-10501-5-git-send-email-yadi.brar@samsung.com>
References: <1370712862-10501-1-git-send-email-yadi.brar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48199 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754482Ab3FQRml (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 13:42:41 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOJ00JKLT71SS60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Jun 2013 02:42:39 +0900 (KST)
In-reply-to: <1370712862-10501-1-git-send-email-yadi.brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, dianders@chromium.org, t.figa@samsung.com, vikas.sajjan@linaro.org, abrestic@chromium.org, Yadwinder Singh Brar <yadi.brar@samsung.com>

This patch add set_rate() and round_rate() for PLL35xx

Reviewed-by: Doug Anderson <dianders@chromium.org>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
---
 drivers/clk/samsung/clk-pll.c |  104 ++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 103 insertions(+), 1 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index f753c5e..df419aa 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -24,16 +24,51 @@ struct samsung_clk_pll {
 
 #define to_clk_pll(_hw) container_of(_hw, struct samsung_clk_pll, hw)
 
+static const struct samsung_pll_rate_table *samsung_get_pll_settings(
+				struct samsung_clk_pll *pll, unsigned long rate)
+{
+	const struct samsung_pll_rate_table  *rate_table = pll->rate_table;
+	int i;
+
+	for (i = 0; i < pll->rate_count; i++) {
+		if (rate == rate_table[i].rate)
+			return &rate_table[i];
+	}
+
+	return NULL;
+}
+
+static long samsung_pll_round_rate(struct clk_hw *hw,
+			unsigned long drate, unsigned long *prate)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	const struct samsung_pll_rate_table *rate_table = pll->rate_table;
+	int i;
+
+	/* Assumming rate_table is in descending order */
+	for (i = 0; i < pll->rate_count; i++) {
+		if (drate >= rate_table[i].rate)
+			return rate_table[i].rate;
+	}
+
+	/* return minimum supported value */
+	return rate_table[i - 1].rate;
+}
+
 /*
  * PLL35xx Clock Type
  */
+/* Maximum lock time can be 270 * PDIV cycles */
+#define PLL35XX_LOCK_FACTOR	(270)
 
 #define PLL35XX_MDIV_MASK       (0x3FF)
 #define PLL35XX_PDIV_MASK       (0x3F)
 #define PLL35XX_SDIV_MASK       (0x7)
+#define PLL35XX_LOCK_STAT_MASK	(0x1)
 #define PLL35XX_MDIV_SHIFT      (16)
 #define PLL35XX_PDIV_SHIFT      (8)
 #define PLL35XX_SDIV_SHIFT      (0)
+#define PLL35XX_LOCK_STAT_SHIFT	(29)
 
 static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
 				unsigned long parent_rate)
@@ -53,8 +88,72 @@ static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)fvco;
 }
 
+static inline bool samsung_pll35xx_mp_change(
+		const struct samsung_pll_rate_table *rate, u32 pll_con)
+{
+	u32 old_mdiv, old_pdiv;
+
+	old_mdiv = (pll_con >> PLL35XX_MDIV_SHIFT) & PLL35XX_MDIV_MASK;
+	old_pdiv = (pll_con >> PLL35XX_PDIV_SHIFT) & PLL35XX_PDIV_MASK;
+
+	return (rate->mdiv != old_mdiv || rate->pdiv != old_pdiv);
+}
+
+static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
+					unsigned long prate)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	const struct samsung_pll_rate_table *rate;
+	u32 tmp;
+
+	/* Get required rate settings from table */
+	rate = samsung_get_pll_settings(pll, drate);
+	if (!rate) {
+		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
+			drate, __clk_get_name(hw->clk));
+		return -EINVAL;
+	}
+
+	tmp = __raw_readl(pll->con_reg);
+
+	if (!(samsung_pll35xx_mp_change(rate, tmp))) {
+		/* If only s change, change just s value only*/
+		tmp &= ~(PLL35XX_SDIV_MASK << PLL35XX_SDIV_SHIFT);
+		tmp |= rate->sdiv << PLL35XX_SDIV_SHIFT;
+		__raw_writel(tmp, pll->con_reg);
+		return 0;
+	}
+
+	/* Set PLL lock time. */
+	__raw_writel(rate->pdiv * PLL35XX_LOCK_FACTOR,
+			pll->lock_reg);
+
+	/* Change PLL PMS values */
+	tmp &= ~((PLL35XX_MDIV_MASK << PLL35XX_MDIV_SHIFT) |
+			(PLL35XX_PDIV_MASK << PLL35XX_PDIV_SHIFT) |
+			(PLL35XX_SDIV_MASK << PLL35XX_SDIV_SHIFT));
+	tmp |= (rate->mdiv << PLL35XX_MDIV_SHIFT) |
+			(rate->pdiv << PLL35XX_PDIV_SHIFT) |
+			(rate->sdiv << PLL35XX_SDIV_SHIFT);
+	__raw_writel(tmp, pll->con_reg);
+
+	/* wait_lock_time */
+	do {
+		cpu_relax();
+		tmp = __raw_readl(pll->con_reg);
+	} while (!(tmp & (PLL35XX_LOCK_STAT_MASK
+				<< PLL35XX_LOCK_STAT_SHIFT)));
+	return 0;
+}
+
 static const struct clk_ops samsung_pll35xx_clk_ops = {
 	.recalc_rate = samsung_pll35xx_recalc_rate,
+	.round_rate = samsung_pll_round_rate,
+	.set_rate = samsung_pll35xx_set_rate,
+};
+
+static const struct clk_ops samsung_pll35xx_clk_min_ops = {
+	.recalc_rate = samsung_pll35xx_recalc_rate,
 };
 
 /*
@@ -384,7 +483,10 @@ void __init samsung_clk_register_pll(struct samsung_pll_clock *clk_list,
 
 		switch (list->type) {
 		case pll_35xx:
-			init.ops = &samsung_pll35xx_clk_ops;
+			if (!pll->rate_table)
+				init.ops = &samsung_pll35xx_clk_min_ops;
+			else
+				init.ops = &samsung_pll35xx_clk_ops;
 			break;
 		case pll_36xx:
 			init.ops = &samsung_pll36xx_clk_ops;
-- 
1.7.0.4
