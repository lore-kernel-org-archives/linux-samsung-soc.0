From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 19/33] ARM: S3C24XX: mach-rx1950: Use common macro to define resources
Date: Wed, 25 Apr 2012 09:42:29 +0530
Message-ID: <1335327163-11794-20-git-send-email-tushar.behera@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:49498 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753216Ab2DYEXT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 00:23:19 -0400
Received: by mail-pb0-f46.google.com with SMTP id ro12so939266pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 21:23:19 -0700 (PDT)
In-Reply-To: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org, Ben Dooks <ben-linux@fluff.org>

CC: Ben Dooks <ben-linux@fluff.org>
CC: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-s3c24xx/mach-rx1950.c |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-rx1950.c b/arch/arm/mach-s3c24xx/mach-rx1950.c
index 200debb..a6762aa 100644
--- a/arch/arm/mach-s3c24xx/mach-rx1950.c
+++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
@@ -152,13 +152,8 @@ static struct pda_power_pdata power_supply_info = {
 };
 
 static struct resource power_supply_resources[] = {
-	[0] = {
-			.name	= "ac",
-			.flags	= IORESOURCE_IRQ | IORESOURCE_IRQ_LOWEDGE |
-					  IORESOURCE_IRQ_HIGHEDGE,
-			.start	= IRQ_EINT2,
-			.end	= IRQ_EINT2,
-	},
+	[0] = DEFINE_RES_NAMED(IRQ_EINT2, 1, "ac", IORESOURCE_IRQ \
+			| IORESOURCE_IRQ_LOWEDGE | IORESOURCE_IRQ_HIGHEDGE),
 };
 
 static struct platform_device power_supply = {
-- 
1.7.4.1
