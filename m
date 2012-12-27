From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: fix uncompress.h and debug-macro.S for EXYNOS5440
Date: Thu, 27 Dec 2012 10:27:14 -0800
Message-ID: <1356632834-8934-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:24541 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751648Ab2L0S13 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Dec 2012 13:27:29 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFP00MRUCLRX1F0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Dec 2012 03:27:27 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFP00HIJCLN2UA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Dec 2012 03:27:27 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

This patch fixes uart base address for uncompress and debug-macro
on EXYNOS5440.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/include/mach/debug-macro.S |   25 +++++++++++++++++------
 arch/arm/mach-exynos/include/mach/map.h         |    1 +
 arch/arm/mach-exynos/include/mach/uncompress.h  |   20 +++++++++++-------
 3 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/debug-macro.S b/arch/arm/mach-exynos/include/mach/debug-macro.S
index e0c86ea..69e3e52 100644
--- a/arch/arm/mach-exynos/include/mach/debug-macro.S
+++ b/arch/arm/mach-exynos/include/mach/debug-macro.S
@@ -21,12 +21,25 @@
 	 */
 
 	.macro addruart, rp, rv, tmp
-		mrc	p15, 0, \tmp, c0, c0, 0
-		and	\tmp, \tmp, #0xf0
-		teq	\tmp, #0xf0		@@ A15
-		ldreq	\rp, =EXYNOS5_PA_UART
-		movne	\rp, #EXYNOS4_PA_UART	@@ EXYNOS4
-		ldr	\rv, =S3C_VA_UART
+		mov	\rp, #0x10000000
+		ldr	\rp, [\rp, #0]
+		and	\rp, \rp, #0x0ff00000
+		teq	\rp, #0x03200000	@ EXYNOS4210, EXYNOS4212
+		beq	4f
+		teq	\rp, #0x04400000	@ EXYNOS4412
+		beq	4f
+		teq	\rp, #0x03500000	@ EXYNOS5250
+		beq	5f
+		b	54f
+
+4:		mov	\rp, #EXYNOS4_PA_UART
+		b	99f
+5:		mov	\rp, #EXYNOS5_PA_UART
+		b	99f
+54:		mov	\rp, #EXYNOS5440_PA_UART
+		b	99f
+99:		ldr	\rv, =S3C_VA_UART
+
 #if CONFIG_DEBUG_S3C_UART != 0
 		add	\rp, \rp, #(0x10000 * CONFIG_DEBUG_S3C_UART)
 		add	\rv, \rv, #(0x10000 * CONFIG_DEBUG_S3C_UART)
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 1df6abb..cba083e 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -203,6 +203,7 @@
 
 #define EXYNOS4_PA_UART			0x13800000
 #define EXYNOS5_PA_UART			0x12C00000
+#define EXYNOS5440_PA_UART		0x000B0000
 
 #define EXYNOS4_PA_VP			0x12C00000
 #define EXYNOS4_PA_MIXER		0x12C10000
diff --git a/arch/arm/mach-exynos/include/mach/uncompress.h b/arch/arm/mach-exynos/include/mach/uncompress.h
index 2979995..ace9be2 100644
--- a/arch/arm/mach-exynos/include/mach/uncompress.h
+++ b/arch/arm/mach-exynos/include/mach/uncompress.h
@@ -31,16 +31,22 @@ static void arch_detect_cpu(void)
 
 	/*
 	 * product_id is bits 31:12
-	 *    bits 23:20 describe the exynosX family
-	 *
+	 *    bits 27:20 describe the exynosX family
 	 */
 	chip_id >>= 20;
-	chip_id &= 0xf;
-
-	if (chip_id == 0x5)
-		uart_base = (volatile u8 *)EXYNOS5_PA_UART + (S3C_UART_OFFSET * CONFIG_S3C_LOWLEVEL_UART_PORT);
+	chip_id &= 0xff;
+
+	if (chip_id == 0x32 || chip_id == 0x44)
+		/* EXYNOS4210, EXYNOS4212 and EXYNOS4412 */
+		uart_base = (volatile u8 *)EXYNOS4_PA_UART;
+	else if (chip_id == 0x35)
+		/* EXYNOS5250 */
+		uart_base = (volatile u8 *)EXYNOS5_PA_UART;
 	else
-		uart_base = (volatile u8 *)EXYNOS4_PA_UART + (S3C_UART_OFFSET * CONFIG_S3C_LOWLEVEL_UART_PORT);
+		/* EXYNOS5440 */
+		uart_base = (volatile u8 *)EXYNOS5440_PA_UART;
+
+	uart_base += S3C_UART_OFFSET * CONFIG_S3C_LOWLEVEL_UART_PORT;
 
 	/*
 	 * For preventing FIFO overrun or infinite loop of UART console,
-- 
1.7.10.4
