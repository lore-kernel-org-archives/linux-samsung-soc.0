From: Heiko =?iso-8859-1?q?St=FCbner?= <mmind@debian.org>
Subject: Re: s3c-sdhci s3c-sdhci.1: failed to get io clock on a s3c2416
Date: Sun, 2 Jan 2011 21:35:22 +0100
Message-ID: <201101022135.22156.mmind@debian.org>
References: <201101021842.55281.mmind@debian.org> <201101022125.37327.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:49518 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751421Ab1ABUfY convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Jan 2011 15:35:24 -0500
In-Reply-To: <201101022125.37327.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Alexander Neumann <fd0@lochraster.org>

>From c3db3b64502ba991af7c51aa0571583772069db4 Mon Sep 17 00:00:00 2001
From: Alexander Neumann <alexander@bumpern.de>
Date: Sun, 2 Jan 2011 21:02:01 +0100
Subject: [PATCH] fix initialize on HSMMC channel 1

---
 .../mach-s3c2410/include/mach/regs-s3c2443-clock.h |    6 ++++--
 arch/arm/mach-s3c2443/clock.c                      |   13 ++++++++-----
 arch/arm/plat-s3c24xx/s3c2443-clock.c              |    8 +++++++-
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h b/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
index 101aeea..bcb3090 100644
--- a/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
+++ b/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
@@ -86,7 +86,8 @@
 #define S3C2443_HCLKCON_LCDC		(1<<9)
 #define S3C2443_HCLKCON_USBH		(1<<11)
 #define S3C2443_HCLKCON_USBD		(1<<12)
-#define S3C2443_HCLKCON_HSMMC		(1<<16)
+#define S3C2443_HCLKCON_HSMMC1		(1<<16)
+#define S3C2443_HCLKCON_HSMMC0		(1<<15)
 #define S3C2443_HCLKCON_CFC		(1<<17)
 #define S3C2443_HCLKCON_SSMC		(1<<18)
 #define S3C2443_HCLKCON_DRAMC		(1<<19)
@@ -111,11 +112,12 @@
 #define S3C2443_SCLKCON_SSMCCLK		(1<<15)
 #define S3C2443_SCLKCON_HSSPICLK	(1<<14)
 #define S3C2443_SCLKCON_HSMMCCLK_EXT	(1<<13)
-#define S3C2443_SCLKCON_HSMMCCLK_EPLL	(1<<12)
+#define S3C2443_SCLKCON_HSMMCCLK_0	(1<<12)
 #define S3C2443_SCLKCON_CAMCLK		(1<<11)
 #define S3C2443_SCLKCON_DISPCLK		(1<<10)
 #define S3C2443_SCLKCON_I2SCLK		(1<<9)
 #define S3C2443_SCLKCON_UARTCLK		(1<<8)
+#define S3C2443_SCLKCON_HSMMCCLK_1	(1<<6)
 #define S3C2443_SCLKCON_USBHOST		(1<<1)
 
 #define S3C2443_PWRCFG_SLEEP		(1<<15)
diff --git a/arch/arm/mach-s3c2443/clock.c b/arch/arm/mach-s3c2443/clock.c
index 0c3c0c8..65bc378 100644
--- a/arch/arm/mach-s3c2443/clock.c
+++ b/arch/arm/mach-s3c2443/clock.c
@@ -206,16 +206,19 @@ static int s3c2443_setparent_hsmmc(struct clk *clk, struct clk *parent)
 {
 	unsigned long clksrc = __raw_readl(S3C2443_SCLKCON);
 
+	/* reset register, disable clock for hsmmc channels 0 and 1 */
 	clksrc &= ~(S3C2443_SCLKCON_HSMMCCLK_EXT |
-		    S3C2443_SCLKCON_HSMMCCLK_EPLL);
+		    S3C2443_SCLKCON_HSMMCCLK_0 |
+		    S3C2443_SCLKCON_HSMMCCLK_1);
 
-	if (parent == &clk_epll)
-		clksrc |= S3C2443_SCLKCON_HSMMCCLK_EPLL;
-	else if (parent == &clk_ext)
+	if (parent == &clk_ext)
 		clksrc |= S3C2443_SCLKCON_HSMMCCLK_EXT;
-	else
+	else if (parent != &clk_epll)
 		return -EINVAL;
 
+	/* enable clock generation for hsmmc channels 0 and 1 */
+	clksrc |= S3C2443_SCLKCON_HSMMCCLK_0 | S3C2443_SCLKCON_HSMMCCLK_1;
+
 	if (clk->usage > 0) {
 		__raw_writel(clksrc, S3C2443_SCLKCON);
 	}
diff --git a/arch/arm/plat-s3c24xx/s3c2443-clock.c b/arch/arm/plat-s3c24xx/s3c2443-clock.c
index 461f070..9e2ae9a 100644
--- a/arch/arm/plat-s3c24xx/s3c2443-clock.c
+++ b/arch/arm/plat-s3c24xx/s3c2443-clock.c
@@ -274,7 +274,13 @@ static struct clk init_clocks[] = {
 		.id		= 0,
 		.parent		= &clk_h,
 		.enable		= s3c2443_clkcon_enable_h,
-		.ctrlbit	= S3C2443_HCLKCON_HSMMC,
+		.ctrlbit	= S3C2443_HCLKCON_HSMMC0,
+	}, {
+		.name		= "hsmmc",
+		.id		= 1,
+		.parent		= &clk_h,
+		.enable		= s3c2443_clkcon_enable_h,
+		.ctrlbit	= S3C2443_HCLKCON_HSMMC1,
 	}, {
 		.name		= "gpio",
 		.id		= -1,
-- 
1.7.2.3
