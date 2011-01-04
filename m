From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/7] ARM: S5P6442: Tidy register and disable clock usage
Date: Tue,  4 Jan 2011 18:30:49 +0900
Message-ID: <1294133453-32210-4-git-send-email-kgene.kim@samsung.com>
References: <1294133453-32210-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:60309 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750903Ab1ADJzb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jan 2011 04:55:31 -0500
In-Reply-To: <1294133453-32210-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch changes the clock registration code to use the s3c_register_clocks()
followed by s3c_disable_clocks() instead of the loops it was using.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6442/clock.c |   16 +++-------------
 1 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-s5p6442/clock.c b/arch/arm/mach-s5p6442/clock.c
index 16d6e7e..fbbc7be 100644
--- a/arch/arm/mach-s5p6442/clock.c
+++ b/arch/arm/mach-s5p6442/clock.c
@@ -340,7 +340,7 @@ void __init_or_cpufreq s5p6442_setup_clocks(void)
 	clk_pclkd1.rate = pclkd1;
 }
 
-static struct clk init_clocks_disable[] = {
+static struct clk init_clocks_off[] = {
 	{
 		.name		= "pdma",
 		.id		= -1,
@@ -408,23 +408,13 @@ static struct clk *clks[] __initdata = {
 
 void __init s5p6442_register_clocks(void)
 {
-	struct clk *clkptr;
-	int i, ret;
-
 	s3c24xx_register_clocks(clks, ARRAY_SIZE(clks));
 
 	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
 
-	clkptr = init_clocks_disable;
-	for (i = 0; i < ARRAY_SIZE(init_clocks_disable); i++, clkptr++) {
-		ret = s3c24xx_register_clock(clkptr);
-		if (ret < 0) {
-			printk(KERN_ERR "Fail to register clock %s (%d)\n",
-					clkptr->name, ret);
-		} else
-			(clkptr->enable)(clkptr, 0);
-	}
+	s3c_register_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
+	s3c_disable_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
 
 	s3c_pwmclk_init();
 }
-- 
1.6.2.5
