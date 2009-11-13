From: Ben Dooks <ben@simtec.co.uk>
Subject: [patch 3/3] ARM: S3C: Update Simtec copyright statements from , to - [2]
Date: Fri, 13 Nov 2009 22:54:45 +0000
Message-ID: <20091113225514.307605452@fluff.org.uk>
References: <20091113225442.869542648@fluff.org.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from aeryn.fluff.org.uk ([87.194.8.8]:45361 "EHLO
	kira.home.fluff.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932406AbZKMWzN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Nov 2009 17:55:13 -0500
Content-Disposition: inline; filename=copyright-fix4.patch
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Simtec Linux Team <linux@simtec.co.uk>

There are a number of statements of the form A, B or A, B, C where
the numbers A,B,C are not consecutive. However, referencing [1] it
is the correct thing to replace these with A-B or A-C as apropriate.

[1] http://www.copyrightservice.co.uk/copyright/p03_copyright_notices
    section 4iii 'Year of publication'

Signed-off-by: Ben Dooks <ben@simtec.co.uk>
Signed-off-by: Simtec Linux Team <linux@simtec.co.uk>

---
 arch/arm/mach-s3c2400/include/mach/map.h           |    2 +-
 arch/arm/mach-s3c2410/bast-irq.c                   |    2 +-
 arch/arm/mach-s3c2410/cpu-freq.c                   |    2 +-
 arch/arm/mach-s3c2410/include/mach/dma.h           |    2 +-
 arch/arm/mach-s3c2410/include/mach/gpio-fns.h      |    2 +-
 arch/arm/mach-s3c2410/include/mach/uncompress.h    |    3 +--
 arch/arm/mach-s3c2410/mach-bast.c                  |    4 ++--
 arch/arm/mach-s3c2410/mach-vr1000.c                |    2 +-
 arch/arm/mach-s3c2440/mach-osiris.c                |    2 +-
 arch/arm/mach-s3c24a0/include/mach/map.h           |    2 +-
 arch/arm/plat-s3c/dma.c                            |    2 +-
 arch/arm/plat-s3c/include/plat/dma.h               |    2 +-
 arch/arm/plat-s3c/include/plat/iic.h               |    2 +-
 arch/arm/plat-s3c/pm-check.c                       |    2 +-
 arch/arm/plat-s3c/pm.c                             |    2 +-
 arch/arm/plat-s3c24xx/clock-dclk.c                 |    2 +-
 arch/arm/plat-s3c24xx/include/plat/cpu-freq-core.h |    2 +-
 arch/arm/plat-s3c24xx/include/plat/regs-dma.h      |    2 +-
 arch/arm/plat-s3c24xx/pm.c                         |    2 +-
 arch/arm/plat-s3c24xx/s3c2410-iotiming.c           |    2 +-
 arch/arm/plat-s3c24xx/s3c2412-iotiming.c           |    2 +-
 arch/arm/plat-s3c24xx/s3c2440-cpufreq.c            |    2 +-
 arch/arm/plat-s3c24xx/s3c244x-clock.c              |    2 +-
 drivers/serial/s3c2410.c                           |    2 +-
 drivers/serial/s3c2412.c                           |    2 +-
 drivers/serial/s3c2440.c                           |    2 +-
 drivers/serial/s3c24a0.c                           |    2 +-
 drivers/serial/samsung.c                           |    2 +-
 drivers/serial/samsung.h                           |    2 +-
 29 files changed, 30 insertions(+), 31 deletions(-)


Index: b/arch/arm/plat-s3c24xx/clock-dclk.c
===================================================================
--- a/arch/arm/plat-s3c24xx/clock-dclk.c	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/clock-dclk.c	2009-11-13 22:52:53.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c24xx/clock-dclk.c
  *
- * Copyright (c) 2004,2008 Simtec Electronics
+ * Copyright (c) 2004-2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *	http://armlinux.simtec.co.uk/
  *
Index: b/arch/arm/plat-s3c24xx/include/plat/cpu-freq-core.h
===================================================================
--- a/arch/arm/plat-s3c24xx/include/plat/cpu-freq-core.h	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/include/plat/cpu-freq-core.h	2009-11-13 22:52:53.000000000 +0000
@@ -1,6 +1,6 @@
 /* arch/arm/plat-s3c/include/plat/cpu-freq.h
  *
- * Copyright (c) 2006,2007,2009 Simtec Electronics
+ * Copyright (c) 2006-2009 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
  *
Index: b/arch/arm/plat-s3c24xx/pm.c
===================================================================
--- a/arch/arm/plat-s3c24xx/pm.c	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/pm.c	2009-11-13 22:52:53.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c24xx/pm.c
  *
- * Copyright (c) 2004,2006 Simtec Electronics
+ * Copyright (c) 2004-2006 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * S3C24XX Power Manager (Suspend-To-RAM) support
Index: b/arch/arm/plat-s3c24xx/s3c2440-cpufreq.c
===================================================================
--- a/arch/arm/plat-s3c24xx/s3c2440-cpufreq.c	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/s3c2440-cpufreq.c	2009-11-13 22:52:53.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c24xx/s3c2440-cpufreq.c
  *
- * Copyright (c) 2006,2008,2009 Simtec Electronics
+ * Copyright (c) 2006-2009 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
  *	Vincent Sanders <vince@simtec.co.uk>
Index: b/arch/arm/mach-s3c2410/include/mach/uncompress.h
===================================================================
--- a/arch/arm/mach-s3c2410/include/mach/uncompress.h	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/mach-s3c2410/include/mach/uncompress.h	2009-11-13 22:52:53.000000000 +0000
@@ -1,7 +1,6 @@
-
 /* arch/arm/mach-s3c2410/include/mach/uncompress.h
  *
- * Copyright (c) 2003, 2007 Simtec Electronics
+ * Copyright (c) 2003-2007 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
  *
Index: b/arch/arm/mach-s3c2410/cpu-freq.c
===================================================================
--- a/arch/arm/mach-s3c2410/cpu-freq.c	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/mach-s3c2410/cpu-freq.c	2009-11-13 22:52:53.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s3c2410/cpu-freq.c
  *
- * Copyright (c) 2006,2008 Simtec Electronics
+ * Copyright (c) 2006-2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
  *
Index: b/arch/arm/mach-s3c2410/mach-vr1000.c
===================================================================
--- a/arch/arm/mach-s3c2410/mach-vr1000.c	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/mach-s3c2410/mach-vr1000.c	2009-11-13 22:52:53.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s3c2410/mach-vr1000.c
  *
- * Copyright (c) 2003-2005,2008 Simtec Electronics
+ * Copyright (c) 2003-2008 Simtec Electronics
  *   Ben Dooks <ben@simtec.co.uk>
  *
  * Machine support for Thorcom VR1000 board. Designed for Thorcom by
Index: b/arch/arm/plat-s3c/dma.c
===================================================================
--- a/arch/arm/plat-s3c/dma.c	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/plat-s3c/dma.c	2009-11-13 22:52:53.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c/dma.c
  *
- * Copyright (c) 2003-2005,2006,2009 Simtec Electronics
+ * Copyright (c) 2003-2009 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *	http://armlinux.simtec.co.uk/
  *
Index: b/arch/arm/plat-s3c/pm-check.c
===================================================================
--- a/arch/arm/plat-s3c/pm-check.c	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/plat-s3c/pm-check.c	2009-11-13 22:52:54.000000000 +0000
@@ -1,7 +1,7 @@
 /* linux/arch/arm/plat-s3c/pm-check.c
  *  originally in linux/arch/arm/plat-s3c24xx/pm.c
  *
- * Copyright (c) 2004,2006,2008 Simtec Electronics
+ * Copyright (c) 2004-2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk
  *	Ben Dooks <ben@simtec.co.uk>
  *
Index: b/arch/arm/mach-s3c24a0/include/mach/map.h
===================================================================
--- a/arch/arm/mach-s3c24a0/include/mach/map.h	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/mach-s3c24a0/include/mach/map.h	2009-11-13 22:52:54.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s3c24a0/include/mach/map.h
  *
- * Copyright 2003,2007  Simtec Electronics
+ * Copyright 2003-2007  Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
  *
Index: b/arch/arm/mach-s3c2410/include/mach/gpio-fns.h
===================================================================
--- a/arch/arm/mach-s3c2410/include/mach/gpio-fns.h	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/mach-s3c2410/include/mach/gpio-fns.h	2009-11-13 22:52:54.000000000 +0000
@@ -1,6 +1,6 @@
 /* arch/arm/mach-s3c2410/include/mach/gpio-fns.h
  *
- * Copyright (c) 2003,2009 Simtec Electronics
+ * Copyright (c) 2003-2009 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * S3C2410 - hardware
Index: b/arch/arm/mach-s3c2410/include/mach/dma.h
===================================================================
--- a/arch/arm/mach-s3c2410/include/mach/dma.h	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/mach-s3c2410/include/mach/dma.h	2009-11-13 22:52:54.000000000 +0000
@@ -1,6 +1,6 @@
 /* arch/arm/mach-s3c2410/include/mach/dma.h
  *
- * Copyright (C) 2003,2004,2006 Simtec Electronics
+ * Copyright (C) 2003-2006 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * Samsung S3C24XX DMA support
Index: b/arch/arm/mach-s3c2410/bast-irq.c
===================================================================
--- a/arch/arm/mach-s3c2410/bast-irq.c	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/mach-s3c2410/bast-irq.c	2009-11-13 22:52:54.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s3c2410/bast-irq.c
  *
- * Copyright 2003,2005 Simtec Electronics
+ * Copyright 2003-2005 Simtec Electronics
  *   Ben Dooks <ben@simtec.co.uk>
  *
  * http://www.simtec.co.uk/products/EB2410ITX/
Index: b/arch/arm/plat-s3c/include/plat/iic.h
===================================================================
--- a/arch/arm/plat-s3c/include/plat/iic.h	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/plat-s3c/include/plat/iic.h	2009-11-13 22:52:54.000000000 +0000
@@ -1,6 +1,6 @@
 /* arch/arm/plat-s3c/include/plat/iic.h
  *
- * Copyright 2004,2009 Simtec Electronics
+ * Copyright 2004-2009 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * S3C - I2C Controller platform_device info
Index: b/arch/arm/plat-s3c/include/plat/dma.h
===================================================================
--- a/arch/arm/plat-s3c/include/plat/dma.h	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/plat-s3c/include/plat/dma.h	2009-11-13 22:52:54.000000000 +0000
@@ -1,6 +1,6 @@
 /* arch/arm/plat-s3c/include/plat/dma.h
  *
- * Copyright (C) 2003,2004,2006 Simtec Electronics
+ * Copyright (C) 2003-2006 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * Samsung S3C DMA support
Index: b/arch/arm/plat-s3c/pm.c
===================================================================
--- a/arch/arm/plat-s3c/pm.c	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/plat-s3c/pm.c	2009-11-13 22:52:54.000000000 +0000
@@ -1,7 +1,7 @@
 /* linux/arch/arm/plat-s3c/pm.c
  *
  * Copyright 2008 Openmoko, Inc.
- * Copyright 2004,2006,2008 Simtec Electronics
+ * Copyright 2004-2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *	http://armlinux.simtec.co.uk/
  *
Index: b/arch/arm/plat-s3c24xx/include/plat/regs-dma.h
===================================================================
--- a/arch/arm/plat-s3c24xx/include/plat/regs-dma.h	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/include/plat/regs-dma.h	2009-11-13 22:52:54.000000000 +0000
@@ -1,6 +1,6 @@
 /* arch/arm/mach-s3c2410/include/mach/dma.h
  *
- * Copyright (C) 2003,2004,2006 Simtec Electronics
+ * Copyright (C) 2003-2006 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * Samsung S3C24XX DMA support
Index: b/arch/arm/plat-s3c24xx/s3c2412-iotiming.c
===================================================================
--- a/arch/arm/plat-s3c24xx/s3c2412-iotiming.c	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/s3c2412-iotiming.c	2009-11-13 22:52:54.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c24xx/s3c2412-iotiming.c
  *
- * Copyright (c) 2006,2008 Simtec Electronics
+ * Copyright (c) 2006-2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
  *
Index: b/arch/arm/mach-s3c2440/mach-osiris.c
===================================================================
--- a/arch/arm/mach-s3c2440/mach-osiris.c	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/mach-s3c2440/mach-osiris.c	2009-11-13 22:52:54.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s3c2440/mach-osiris.c
  *
- * Copyright (c) 2005,2008 Simtec Electronics
+ * Copyright (c) 2005-2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
  *
Index: b/arch/arm/plat-s3c24xx/s3c2410-iotiming.c
===================================================================
--- a/arch/arm/plat-s3c24xx/s3c2410-iotiming.c	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/s3c2410-iotiming.c	2009-11-13 22:52:54.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c24xx/s3c2410-iotiming.c
  *
- * Copyright (c) 2006,2008,2009 Simtec Electronics
+ * Copyright (c) 2006-2009 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
  *
Index: b/arch/arm/plat-s3c24xx/s3c244x-clock.c
===================================================================
--- a/arch/arm/plat-s3c24xx/s3c244x-clock.c	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/s3c244x-clock.c	2009-11-13 22:52:54.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c24xx/s3c24xx-clock.c
  *
- * Copyright (c) 2004-2005,2008 Simtec Electronics
+ * Copyright (c) 2004-2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
  *
Index: b/arch/arm/mach-s3c2400/include/mach/map.h
===================================================================
--- a/arch/arm/mach-s3c2400/include/mach/map.h	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/mach-s3c2400/include/mach/map.h	2009-11-13 22:52:54.000000000 +0000
@@ -1,6 +1,6 @@
 /* arch/arm/mach-s3c2400/include/mach/map.h
  *
- * Copyright 2003,2007  Simtec Electronics
+ * Copyright 2003-2007 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
  *
Index: b/arch/arm/mach-s3c2410/mach-bast.c
===================================================================
--- a/arch/arm/mach-s3c2410/mach-bast.c	2009-11-13 22:51:56.000000000 +0000
+++ b/arch/arm/mach-s3c2410/mach-bast.c	2009-11-13 22:52:54.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s3c2410/mach-bast.c
  *
- * Copyright 2003-2005,2008 Simtec Electronics
+ * Copyright 2003-2008 Simtec Electronics
  *   Ben Dooks <ben@simtec.co.uk>
  *
  * http://www.simtec.co.uk/products/EB2410ITX/
@@ -66,7 +66,7 @@
 #include "usb-simtec.h"
 #include "nor-simtec.h"
 
-#define COPYRIGHT ", Copyright 2004-2005 Simtec Electronics"
+#define COPYRIGHT ", Copyright 2004-2008 Simtec Electronics"
 
 /* macros for virtual address mods for the io space entries */
 #define VA_C5(item) ((unsigned long)(item) + BAST_VAM_CS5)
Index: b/drivers/serial/s3c2440.c
===================================================================
--- a/drivers/serial/s3c2440.c	2009-11-13 22:51:56.000000000 +0000
+++ b/drivers/serial/s3c2440.c	2009-11-13 22:52:54.000000000 +0000
@@ -2,7 +2,7 @@
  *
  * Driver for Samsung S3C2440 and S3C2442 SoC onboard UARTs.
  *
- * Ben Dooks, Copyright (c) 2003-2005,2008 Simtec Electronics
+ * Ben Dooks, Copyright (c) 2003-2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *
  * This program is free software; you can redistribute it and/or modify
Index: b/drivers/serial/s3c24a0.c
===================================================================
--- a/drivers/serial/s3c24a0.c	2009-11-13 22:51:56.000000000 +0000
+++ b/drivers/serial/s3c24a0.c	2009-11-13 22:52:54.000000000 +0000
@@ -6,7 +6,7 @@
  *
  * Author: Sandeep Patil <sandeep.patil@azingo.com>
  *
- * Ben Dooks, Copyright (c) 2003-2005,2008 Simtec Electronics
+ * Ben Dooks, Copyright (c) 2003-2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *
  * This program is free software; you can redistribute it and/or modify
Index: b/drivers/serial/samsung.c
===================================================================
--- a/drivers/serial/samsung.c	2009-11-13 22:51:56.000000000 +0000
+++ b/drivers/serial/samsung.c	2009-11-13 22:52:54.000000000 +0000
@@ -2,7 +2,7 @@
  *
  * Driver core for Samsung SoC onboard UARTs.
  *
- * Ben Dooks, Copyright (c) 2003-2005,2008 Simtec Electronics
+ * Ben Dooks, Copyright (c) 2003-2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *
  * This program is free software; you can redistribute it and/or modify
Index: b/drivers/serial/samsung.h
===================================================================
--- a/drivers/serial/samsung.h	2009-11-13 22:51:56.000000000 +0000
+++ b/drivers/serial/samsung.h	2009-11-13 22:52:54.000000000 +0000
@@ -2,7 +2,7 @@
  *
  * Driver for Samsung SoC onboard UARTs.
  *
- * Ben Dooks, Copyright (c) 2003-2005,2008 Simtec Electronics
+ * Ben Dooks, Copyright (c) 2003-2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *
  * This program is free software; you can redistribute it and/or modify
Index: b/drivers/serial/s3c2410.c
===================================================================
--- a/drivers/serial/s3c2410.c	2009-11-13 22:51:56.000000000 +0000
+++ b/drivers/serial/s3c2410.c	2009-11-13 22:52:54.000000000 +0000
@@ -2,7 +2,7 @@
  *
  * Driver for Samsung S3C2410 SoC onboard UARTs.
  *
- * Ben Dooks, Copyright (c) 2003-2005,2008 Simtec Electronics
+ * Ben Dooks, Copyright (c) 2003-2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *
  * This program is free software; you can redistribute it and/or modify
Index: b/drivers/serial/s3c2412.c
===================================================================
--- a/drivers/serial/s3c2412.c	2009-11-13 22:51:56.000000000 +0000
+++ b/drivers/serial/s3c2412.c	2009-11-13 22:52:54.000000000 +0000
@@ -2,7 +2,7 @@
  *
  * Driver for Samsung S3C2412 and S3C2413 SoC onboard UARTs.
  *
- * Ben Dooks, Copyright (c) 2003-2005,2008 Simtec Electronics
+ * Ben Dooks, Copyright (c) 2003-2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *
  * This program is free software; you can redistribute it and/or modify
