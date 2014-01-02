From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] mtd: s3c2410: Merge plat/regs-nand.h into s3c2410.c
Date: Thu,  2 Jan 2014 10:27:10 +0530
Message-ID: <1388638630-1353-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:43011 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750728AbaABFAx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jan 2014 00:00:53 -0500
Received: by mail-pd0-f182.google.com with SMTP id v10so13669204pde.41
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Jan 2014 21:00:53 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, computersforpeace@gmail.com, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

plat/regs-nand.h is used only by S3C2410 nand driver. Since there
are no other users, merge this file into the driver code to remove
platform dependency.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
The earlier version of this patch was titled
"mtd: s3c2410: Move plat/regs-nand.h to drivers/mtd".
Please ignore that.
---

 arch/arm/plat-samsung/include/plat/regs-nand.h |  123 ------------------------
 drivers/mtd/nand/s3c2410.c                     |  104 +++++++++++++++++++-
 2 files changed, 103 insertions(+), 124 deletions(-)
 delete mode 100644 arch/arm/plat-samsung/include/plat/regs-nand.h

diff --git a/arch/arm/plat-samsung/include/plat/regs-nand.h b/arch/arm/plat-samsung/include/plat/regs-nand.h
deleted file mode 100644
index 238efea7b9e4..000000000000
--- a/arch/arm/plat-samsung/include/plat/regs-nand.h
+++ /dev/null
@@ -1,123 +0,0 @@
-/* arch/arm/mach-s3c2410/include/mach/regs-nand.h
- *
- * Copyright (c) 2004-2005 Simtec Electronics <linux@simtec.co.uk>
- *	http://www.simtec.co.uk/products/SWLINUX/
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * S3C2410 NAND register definitions
-*/
-
-#ifndef __ASM_ARM_REGS_NAND
-#define __ASM_ARM_REGS_NAND
-
-
-#define S3C2410_NFREG(x) (x)
-
-#define S3C2410_NFCONF  S3C2410_NFREG(0x00)
-#define S3C2410_NFCMD   S3C2410_NFREG(0x04)
-#define S3C2410_NFADDR  S3C2410_NFREG(0x08)
-#define S3C2410_NFDATA  S3C2410_NFREG(0x0C)
-#define S3C2410_NFSTAT  S3C2410_NFREG(0x10)
-#define S3C2410_NFECC   S3C2410_NFREG(0x14)
-
-#define S3C2440_NFCONT   S3C2410_NFREG(0x04)
-#define S3C2440_NFCMD    S3C2410_NFREG(0x08)
-#define S3C2440_NFADDR   S3C2410_NFREG(0x0C)
-#define S3C2440_NFDATA   S3C2410_NFREG(0x10)
-#define S3C2440_NFECCD0  S3C2410_NFREG(0x14)
-#define S3C2440_NFECCD1  S3C2410_NFREG(0x18)
-#define S3C2440_NFECCD   S3C2410_NFREG(0x1C)
-#define S3C2440_NFSTAT   S3C2410_NFREG(0x20)
-#define S3C2440_NFESTAT0 S3C2410_NFREG(0x24)
-#define S3C2440_NFESTAT1 S3C2410_NFREG(0x28)
-#define S3C2440_NFMECC0  S3C2410_NFREG(0x2C)
-#define S3C2440_NFMECC1  S3C2410_NFREG(0x30)
-#define S3C2440_NFSECC   S3C2410_NFREG(0x34)
-#define S3C2440_NFSBLK   S3C2410_NFREG(0x38)
-#define S3C2440_NFEBLK   S3C2410_NFREG(0x3C)
-
-#define S3C2412_NFSBLK		S3C2410_NFREG(0x20)
-#define S3C2412_NFEBLK		S3C2410_NFREG(0x24)
-#define S3C2412_NFSTAT		S3C2410_NFREG(0x28)
-#define S3C2412_NFMECC_ERR0	S3C2410_NFREG(0x2C)
-#define S3C2412_NFMECC_ERR1	S3C2410_NFREG(0x30)
-#define S3C2412_NFMECC0		S3C2410_NFREG(0x34)
-#define S3C2412_NFMECC1		S3C2410_NFREG(0x38)
-#define S3C2412_NFSECC		S3C2410_NFREG(0x3C)
-
-#define S3C2410_NFCONF_EN          (1<<15)
-#define S3C2410_NFCONF_512BYTE     (1<<14)
-#define S3C2410_NFCONF_4STEP       (1<<13)
-#define S3C2410_NFCONF_INITECC     (1<<12)
-#define S3C2410_NFCONF_nFCE        (1<<11)
-#define S3C2410_NFCONF_TACLS(x)    ((x)<<8)
-#define S3C2410_NFCONF_TWRPH0(x)   ((x)<<4)
-#define S3C2410_NFCONF_TWRPH1(x)   ((x)<<0)
-
-#define S3C2410_NFSTAT_BUSY        (1<<0)
-
-#define S3C2440_NFCONF_BUSWIDTH_8	(0<<0)
-#define S3C2440_NFCONF_BUSWIDTH_16	(1<<0)
-#define S3C2440_NFCONF_ADVFLASH		(1<<3)
-#define S3C2440_NFCONF_TACLS(x)		((x)<<12)
-#define S3C2440_NFCONF_TWRPH0(x)	((x)<<8)
-#define S3C2440_NFCONF_TWRPH1(x)	((x)<<4)
-
-#define S3C2440_NFCONT_LOCKTIGHT	(1<<13)
-#define S3C2440_NFCONT_SOFTLOCK		(1<<12)
-#define S3C2440_NFCONT_ILLEGALACC_EN	(1<<10)
-#define S3C2440_NFCONT_RNBINT_EN	(1<<9)
-#define S3C2440_NFCONT_RN_FALLING	(1<<8)
-#define S3C2440_NFCONT_SPARE_ECCLOCK	(1<<6)
-#define S3C2440_NFCONT_MAIN_ECCLOCK	(1<<5)
-#define S3C2440_NFCONT_INITECC		(1<<4)
-#define S3C2440_NFCONT_nFCE		(1<<1)
-#define S3C2440_NFCONT_ENABLE		(1<<0)
-
-#define S3C2440_NFSTAT_READY		(1<<0)
-#define S3C2440_NFSTAT_nCE		(1<<1)
-#define S3C2440_NFSTAT_RnB_CHANGE	(1<<2)
-#define S3C2440_NFSTAT_ILLEGAL_ACCESS	(1<<3)
-
-#define S3C2412_NFCONF_NANDBOOT		(1<<31)
-#define S3C2412_NFCONF_ECCCLKCON	(1<<30)
-#define S3C2412_NFCONF_ECC_MLC		(1<<24)
-#define S3C2412_NFCONF_TACLS_MASK	(7<<12)	/* 1 extra bit of Tacls */
-
-#define S3C2412_NFCONT_ECC4_DIRWR	(1<<18)
-#define S3C2412_NFCONT_LOCKTIGHT	(1<<17)
-#define S3C2412_NFCONT_SOFTLOCK		(1<<16)
-#define S3C2412_NFCONT_ECC4_ENCINT	(1<<13)
-#define S3C2412_NFCONT_ECC4_DECINT	(1<<12)
-#define S3C2412_NFCONT_MAIN_ECC_LOCK	(1<<7)
-#define S3C2412_NFCONT_INIT_MAIN_ECC	(1<<5)
-#define S3C2412_NFCONT_nFCE1		(1<<2)
-#define S3C2412_NFCONT_nFCE0		(1<<1)
-
-#define S3C2412_NFSTAT_ECC_ENCDONE	(1<<7)
-#define S3C2412_NFSTAT_ECC_DECDONE	(1<<6)
-#define S3C2412_NFSTAT_ILLEGAL_ACCESS	(1<<5)
-#define S3C2412_NFSTAT_RnB_CHANGE	(1<<4)
-#define S3C2412_NFSTAT_nFCE1		(1<<3)
-#define S3C2412_NFSTAT_nFCE0		(1<<2)
-#define S3C2412_NFSTAT_Res1		(1<<1)
-#define S3C2412_NFSTAT_READY		(1<<0)
-
-#define S3C2412_NFECCERR_SERRDATA(x)	(((x) >> 21) & 0xf)
-#define S3C2412_NFECCERR_SERRBIT(x)	(((x) >> 18) & 0x7)
-#define S3C2412_NFECCERR_MERRDATA(x)	(((x) >> 7) & 0x3ff)
-#define S3C2412_NFECCERR_MERRBIT(x)	(((x) >> 4) & 0x7)
-#define S3C2412_NFECCERR_SPARE_ERR(x)	(((x) >> 2) & 0x3)
-#define S3C2412_NFECCERR_MAIN_ERR(x)	(((x) >> 2) & 0x3)
-#define S3C2412_NFECCERR_NONE		(0)
-#define S3C2412_NFECCERR_1BIT		(1)
-#define S3C2412_NFECCERR_MULTIBIT	(2)
-#define S3C2412_NFECCERR_ECCAREA	(3)
-
-
-
-#endif /* __ASM_ARM_REGS_NAND */
-
diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index d65cbe903d40..8cd8fd3a58e7 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -46,9 +46,111 @@
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
-#include <plat/regs-nand.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
 
