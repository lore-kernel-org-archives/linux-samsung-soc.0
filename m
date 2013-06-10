From: Yadwinder Singh Brar <yadi.brar@samsung.com>
Subject: [PATCH v6 1/7] clk: samsung: Introduce a common samsung_clk_pll struct
Date: Mon, 10 Jun 2013 18:54:13 +0530
Message-ID: <1370870659-10929-2-git-send-email-yadi.brar@samsung.com>
References: <1370870659-10929-1-git-send-email-yadi.brar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:61868 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756566Ab3FSNc3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 09:32:29 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MON00GH66Y4S640@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Jun 2013 22:32:28 +0900 (KST)
In-reply-to: <1370870659-10929-1-git-send-email-yadi.brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, dianders@chromium.org, t.figa@samsung.com, vikas.sajjan@linaro.org, abrestic@chromium.org, Yadwinder Singh Brar <yadi.brar@samsung.com>

This patch unifies clk strutures used for PLL35xx & PLL36xx and
adding an extra member lock_reg, so that common code can be factored out.

Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
---
 drivers/clk/samsung/clk-pll.c |   30 ++++++++++++------------------
 1 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 89135f6..8224bde 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -13,6 +13,14 @@
 #include "clk.h"
 #include "clk-pll.h"
 
+struct samsung_clk_pll {
+	struct clk_hw		hw;
+	void __iomem		*lock_reg;
+	void __iomem		*con_reg;
+};
+
+#define to_clk_pll(_hw) container_of(_hw, struct samsung_clk_pll, hw)
+
 /*
  * PLL35xx Clock Type
  */
@@ -24,17 +32,10 @@
 #define PLL35XX_PDIV_SHIFT      (8)
 #define PLL35XX_SDIV_SHIFT      (0)
 
-struct samsung_clk_pll35xx {
-	struct clk_hw		hw;
-	const void __iomem	*con_reg;
-};
-
-#define to_clk_pll35xx(_hw) container_of(_hw, struct samsung_clk_pll35xx, hw)
-
 static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
 				unsigned long parent_rate)
 {
-	struct samsung_clk_pll35xx *pll = to_clk_pll35xx(hw);
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
 	u32 mdiv, pdiv, sdiv, pll_con;
 	u64 fvco = parent_rate;
 
@@ -56,7 +57,7 @@ static const struct clk_ops samsung_pll35xx_clk_ops = {
 struct clk * __init samsung_clk_register_pll35xx(const char *name,
 			const char *pname, const void __iomem *con_reg)
 {
-	struct samsung_clk_pll35xx *pll;
+	struct samsung_clk_pll *pll;
 	struct clk *clk;
 	struct clk_init_data init;
 
@@ -100,17 +101,10 @@ struct clk * __init samsung_clk_register_pll35xx(const char *name,
 #define PLL36XX_PDIV_SHIFT	(8)
 #define PLL36XX_SDIV_SHIFT	(0)
 
-struct samsung_clk_pll36xx {
-	struct clk_hw		hw;
-	const void __iomem	*con_reg;
-};
-
-#define to_clk_pll36xx(_hw) container_of(_hw, struct samsung_clk_pll36xx, hw)
-
 static unsigned long samsung_pll36xx_recalc_rate(struct clk_hw *hw,
 				unsigned long parent_rate)
 {
-	struct samsung_clk_pll36xx *pll = to_clk_pll36xx(hw);
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
 	u32 mdiv, pdiv, sdiv, kdiv, pll_con0, pll_con1;
 	u64 fvco = parent_rate;
 
@@ -135,7 +129,7 @@ static const struct clk_ops samsung_pll36xx_clk_ops = {
 struct clk * __init samsung_clk_register_pll36xx(const char *name,
 			const char *pname, const void __iomem *con_reg)
 {
-	struct samsung_clk_pll36xx *pll;
+	struct samsung_clk_pll *pll;
 	struct clk *clk;
 	struct clk_init_data init;
 
-- 
1.7.0.4
