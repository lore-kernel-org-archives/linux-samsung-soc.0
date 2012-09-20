From: In-Bae Jeong <kukyakya@gmail.com>
Subject: [PATCH] samsung: clock: Modify for the case with the only parent
Date: Thu, 20 Sep 2012 15:50:59 +0900
Message-ID: <1348123859-13842-1-git-send-email-kukyakya@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:61546 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751728Ab2ITGve (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Sep 2012 02:51:34 -0400
Received: by pbbrr13 with SMTP id rr13so4378585pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Sep 2012 23:51:34 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: In-Bae Jeong <kukyakya@gmail.com>

'camera' clock has the only parent and thus has no reg_src.
It has a parent clock but it prints 'No parent clock specified' message.
This patch is to deal with the case with the only parent clock.
---
 arch/arm/plat-samsung/clock-clksrc.c |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-samsung/clock-clksrc.c
index 786a410..c00bd86 100644
--- a/arch/arm/plat-samsung/clock-clksrc.c
+++ b/arch/arm/plat-samsung/clock-clksrc.c
@@ -131,18 +131,19 @@ void __init_or_cpufreq s3c_set_clksrc(struct clksrc_clk *clk, bool announce)
 {
 	struct clksrc_sources *srcs = clk->sources;
 	u32 mask = bit_mask(clk->reg_src.shift, clk->reg_src.size);
-	u32 clksrc;
+	u32 clksrc = 0;
 
-	if (!clk->reg_src.reg) {
-		if (!clk->clk.parent)
-			printk(KERN_ERR "%s: no parent clock specified\n",
-				clk->clk.name);
+	if (!clk->reg_src.reg && !clk->clk.parent && !srcs->nr_sources) {
+		printk(KERN_ERR "%s: no parent clock specified\n",
+		       clk->clk.name);
 		return;
 	}
 
-	clksrc = __raw_readl(clk->reg_src.reg);
-	clksrc &= mask;
-	clksrc >>= clk->reg_src.shift;
+	if (srcs->nr_sources > 1) {
+		clksrc = __raw_readl(clk->reg_src.reg);
+		clksrc &= mask;
+		clksrc >>= clk->reg_src.shift;
+	}
 
 	if (clksrc > srcs->nr_sources || !srcs->sources[clksrc]) {
 		printk(KERN_ERR "%s: bad source %d\n",
-- 
1.7.8.6
