From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 08/33] ARM: S3C24XX: mach-amlm5900: Use common macro to define resources
Date: Wed, 25 Apr 2012 09:42:18 +0530
Message-ID: <1335327163-11794-9-git-send-email-tushar.behera@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:44854 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751825Ab2DYEWZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 00:22:25 -0400
Received: by mail-pz0-f51.google.com with SMTP id z8so1811908dad.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 21:22:24 -0700 (PDT)
In-Reply-To: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org, Ben Dooks <ben-linux@fluff.org>

CC: Ben Dooks <ben-linux@fluff.org>
CC: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-s3c24xx/mach-amlm5900.c |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-amlm5900.c b/arch/arm/mach-s3c24xx/mach-amlm5900.c
index 4220cc6..ea2c4b0 100644
--- a/arch/arm/mach-s3c24xx/mach-amlm5900.c
+++ b/arch/arm/mach-s3c24xx/mach-amlm5900.c
@@ -65,13 +65,8 @@
 
 #include "common.h"
 
-static struct resource amlm5900_nor_resource = {
-		.start = 0x00000000,
-		.end   = 0x01000000 - 1,
-		.flags = IORESOURCE_MEM,
-};
-
-
+static struct resource amlm5900_nor_resource =
+			DEFINE_RES_MEM(0x00000000, SZ_16M);
 
 static struct mtd_partition amlm5900_mtd_partitions[] = {
 	{
-- 
1.7.4.1
