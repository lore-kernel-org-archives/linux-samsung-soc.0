From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 6/7] ARM: S5PV210: Tidy init+disable clock usage and s3c24xx_register_clocks cleanup
Date: Tue,  4 Jan 2011 18:30:52 +0900
Message-ID: <1294133453-32210-7-git-send-email-kgene.kim@samsung.com>
References: <1294133453-32210-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:60311 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750897Ab1ADJzb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jan 2011 04:55:31 -0500
In-Reply-To: <1294133453-32210-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch changes the clock registration code to use the s3c_register_clocks()
followed by s3c_disable_clocks() instead of the loops it was using and cleanups
the return of s3c24xx_register_clocks() because it includes it.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/clock.c |   19 ++++---------------
 1 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index 019c3a6..061a9b6 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -309,7 +309,7 @@ static struct clk_ops clk_fout_apll_ops = {
 	.get_rate	= s5pv210_clk_fout_apll_get_rate,
 };
 
-static struct clk init_clocks_disable[] = {
+static struct clk init_clocks_off[] = {
 	{
 		.name		= "pdma",
 		.id		= 0,
@@ -1220,13 +1220,9 @@ static struct clk *clks[] __initdata = {
 
 void __init s5pv210_register_clocks(void)
 {
-	struct clk *clkp;
-	int ret;
 	int ptr;
 
-	ret = s3c24xx_register_clocks(clks, ARRAY_SIZE(clks));
-	if (ret > 0)
-		printk(KERN_ERR "Failed to register %u clocks\n", ret);
+	s3c24xx_register_clocks(clks, ARRAY_SIZE(clks));
 
 	for (ptr = 0; ptr < ARRAY_SIZE(sysclks); ptr++)
 		s3c_register_clksrc(sysclks[ptr], 1);
@@ -1234,15 +1230,8 @@ void __init s5pv210_register_clocks(void)
 	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
 
-	clkp = init_clocks_disable;
-	for (ptr = 0; ptr < ARRAY_SIZE(init_clocks_disable); ptr++, clkp++) {
-		ret = s3c24xx_register_clock(clkp);
-		if (ret < 0) {
-			printk(KERN_ERR "Failed to register clock %s (%d)\n",
-			       clkp->name, ret);
-		}
-		(clkp->enable)(clkp, 0);
-	}
+	s3c_register_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
+	s3c_disable_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
 
 	s3c_pwmclk_init();
 }
-- 
1.6.2.5
