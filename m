From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 4/5] ARM: S5P64X0: Fix incorrect serial clock name
Date: Fri, 12 Aug 2011 15:56:26 +0530
Message-ID: <1313144787-30666-5-git-send-email-a.kesavan@samsung.com>
References: <1313144787-30666-1-git-send-email-a.kesavan@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63349 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753279Ab1HLKZi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 06:25:38 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPT000AJ8YJO3R0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:25:35 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.92])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPT00ESK8YEI1@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:25:35 +0900 (KST)
In-reply-to: <1313144787-30666-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

The S3C6400 serial glue driver(used by S5P64X0) needs the clock name to be
pclk or uclk1. Correct the clock name in init.c to pclk and source pclk
from pclk_low to get the correct rate.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm/mach-s5p64x0/clock-s5p6440.c |    2 +-
 arch/arm/mach-s5p64x0/clock-s5p6450.c |    2 +-
 arch/arm/mach-s5p64x0/init.c          |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/clock-s5p6440.c b/arch/arm/mach-s5p64x0/clock-s5p6440.c
index 0e9cd30..4b594a4 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6440.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6440.c
@@ -554,7 +554,7 @@ void __init_or_cpufreq s5p6440_setup_clocks(void)
 
 	clk_f.rate = fclk;
 	clk_h.rate = hclk;
-	clk_p.rate = pclk;
+	clk_p.rate = pclk_low;
 
 	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
 		s3c_set_clksrc(&clksrcs[ptr], true);
diff --git a/arch/arm/mach-s5p64x0/clock-s5p6450.c b/arch/arm/mach-s5p64x0/clock-s5p6450.c
index d9dc16c..eca9a57 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6450.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6450.c
@@ -613,7 +613,7 @@ void __init_or_cpufreq s5p6450_setup_clocks(void)
 
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
1.7.4.1
