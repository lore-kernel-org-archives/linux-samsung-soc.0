From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 08/21] clk: samsung: pll: Remove unimplemented ops
Date: Wed, 27 Mar 2013 12:02:45 +0100
Message-ID: <1364382178-25248-9-git-send-email-t.figa@samsung.com>
References: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59669 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751950Ab3C0LF4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Mar 2013 07:05:56 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MKB0078IG5PMTQ0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Mar 2013 20:05:55 +0900 (KST)
In-reply-to: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, a.hajda@samsung.com, l.majewski@samsung.com

Unimplemented clock operations should be simply omitted instead of returning
error values.

This patch removes unimplemented PLL operations to fix problems caused
by returning error code in round_rate callback.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-pll.c | 80 -------------------------------------------
 1 file changed, 80 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 4b24511..89135f6 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -49,24 +49,8 @@ static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)fvco;
 }
 
-/* todo: implement pl35xx clock round rate operation */
-static long samsung_pll35xx_round_rate(struct clk_hw *hw,
-				unsigned long drate, unsigned long *prate)
-{
-	return -ENOTSUPP;
-}
-
-/* todo: implement pl35xx clock set rate */
-static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
-				unsigned long prate)
-{
-	return -ENOTSUPP;
-}
-
 static const struct clk_ops samsung_pll35xx_clk_ops = {
 	.recalc_rate = samsung_pll35xx_recalc_rate,
-	.round_rate = samsung_pll35xx_round_rate,
-	.set_rate = samsung_pll35xx_set_rate,
 };
 
 struct clk * __init samsung_clk_register_pll35xx(const char *name,
@@ -144,24 +128,8 @@ static unsigned long samsung_pll36xx_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)fvco;
 }
 
-/* todo: implement pl36xx clock round rate operation */
-static long samsung_pll36xx_round_rate(struct clk_hw *hw,
-				unsigned long drate, unsigned long *prate)
-{
-	return -ENOTSUPP;
-}
-
-/* todo: implement pl36xx clock set rate */
-static int samsung_pll36xx_set_rate(struct clk_hw *hw, unsigned long drate,
-				unsigned long prate)
-{
-	return -ENOTSUPP;
-}
-
 static const struct clk_ops samsung_pll36xx_clk_ops = {
 	.recalc_rate = samsung_pll36xx_recalc_rate,
-	.round_rate = samsung_pll36xx_round_rate,
-	.set_rate = samsung_pll36xx_set_rate,
 };
 
 struct clk * __init samsung_clk_register_pll36xx(const char *name,
@@ -239,24 +207,8 @@ static unsigned long samsung_pll45xx_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)fvco;
 }
 
-/* todo: implement pl45xx clock round rate operation */
-static long samsung_pll45xx_round_rate(struct clk_hw *hw,
-				unsigned long drate, unsigned long *prate)
-{
-	return -ENOTSUPP;
-}
-
-/* todo: implement pl45xx clock set rate */
-static int samsung_pll45xx_set_rate(struct clk_hw *hw, unsigned long drate,
-				unsigned long prate)
-{
-	return -ENOTSUPP;
-}
-
 static const struct clk_ops samsung_pll45xx_clk_ops = {
 	.recalc_rate = samsung_pll45xx_recalc_rate,
-	.round_rate = samsung_pll45xx_round_rate,
-	.set_rate = samsung_pll45xx_set_rate,
 };
 
 struct clk * __init samsung_clk_register_pll45xx(const char *name,
@@ -342,24 +294,8 @@ static unsigned long samsung_pll46xx_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)fvco;
 }
 
-/* todo: implement pl46xx clock round rate operation */
-static long samsung_pll46xx_round_rate(struct clk_hw *hw,
-				unsigned long drate, unsigned long *prate)
-{
-	return -ENOTSUPP;
-}
-
-/* todo: implement pl46xx clock set rate */
-static int samsung_pll46xx_set_rate(struct clk_hw *hw, unsigned long drate,
-				unsigned long prate)
-{
-	return -ENOTSUPP;
-}
-
 static const struct clk_ops samsung_pll46xx_clk_ops = {
 	.recalc_rate = samsung_pll46xx_recalc_rate,
-	.round_rate = samsung_pll46xx_round_rate,
-	.set_rate = samsung_pll46xx_set_rate,
 };
 
 struct clk * __init samsung_clk_register_pll46xx(const char *name,
@@ -441,24 +377,8 @@ static unsigned long samsung_pll2550x_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)fvco;
 }
 
-/* todo: implement pl2550x clock round rate operation */
-static long samsung_pll2550x_round_rate(struct clk_hw *hw,
-				unsigned long drate, unsigned long *prate)
-{
-	return -ENOTSUPP;
-}
-
-/* todo: implement pl2550x clock set rate */
-static int samsung_pll2550x_set_rate(struct clk_hw *hw, unsigned long drate,
-				unsigned long prate)
-{
-	return -ENOTSUPP;
-}
-
 static const struct clk_ops samsung_pll2550x_clk_ops = {
 	.recalc_rate = samsung_pll2550x_recalc_rate,
-	.round_rate = samsung_pll2550x_round_rate,
-	.set_rate = samsung_pll2550x_set_rate,
 };
 
 struct clk * __init samsung_clk_register_pll2550x(const char *name,
-- 
1.8.1.5
