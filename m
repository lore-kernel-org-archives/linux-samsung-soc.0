From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 1/2] ARM: S3C64XX: Move RTC clock from init_clocks to init_clocks_disable
Date: Wed, 21 Jul 2010 17:55:00 +0900
Message-ID: <1279702501-6803-2-git-send-email-kgene.kim@samsung.com>
References: <1279702501-6803-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:53831 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751755Ab0GUJGM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jul 2010 05:06:12 -0400
In-Reply-To: <1279702501-6803-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, Atul Dahiya <atul.dahiya@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Atul Dahiya <atul.dahiya@samsung.com>

RTC clock does not require to be enabled at boot time.

Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s3c64xx/clock.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/clock.c b/arch/arm/mach-s3c64xx/clock.c
index fbd85a9..f577eb7 100644
--- a/arch/arm/mach-s3c64xx/clock.c
+++ b/arch/arm/mach-s3c64xx/clock.c
@@ -133,6 +133,12 @@ static struct clk init_clocks_disable[] = {
 		.id		= -1,
 		.parent		= &clk_h,
 	}, {
+		.name		= "rtc",
+		.id		= -1,
+		.parent		= &clk_p,
+		.enable		= s3c64xx_pclk_ctrl,
+		.ctrlbit	= S3C_CLKCON_PCLK_RTC,
+	}, {
 		.name		= "adc",
 		.id		= -1,
 		.parent		= &clk_p,
@@ -295,12 +301,6 @@ static struct clk init_clocks[] = {
 		.enable		= s3c64xx_pclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_PCLK_UART3,
 	}, {
-		.name		= "rtc",
-		.id		= -1,
-		.parent		= &clk_p,
-		.enable		= s3c64xx_pclk_ctrl,
-		.ctrlbit	= S3C_CLKCON_PCLK_RTC,
-	}, {
 		.name		= "watchdog",
 		.id		= -1,
 		.parent		= &clk_p,
-- 
1.6.2.5
