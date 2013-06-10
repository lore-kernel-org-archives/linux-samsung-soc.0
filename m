From: Yadwinder Singh Brar <yadi.brar@samsung.com>
Subject: [PATCH v6 5/7] clk: samsung: Add set_rate() clk_ops for PLL36xx
Date: Mon, 10 Jun 2013 18:54:17 +0530
Message-ID: <1370870659-10929-6-git-send-email-yadi.brar@samsung.com>
References: <1370870659-10929-1-git-send-email-yadi.brar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54147 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756736Ab3FSNcj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 09:32:39 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MON00LJH6YDURV0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Jun 2013 22:32:38 +0900 (KST)
In-reply-to: <1370870659-10929-1-git-send-email-yadi.brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, dianders@chromium.org, t.figa@samsung.com, vikas.sajjan@linaro.org, abrestic@chromium.org

From: Vikas Sajjan <vikas.sajjan@linaro.org>

This patch adds set_rate and round_rate clk_ops for PLL36xx

Reviewed-by: Tomasz Figa <t.figa@samsung.com>
Reviewed-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 drivers/clk/samsung/clk-pll.c |   79 ++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 78 insertions(+), 1 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index e3e7f0c..2197004 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -160,6 +160,8 @@ static const struct clk_ops samsung_pll35xx_clk_min_ops = {
 /*
  * PLL36xx Clock Type
  */
+/* Maximum lock time can be 3000 * PDIV cycles */
+#define PLL36XX_LOCK_FACTOR    (3000)
 
 #define PLL36XX_KDIV_MASK	(0xFFFF)
 #define PLL36XX_MDIV_MASK	(0x1FF)
@@ -168,6 +170,8 @@ static const struct clk_ops samsung_pll35xx_clk_min_ops = {
 #define PLL36XX_MDIV_SHIFT	(16)
 #define PLL36XX_PDIV_SHIFT	(8)
 #define PLL36XX_SDIV_SHIFT	(0)
+#define PLL36XX_KDIV_SHIFT	(0)
+#define PLL36XX_LOCK_STAT_SHIFT	(29)
 
 static unsigned long samsung_pll36xx_recalc_rate(struct clk_hw *hw,
 				unsigned long parent_rate)
@@ -190,8 +194,78 @@ static unsigned long samsung_pll36xx_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)fvco;
 }
 
+static inline bool samsung_pll36xx_mpk_change(
+	const struct samsung_pll_rate_table *rate, u32 pll_con0, u32 pll_con1)
+{
+	u32 old_mdiv, old_pdiv, old_kdiv;
+
+	old_mdiv = (pll_con0 >> PLL36XX_MDIV_SHIFT) & PLL36XX_MDIV_MASK;
+	old_pdiv = (pll_con0 >> PLL36XX_PDIV_SHIFT) & PLL36XX_PDIV_MASK;
+	old_kdiv = (pll_con1 >> PLL36XX_KDIV_SHIFT) & PLL36XX_KDIV_MASK;
+
+	return (rate->mdiv != old_mdiv || rate->pdiv != old_pdiv ||
+		rate->kdiv != old_kdiv);
+}
+
+static int samsung_pll36xx_set_rate(struct clk_hw *hw, unsigned long drate,
+					unsigned long parent_rate)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 tmp, pll_con0, pll_con1;
+	const struct samsung_pll_rate_table *rate;
+
+	rate = samsung_get_pll_settings(pll, drate);
+	if (!rate) {
+		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
+			drate, __clk_get_name(hw->clk));
+		return -EINVAL;
+	}
+
+	pll_con0 = __raw_readl(pll->con_reg);
+	pll_con1 = __raw_readl(pll->con_reg + 4);
+
+	if (!(samsung_pll36xx_mpk_change(rate, pll_con0, pll_con1))) {
+		/* If only s change, change just s value only*/
+		pll_con0 &= ~(PLL36XX_SDIV_MASK << PLL36XX_SDIV_SHIFT);
+		pll_con0 |= (rate->sdiv << PLL36XX_SDIV_SHIFT);
+		__raw_writel(pll_con0, pll->con_reg);
+
+		return 0;
+	}
+
+	/* Set PLL lock time. */
+	__raw_writel(rate->pdiv * PLL36XX_LOCK_FACTOR, pll->lock_reg);
+
+	 /* Change PLL PMS values */
+	pll_con0 &= ~((PLL36XX_MDIV_MASK << PLL36XX_MDIV_SHIFT) |
+			(PLL36XX_PDIV_MASK << PLL36XX_PDIV_SHIFT) |
+			(PLL36XX_SDIV_MASK << PLL36XX_SDIV_SHIFT));
+	pll_con0 |= (rate->mdiv << PLL36XX_MDIV_SHIFT) |
+			(rate->pdiv << PLL36XX_PDIV_SHIFT) |
+			(rate->sdiv << PLL36XX_SDIV_SHIFT);
+	__raw_writel(pll_con0, pll->con_reg);
+
+	pll_con1 &= ~(PLL36XX_KDIV_MASK << PLL36XX_KDIV_SHIFT);
+	pll_con1 |= rate->kdiv << PLL36XX_KDIV_SHIFT;
+	__raw_writel(pll_con1, pll->con_reg + 4);
+
+	/* wait_lock_time */
+	do {
+		cpu_relax();
+		tmp = __raw_readl(pll->con_reg);
+	} while (!(tmp & (1 << PLL36XX_LOCK_STAT_SHIFT)));
+
+	return 0;
+}
+
 static const struct clk_ops samsung_pll36xx_clk_ops = {
 	.recalc_rate = samsung_pll36xx_recalc_rate,
+	.set_rate = samsung_pll36xx_set_rate,
+	.round_rate = samsung_pll_round_rate,
+};
+
+static const struct clk_ops samsung_pll36xx_clk_min_ops = {
+	.recalc_rate = samsung_pll36xx_recalc_rate,
 };
 
 /*
@@ -494,7 +568,10 @@ void __init samsung_clk_register_pll(struct samsung_pll_clock *clk_list,
 		/* clk_ops for 36xx and 2650 are similar */
 		case pll_36xx:
 		case pll_2650:
-			init.ops = &samsung_pll36xx_clk_ops;
+			if (!pll->rate_table)
+				init.ops = &samsung_pll36xx_clk_min_ops;
+			else
+				init.ops = &samsung_pll36xx_clk_ops;
 			break;
 		default:
 			pr_warn("%s: Unknown pll type for pll clk %s\n",
-- 
1.7.0.4
