From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 17/33] ARM: S3C24XX: mach-otom: Use common macro to define resources
Date: Wed, 25 Apr 2012 09:42:27 +0530
Message-ID: <1335327163-11794-18-git-send-email-tushar.behera@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:49498 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753216Ab2DYEXJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 00:23:09 -0400
Received: by mail-pb0-f46.google.com with SMTP id ro12so939266pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 21:23:09 -0700 (PDT)
In-Reply-To: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org, Guillaume GOURAT <guillaume.gourat@nexvision.tv>, Ben Dooks <ben-linux@fluff.org>

CC: Guillaume GOURAT <guillaume.gourat@nexvision.tv>
CC: Ben Dooks <ben-linux@fluff.org>
CC: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-s3c24xx/mach-otom.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-otom.c b/arch/arm/mach-s3c24xx/mach-otom.c
index 5f1e0ee..bc4b6ef 100644
--- a/arch/arm/mach-s3c24xx/mach-otom.c
+++ b/arch/arm/mach-s3c24xx/mach-otom.c
@@ -77,11 +77,7 @@ static struct s3c2410_uartcfg otom11_uartcfgs[] __initdata = {
 /* NOR Flash on NexVision OTOM board */
 
 static struct resource otom_nor_resource[] = {
-	[0] = {
-		.start = S3C2410_CS0,
-		.end   = S3C2410_CS0 + (4*1024*1024) - 1,
-		.flags = IORESOURCE_MEM,
-	}
+	[0] = DEFINE_RES_MEM(S3C2410_CS0, SZ_4M),
 };
 
 static struct platform_device otom_device_nor = {
-- 
1.7.4.1
