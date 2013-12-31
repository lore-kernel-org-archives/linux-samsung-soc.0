From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] mtd: s3c2410: Move plat/regs-nand.h to drivers/mtd
Date: Tue, 31 Dec 2013 10:41:30 +0530
Message-ID: <1388466690-16435-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:37951 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751152Ab3LaFPK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Dec 2013 00:15:10 -0500
Received: by mail-pa0-f43.google.com with SMTP id bj1so12371955pad.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2013 21:15:09 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, computersforpeace@gmail.com, sachin.kamat@linaro.org, patches@linaro.org

plat/regs-nand.h is used only by s3c2410 nand driver.
Move this file to the drivers folder to remove platform
dependency.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/s3c2410.c                         |    2 +-
 .../plat/regs-nand.h => drivers/mtd/nand/s3c2410.h |   11 ++++-------
 2 files changed, 5 insertions(+), 8 deletions(-)
 rename arch/arm/plat-samsung/include/plat/regs-nand.h => drivers/mtd/nand/s3c2410.h (96%)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index d65cbe903d40..83fb4feb7556 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -46,8 +46,8 @@
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
-#include <plat/regs-nand.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
+#include "s3c2410.h"
 
 /* new oob placement block for use with hardware ecc generation
  */
diff --git a/arch/arm/plat-samsung/include/plat/regs-nand.h b/drivers/mtd/nand/s3c2410.h
similarity index 96%
rename from arch/arm/plat-samsung/include/plat/regs-nand.h
rename to drivers/mtd/nand/s3c2410.h
index 238efea7b9e4..f3b82d7053a0 100644
--- a/arch/arm/plat-samsung/include/plat/regs-nand.h
+++ b/drivers/mtd/nand/s3c2410.h
@@ -1,5 +1,4 @@
-/* arch/arm/mach-s3c2410/include/mach/regs-nand.h
- *
+/*
  * Copyright (c) 2004-2005 Simtec Electronics <linux@simtec.co.uk>
  *	http://www.simtec.co.uk/products/SWLINUX/
  *
@@ -10,8 +9,8 @@
  * S3C2410 NAND register definitions
 */
 
-#ifndef __ASM_ARM_REGS_NAND
-#define __ASM_ARM_REGS_NAND
+#ifndef __S3C2410_NAND_H
+#define __S3C2410_NAND_H
 
 
 #define S3C2410_NFREG(x) (x)
@@ -117,7 +116,5 @@
 #define S3C2412_NFECCERR_MULTIBIT	(2)
 #define S3C2412_NFECCERR_ECCAREA	(3)
 
-
-
-#endif /* __ASM_ARM_REGS_NAND */
+#endif /* __S3C2410_NAND_H */
 
-- 
1.7.9.5
