From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Add check to ensure that clksrc_clk does have multiple clock sources
Date: Mon, 18 Jan 2010 11:40:04 +0900
Message-ID: <1263782404-30534-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:33312 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751463Ab0ARCo6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Jan 2010 21:44:58 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>

This patch adds a additional check in s3c_set_clksrc function to ensure
that the clksrc_clk does have a choice of multiple clock sources. In addition
to this, a check is added to ensure that a parent is assigned to the clksrc_clk 
in case it does not have a choice of parent clocks.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/plat-samsung/clock-clksrc.c |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-samsung/clock-clksrc.c
index 33c633a..835921d 100644
--- a/arch/arm/plat-samsung/clock-clksrc.c
+++ b/arch/arm/plat-samsung/clock-clksrc.c
@@ -129,11 +129,16 @@ void __init_or_cpufreq s3c_set_clksrc(struct clksrc_clk *clk, bool announce)
 {
 	struct clksrc_sources *srcs = clk->sources;
 	u32 mask = bit_mask(clk->reg_src.shift, clk->reg_src.size);
-	u32 clksrc = 0;
-
-	if (clk->reg_src.reg)
-		clksrc = __raw_readl(clk->reg_src.reg);
+	u32 clksrc;
 
+	if (!clk->reg_src.reg) {
+		if (!clk->clk.parent)
+		       printk(KERN_ERR "%s: no parent clock specified\n",
+				clk->clk.name);
+ 		return;		
+	}
+	
+	clksrc = __raw_readl(clk->reg_src.reg);
 	clksrc &= mask;
 	clksrc >>= clk->reg_src.shift;
 
-- 
1.6.3.3
