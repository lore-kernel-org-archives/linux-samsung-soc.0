From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 3/4] ARM: S5P64X0: Fix incorrect serial clock name
Date: Thu,  9 Dec 2010 17:11:56 +0900
Message-ID: <1291882317-20411-4-git-send-email-sbkim73@samsung.com>
References: <1291882317-20411-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:40888 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754953Ab0LII3p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Dec 2010 03:29:45 -0500
In-Reply-To: <1291882317-20411-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Abhilash Kesavan <a.kesavan@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Abhilash Kesavan <a.kesavan@samsung.com>

The 6400 serial glue driver needs the clock name to be pclk or uclk1.
Correct the clock name in init.c to pclk and source pclk from pclk_low to
get the correct rate.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5p64x0/clock-s5p6440.c |    2 +-
 arch/arm/mach-s5p64x0/clock-s5p6450.c |    2 +-
 arch/arm/mach-s5p64x0/init.c          |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/clock-s5p6440.c b/arch/arm/mach-s5p64x0/clock-s5p6440.c
index e4883dc..90ac68d 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6440.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6440.c
@@ -588,7 +588,7 @@ void __init_or_cpufreq s5p6440_setup_clocks(void)
 
 	clk_f.rate = fclk;
 	clk_h.rate = hclk;
-	clk_p.rate = pclk;
+	clk_p.rate = pclk_low;
 
 	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
 		s3c_set_clksrc(&clksrcs[ptr], true);
diff --git a/arch/arm/mach-s5p64x0/clock-s5p6450.c b/arch/arm/mach-s5p64x0/clock-s5p6450.c
index 7dbf3c9..2026317 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6450.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6450.c
@@ -625,7 +625,7 @@ void __init_or_cpufreq s5p6450_setup_clocks(void)
 
 	clk_f.rate = fclk;
 	clk_h.rate = hclk;
-	clk_p.rate = pclk;
+	clk_p.rate = pclk_low;
 
 	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
 		s3c_set_clksrc(&clksrcs[ptr], true);
diff --git a/arch/arm/mach-s5p64x0/init.c b/arch/arm/mach-s5p64x0/init.c
index 79833ca..ee25e28 100644
--- a/arch/arm/mach-s5p64x0/init.c
+++ b/arch/arm/mach-s5p64x0/init.c
@@ -25,7 +25,7 @@
 
 static struct s3c24xx_uart_clksrc s5p64x0_serial_clocks[] = {
 	[0] = {
-		.name		= "pclk_low",
+		.name		= "pclk",
 		.divisor	= 1,
 		.min_baud	= 0,
 		.max_baud	= 0,
-- 
1.6.6.1
