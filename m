From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P6442: Support arch_reset() in S5P6442
Date: Mon, 31 May 2010 11:23:15 +0900
Message-ID: <1275272595-25251-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45471 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755314Ab0EaCbG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 30 May 2010 22:31:06 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Jongpill Lee <boyko.lee@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Jongpill Lee <boyko.lee@samsung.com>

This patch is for support system reboot on S5P6442.

Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6442/include/mach/regs-clock.h |    2 ++
 arch/arm/mach-s5p6442/include/mach/system.h     |    6 +++++-
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5p6442/include/mach/regs-clock.h b/arch/arm/mach-s5p6442/include/mach/regs-clock.h
index d8360b5..61c694d 100644
--- a/arch/arm/mach-s5p6442/include/mach/regs-clock.h
+++ b/arch/arm/mach-s5p6442/include/mach/regs-clock.h
@@ -59,6 +59,8 @@
 #define S5P_CLK_MUX_STAT0	S5P_CLKREG(0x1100)
 #define S5P_CLK_MUX_STAT1	S5P_CLKREG(0x1104)
 
+#define S5P_SWRESET		S5P_CLKREG(0x2000)
+
 #define S5P_MDNIE_SEL		S5P_CLKREG(0x7008)
 
 /* Register Bit definition */
diff --git a/arch/arm/mach-s5p6442/include/mach/system.h b/arch/arm/mach-s5p6442/include/mach/system.h
index 8bcd8ed..974a8e9 100644
--- a/arch/arm/mach-s5p6442/include/mach/system.h
+++ b/arch/arm/mach-s5p6442/include/mach/system.h
@@ -13,6 +13,10 @@
 #ifndef __ASM_ARCH_SYSTEM_H
 #define __ASM_ARCH_SYSTEM_H __FILE__
 
+#include <linux/io.h>
+#include <mach/map.h>
+#include <mach/regs-clock.h>
+
 static void arch_idle(void)
 {
 	/* nothing here yet */
@@ -20,7 +24,7 @@ static void arch_idle(void)
 
 static void arch_reset(char mode, const char *cmd)
 {
-	/* nothing here yet */
+	__raw_writel(0x1, S5P_SWRESET);
 }
 
 #endif /* __ASM_ARCH_SYSTEM_H */
-- 
1.6.2.5
