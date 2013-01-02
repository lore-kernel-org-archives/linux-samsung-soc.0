From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 19/26] ARM: S3C24XX: remove idle.h
Date: Wed, 02 Jan 2013 14:23:56 -0800
Message-ID: <1357165443-3716-20-git-send-email-kgene.kim@samsung.com>
References: <1357165443-3716-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41067 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752757Ab3ABWY7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 17:24:59 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MG000B7VRKLFV10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:24:58 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MG00028PRKVD920@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:24:58 +0900 (KST)
In-reply-to: <1357165443-3716-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

The <mach/idle.h> is no longer used.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s3c24xx/include/mach/idle.h |   24 ------------------------
 arch/arm/mach-s3c24xx/mach-smdk2413.c     |    1 -
 arch/arm/mach-s3c24xx/mach-smdk2416.c     |    1 -
 arch/arm/mach-s3c24xx/mach-smdk2440.c     |    1 -
 arch/arm/mach-s3c24xx/mach-smdk2443.c     |    1 -
 arch/arm/mach-s3c24xx/mach-vstms.c        |    1 -
 6 files changed, 29 deletions(-)
 delete mode 100644 arch/arm/mach-s3c24xx/include/mach/idle.h

diff --git a/arch/arm/mach-s3c24xx/include/mach/idle.h b/arch/arm/mach-s3c24xx/include/mach/idle.h
deleted file mode 100644
index e9ddd70..0000000
--- a/arch/arm/mach-s3c24xx/include/mach/idle.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* arch/arm/mach-s3c2410/include/mach/idle.h
- *
- * Copyright (c) 2004 Simtec Electronics <linux@simtec.co.uk>
- *		http://www.simtec.co.uk/products/SWLINUX/
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * S3C2410 CPU Idle controls
-*/
-
-#ifndef __ASM_ARCH_IDLE_H
-#define __ASM_ARCH_IDLE_H __FILE__
-
-/* This allows the over-ride of the default idle code, in case there
- * is any other things to be done over idle (like DVS)
-*/
-
-extern void (*s3c24xx_idle)(void);
-
-extern void s3c24xx_default_idle(void);
-
-#endif /* __ASM_ARCH_IDLE_H */
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2413.c b/arch/arm/mach-s3c24xx/mach-smdk2413.c
index ce99fd8..b9d5703 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2413.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2413.c
@@ -37,7 +37,6 @@
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
 
-#include <mach/idle.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <mach/fb.h>
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2416.c b/arch/arm/mach-s3c24xx/mach-smdk2416.c
index f30d7fc..7de4120 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2416.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2416.c
@@ -39,7 +39,6 @@
 #include <mach/regs-lcd.h>
 #include <mach/regs-s3c2443-clock.h>
 
-#include <mach/idle.h>
 #include <linux/platform_data/leds-s3c24xx.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2440.c b/arch/arm/mach-s3c24xx/mach-smdk2440.c
index b7ff882..0bba786 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2440.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2440.c
@@ -35,7 +35,6 @@
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
 
-#include <mach/idle.h>
 #include <mach/fb.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2443.c b/arch/arm/mach-s3c24xx/mach-smdk2443.c
index 2568656..c6d1a03 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2443.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2443.c
@@ -35,7 +35,6 @@
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
 
-#include <mach/idle.h>
 #include <mach/fb.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-vstms.c b/arch/arm/mach-s3c24xx/mach-vstms.c
index f1d44ae..eef559c 100644
--- a/arch/arm/mach-s3c24xx/mach-vstms.c
+++ b/arch/arm/mach-s3c24xx/mach-vstms.c
@@ -36,7 +36,6 @@
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
 
-#include <mach/idle.h>
 #include <mach/fb.h>
 
 #include <linux/platform_data/i2c-s3c2410.h>
-- 
1.7.10.4
