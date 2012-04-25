From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 16/33] ARM: S3C24XX: mach-osiris: Use common macro to define resources
Date: Wed, 25 Apr 2012 09:42:26 +0530
Message-ID: <1335327163-11794-17-git-send-email-tushar.behera@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:49498 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753312Ab2DYEXE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 00:23:04 -0400
Received: by mail-pb0-f46.google.com with SMTP id ro12so939266pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 21:23:04 -0700 (PDT)
In-Reply-To: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org, Ben Dooks <ben-linux@fluff.org>

CC: Ben Dooks <ben-linux@fluff.org>
CC: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-s3c24xx/mach-osiris.c |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c b/arch/arm/mach-s3c24xx/mach-osiris.c
index c5daeb6..95d0772 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris.c
@@ -244,16 +244,8 @@ static struct s3c2410_platform_nand __initdata osiris_nand_info = {
 /* PCMCIA control and configuration */
 
 static struct resource osiris_pcmcia_resource[] = {
-	[0] = {
-		.start	= 0x0f000000,
-		.end	= 0x0f100000,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start	= 0x0c000000,
-		.end	= 0x0c100000,
-		.flags	= IORESOURCE_MEM,
-	}
+	[0] = DEFINE_RES_MEM(0x0f000000, SZ_1M),
+	[1] = DEFINE_RES_MEM(0x0c000000, SZ_1M),
 };
 
 static struct platform_device osiris_pcmcia = {
-- 
1.7.4.1
