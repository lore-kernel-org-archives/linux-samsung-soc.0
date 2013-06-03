From: Yadwinder Singh Brar <yadi.brar@samsung.com>
Subject: [PATCH v4 4/6] clk: samsung: Add set_rate() clk_ops for PLL36xx
Date: Mon, 03 Jun 2013 20:39:54 +0530
Message-ID: <1370272196-4346-5-git-send-email-yadi.brar@samsung.com>
References: <1370272196-4346-1-git-send-email-yadi.brar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40049 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751720Ab3FLPVd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 11:21:33 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOA00JMTDBPN7D0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Jun 2013 00:21:32 +0900 (KST)
In-reply-to: <1370272196-4346-1-git-send-email-yadi.brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, dianders@chromium.org, t.figa@samsung.com, vikas.sajjan@linaro.org, patches@linaro.org

From: Vikas Sajjan <vikas.sajjan@linaro.org>

This patch adds set_rate and round_rate clk_ops for PLL36xx

Reviewed-by: Tomasz Figa <t.figa@samsung.com>
Reviewed-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 drivers/clk/samsung/clk-pll.c |   79 ++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 78 insertions(+), 1 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 319b52b..42b60b5 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -215,6 +215,9 @@ struct clk * __init samsung_clk_register_pll35xx(const char *name,
 #define PLL36XX_CON0_OFFSET	(0x100)
 #define PLL36XX_CON1_OFFSET	(0x104)
 
+/* Maximum lock time can be 3000 * PDIV cycles */
+#define PLL36XX_LOCK_FACTOR	(3000)
+
 #define PLL36XX_KDIV_MASK	(0xFFFF)
 #define PLL36XX_MDIV_MASK	(0x1FF)
 #define PLL36XX_PDIV_MASK	(0x3F)
@@ -222,6 +225,8 @@ struct clk * __init samsung_clk_register_pll35xx(const char *name,
 #define PLL36XX_MDIV_SHIFT	(16)
 #define PLL36XX_PDIV_SHIFT	(8)
 #define PLL36XX_SDIV_SHIFT	(0)
+#define PLL36XX_KDIV_SHIFT	(0)
+#define PLL36XX_LOCK_STAT_SHIFT	(29)
 
 static unsigned long samsung_pll36xx_recalc_rate(struct clk_hw *hw,
 				unsigned long parent_rate)
@@ -244,8 +249,78 @@ static unsigned long samsung_pll36xx_recalc_rate(struct clk_hw *hw,
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
+	pll_con0 = pll_readl(pll, PLL36XX_CON0_OFFSET);
+	pll_con1 = pll_readl(pll, PLL36XX_CON1_OFFSET);
+
+	if (!(samsung_pll36xx_mpk_change(rate, pll_con0, pll_con1))) {
+		/* If only s change, change just s value only*/
+		pll_con0 &= ~(PLL36XX_SDIV_MASK << PLL36XX_SDIV_SHIFT);
+		pll_con0 |= (rate->sdiv << PLL36XX_SDIV_SHIFT);
+		pll_writel(pll, pll_con0, PLL36XX_CON0_OFFSET);
+		return 0;
+	}
+
+	/* Set PLL lock time. */
+	pll_writel(pll, (rate->pdiv * PLL36XX_LOCK_FACTOR),
+			PLL36XX_LOCK_OFFSET);
+
+	 /* Change PLL PMS values */
+	pll_con0 &= ~((PLL36XX_MDIV_MASK << PLL36XX_MDIV_SHIFT) |
+			(PLL36XX_PDIV_MASK << PLL36XX_PDIV_SHIFT) |
+			(PLL36XX_SDIV_MASK << PLL36XX_SDIV_SHIFT));
+	pll_con0 |= (rate->mdiv << PLL36XX_MDIV_SHIFT) |
+			(rate->pdiv << PLL36XX_PDIV_SHIFT) |
+			(rate->sdiv << PLL36XX_SDIV_SHIFT);
+	pll_writel(pll, pll_con0, PLL36XX_CON0_OFFSET);
+
+	pll_con1 &= ~(PLL36XX_KDIV_MASK << PLL36XX_KDIV_SHIFT);
+	pll_con1 |= rate->kdiv << PLL36XX_KDIV_SHIFT;
+	pll_writel(pll, pll_con1, PLL36XX_CON1_OFFSET);
+
+	/* wait_lock_time */
+	do {
+		cpu_relax();
+		tmp = pll_readl(pll, PLL36XX_CON0_OFFSET);
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
 
 struct clk * __init samsung_clk_register_pll36xx(const char *name,
@@ -264,7 +339,6 @@ struct clk * __init samsung_clk_register_pll36xx(const char *name,
 	}
 
 	init.name = name;
-	init.ops = &samsung_pll36xx_clk_ops;
 	init.flags = CLK_GET_RATE_NOCACHE;
 	init.parent_names = &pname;
 	init.num_parents = 1;
@@ -273,6 +347,9 @@ struct clk * __init samsung_clk_register_pll36xx(const char *name,
 		pll->rate_count = rate_count;
 		pll->rate_table = kmemdup(rate_table, rate_count *
 			sizeof(struct samsung_pll_rate_table), GFP_KERNEL);
+		init.ops = &samsung_pll36xx_clk_ops;
+	} else {
+		init.ops = &samsung_pll36xx_clk_min_ops;
 	}
 
 	pll->hw.init = &init;
-- 
1.7.0.4
