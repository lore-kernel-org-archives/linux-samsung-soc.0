From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 15/30] mtd: onenand/samsung: make regs-onenand.h file local
Date: Thu, 11 Apr 2013 02:04:57 +0200
Message-ID: <1365638712-1028578-16-git-send-email-arnd@arndb.de>
References: <1365638712-1028578-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1365638712-1028578-1-git-send-email-arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Nothing uses the NAND register definitions other than the
actual driver, so we can move the header file into the
same local directory, which lets us build it in a multiplatform
configuration.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>
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


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
