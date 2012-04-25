From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 20/33] ARM: S3C24XX: mach-tct_hammer: Use common macro to define resources
Date: Wed, 25 Apr 2012 09:42:30 +0530
Message-ID: <1335327163-11794-21-git-send-email-tushar.behera@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:36558 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753216Ab2DYEXY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 00:23:24 -0400
Received: by mail-pz0-f51.google.com with SMTP id z8so1813007dad.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 21:23:24 -0700 (PDT)
In-Reply-To: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org, Ben Dooks <ben-linux@fluff.org>

CC: Ben Dooks <ben-linux@fluff.org>
CC: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-s3c24xx/mach-tct_hammer.c |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-tct_hammer.c b/arch/arm/mach-s3c24xx/mach-tct_hammer.c
index 1114666..fe99028 100644
--- a/arch/arm/mach-s3c24xx/mach-tct_hammer.c
+++ b/arch/arm/mach-s3c24xx/mach-tct_hammer.c
@@ -56,11 +56,8 @@
 
 #include "common.h"
 
-static struct resource tct_hammer_nor_resource = {
-		.start = 0x00000000,
-		.end   = 0x01000000 - 1,
-		.flags = IORESOURCE_MEM,
-};
+static struct resource tct_hammer_nor_resource =
+			DEFINE_RES_MEM(0x00000000, SZ_16M);
 
 static struct mtd_partition tct_hammer_mtd_partitions[] = {
 	{
-- 
1.7.4.1
