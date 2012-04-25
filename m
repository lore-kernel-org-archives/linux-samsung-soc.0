From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 10/33] ARM: S3C24XX: mach-at2440evb: Use common macro to define resources
Date: Wed, 25 Apr 2012 09:42:20 +0530
Message-ID: <1335327163-11794-11-git-send-email-tushar.behera@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:49498 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751825Ab2DYEWe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 00:22:34 -0400
Received: by mail-pb0-f46.google.com with SMTP id ro12so939266pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 21:22:34 -0700 (PDT)
In-Reply-To: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org, Ben Dooks <ben-linux@fluff.org>

CC: Ben Dooks <ben-linux@fluff.org>
CC: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-s3c24xx/mach-at2440evb.c |   19 ++++---------------
 1 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-at2440evb.c b/arch/arm/mach-s3c24xx/mach-at2440evb.c
index d7ae49c..7a05abf 100644
--- a/arch/arm/mach-s3c24xx/mach-at2440evb.c
+++ b/arch/arm/mach-s3c24xx/mach-at2440evb.c
@@ -118,21 +118,10 @@ static struct s3c2410_platform_nand __initdata at2440evb_nand_info = {
 /* DM9000AEP 10/100 ethernet controller */
 
 static struct resource at2440evb_dm9k_resource[] = {
-	[0] = {
-		.start = S3C2410_CS3,
-		.end   = S3C2410_CS3 + 3,
-		.flags = IORESOURCE_MEM
-	},
-	[1] = {
-		.start = S3C2410_CS3 + 4,
-		.end   = S3C2410_CS3 + 7,
-		.flags = IORESOURCE_MEM
-	},
-	[2] = {
-		.start = IRQ_EINT7,
-		.end   = IRQ_EINT7,
-		.flags = IORESOURCE_IRQ | IORESOURCE_IRQ_HIGHEDGE,
-	}
+	[0] = DEFINE_RES_MEM(S3C2410_CS3, 4),
+	[1] = DEFINE_RES_MEM(S3C2410_CS3 + 4, 4),
+	[2] = DEFINE_RES_NAMED(IRQ_EINT7, 1, NULL, IORESOURCE_IRQ \
+					| IORESOURCE_IRQ_HIGHEDGE),
 };
 
 static struct dm9000_plat_data at2440evb_dm9k_pdata = {
-- 
1.7.4.1