+#define S3C2410_NFREG(x) (x)
+
+#define S3C2410_NFCONF		S3C2410_NFREG(0x00)
+#define S3C2410_NFCMD		S3C2410_NFREG(0x04)
+#define S3C2410_NFADDR		S3C2410_NFREG(0x08)
+#define S3C2410_NFDATA		S3C2410_NFREG(0x0C)
+#define S3C2410_NFSTAT		S3C2410_NFREG(0x10)
+#define S3C2410_NFECC		S3C2410_NFREG(0x14)
+
+#define S3C2440_NFCONT		S3C2410_NFREG(0x04)
+#define S3C2440_NFCMD		S3C2410_NFREG(0x08)
+#define S3C2440_NFADDR		S3C2410_NFREG(0x0C)
+#define S3C2440_NFDATA		S3C2410_NFREG(0x10)
+#define S3C2440_NFECCD0		S3C2410_NFREG(0x14)
+#define S3C2440_NFECCD1		S3C2410_NFREG(0x18)
+#define S3C2440_NFECCD		S3C2410_NFREG(0x1C)
+#define S3C2440_NFSTAT		S3C2410_NFREG(0x20)
+#define S3C2440_NFESTAT0	S3C2410_NFREG(0x24)
+#define S3C2440_NFESTAT1	S3C2410_NFREG(0x28)
+#define S3C2440_NFMECC0		S3C2410_NFREG(0x2C)
+#define S3C2440_NFMECC1		S3C2410_NFREG(0x30)
+#define S3C2440_NFSECC		S3C2410_NFREG(0x34)
+#define S3C2440_NFSBLK		S3C2410_NFREG(0x38)
+#define S3C2440_NFEBLK		S3C2410_NFREG(0x3C)
+
+#define S3C2412_NFSBLK		S3C2410_NFREG(0x20)
+#define S3C2412_NFEBLK		S3C2410_NFREG(0x24)
+#define S3C2412_NFSTAT		S3C2410_NFREG(0x28)
+#define S3C2412_NFMECC_ERR0	S3C2410_NFREG(0x2C)
+#define S3C2412_NFMECC_ERR1	S3C2410_NFREG(0x30)
+#define S3C2412_NFMECC0		S3C2410_NFREG(0x34)
+#define S3C2412_NFMECC1		S3C2410_NFREG(0x38)
+#define S3C2412_NFSECC		S3C2410_NFREG(0x3C)
+
+#define S3C2410_NFCONF_EN		(1<<15)
+#define S3C2410_NFCONF_512BYTE		(1<<14)
+#define S3C2410_NFCONF_4STEP		(1<<13)
+#define S3C2410_NFCONF_INITECC		(1<<12)
+#define S3C2410_NFCONF_nFCE		(1<<11)
+#define S3C2410_NFCONF_TACLS(x)		((x)<<8)
+#define S3C2410_NFCONF_TWRPH0(x)	((x)<<4)
+#define S3C2410_NFCONF_TWRPH1(x)	((x)<<0)
+
+#define S3C2410_NFSTAT_BUSY		(1<<0)
+
+#define S3C2440_NFCONF_BUSWIDTH_8	(0<<0)
+#define S3C2440_NFCONF_BUSWIDTH_16	(1<<0)
+#define S3C2440_NFCONF_ADVFLASH		(1<<3)
+#define S3C2440_NFCONF_TACLS(x)		((x)<<12)
+#define S3C2440_NFCONF_TWRPH0(x)	((x)<<8)
+#define S3C2440_NFCONF_TWRPH1(x)	((x)<<4)
+
+#define S3C2440_NFCONT_LOCKTIGHT	(1<<13)
+#define S3C2440_NFCONT_SOFTLOCK		(1<<12)
+#define S3C2440_NFCONT_ILLEGALACC_EN	(1<<10)
+#define S3C2440_NFCONT_RNBINT_EN	(1<<9)
+#define S3C2440_NFCONT_RN_FALLING	(1<<8)
+#define S3C2440_NFCONT_SPARE_ECCLOCK	(1<<6)
+#define S3C2440_NFCONT_MAIN_ECCLOCK	(1<<5)
+#define S3C2440_NFCONT_INITECC		(1<<4)
+#define S3C2440_NFCONT_nFCE		(1<<1)
+#define S3C2440_NFCONT_ENABLE		(1<<0)
+
+#define S3C2440_NFSTAT_READY		(1<<0)
+#define S3C2440_NFSTAT_nCE		(1<<1)
+#define S3C2440_NFSTAT_RnB_CHANGE	(1<<2)
+#define S3C2440_NFSTAT_ILLEGAL_ACCESS	(1<<3)
+
+#define S3C2412_NFCONF_NANDBOOT		(1<<31)
+#define S3C2412_NFCONF_ECCCLKCON	(1<<30)
+#define S3C2412_NFCONF_ECC_MLC		(1<<24)
+#define S3C2412_NFCONF_TACLS_MASK	(7<<12)	/* 1 extra bit of Tacls */
+
+#define S3C2412_NFCONT_ECC4_DIRWR	(1<<18)
+#define S3C2412_NFCONT_LOCKTIGHT	(1<<17)
+#define S3C2412_NFCONT_SOFTLOCK		(1<<16)
+#define S3C2412_NFCONT_ECC4_ENCINT	(1<<13)
+#define S3C2412_NFCONT_ECC4_DECINT	(1<<12)
+#define S3C2412_NFCONT_MAIN_ECC_LOCK	(1<<7)
+#define S3C2412_NFCONT_INIT_MAIN_ECC	(1<<5)
+#define S3C2412_NFCONT_nFCE1		(1<<2)
+#define S3C2412_NFCONT_nFCE0		(1<<1)
+
+#define S3C2412_NFSTAT_ECC_ENCDONE	(1<<7)
+#define S3C2412_NFSTAT_ECC_DECDONE	(1<<6)
+#define S3C2412_NFSTAT_ILLEGAL_ACCESS	(1<<5)
+#define S3C2412_NFSTAT_RnB_CHANGE	(1<<4)
+#define S3C2412_NFSTAT_nFCE1		(1<<3)
+#define S3C2412_NFSTAT_nFCE0		(1<<2)
+#define S3C2412_NFSTAT_Res1		(1<<1)
+#define S3C2412_NFSTAT_READY		(1<<0)
+
+#define S3C2412_NFECCERR_SERRDATA(x)	(((x) >> 21) & 0xf)
+#define S3C2412_NFECCERR_SERRBIT(x)	(((x) >> 18) & 0x7)
+#define S3C2412_NFECCERR_MERRDATA(x)	(((x) >> 7) & 0x3ff)
+#define S3C2412_NFECCERR_MERRBIT(x)	(((x) >> 4) & 0x7)
+#define S3C2412_NFECCERR_SPARE_ERR(x)	(((x) >> 2) & 0x3)
+#define S3C2412_NFECCERR_MAIN_ERR(x)	(((x) >> 2) & 0x3)
+#define S3C2412_NFECCERR_NONE		(0)
+#define S3C2412_NFECCERR_1BIT		(1)
+#define S3C2412_NFECCERR_MULTIBIT	(2)
+#define S3C2412_NFECCERR_ECCAREA	(3)
+
 /* new oob placement block for use with hardware ecc generation
  */
 
-- 
1.7.9.5
