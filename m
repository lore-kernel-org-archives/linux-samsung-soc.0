From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH] ARM: SAMSUNG: Fix clksrc-clk's checks for bad register settings
Date: Mon, 18 Jan 2010 08:42:55 +0000
Message-ID: <1263804176-8417-4-git-send-email-ben-linux@fluff.org>
References: <1263804176-8417-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:60072 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753661Ab0ARIm6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jan 2010 03:42:58 -0500
In-Reply-To: <1263804176-8417-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Ben Dooks <ben-linux@fluff.org>

The WARN_ON() was only checking the first clock in the array, instead of
being executed for each clksrc clock being registered.

Since this is an array of clocks, WARN_ON() does not provide a lot of
useful information about the problem, so change to using printk(KERN_ERR)
to report the problem to the console.

As a note, we still try and register the clock even if these problems are
present just in case and to avoid changing the behaviour of the registration
process.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-samsung/clock-clksrc.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-samsung/clock-clksrc.c
index 98c6b88..656c70e 100644
--- a/arch/arm/plat-samsung/clock-clksrc.c
+++ b/arch/arm/plat-samsung/clock-clksrc.c
@@ -177,9 +177,11 @@ void __init s3c_register_clksrc(struct clksrc_clk *clksrc, int size)
 {
 	int ret;
 
-	WARN_ON(!clksrc->reg_div.reg && !clksrc->reg_src.reg);
-
 	for (; size > 0; size--, clksrc++) {
+		if (!clksrc->reg_div.reg && !clksrc->reg_src.reg)
+			printk(KERN_ERR "%s: clock %s has no registers set\n",
+			       __func__, clksrc->clk.name);
+
 		/* fill in the default functions */
 
 		if (!clksrc->clk.ops) {
-- 
1.6.0.4
