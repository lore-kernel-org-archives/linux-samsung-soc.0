From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH] mach-s3c64xx: Remove all defintions not related to regs-clocks
Date: Mon, 14 Jul 2014 14:14:24 -0400
Message-ID: <1405361664-5210-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:55539 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756805AbaGNSO3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 14:14:29 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, tomasz.figa@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

This patch addresses the fix me message in this file that states to
remove all definitions not related to reg-clocks in this header
file.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 arch/arm/mach-s3c64xx/include/mach/regs-clock.h | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/include/mach/regs-clock.h b/arch/arm/mach-s3c64xx/include/mach/regs-clock.h
index 4f44aac..46e64cc 100644
--- a/arch/arm/mach-s3c64xx/include/mach/regs-clock.h
+++ b/arch/arm/mach-s3c64xx/include/mach/regs-clock.h
@@ -15,24 +15,4 @@
 #ifndef __PLAT_REGS_CLOCK_H
 #define __PLAT_REGS_CLOCK_H __FILE__
 
-/*
- * FIXME: Remove remaining definitions
- */
-
-#define S3C_CLKREG(x)		(S3C_VA_SYS + (x))
-
-#define S3C_PCLK_GATE		S3C_CLKREG(0x34)
-#define S3C6410_CLK_SRC2	S3C_CLKREG(0x10C)
-#define S3C_MEM_SYS_CFG		S3C_CLKREG(0x120)
-
-/* PCLK GATE Registers */
-#define S3C_CLKCON_PCLK_UART3		(1<<4)
-#define S3C_CLKCON_PCLK_UART2		(1<<3)
-#define S3C_CLKCON_PCLK_UART1		(1<<2)
-#define S3C_CLKCON_PCLK_UART0		(1<<1)
-
-/* MEM_SYS_CFG */
-#define MEM_SYS_CFG_INDEP_CF		0x4000
-#define MEM_SYS_CFG_EBI_FIX_PRI_CFCON	0x30
-
-#endif /* _PLAT_REGS_CLOCK_H */
+/#endif /* _PLAT_REGS_CLOCK_H */
-- 
1.9.1
