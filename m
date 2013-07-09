From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v2 1/6] clk: samsung: move common plls registration into separate function
Date: Wed, 10 Jul 2013 00:57:47 +0200
Message-ID: <201307100057.48265.heiko@sntech.de>
References: <201307100057.06061.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:44508 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752209Ab3GIW5v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Jul 2013 18:57:51 -0400
In-Reply-To: <201307100057.06061.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, t.figa@samsung.com, Russell King <linux@arm.linux.org.uk>

All Samsung PLLs use similar code to register the clocks and clkdev lookups.
Therefore move these into a separate function to reduce code duplication.

Suggested-by: Russell King <linux@arm.linux.org.uk>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/samsung/clk-pll.c |   68 +++++++++++++++++------------------------
 1 file changed, 28 insertions(+), 40 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 362f12d..9153e46 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -13,6 +13,24 @@
 #include "clk.h"
 #include "clk-pll.h"
 
+static inline struct clk *samsung_register_pll(struct clk_hw *hw)
+{
+	struct clk *clk;
+	const char *name = hw->init->name;
+
+	clk = clk_register(NULL, hw);
+	if (IS_ERR(clk)) {
+		pr_err("%s: failed to register pll clock %s\n", __func__,
+				name);
+		return clk;
+	}
+
+	if (clk_register_clkdev(clk, name, NULL))
+		pr_err("%s: failed to register lookup for %s", __func__, name);
+
+	return clk;
+}
+
 /*
  * PLL35xx Clock Type
  */
@@ -75,15 +93,9 @@ struct clk * __init samsung_clk_register_pll35xx(const char *name,
 	pll->hw.init = &init;
 	pll->con_reg = con_reg;
 
-	clk = clk_register(NULL, &pll->hw);
-	if (IS_ERR(clk)) {
-		pr_err("%s: failed to register pll clock %s\n", __func__,
-				name);
+	clk = samsung_register_pll(&pll->hw);
+	if (IS_ERR(clk))
 		kfree(pll);
-	}
-
-	if (clk_register_clkdev(clk, name, NULL))
-		pr_err("%s: failed to register lookup for %s", __func__, name);
 
 	return clk;
 }
@@ -155,15 +167,9 @@ struct clk * __init samsung_clk_register_pll36xx(const char *name,
 	pll->hw.init = &init;
 	pll->con_reg = con_reg;
 
-	clk = clk_register(NULL, &pll->hw);
-	if (IS_ERR(clk)) {
-		pr_err("%s: failed to register pll clock %s\n", __func__,
-				name);
+	clk = samsung_register_pll(&pll->hw);
+	if (IS_ERR(clk))
 		kfree(pll);
-	}
-
-	if (clk_register_clkdev(clk, name, NULL))
-		pr_err("%s: failed to register lookup for %s", __func__, name);
 
 	return clk;
 }
@@ -236,15 +242,9 @@ struct clk * __init samsung_clk_register_pll45xx(const char *name,
 	pll->con_reg = con_reg;
 	pll->type = type;
 
-	clk = clk_register(NULL, &pll->hw);
-	if (IS_ERR(clk)) {
-		pr_err("%s: failed to register pll clock %s\n", __func__,
-				name);
+	clk = samsung_register_pll(&pll->hw);
+	if (IS_ERR(clk))
 		kfree(pll);
-	}
-
-	if (clk_register_clkdev(clk, name, NULL))
-		pr_err("%s: failed to register lookup for %s", __func__, name);
 
 	return clk;
 }
@@ -323,15 +323,9 @@ struct clk * __init samsung_clk_register_pll46xx(const char *name,
 	pll->con_reg = con_reg;
 	pll->type = type;
 
-	clk = clk_register(NULL, &pll->hw);
-	if (IS_ERR(clk)) {
-		pr_err("%s: failed to register pll clock %s\n", __func__,
-				name);
+	clk = samsung_register_pll(&pll->hw);
+	if (IS_ERR(clk))
 		kfree(pll);
-	}
-
-	if (clk_register_clkdev(clk, name, NULL))
-		pr_err("%s: failed to register lookup for %s", __func__, name);
 
 	return clk;
 }
@@ -406,15 +400,9 @@ struct clk * __init samsung_clk_register_pll2550x(const char *name,
 	pll->reg_base = reg_base;
 	pll->offset = offset;
 
-	clk = clk_register(NULL, &pll->hw);
-	if (IS_ERR(clk)) {
-		pr_err("%s: failed to register pll clock %s\n", __func__,
-				name);
+	clk = samsung_register_pll(&pll->hw);
+	if (IS_ERR(clk))
 		kfree(pll);
-	}
-
-	if (clk_register_clkdev(clk, name, NULL))
-		pr_err("%s: failed to register lookup for %s", __func__, name);
 
 	return clk;
 }
-- 
1.7.10.4
