From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: Remove the L2 cache latency setting for EXYNOS5
Date: Thu, 21 Jun 2012 09:48:00 +0900
Message-ID: <038301cd4f47$8202b420$86081c60$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46583 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754399Ab2FUAsE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jun 2012 20:48:04 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5X001ZPZJUXM80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jun 2012 09:48:03 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5X009ZIZK0KZ40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jun 2012 09:48:01 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Boojin Kim' <boojin.kim@samsung.com>

From: Boojin Kim <boojin.kim@samsung.com>

Since SYSRAM set the L2 cache latency on EXYNOS5 SoCs,
no longer need that in the kernel. It helps to reduce
booting time (no need cache disable and cache enable).

Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/common.c |   25 -------------------------
 1 files changed, 0 insertions(+), 25 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 742edd3..0ec1a91 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -712,31 +712,6 @@ static int __init exynos4_l2x0_cache_init(void)
 early_initcall(exynos4_l2x0_cache_init);
 #endif
 
-static int __init exynos5_l2_cache_init(void)
-{
-	unsigned int val;
-
-	if (!soc_is_exynos5250())
-		return 0;
-
-	asm volatile("mrc p15, 0, %0, c1, c0, 0\n"
-		     "bic %0, %0, #(1 << 2)\n"	/* cache disable */
-		     "mcr p15, 0, %0, c1, c0, 0\n"
-		     "mrc p15, 1, %0, c9, c0, 2\n"
-		     : "=r"(val));
-
-	val |= (1 << 9) | (1 << 5) | (2 << 6) | (2 << 0);
-
-	asm volatile("mcr p15, 1, %0, c9, c0, 2\n" : : "r"(val));
-	asm volatile("mrc p15, 0, %0, c1, c0, 0\n"
-		     "orr %0, %0, #(1 << 2)\n"	/* cache enable */
-		     "mcr p15, 0, %0, c1, c0, 0\n"
-		     : : "r"(val));
-
-	return 0;
-}
-early_initcall(exynos5_l2_cache_init);
-
 static int __init exynos_init(void)
 {
 	printk(KERN_INFO "EXYNOS: Initializing architecture\n");
-- 
1.7.1
