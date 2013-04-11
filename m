From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 08/10] mtd: onenand/samsung: make regs-onenand.h file local
Date: Thu, 11 Apr 2013 23:37:23 +0200
Message-ID: <1365716245-99231-9-git-send-email-arnd@arndb.de>
References: <1365716245-99231-1-git-send-email-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:50506 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753109Ab3DKVhz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Apr 2013 17:37:55 -0400
In-Reply-To: <1365716245-99231-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>

Nothing uses the NAND register definitions other than the
actual driver, so we can move the header file into the
same local directory, which lets us build it in a multiplatform
configuration.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>
---
 drivers/mtd/onenand/samsung.c                                         | 4 ++--
 .../include/plat/regs-onenand.h => drivers/mtd/onenand/samsung.h      | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename arch/arm/plat-samsung/include/plat/regs-onenand.h => drivers/mtd/onenand/samsung.h (98%)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 33f2a8f..2cf7408 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -23,11 +23,11 @@
 #include <linux/mtd/partitions.h>
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 
 #include <asm/mach/flash.h>
-#include <plat/regs-onenand.h>
 
-#include <linux/io.h>
+#include "samsung.h"
 
 enum soc_type {
 	TYPE_S3C6400,
diff --git a/arch/arm/plat-samsung/include/plat/regs-onenand.h b/drivers/mtd/onenand/samsung.h
similarity index 98%
rename from arch/arm/plat-samsung/include/plat/regs-onenand.h
rename to drivers/mtd/onenand/samsung.h
index 930ea8b..c4a80e6 100644
--- a/arch/arm/plat-samsung/include/plat/regs-onenand.h
+++ b/drivers/mtd/onenand/samsung.h
@@ -11,8 +11,6 @@
 #ifndef __SAMSUNG_ONENAND_H__
 #define __SAMSUNG_ONENAND_H__
 
-#include <mach/hardware.h>
-
 /*
  * OneNAND Controller
  */
-- 
1.8.1.2
