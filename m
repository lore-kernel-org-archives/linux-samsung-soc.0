From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 14/33] ARM: S3C24XX: mach-mini2440: Use common macro to define resources
Date: Wed, 25 Apr 2012 09:42:24 +0530
Message-ID: <1335327163-11794-15-git-send-email-tushar.behera@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:49498 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753439Ab2DYEWx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 00:22:53 -0400
Received: by mail-pb0-f46.google.com with SMTP id ro12so939266pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 21:22:53 -0700 (PDT)
In-Reply-To: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org, Michel Pollet <buserror@gmail.com>, Ben Dooks <ben-linux@fluff.org>

CC: Michel Pollet <buserror@gmail.com>
CC: Ben Dooks <ben-linux@fluff.org>
CC: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-s3c24xx/mach-mini2440.c |   19 ++++---------------
 1 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index 5d66fb2..f092b18 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -292,21 +292,10 @@ static struct s3c2410_platform_nand mini2440_nand_info __initdata = {
 /* DM9000AEP 10/100 ethernet controller */
 
 static struct resource mini2440_dm9k_resource[] = {
-	[0] = {
-		.start = MACH_MINI2440_DM9K_BASE,
-		.end   = MACH_MINI2440_DM9K_BASE + 3,
-		.flags = IORESOURCE_MEM
-	},
-	[1] = {
-		.start = MACH_MINI2440_DM9K_BASE + 4,
-		.end   = MACH_MINI2440_DM9K_BASE + 7,
-		.flags = IORESOURCE_MEM
-	},
-	[2] = {
-		.start = IRQ_EINT7,
-		.end   = IRQ_EINT7,
-		.flags = IORESOURCE_IRQ | IORESOURCE_IRQ_HIGHEDGE,
-	}
+	[0] = DEFINE_RES_MEM(MACH_MINI2440_DM9K_BASE, 4),
+	[1] = DEFINE_RES_MEM(MACH_MINI2440_DM9K_BASE + 4, 4),
+	[2] = DEFINE_RES_NAMED(IRQ_EINT7, 1, NULL, IORESOURCE_IRQ \
+						| IORESOURCE_IRQ_HIGHEDGE),
 };
 
 /*
-- 
1.7.4.1
