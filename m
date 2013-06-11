From: Yadwinder Singh Brar <yadi.brar@samsung.com>
Subject: [PATCH v7 06/11] clk: samsung: Remove unused pll registeration code
 for pll35xx and pll36xx
Date: Tue, 11 Jun 2013 15:01:11 +0530
Message-ID: <1370943076-13461-7-git-send-email-yadi.brar@samsung.com>
References: <1370943076-13461-1-git-send-email-yadi.brar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34165 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756231Ab3FTJjl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 05:39:41 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOO00HFMQSWTRO0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Jun 2013 18:39:40 +0900 (KST)
In-reply-to: <1370943076-13461-1-git-send-email-yadi.brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, dianders@chromium.org, t.figa@samsung.com, vikas.sajjan@linaro.org, abrestic@chromium.org, Yadwinder Singh Brar <yadi.brar@samsung.com>

This patch removes samsung_clk_register_pll35xx() and
samsung_clk_register_pll36xx() registaration functions as users migrated to
new samsung_clk_register_pll().

Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
---
 drivers/clk/samsung/clk-pll.c |   70 -----------------------------------------
 drivers/clk/samsung/clk-pll.h |    4 --
 2 files changed, 0 insertions(+), 74 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index f20af69..7d5bea8 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -55,41 +55,6 @@ static const struct clk_ops samsung_pll35xx_clk_ops = {
 	.recalc_rate = samsung_pll35xx_recalc_rate,
 };
 
-struct clk * __init samsung_clk_register_pll35xx(const char *name,
-			const char *pname, const void __iomem *con_reg)
-{
-	struct samsung_clk_pll *pll;
-	struct clk *clk;
-	struct clk_init_data init;
-
-	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
-	if (!pll) {
-		pr_err("%s: could not allocate pll clk %s\n", __func__, name);
-		return NULL;
-	}
-
-	init.name = name;
-	init.ops = &samsung_pll35xx_clk_ops;
-	init.flags = CLK_GET_RATE_NOCACHE;
-	init.parent_names = &pname;
-	init.num_parents = 1;
-
-	pll->hw.init = &init;
-	pll->con_reg = con_reg;
-
-	clk = clk_register(NULL, &pll->hw);
-	if (IS_ERR(clk)) {
-		pr_err("%s: failed to register pll clock %s\n", __func__,
-				name);
-		kfree(pll);
-	}
-
-	if (clk_register_clkdev(clk, name, NULL))
-		pr_err("%s: failed to register lookup for %s", __func__, name);
-
-	return clk;
-}
-
 /*
  * PLL36xx Clock Type
  */
@@ -127,41 +92,6 @@ static const struct clk_ops samsung_pll36xx_clk_ops = {
 	.recalc_rate = samsung_pll36xx_recalc_rate,
 };
 
-struct clk * __init samsung_clk_register_pll36xx(const char *name,
-			const char *pname, const void __iomem *con_reg)
-{
-	struct samsung_clk_pll *pll;
-	struct clk *clk;
-	struct clk_init_data init;
-
-	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
-	if (!pll) {
-		pr_err("%s: could not allocate pll clk %s\n", __func__, name);
-		return NULL;
-	}
-
-	init.name = name;
-	init.ops = &samsung_pll36xx_clk_ops;
-	init.flags = CLK_GET_RATE_NOCACHE;
-	init.parent_names = &pname;
-	init.num_parents = 1;
-
-	pll->hw.init = &init;
-	pll->con_reg = con_reg;
-
-	clk = clk_register(NULL, &pll->hw);
-	if (IS_ERR(clk)) {
-		pr_err("%s: failed to register pll clock %s\n", __func__,
-				name);
-		kfree(pll);
-	}
-
-	if (clk_register_clkdev(clk, name, NULL))
-		pr_err("%s: failed to register lookup for %s", __func__, name);
-
-	return clk;
-}
-
 /*
  * PLL45xx Clock Type
  */
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 0d86bf0..1536f27 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -31,10 +31,6 @@ enum pll46xx_type {
 	pll_4650c,
 };
 
-extern struct clk * __init samsung_clk_register_pll35xx(const char *name,
-			const char *pname, const void __iomem *con_reg);
-extern struct clk * __init samsung_clk_register_pll36xx(const char *name,
-			const char *pname, const void __iomem *con_reg);
 extern struct clk * __init samsung_clk_register_pll45xx(const char *name,
 			const char *pname, const void __iomem *con_reg,
 			enum pll45xx_type type);
-- 
1.7.0.4
