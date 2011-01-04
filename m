From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 5/7] ARM: S5PC100: Tidy register and disable clock usage
Date: Tue,  4 Jan 2011 18:30:51 +0900
Message-ID: <1294133453-32210-6-git-send-email-kgene.kim@samsung.com>
References: <1294133453-32210-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:60310 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750944Ab1ADJzb (ORCPT
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
 arch/arm/mach-s5pc100/clock.c |   16 +++-------------
 1 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-s5pc100/clock.c b/arch/arm/mach-s5pc100/clock.c
index 2d4a761..0305e9b 100644
--- a/arch/arm/mach-s5pc100/clock.c
+++ b/arch/arm/mach-s5pc100/clock.c
@@ -396,7 +396,7 @@ static int s5pc100_sclk1_ctrl(struct clk *clk, int enable)
  * recommended to keep the following clocks disabled until the driver requests
  * for enabling the clock.
  */
-static struct clk init_clocks_disable[] = {
+static struct clk init_clocks_off[] = {
 	{
 		.name		= "cssys",
 		.id		= -1,
@@ -1381,8 +1381,6 @@ static struct clk *clks[] __initdata = {
 
 void __init s5pc100_register_clocks(void)
 {
-	struct clk *clkp;
-	int ret;
 	int ptr;
 
 	s3c24xx_register_clocks(clks, ARRAY_SIZE(clks));
@@ -1393,16 +1391,8 @@ void __init s5pc100_register_clocks(void)
 	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
 
-	clkp = init_clocks_disable;
-	for (ptr = 0; ptr < ARRAY_SIZE(init_clocks_disable); ptr++, clkp++) {
-
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
