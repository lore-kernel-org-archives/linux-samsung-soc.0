From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 12/33] ARM: S3C24XX: mach-gta02: Use common macro to define resources
Date: Wed, 25 Apr 2012 09:42:22 +0530
Message-ID: <1335327163-11794-13-git-send-email-tushar.behera@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:49498 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753210Ab2DYEWo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 00:22:44 -0400
Received: by mail-pb0-f46.google.com with SMTP id ro12so939266pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 21:22:44 -0700 (PDT)
In-Reply-To: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org, Nelson Castillo <arhuaco@freaks-unidos.net>, Ben Dooks <ben-linux@fluff.org>

CC: Nelson Castillo <arhuaco@freaks-unidos.net>
CC: Ben Dooks <ben-linux@fluff.org>
CC: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-s3c24xx/mach-gta02.c |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
index ba5d853..0f29f64a 100644
--- a/arch/arm/mach-s3c24xx/mach-gta02.c
+++ b/arch/arm/mach-s3c24xx/mach-gta02.c
@@ -387,11 +387,8 @@ static struct physmap_flash_data gta02_nor_flash_data = {
 	.width		= 2,
 };
 
-static struct resource gta02_nor_flash_resource = {
-	.start		= GTA02_FLASH_BASE,
-	.end		= GTA02_FLASH_BASE + GTA02_FLASH_SIZE - 1,
-	.flags		= IORESOURCE_MEM,
-};
+static struct resource gta02_nor_flash_resource =
+	DEFINE_RES_MEM(GTA02_FLASH_BASE, GTA02_FLASH_SIZE);
 
 static struct platform_device gta02_nor_flash = {
 	.name		= "physmap-flash",
-- 
1.7.4.1
