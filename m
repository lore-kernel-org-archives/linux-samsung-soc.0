From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 2/3] ARM: S5PV210: Cleanup mach/regs-fb.h from mach-s5pv210
Date: Wed, 20 Jul 2011 19:02:30 +0530
Message-ID: <1311168751-30336-3-git-send-email-ajaykumar.rs@samsung.com>
References: <1311168751-30336-1-git-send-email-ajaykumar.rs@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13897 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751302Ab1GTNhT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jul 2011 09:37:19 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOM00LB6WHUW270@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jul 2011 22:37:18 +0900 (KST)
Received: from Hawshines.sisodomain.com ([107.108.83.161])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOM00AJWWHWME@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jul 2011 22:37:19 +0900 (KST)
In-reply-to: <1311168751-30336-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jg1.han@samsung.com, m.szyprowski@samsung.com

Use plat/regs-fb-v4.h in machine files instead of mach/regs-fb.h.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/mach-s5pv210/include/mach/regs-fb.h |   21 ---------------------
 arch/arm/mach-s5pv210/mach-aquila.c          |    2 +-
 arch/arm/mach-s5pv210/mach-goni.c            |    2 +-
 arch/arm/mach-s5pv210/mach-smdkv210.c        |    2 +-
 arch/arm/mach-s5pv210/setup-fb-24bpp.c       |    1 -
 5 files changed, 3 insertions(+), 25 deletions(-)
 delete mode 100644 arch/arm/mach-s5pv210/include/mach/regs-fb.h

diff --git a/arch/arm/mach-s5pv210/include/mach/regs-fb.h b/arch/arm/mach-s5pv210/include/mach/regs-fb.h
deleted file mode 100644
index 60d9929..0000000
--- a/arch/arm/mach-s5pv210/include/mach/regs-fb.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* 
- * Copyright 2010 Ben Dooks <ben-linux@fluff.org>
- *
- * Dummy framebuffer to allow build for the moment.
- * 
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#ifndef __ASM_ARCH_MACH_REGS_FB_H
-#define __ASM_ARCH_MACH_REGS_FB_H __FILE__
-
-#include <plat/regs-fb-v4.h>
-
-static inline unsigned int s3c_fb_pal_reg(unsigned int window, int reg)
-{
-	return 0x2400 + (window * 256 *4 ) + reg;
-}
-
-#endif /* __ASM_ARCH_MACH_REGS_FB_H */
diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index 4e1d8ff..509627f 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -29,7 +29,6 @@
 
 #include <mach/map.h>
 #include <mach/regs-clock.h>
-#include <mach/regs-fb.h>
 
 #include <plat/gpio-cfg.h>
 #include <plat/regs-serial.h>
@@ -40,6 +39,7 @@
 #include <plat/fimc-core.h>
 #include <plat/sdhci.h>
 #include <plat/s5p-time.h>
+#include <plat/regs-fb-v4.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define AQUILA_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 31d5aa7..e0c4d06 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -34,7 +34,6 @@
 
 #include <mach/map.h>
 #include <mach/regs-clock.h>
-#include <mach/regs-fb.h>
 
 #include <plat/gpio-cfg.h>
 #include <plat/regs-serial.h>
@@ -47,6 +46,7 @@
 #include <plat/sdhci.h>
 #include <plat/clock.h>
 #include <plat/s5p-time.h>
+#include <plat/regs-fb-v4.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define GONI_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index c6a9e86..9ccab15 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -29,7 +29,6 @@
 
 #include <mach/map.h>
 #include <mach/regs-clock.h>
-#include <mach/regs-fb.h>
 
 #include <plat/regs-serial.h>
 #include <plat/regs-srom.h>
@@ -45,6 +44,7 @@
 #include <plat/pm.h>
 #include <plat/fb.h>
 #include <plat/s5p-time.h>
+#include <plat/regs-fb-v4.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define SMDKV210_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
diff --git a/arch/arm/mach-s5pv210/setup-fb-24bpp.c b/arch/arm/mach-s5pv210/setup-fb-24bpp.c
index e932ebf..55103c8 100644
--- a/arch/arm/mach-s5pv210/setup-fb-24bpp.c
+++ b/arch/arm/mach-s5pv210/setup-fb-24bpp.c
@@ -15,7 +15,6 @@
 #include <linux/fb.h>
 #include <linux/gpio.h>
 
-#include <mach/regs-fb.h>
 #include <mach/map.h>
 #include <plat/fb.h>
 #include <mach/regs-clock.h>
-- 
1.7.0.4
