From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 01/20] ARM: S5PC100: use 0x30008000 as memory base
Date: Fri, 20 Nov 2009 14:42:33 +0100
Message-ID: <1258724572-19176-2-git-send-email-m.szyprowski@samsung.com>
References: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:9459 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753438AbZKTNm4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Nov 2009 08:42:56 -0500
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0KTE0056QU3OQ320@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Nov 2009 13:43:00 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KTE006SCU3OK9@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Nov 2009 13:43:00 +0000 (GMT)
In-reply-to: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org

From: Kyungmin Park <kyungmin.park@samsung.com>

We decided to use 0x3000'0000 as base memory address on S5PC1XX SoCs
(s5pc100 and s5pc110).
A patch to u-boot that configures SMDKC100 board and sets base memory
as 0x3000'0000 has been already posted.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-s5pc100/Makefile.boot         |    4 ++--
 arch/arm/mach-s5pc100/include/mach/map.h    |    2 +-
 arch/arm/mach-s5pc100/include/mach/memory.h |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s5pc100/Makefile.boot b/arch/arm/mach-s5pc100/Makefile.boot
index ff90aa1..b0909e3 100644
--- a/arch/arm/mach-s5pc100/Makefile.boot
+++ b/arch/arm/mach-s5pc100/Makefile.boot
@@ -1,2 +1,2 @@
-   zreladdr-y	:= 0x20008000
-params_phys-y	:= 0x20000100
+   zreladdr-y	:= 0x30008000
+params_phys-y	:= 0x30000100
diff --git a/arch/arm/mach-s5pc100/include/mach/map.h b/arch/arm/mach-s5pc100/include/mach/map.h
index 4681ebe..f90c033 100644
--- a/arch/arm/mach-s5pc100/include/mach/map.h
+++ b/arch/arm/mach-s5pc100/include/mach/map.h
@@ -113,7 +113,7 @@
 #define S5PC100_PA_TSADC	(0xF3000000)
 
 /* ETC */
-#define S5PC100_PA_SDRAM	(0x20000000)
+#define S5PC100_PA_SDRAM	(0x30000000)
 #define S5PC1XX_PA_SDRAM	S5PC100_PA_SDRAM
 
 /* compatibility defines. */
diff --git a/arch/arm/mach-s5pc100/include/mach/memory.h b/arch/arm/mach-s5pc100/include/mach/memory.h
index 4b60d18..21cc182 100644
--- a/arch/arm/mach-s5pc100/include/mach/memory.h
+++ b/arch/arm/mach-s5pc100/include/mach/memory.h
@@ -13,6 +13,6 @@
 #ifndef __ASM_ARCH_MEMORY_H
 #define __ASM_ARCH_MEMORY_H
 
-#define PHYS_OFFSET     	UL(0x20000000)
+#define PHYS_OFFSET     	UL(0x30000000)
 
 #endif
-- 
1.6.4
