From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: s3c_set_clksrc returns for single parent clock.
Date: Mon, 18 Jan 2010 09:38:17 +0900
Message-ID: <1263775097-16062-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:35449 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932082Ab0ARApB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Jan 2010 19:45:01 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>

The function s3c_set_clksrc should return if the clksrc_clk clock has
only one possible parent clock.

Signed-of-by:  Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/plat-samsung/clock-clksrc.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-samsung/clock-clksrc.c
index 33c633a..80da4c4 100644
--- a/arch/arm/plat-samsung/clock-clksrc.c
+++ b/arch/arm/plat-samsung/clock-clksrc.c
@@ -131,9 +131,10 @@ void __init_or_cpufreq s3c_set_clksrc(struct clksrc_clk *clk, bool announce)
 	u32 mask = bit_mask(clk->reg_src.shift, clk->reg_src.size);
 	u32 clksrc = 0;
 
-	if (clk->reg_src.reg)
-		clksrc = __raw_readl(clk->reg_src.reg);
+	if (!clk->reg_src.reg)
+		return;
 
+	clksrc = __raw_readl(clk->reg_src.reg);
 	clksrc &= mask;
 	clksrc >>= clk->reg_src.shift;
 
-- 
1.6.3.3
