From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] clk: Correct handling of NULL clk in __clk_{get, put}
Date: Tue, 07 Jan 2014 13:03:43 +0100
Message-ID: <1389096223-23934-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:23436 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750851AbaAGMET (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 07:04:19 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MZ100KIK5J6W1A0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Jan 2014 21:04:18 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: sachin.kamat@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mturquette@linaro.org, tomasz.figa@gmail.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

Ensure clk->kref is dereferenced only when clk is not NULL.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Hi Sachin,

please try if this patch fixes the exyno5420 boot crash.

Thanks,
Sylwester

 drivers/clk/clk.c |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e3e0327..a1fe86f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2179,24 +2179,25 @@ EXPORT_SYMBOL_GPL(devm_clk_unregister);
  */
 int __clk_get(struct clk *clk)
 {
-	if (clk && !try_module_get(clk->owner))
-		return 0;
+	if (clk) {
+		if (!try_module_get(clk->owner))
+			return 0;

-	kref_get(&clk->ref);
+		kref_get(&clk->ref);
+	}
 	return 1;
 }

 void __clk_put(struct clk *clk)
 {
-	if (WARN_ON_ONCE(IS_ERR(clk)))
+	if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
 		return;

 	clk_prepare_lock();
 	kref_put(&clk->ref, __clk_release);
 	clk_prepare_unlock();

-	if (clk)
-		module_put(clk->owner);
+	module_put(clk->owner);
 }

 /***        clk rate change notifiers        ***/
--
1.7.9.5
