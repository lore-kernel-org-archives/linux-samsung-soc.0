From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 5/7] clk/samsung: add support for pll2550xx
Date: Fri, 06 Dec 2013 21:26:29 +0530
Message-ID: <1386345391-23482-6-git-send-email-rahul.sharma@samsung.com>
References: <1386345391-23482-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:18473 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757758Ab3LFP5b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Dec 2013 10:57:31 -0500
In-reply-to: <1386345391-23482-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, thomas.ab@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, pankaj.dubey@samsung.com, yg1004.jang@samsung.com, arun.kk@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Pankaj Dubey <pankaj.dubey@samsung.com>

exynos5260 use pll2520xx and it has different bitfields
for P,M,S values as compared to pll2550xx. Support for
pll2520xx is added here.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 drivers/clk/samsung/clk-pll.c |  107 +++++++++++++++++++++++++++++++++++++++++
 drivers/clk/samsung/clk-pll.h |    1 +
 2 files changed, 108 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index e8e8953..237a889 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -710,6 +710,107 @@ struct clk * __init samsung_clk_register_pll2550x(const char *name,
 	return clk;
 }
 
+/*
+ * PLL2550xx Clock Type
+ */
+
+/* Maximum lock time can be 270 * PDIV cycles */
+#define PLL2550XX_LOCK_FACTOR (270)
+
+#define PLL2550XX_MDIV_MASK		(0x3FF)
+#define PLL2550XX_PDIV_MASK		(0x3F)
+#define PLL2550XX_SDIV_MASK		(0x7)
+#define PLL2550XX_LOCK_STAT_MASK	(0x1)
+#define PLL2550XX_MDIV_SHIFT		(9)
+#define PLL2550XX_PDIV_SHIFT		(3)
+#define PLL2550XX_SDIV_SHIFT		(0)
+#define PLL2550XX_LOCK_STAT_SHIFT	(21)
+
+static unsigned long samsung_pll2550xx_recalc_rate(struct clk_hw *hw,
+				unsigned long parent_rate)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 mdiv, pdiv, sdiv, pll_con;
+	u64 fvco = parent_rate;
+
+	pll_con = __raw_readl(pll->con_reg);
+	mdiv = (pll_con >> PLL2550XX_MDIV_SHIFT) & PLL2550XX_MDIV_MASK;
+	pdiv = (pll_con >> PLL2550XX_PDIV_SHIFT) & PLL2550XX_PDIV_MASK;
+	sdiv = (pll_con >> PLL2550XX_SDIV_SHIFT) & PLL2550XX_SDIV_MASK;
+
+	fvco *= mdiv;
+	do_div(fvco, (pdiv << sdiv));
+
+	return (unsigned long)fvco;
+}
+
+static inline bool samsung_pll2550xx_mp_change(u32 mdiv, u32 pdiv, u32 pll_con)
+{
+	if ((mdiv != ((pll_con >> PLL2550XX_MDIV_SHIFT) &
+				PLL2550XX_MDIV_MASK)) ||
+		(pdiv != ((pll_con >> PLL2550XX_PDIV_SHIFT) &
+				PLL2550XX_PDIV_MASK)))
+		return 1;
+	else
+		return 0;
+}
+
+static int samsung_pll2550xx_set_rate(struct clk_hw *hw, unsigned long drate,
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
+	if (!(samsung_pll2550xx_mp_change(rate->mdiv, rate->pdiv, tmp))) {
+		/* If only s change, change just s value only*/
+		tmp &= ~(PLL2550XX_SDIV_MASK << PLL2550XX_SDIV_SHIFT);
+		tmp |= rate->sdiv << PLL2550XX_SDIV_SHIFT;
+		__raw_writel(tmp, pll->con_reg);
+	} else {
+		/* Set PLL lock time. */
+		__raw_writel(rate->pdiv * PLL2550XX_LOCK_FACTOR, pll->lock_reg);
+
+		/* Change PLL PMS values */
+		tmp &= ~((PLL2550XX_MDIV_MASK << PLL2550XX_MDIV_SHIFT) |
+				(PLL2550XX_PDIV_MASK << PLL2550XX_PDIV_SHIFT) |
+				(PLL2550XX_SDIV_MASK << PLL2550XX_SDIV_SHIFT));
+		tmp |= (rate->mdiv << PLL2550XX_MDIV_SHIFT) |
+				(rate->pdiv << PLL2550XX_PDIV_SHIFT) |
+				(rate->sdiv << PLL2550XX_SDIV_SHIFT);
+		__raw_writel(tmp, pll->con_reg);
+
+		/* wait_lock_time */
+		do {
+			cpu_relax();
+			tmp = __raw_readl(pll->con_reg);
+		} while (!(tmp & (PLL2550XX_LOCK_STAT_MASK
+				<< PLL2550XX_LOCK_STAT_SHIFT)));
+	}
+
+	return 0;
+}
+
+static const struct clk_ops samsung_pll2550xx_clk_ops = {
+	.recalc_rate = samsung_pll2550xx_recalc_rate,
+	.round_rate = samsung_pll_round_rate,
+	.set_rate = samsung_pll2550xx_set_rate,
+};
+
+static const struct clk_ops samsung_pll2550xx_clk_min_ops = {
+	.recalc_rate = samsung_pll2550xx_recalc_rate,
+};
+
 static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 				struct samsung_pll_clock *pll_clk,
 				void __iomem *base)
@@ -787,6 +888,12 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		else
 			init.ops = &samsung_pll46xx_clk_ops;
 		break;
+	case pll_2550xx:
+		if (!pll->rate_table)
+			init.ops = &samsung_pll2550xx_clk_min_ops;
+		else
+			init.ops = &samsung_pll2550xx_clk_ops;
+		break;
 	default:
 		pr_warn("%s: Unknown pll type for pll clk %s\n",
 			__func__, pll_clk->name);
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 6c39030..e106470 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -25,6 +25,7 @@ enum samsung_pll_type {
 	pll_4650c,
 	pll_6552,
 	pll_6553,
+	pll_2550xx,
 };
 
 #define PLL_35XX_RATE(_rate, _m, _p, _s)			\
-- 
1.7.9.5
