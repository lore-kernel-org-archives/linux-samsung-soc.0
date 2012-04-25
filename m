From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 09/33] ARM: S3C24XX: mach-anubis: Use common macro to define resources
Date: Wed, 25 Apr 2012 09:42:19 +0530
Message-ID: <1335327163-11794-10-git-send-email-tushar.behera@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:49498 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751825Ab2DYEW3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 00:22:29 -0400
Received: by mail-pb0-f46.google.com with SMTP id ro12so939266pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 21:22:29 -0700 (PDT)
In-Reply-To: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org, Ben Dooks <ben-linux@fluff.org>

CC: Ben Dooks <ben-linux@fluff.org>
CC: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-s3c24xx/mach-anubis.c |   62 ++++++----------------------------
 1 files changed, 11 insertions(+), 51 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-anubis.c b/arch/arm/mach-s3c24xx/mach-anubis.c
index 60c72c5..5a7d0c0 100644
--- a/arch/arm/mach-s3c24xx/mach-anubis.c
+++ b/arch/arm/mach-s3c24xx/mach-anubis.c
@@ -235,19 +235,9 @@ static struct pata_platform_info anubis_ide_platdata = {
 };
 
 static struct resource anubis_ide0_resource[] = {
-	{
-		.start	= S3C2410_CS3,
-		.end	= S3C2410_CS3 + (8*32) - 1,
-		.flags	= IORESOURCE_MEM,
-	}, {
-		.start	= S3C2410_CS3 + (1<<26) + (6*32),
-		.end	= S3C2410_CS3 + (1<<26) + (7*32) - 1,
-		.flags	= IORESOURCE_MEM,
-	}, {
-		.start	= IRQ_IDE0,
-		.end	= IRQ_IDE0,
-		.flags	= IORESOURCE_IRQ,
-	},
+	[0] = DEFINE_RES_MEM(S3C2410_CS3, 8 * 32),
+	[2] = DEFINE_RES_MEM(S3C2410_CS3 + (1 << 26) + (6 * 32), 32),
+	[3] = DEFINE_RES_IRQ(IRQ_IDE0),
 };
 
 static struct platform_device anubis_device_ide0 = {
@@ -262,19 +252,9 @@ static struct platform_device anubis_device_ide0 = {
 };
 
 static struct resource anubis_ide1_resource[] = {
-	{
-		.start	= S3C2410_CS4,
-		.end	= S3C2410_CS4 + (8*32) - 1,
-		.flags	= IORESOURCE_MEM,
-	}, {
-		.start	= S3C2410_CS4 + (1<<26) + (6*32),
-		.end	= S3C2410_CS4 + (1<<26) + (7*32) - 1,
-		.flags	= IORESOURCE_MEM,
-	}, {
-		.start	= IRQ_IDE0,
-		.end	= IRQ_IDE0,
-		.flags	= IORESOURCE_IRQ,
-	},
+	[0] = DEFINE_RES_MEM(S3C2410_CS4, 8 * 32),
+	[1] = DEFINE_RES_MEM(S3C2410_CS4 + (1 << 26) + (6 * 32), 32),
+	[2] = DEFINE_RES_IRQ(IRQ_IDE0),
 };
 
 static struct platform_device anubis_device_ide1 = {
@@ -298,16 +278,8 @@ static struct ax_plat_data anubis_asix_platdata = {
 };
 
 static struct resource anubis_asix_resource[] = {
-	[0] = {
-		.start = S3C2410_CS5,
-		.end   = S3C2410_CS5 + (0x20 * 0x20) -1,
-		.flags = IORESOURCE_MEM
-	},
-	[1] = {
-		.start = IRQ_ASIX,
-		.end   = IRQ_ASIX,
-		.flags = IORESOURCE_IRQ
-	}
+	[0] = DEFINE_RES_MEM(S3C2410_CS5, 0x20 * 0x20),
+	[1] = DEFINE_RES_IRQ(IRQ_ASIX),
 };
 
 static struct platform_device anubis_device_asix = {
@@ -323,21 +295,9 @@ static struct platform_device anubis_device_asix = {
 /* SM501 */
 
 static struct resource anubis_sm501_resource[] = {
-	[0] = {
-		.start	= S3C2410_CS2,
-		.end	= S3C2410_CS2 + SZ_8M,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start	= S3C2410_CS2 + SZ_64M - SZ_2M,
-		.end	= S3C2410_CS2 + SZ_64M - 1,
-		.flags	= IORESOURCE_MEM,
-	},
-	[2] = {
-		.start	= IRQ_EINT0,
-		.end	= IRQ_EINT0,
-		.flags	= IORESOURCE_IRQ,
-	},
+	[0] = DEFINE_RES_MEM(S3C2410_CS2, SZ_8M),
+	[1] = DEFINE_RES_MEM(S3C2410_CS2 + SZ_64M - SZ_2M, SZ_2M),
+	[2] = DEFINE_RES_IRQ(IRQ_EINT0),
 };
 
 static struct sm501_initdata anubis_sm501_initdata = {
-- 
1.7.4.1
