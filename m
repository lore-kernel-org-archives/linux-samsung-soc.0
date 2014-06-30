From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 14/17] mtd: onenand: remove s5pc100 related onenand codes
Date: Tue, 01 Jul 2014 06:32:24 +0900
Message-ID: <1404163947-3105-15-git-send-email-kgene.kim@samsung.com>
References: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60295 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752872AbaF3NTL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 09:19:11 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7Z002TPGZVEA70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Jun 2014 22:19:07 +0900 (KST)
In-reply-to: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>

This patch removes s5pc100 related onenand codes because of no more
support for S5PC100 SoC in mainline.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/onenand/Kconfig   |    4 ++--
 drivers/mtd/onenand/samsung.c |   25 +------------------------
 2 files changed, 3 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
index ab26072..dcae2f6 100644
--- a/drivers/mtd/onenand/Kconfig
+++ b/drivers/mtd/onenand/Kconfig
@@ -32,10 +32,10 @@ config MTD_ONENAND_OMAP2
 
 config MTD_ONENAND_SAMSUNG
         tristate "OneNAND on Samsung SOC controller support"
-        depends on ARCH_S3C64XX || ARCH_S5PC100 || ARCH_S5PV210 || ARCH_EXYNOS4
+        depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS4
         help
           Support for a OneNAND flash device connected to an Samsung SOC.
-          S3C64XX/S5PC100 use command mapping method.
+          S3C64XX uses command mapping method.
           S5PC110/S5PC210 use generic OneNAND method.
 
 config MTD_ONENAND_OTP
diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index efb819c..19cfb97 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -10,7 +10,7 @@
  * published by the Free Software Foundation.
  *
  * Implementation:
- *	S3C64XX and S5PC100: emulate the pseudo BufferRAM
+ *	S3C64XX: emulate the pseudo BufferRAM
  *	S5PC110: use DMA
  */
 
@@ -32,7 +32,6 @@
 enum soc_type {
 	TYPE_S3C6400,
 	TYPE_S3C6410,
-	TYPE_S5PC100,
 	TYPE_S5PC110,
 };
 
@@ -59,7 +58,6 @@ enum soc_type {
 #define MAP_11				(0x3)
 
 #define S3C64XX_CMD_MAP_SHIFT		24
-#define S5PC100_CMD_MAP_SHIFT		26
 
 #define S3C6400_FBA_SHIFT		10
 #define S3C6400_FPA_SHIFT		4
@@ -69,10 +67,6 @@ enum soc_type {
 #define S3C6410_FPA_SHIFT		6
 #define S3C6410_FSA_SHIFT		4
 
-#define S5PC100_FBA_SHIFT		13
-#define S5PC100_FPA_SHIFT		7
-#define S5PC100_FSA_SHIFT		5
-
 /* S5PC110 specific definitions */
 #define S5PC110_DMA_SRC_ADDR		0x400
 #define S5PC110_DMA_SRC_CFG		0x404
@@ -195,11 +189,6 @@ static unsigned int s3c64xx_cmd_map(unsigned type, unsigned val)
 	return (type << S3C64XX_CMD_MAP_SHIFT) | val;
 }
 
-static unsigned int s5pc1xx_cmd_map(unsigned type, unsigned val)
-{
-	return (type << S5PC100_CMD_MAP_SHIFT) | val;
-}
-
 static unsigned int s3c6400_mem_addr(int fba, int fpa, int fsa)
 {
 	return (fba << S3C6400_FBA_SHIFT) | (fpa << S3C6400_FPA_SHIFT) |
@@ -212,12 +201,6 @@ static unsigned int s3c6410_mem_addr(int fba, int fpa, int fsa)
 		(fsa << S3C6410_FSA_SHIFT);
 }
 
-static unsigned int s5pc100_mem_addr(int fba, int fpa, int fsa)
-{
-	return (fba << S5PC100_FBA_SHIFT) | (fpa << S5PC100_FPA_SHIFT) |
-		(fsa << S5PC100_FSA_SHIFT);
-}
-
 static void s3c_onenand_reset(void)
 {
 	unsigned long timeout = 0x10000;
@@ -835,9 +818,6 @@ static void s3c_onenand_setup(struct mtd_info *mtd)
 	} else if (onenand->type == TYPE_S3C6410) {
 		onenand->mem_addr = s3c6410_mem_addr;
 		onenand->cmd_map = s3c64xx_cmd_map;
-	} else if (onenand->type == TYPE_S5PC100) {
-		onenand->mem_addr = s5pc100_mem_addr;
-		onenand->cmd_map = s5pc1xx_cmd_map;
 	} else if (onenand->type == TYPE_S5PC110) {
 		/* Use generic onenand functions */
 		this->read_bufferram = s5pc110_read_bufferram;
@@ -1111,9 +1091,6 @@ static struct platform_device_id s3c_onenand_driver_ids[] = {
 		.name		= "s3c6410-onenand",
 		.driver_data	= TYPE_S3C6410,
 	}, {
-		.name		= "s5pc100-onenand",
-		.driver_data	= TYPE_S5PC100,
-	}, {
 		.name		= "s5pc110-onenand",
 		.driver_data	= TYPE_S5PC110,
 	}, { },
-- 
1.7.10.4
