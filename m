From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 15/33] ARM: S3C24XX: mach-nexcoder: Use common macro to define resources
Date: Wed, 25 Apr 2012 09:42:25 +0530
Message-ID: <1335327163-11794-16-git-send-email-tushar.behera@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:36558 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753410Ab2DYEW7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 00:22:59 -0400
Received: by dadz8 with SMTP id z8so1813007dad.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 21:22:59 -0700 (PDT)
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
 arch/arm/mach-s3c24xx/mach-nexcoder.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-nexcoder.c b/arch/arm/mach-s3c24xx/mach-nexcoder.c
index 5198e3e..5c05ba1 100644
--- a/arch/arm/mach-s3c24xx/mach-nexcoder.c
+++ b/arch/arm/mach-s3c24xx/mach-nexcoder.c
@@ -84,11 +84,7 @@ static struct s3c2410_uartcfg nexcoder_uartcfgs[] __initdata = {
 /* NOR Flash on NexVision NexCoder 2440 board */
 
 static struct resource nexcoder_nor_resource[] = {
-	[0] = {
-		.start = S3C2410_CS0,
-		.end   = S3C2410_CS0 + (8*1024*1024) - 1,
-		.flags = IORESOURCE_MEM,
-	}
+	[0] = DEFINE_RES_MEM(S3C2410_CS0, SZ_8M),
 };
 
 static struct map_info nexcoder_nor_map = {
-- 
1.7.4.1
