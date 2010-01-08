From: Ben Dooks <ben-linux@fluff.org>
Subject: [S3C-CLK] ARM: SAMSUNG: Do not allow get/set/round rate calls with no divider
Date: Fri,  8 Jan 2010 02:30:20 +0000
Message-ID: <1262917822-26004-13-git-send-email-ben-linux@fluff.org>
References: <1262917822-26004-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:57267 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752418Ab0AHCa1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Jan 2010 21:30:27 -0500
In-Reply-To: <1262917822-26004-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

From: Ben Dooks <ben@ben-laptop.fluff.org>

If the reg_div field is not set, then do not register clk_ops with the
get/set/round rate calls as these will fail to work.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-samsung/clock-clksrc.c |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-samsung/clock-clksrc.c
index 12129f8..aaf7d5e 100644
--- a/arch/arm/plat-samsung/clock-clksrc.c
+++ b/arch/arm/plat-samsung/clock-clksrc.c
@@ -158,14 +158,25 @@ static struct clk_ops clksrc_ops = {
 	.round_rate	= s3c_roundrate_clksrc,
 };
 
+static struct clk_ops clksrc_ops_nodiv = {
+	.set_parent	= s3c_setparent_clksrc,
+};
+
 void __init s3c_register_clksrc(struct clksrc_clk *clksrc, int size)
 {
 	int ret;
 
+	WARN_ON(!clksrc->reg_div.reg && !clksrc->reg_src.reg);
+
 	for (; size > 0; size--, clksrc++) {
 		/* fill in the default functions */
-		if (!clksrc->clk.ops)
-			clksrc->clk.ops = &clksrc_ops;
+
+		if (!clksrc->clk.ops) {
+			if (!clksrc->reg_div.reg)
+				clksrc->clk.ops = &clksrc_ops_nodiv;
+			else
+				clksrc->clk.ops = &clksrc_ops;
+		}
 
 		/* setup the clocksource, but do not announce it
 		 * as it may be re-set by the setup routines
-- 
1.6.0.4
