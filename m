From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH] clk: samsung: remove parentheses from return statements
Date: Wed, 26 Feb 2014 11:44:48 +0900
Message-ID: <1393382688-5429-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:51784 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751164AbaBZC2o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Feb 2014 21:28:44 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: t.figa@samsung.com, mturquette@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Pankaj Dubey <pankaj.dubey@samsung.com>

fixed following checkpatch warning message
"return is not a function, parentheses are not required"

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 drivers/clk/samsung/clk-pll.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 7fb0a28..32b483f 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -166,7 +166,7 @@ static inline bool samsung_pll35xx_mp_change(
 	old_mdiv = (pll_con >> PLL35XX_MDIV_SHIFT) & PLL35XX_MDIV_MASK;
 	old_pdiv = (pll_con >> PLL35XX_PDIV_SHIFT) & PLL35XX_PDIV_MASK;
 
-	return (rate->mdiv != old_mdiv || rate->pdiv != old_pdiv);
+	return rate->mdiv != old_mdiv || rate->pdiv != old_pdiv;
 }
 
 static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
@@ -274,8 +274,8 @@ static inline bool samsung_pll36xx_mpk_change(
 	old_pdiv = (pll_con0 >> PLL36XX_PDIV_SHIFT) & PLL36XX_PDIV_MASK;
 	old_kdiv = (pll_con1 >> PLL36XX_KDIV_SHIFT) & PLL36XX_KDIV_MASK;
 
-	return (rate->mdiv != old_mdiv || rate->pdiv != old_pdiv ||
-		rate->kdiv != old_kdiv);
+	return rate->mdiv != old_mdiv || rate->pdiv != old_pdiv ||
+		rate->kdiv != old_kdiv;
 }
 
 static int samsung_pll36xx_set_rate(struct clk_hw *hw, unsigned long drate,
@@ -387,8 +387,8 @@ static bool samsung_pll45xx_mp_change(u32 pll_con0, u32 pll_con1,
 	old_pdiv = (pll_con0 >> PLL45XX_PDIV_SHIFT) & PLL45XX_PDIV_MASK;
 	old_afc = (pll_con1 >> PLL45XX_AFC_SHIFT) & PLL45XX_AFC_MASK;
 
-	return (old_mdiv != rate->mdiv || old_pdiv != rate->pdiv
-		|| old_afc != rate->afc);
+	return old_mdiv != rate->mdiv || old_pdiv != rate->pdiv
+		|| old_afc != rate->afc;
 }
 
 static int samsung_pll45xx_set_rate(struct clk_hw *hw, unsigned long drate,
@@ -534,8 +534,8 @@ static bool samsung_pll46xx_mpk_change(u32 pll_con0, u32 pll_con1,
 	old_pdiv = (pll_con0 >> PLL46XX_PDIV_SHIFT) & PLL46XX_PDIV_MASK;
 	old_kdiv = (pll_con1 >> PLL46XX_KDIV_SHIFT) & PLL46XX_KDIV_MASK;
 
-	return (old_mdiv != rate->mdiv || old_pdiv != rate->pdiv
-		|| old_kdiv != rate->kdiv);
+	return old_mdiv != rate->mdiv || old_pdiv != rate->pdiv
+		|| old_kdiv != rate->kdiv;
 }
 
 static int samsung_pll46xx_set_rate(struct clk_hw *hw, unsigned long drate,
-- 
1.7.9.5
