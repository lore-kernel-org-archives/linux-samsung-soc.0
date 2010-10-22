From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V2 1/4] ARM: SAMSUNG: Move the start address of Samsung SoCs' VA space
Date: Fri, 22 Oct 2010 15:21:33 +0900
Message-ID: <1287728493-12785-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:33220 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752838Ab0JVG2E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Oct 2010 02:28:04 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch moves the start address of Samsung SoCs' VA space so that
can use more vmalloc()/ioremap() space. Of course need to change the
VMALLOC_END for it.

Cc: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
Changes since v1:
- Changes address to 0xF6000000 due to S3C24XX_VA_GPIO

 arch/arm/plat-samsung/include/plat/map-base.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/map-base.h b/arch/arm/plat-samsung/include/plat/map-base.h
index 250be31..86f66be 100644
--- a/arch/arm/plat-samsung/include/plat/map-base.h
+++ b/arch/arm/plat-samsung/include/plat/map-base.h
@@ -14,7 +14,7 @@
 #ifndef __ASM_PLAT_MAP_H
 #define __ASM_PLAT_MAP_H __FILE__
 
-/* Fit all our registers in at 0xF4000000 upwards, trying to use as
+/* Fit all our registers in at 0xF6000000 upwards, trying to use as
  * little of the VA space as possible so vmalloc and friends have a
  * better chance of getting memory.
  *
@@ -22,7 +22,7 @@
  * an single MOVS instruction (ie, only 8 bits of set data)
  */
 
-#define S3C_ADDR_BASE	(0xF4000000)
+#define S3C_ADDR_BASE	0xF6000000
 
 #ifndef __ASSEMBLY__
 #define S3C_ADDR(x)	((void __iomem __force *)S3C_ADDR_BASE + (x))
-- 
1.6.2.5
