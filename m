From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH] ARM: SAMSUNG: Add check to ensure that clksrc_clk does have multiple clock sources
Date: Mon, 18 Jan 2010 08:42:54 +0000
Message-ID: <1263804176-8417-3-git-send-email-ben-linux@fluff.org>
References: <1263804176-8417-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:60078 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755207Ab0ARIm6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jan 2010 03:42:58 -0500
In-Reply-To: <1263804176-8417-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Thomas Abraham <thomas.ab@samsung.com>, Ben Dooks <ben-linux@fluff.org>

From: Thomas Abraham <thomas.ab@samsung.com>

Adds a additional check in s3c_set_clksrc function to ensure that the clksrc_clk
does have a choice of multiple clock sources. In addition to this, a check is
added to ensure that a parent is assigned to the clksrc_clk in case it does not
have a choice of parent clocks.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-samsung/clock-clksrc.c |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-samsung/clock-clksrc.c
index 33c633a..98c6b88 100644
--- a/arch/arm/plat-samsung/clock-clksrc.c
+++ b/arch/arm/plat-samsung/clock-clksrc.c
@@ -129,11 +129,16 @@ void __init_or_cpufreq s3c_set_clksrc(struct clksrc_clk *clk, bool announce)
 {
 	struct clksrc_sources *srcs = clk->sources;
 	u32 mask = bit_mask(clk->reg_src.shift, clk->reg_src.size);
-	u32 clksrc = 0;
+	u32 clksrc;
 
-	if (clk->reg_src.reg)
-		clksrc = __raw_readl(clk->reg_src.reg);
+	if (!clk->reg_src.reg) {
+		if (!clk->clk.parent)
+			printk(KERN_ERR "%s: no parent clock specified\n",
+				clk->clk.name);
+		return;
+	}
 
+	clksrc = __raw_readl(clk->reg_src.reg);
 	clksrc &= mask;
 	clksrc >>= clk->reg_src.shift;
 
-- 
1.6.0.4
