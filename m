From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 25/33] ARM: S3C64XX: mach-anw6410: Use common macro to define resources
Date: Wed, 25 Apr 2012 09:42:35 +0530
Message-ID: <1335327163-11794-26-git-send-email-tushar.behera@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:36558 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753216Ab2DYEXw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 00:23:52 -0400
Received: by mail-pz0-f51.google.com with SMTP id z8so1813007dad.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 21:23:52 -0700 (PDT)
In-Reply-To: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org, Kwangwoo Lee <kwangwoo.lee@gmail.com>, Ben Dooks <ben-linux@fluff.org>

CC: Kwangwoo Lee <kwangwoo.lee@gmail.com>
CC: Ben Dooks <ben-linux@fluff.org>
CC: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-s3c64xx/mach-anw6410.c |   19 ++++---------------
 1 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/mach-anw6410.c b/arch/arm/mach-s3c64xx/mach-anw6410.c
index b86f277..f252691 100644
--- a/arch/arm/mach-s3c64xx/mach-anw6410.c
+++ b/arch/arm/mach-s3c64xx/mach-anw6410.c
@@ -165,21 +165,10 @@ static void __init anw6410_dm9000_enable(void)
 }
 
 static struct resource anw6410_dm9000_resource[] = {
-	[0] = {
-		.start = ANW6410_PA_DM9000,
-		.end   = ANW6410_PA_DM9000 + 3,
-		.flags = IORESOURCE_MEM,
-	},
-	[1] = {
-		.start = ANW6410_PA_DM9000 + 4,
-		.end   = ANW6410_PA_DM9000 + 4 + 500,
-		.flags = IORESOURCE_MEM,
-	},
-	[2] = {
-		.start = IRQ_EINT(15),
-		.end   = IRQ_EINT(15),
-		.flags = IORESOURCE_IRQ | IRQF_TRIGGER_HIGH,
-	},
+	[0] = DEFINE_RES_MEM(ANW6410_PA_DM9000, 4),
+	[1] = DEFINE_RES_MEM(ANW6410_PA_DM9000 + 4, 501),
+	[2] = DEFINE_RES_NAMED(IRQ_EINT(15), 1, NULL, IORESOURCE_IRQ \
+					| IRQF_TRIGGER_HIGH),
 };
 
 static struct dm9000_plat_data anw6410_dm9000_pdata = {
-- 
1.7.4.1
