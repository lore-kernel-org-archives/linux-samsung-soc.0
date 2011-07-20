From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 3/3] ARM: S3C64XX: Cleanup mach/regs-fb.h from mach-s3c64xx
Date: Wed, 20 Jul 2011 19:02:31 +0530
Message-ID: <1311168751-30336-4-git-send-email-ajaykumar.rs@samsung.com>
References: <1311168751-30336-1-git-send-email-ajaykumar.rs@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13897 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750979Ab1GTNhU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jul 2011 09:37:20 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOM00LB6WHUW270@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jul 2011 22:37:19 +0900 (KST)
Received: from Hawshines.sisodomain.com ([107.108.83.161])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOM00AJWWHWME@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jul 2011 22:37:20 +0900 (KST)
In-reply-to: <1311168751-30336-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jg1.han@samsung.com, m.szyprowski@samsung.com

Use plat/regs-fb-v4.h in machine files instead of mach/regs-fb.h.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/mach-s3c64xx/include/mach/regs-fb.h |   21 ---------------------
 arch/arm/mach-s3c64xx/mach-anw6410.c         |    2 +-
 arch/arm/mach-s3c64xx/mach-crag6410.c        |    2 +-
 arch/arm/mach-s3c64xx/mach-hmt.c             |    2 +-
 arch/arm/mach-s3c64xx/mach-mini6410.c        |    2 +-
 arch/arm/mach-s3c64xx/mach-ncp.c             |    2 +-
 arch/arm/mach-s3c64xx/mach-real6410.c        |    2 +-
 arch/arm/mach-s3c64xx/mach-smartq5.c         |    2 +-
 arch/arm/mach-s3c64xx/mach-smartq7.c         |    2 +-
 arch/arm/mach-s3c64xx/mach-smdk6410.c        |    2 +-
 arch/arm/mach-s3c64xx/setup-fb-24bpp.c       |    1 -
 11 files changed, 9 insertions(+), 31 deletions(-)
 delete mode 100644 arch/arm/mach-s3c64xx/include/mach/regs-fb.h

diff --git a/arch/arm/mach-s3c64xx/include/mach/regs-fb.h b/arch/arm/mach-s3c64xx/include/mach/regs-fb.h
deleted file mode 100644
index a06ee0a..0000000
--- a/arch/arm/mach-s3c64xx/include/mach/regs-fb.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/*
- * Copyright 2008 Openmoko, Inc.
- * Copyright 2008 Simtec Electronics
- * Copyright 2009 Samsung Electronics Co.
- *
- * Pawel Osciak <p.osciak@samsung.com>
- * Based on plat-s3c/include/plat/regs-fb.h by Ben Dooks <ben@simtec.co.uk>
- *
- * Framebuffer register definitions for Samsung S3C64xx.
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
-#endif /* __ASM_ARCH_MACH_REGS_FB_H */
diff --git a/arch/arm/mach-s3c64xx/mach-anw6410.c b/arch/arm/mach-s3c64xx/mach-anw6410.c
index a53cf14..cb88643 100644
--- a/arch/arm/mach-s3c64xx/mach-anw6410.c
+++ b/arch/arm/mach-s3c64xx/mach-anw6410.c
@@ -35,7 +35,6 @@
 #include <asm/mach/irq.h>
 
 #include <mach/hardware.h>
-#include <mach/regs-fb.h>
 #include <mach/map.h>
 
 #include <asm/irq.h>
@@ -44,6 +43,7 @@
 #include <plat/regs-serial.h>
 #include <plat/iic.h>
 #include <plat/fb.h>
+#include <plat/regs-fb-v4.h>
 
 #include <mach/s3c6410.h>
 #include <plat/clock.h>
diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
index ae51b17..c8d7b5d 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -44,7 +44,6 @@
 #include <mach/map.h>
 
 #include <mach/s3c6410.h>
-#include <mach/regs-fb.h>
 #include <mach/regs-sys.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-modem.h>
@@ -64,6 +63,7 @@
 #include <plat/adc.h>
 #include <plat/iic.h>
 #include <plat/pm.h>
+#include <plat/regs-fb-v4.h>
 
 #include <sound/wm8915.h>
 #include <sound/wm8962.h>
diff --git a/arch/arm/mach-s3c64xx/mach-hmt.c b/arch/arm/mach-s3c64xx/mach-hmt.c
index b263958..b3d93cc 100644
--- a/arch/arm/mach-s3c64xx/mach-hmt.c
+++ b/arch/arm/mach-s3c64xx/mach-hmt.c
@@ -27,7 +27,6 @@
 #include <asm/mach/irq.h>
 
 #include <mach/hardware.h>
-#include <mach/regs-fb.h>
 #include <mach/map.h>
 
 #include <asm/irq.h>
@@ -42,6 +41,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/regs-fb-v4.h>
 
 #define UCON S3C2410_UCON_DEFAULT
 #define ULCON (S3C2410_LCON_CS8 | S3C2410_LCON_PNONE)
