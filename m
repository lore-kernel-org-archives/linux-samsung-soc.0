From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH] ARM: SAMSUNG: Fix bug in clksrc-clk round_rate call.
Date: Mon, 18 Jan 2010 08:42:56 +0000
Message-ID: <1263804176-8417-5-git-send-email-ben-linux@fluff.org>
References: <1263804176-8417-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:60074 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755197Ab0ARIm6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jan 2010 03:42:58 -0500
In-Reply-To: <1263804176-8417-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Ben Dooks <ben-linux@fluff.org>

The call has been assuming all clksrc-clks' divider size is 4 bits, but
this may not be the case anymore. Use the reg_div.size parameter to
calculate the maximum value it can take and check against that.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-samsung/clock-clksrc.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-samsung/clock-clksrc.c
index 656c70e..ae8b850 100644
--- a/arch/arm/plat-samsung/clock-clksrc.c
+++ b/arch/arm/plat-samsung/clock-clksrc.c
@@ -60,7 +60,7 @@ static int s3c_setrate_clksrc(struct clk *clk, unsigned long rate)
 
 	rate = clk_round_rate(clk, rate);
 	div = clk_get_rate(clk->parent) / rate;
-	if (div > 16)
+	if (div > (1 << sclk->reg_div.size))
 		return -EINVAL;
 
 	val = __raw_readl(reg);
@@ -102,7 +102,9 @@ static int s3c_setparent_clksrc(struct clk *clk, struct clk *parent)
 static unsigned long s3c_roundrate_clksrc(struct clk *clk,
 					      unsigned long rate)
 {
+	struct clksrc_clk *sclk = to_clksrc(clk);
 	unsigned long parent_rate = clk_get_rate(clk->parent);
+	int max_div = 1 << sclk->reg_div.size;
 	int div;
 
 	if (rate >= parent_rate)
@@ -114,8 +116,8 @@ static unsigned long s3c_roundrate_clksrc(struct clk *clk,
 
 		if (div == 0)
 			div = 1;
-		if (div > 16)
-			div = 16;
+		if (div > max_div)
+			div = max_div;
 
 		rate = parent_rate / div;
 	}
-- 
1.6.0.4