diff --git a/arch/arm/mach-s3c64xx/mach-mini6410.c b/arch/arm/mach-s3c64xx/mach-mini6410.c
index 89f35e0..527f49b 100644
--- a/arch/arm/mach-s3c64xx/mach-mini6410.c
+++ b/arch/arm/mach-s3c64xx/mach-mini6410.c
@@ -29,7 +29,6 @@
 #include <asm/mach/map.h>
 
 #include <mach/map.h>
-#include <mach/regs-fb.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-modem.h>
 #include <mach/regs-srom.h>
@@ -42,6 +41,7 @@
 #include <plat/nand.h>
 #include <plat/regs-serial.h>
 #include <plat/ts.h>
+#include <plat/regs-fb-v4.h>
 
 #include <video/platform_lcd.h>
 
diff --git a/arch/arm/mach-s3c64xx/mach-ncp.c b/arch/arm/mach-s3c64xx/mach-ncp.c
index c498649..01c6857 100644
--- a/arch/arm/mach-s3c64xx/mach-ncp.c
+++ b/arch/arm/mach-s3c64xx/mach-ncp.c
@@ -30,7 +30,6 @@
 #include <asm/mach/irq.h>
 
 #include <mach/hardware.h>
-#include <mach/regs-fb.h>
 #include <mach/map.h>
 
 #include <asm/irq.h>
@@ -44,6 +43,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/regs-fb-v4.h>
 
 #define UCON S3C2410_UCON_DEFAULT
 #define ULCON S3C2410_LCON_CS8 | S3C2410_LCON_PNONE
diff --git a/arch/arm/mach-s3c64xx/mach-real6410.c b/arch/arm/mach-s3c64xx/mach-real6410.c
index 4957ab0..95b04b1 100644
--- a/arch/arm/mach-s3c64xx/mach-real6410.c
+++ b/arch/arm/mach-s3c64xx/mach-real6410.c
@@ -30,7 +30,6 @@
 #include <asm/mach/map.h>
 
 #include <mach/map.h>
-#include <mach/regs-fb.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-modem.h>
 #include <mach/regs-srom.h>
@@ -43,6 +42,7 @@
 #include <plat/nand.h>
 #include <plat/regs-serial.h>
 #include <plat/ts.h>
+#include <plat/regs-fb-v4.h>
 
 #include <video/platform_lcd.h>
 
diff --git a/arch/arm/mach-s3c64xx/mach-smartq5.c b/arch/arm/mach-s3c64xx/mach-smartq5.c
index 3a3e5ac..342e8df 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq5.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq5.c
@@ -21,7 +21,6 @@
 #include <asm/mach/arch.h>
 
 #include <mach/map.h>
-#include <mach/regs-fb.h>
 #include <mach/regs-gpio.h>
 #include <mach/s3c6410.h>
 
@@ -29,6 +28,7 @@
 #include <plat/devs.h>
 #include <plat/fb.h>
 #include <plat/gpio-cfg.h>
+#include <plat/regs-fb-v4.h>
 
 #include "mach-smartq.h"
 
diff --git a/arch/arm/mach-s3c64xx/mach-smartq7.c b/arch/arm/mach-s3c64xx/mach-smartq7.c
index e653758..5796397 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq7.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq7.c
@@ -21,7 +21,6 @@
 #include <asm/mach/arch.h>
 
 #include <mach/map.h>
-#include <mach/regs-fb.h>
 #include <mach/regs-gpio.h>
 #include <mach/s3c6410.h>
 
@@ -29,6 +28,7 @@
 #include <plat/devs.h>
 #include <plat/fb.h>
 #include <plat/gpio-cfg.h>
+#include <plat/regs-fb-v4.h>
 
 #include "mach-smartq.h"
 
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-s3c64xx/mach-smdk6410.c
index e0521e0..209c9b5 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@ -48,7 +48,6 @@
 #include <asm/mach/irq.h>
 
 #include <mach/hardware.h>
-#include <mach/regs-fb.h>
 #include <mach/map.h>
 
 #include <asm/irq.h>
@@ -71,6 +70,7 @@
 #include <plat/adc.h>
 #include <plat/ts.h>
 #include <plat/keypad.h>
+#include <plat/regs-fb-v4.h>
 
 #define UCON S3C2410_UCON_DEFAULT | S3C2410_UCON_UCLK
 #define ULCON S3C2410_LCON_CS8 | S3C2410_LCON_PNONE | S3C2410_LCON_STOPB
diff --git a/arch/arm/mach-s3c64xx/setup-fb-24bpp.c b/arch/arm/mach-s3c64xx/setup-fb-24bpp.c
index 8f30911..83d2afb 100644
--- a/arch/arm/mach-s3c64xx/setup-fb-24bpp.c
+++ b/arch/arm/mach-s3c64xx/setup-fb-24bpp.c
@@ -17,7 +17,6 @@
 #include <linux/fb.h>
 #include <linux/gpio.h>
 
-#include <mach/regs-fb.h>
 #include <plat/fb.h>
 #include <plat/gpio-cfg.h>
 
-- 
1.7.0.4
