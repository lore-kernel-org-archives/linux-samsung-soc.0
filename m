From: Ben Dooks <ben@simtec.co.uk>
Subject: [patch 2/3] ARM: S3C: Update Simtec copyright statements from , to -
Date: Fri, 13 Nov 2009 22:54:44 +0000
Message-ID: <20091113225514.161140653@fluff.org.uk>
References: <20091113225442.869542648@fluff.org.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from aeryn.fluff.org.uk ([87.194.8.8]:45358 "EHLO
	kira.home.fluff.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932332AbZKMWzK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Nov 2009 17:55:10 -0500
Content-Disposition: inline; filename=copyright-fix3.patch
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Simtec Linux Team <linux@simtec.co.uk>

There are a number of statements of the form A, B or A, B, C where
the numbers A,B,C are consecutive. Tidy these up to be A-B or A-C
as appropriate and to comply better with copyright standards [1]

[1] http://www.copyrightservice.co.uk/copyright/p03_copyright_notices
    section 4iii 'Year of publication'

Signed-off-by: Ben Dooks <ben@simtec.co.uk>
Signed-off-by: Simtec Linux Team <linux@simtec.co.uk>

---
 Documentation/arm/Samsung-S3C24XX/Overview.txt  |    2 +-
 arch/arm/mach-s3c2410/include/mach/bast-cpld.h  |    2 +-
 arch/arm/mach-s3c2410/include/mach/bast-irq.h   |    2 +-
 arch/arm/mach-s3c2410/include/mach/bast-map.h   |    2 +-
 arch/arm/mach-s3c2410/include/mach/bast-pmu.h   |    2 +-
 arch/arm/mach-s3c2410/include/mach/regs-clock.h |    4 ++--
 arch/arm/mach-s3c2410/include/mach/regs-gpio.h  |    4 ++--
 arch/arm/mach-s3c2410/include/mach/regs-power.h |    4 ++--
 arch/arm/mach-s3c2410/include/mach/vr1000-irq.h |    2 +-
 arch/arm/mach-s3c2410/pll.c                     |    2 +-
 arch/arm/mach-s3c2410/usb-simtec.c              |    2 +-
 arch/arm/mach-s3c2440/irq.c                     |    2 +-
 arch/arm/mach-s3c2440/mach-rx3715.c             |    2 +-
 arch/arm/mach-s3c2440/mach-smdk2440.c           |    2 +-
 arch/arm/mach-s3c24a0/include/mach/regs-clock.h |    4 ++--
 arch/arm/plat-s3c/dev-i2c0.c                    |    2 +-
 arch/arm/plat-s3c/dev-i2c1.c                    |    2 +-
 arch/arm/plat-s3c/include/plat/cpu-freq.h       |    2 +-
 arch/arm/plat-s3c/include/plat/regs-nand.h      |    4 ++--
 arch/arm/plat-s3c24xx/cpu-freq.c                |    2 +-
 arch/arm/plat-s3c24xx/dma.c                     |    4 ++--
 arch/arm/plat-s3c24xx/irq-pm.c                  |    2 +-
 arch/arm/plat-s3c24xx/irq.c                     |    2 +-
 arch/arm/plat-s3c24xx/s3c2440-pll-12000000.c    |    2 +-
 arch/arm/plat-s3c24xx/s3c244x-irq.c             |    2 +-
 25 files changed, 31 insertions(+), 31 deletions(-)

Index: b/arch/arm/mach-s3c2410/include/mach/bast-cpld.h
===================================================================
--- a/arch/arm/mach-s3c2410/include/mach/bast-cpld.h	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/mach-s3c2410/include/mach/bast-cpld.h	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* arch/arm/mach-s3c2410/include/mach/bast-cpld.h
  *
- * Copyright (c) 2003,2004 Simtec Electronics
+ * Copyright (c) 2003-2004 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * BAST - CPLD control constants
Index: b/arch/arm/mach-s3c2410/include/mach/bast-irq.h
===================================================================
--- a/arch/arm/mach-s3c2410/include/mach/bast-irq.h	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/mach-s3c2410/include/mach/bast-irq.h	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* arch/arm/mach-s3c2410/include/mach/bast-irq.h
  *
- * Copyright (c) 2003,2004 Simtec Electronics
+ * Copyright (c) 2003-2004 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * Machine BAST - IRQ Number definitions
Index: b/arch/arm/mach-s3c2410/include/mach/bast-map.h
===================================================================
--- a/arch/arm/mach-s3c2410/include/mach/bast-map.h	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/mach-s3c2410/include/mach/bast-map.h	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* arch/arm/mach-s3c2410/include/mach/bast-map.h
  *
- * Copyright (c) 2003,2004 Simtec Electronics
+ * Copyright (c) 2003-2004 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * Machine BAST - Memory map definitions
Index: b/arch/arm/mach-s3c2410/include/mach/regs-gpio.h
===================================================================
--- a/arch/arm/mach-s3c2410/include/mach/regs-gpio.h	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/mach-s3c2410/include/mach/regs-gpio.h	2009-11-10 15:09:41.000000000 +0000
@@ -1,7 +1,7 @@
 /* arch/arm/mach-s3c2410/include/mach/regs-gpio.h
  *
- * Copyright (c) 2003,2004 Simtec Electronics <linux@simtec.co.uk>
- *		           http://www.simtec.co.uk/products/SWLINUX/
+ * Copyright (c) 2003-2004 Simtec Electronics <linux@simtec.co.uk>
+ *	http://www.simtec.co.uk/products/SWLINUX/
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
Index: b/arch/arm/mach-s3c2410/include/mach/regs-power.h
===================================================================
--- a/arch/arm/mach-s3c2410/include/mach/regs-power.h	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/mach-s3c2410/include/mach/regs-power.h	2009-11-10 15:09:41.000000000 +0000
@@ -1,7 +1,7 @@
 /* arch/arm/mach-s3c2410/include/mach/regs-power.h
  *
- * Copyright (c) 2003,2004,2005,2006 Simtec Electronics <linux@simtec.co.uk>
- *		      http://armlinux.simtec.co.uk/
+ * Copyright (c) 2003-2006 Simtec Electronics <linux@simtec.co.uk>
+ *	http://armlinux.simtec.co.uk/
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
Index: b/arch/arm/mach-s3c2410/include/mach/vr1000-irq.h
===================================================================
--- a/arch/arm/mach-s3c2410/include/mach/vr1000-irq.h	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/mach-s3c2410/include/mach/vr1000-irq.h	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* arch/arm/mach-s3c2410/include/mach/vr1000-irq.h
  *
- * Copyright (c) 2003,2004 Simtec Electronics
+ * Copyright (c) 2003-2004 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * Machine VR1000 - IRQ Number definitions
Index: b/arch/arm/mach-s3c2440/mach-smdk2440.c
===================================================================
--- a/arch/arm/mach-s3c2440/mach-smdk2440.c	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/mach-s3c2440/mach-smdk2440.c	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s3c2440/mach-smdk2440.c
  *
- * Copyright (c) 2004,2005 Simtec Electronics
+ * Copyright (c) 2004-2005 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * http://www.fluff.org/ben/smdk2440/
Index: b/arch/arm/plat-s3c24xx/cpu-freq.c
===================================================================
--- a/arch/arm/plat-s3c24xx/cpu-freq.c	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/cpu-freq.c	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c24xx/cpu-freq.c
  *
- * Copyright (c) 2006,2007,2008 Simtec Electronics
+ * Copyright (c) 2006-2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
  *
Index: b/arch/arm/plat-s3c24xx/irq-pm.c
===================================================================
--- a/arch/arm/plat-s3c24xx/irq-pm.c	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/irq-pm.c	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c24xx/irq-om.c
  *
- * Copyright (c) 2003,2004 Simtec Electronics
+ * Copyright (c) 2003-2004 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *	http://armlinux.simtec.co.uk/
  *
Index: b/arch/arm/plat-s3c24xx/irq.c
===================================================================
--- a/arch/arm/plat-s3c24xx/irq.c	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/irq.c	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c24xx/irq.c
  *
- * Copyright (c) 2003,2004 Simtec Electronics 
+ * Copyright (c) 2003-2004 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * This program is free software; you can redistribute it and/or modify
Index: b/arch/arm/plat-s3c24xx/s3c2440-pll-12000000.c
===================================================================
--- a/arch/arm/plat-s3c24xx/s3c2440-pll-12000000.c	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/s3c2440-pll-12000000.c	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* arch/arm/plat-s3c24xx/s3c2440-pll-12000000.c
  *
- * Copyright (c) 2006,2007 Simtec Electronics
+ * Copyright (c) 2006-2007 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
  *	Vincent Sanders <vince@arm.linux.org.uk>
Index: b/arch/arm/plat-s3c24xx/s3c244x-irq.c
===================================================================
--- a/arch/arm/plat-s3c24xx/s3c244x-irq.c	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/s3c244x-irq.c	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c24xx/s3c244x-irq.c
  *
- * Copyright (c) 2003,2004 Simtec Electronics
+ * Copyright (c) 2003-2004 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * This program is free software; you can redistribute it and/or modify
Index: b/arch/arm/mach-s3c2410/include/mach/bast-pmu.h
===================================================================
--- a/arch/arm/mach-s3c2410/include/mach/bast-pmu.h	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/mach-s3c2410/include/mach/bast-pmu.h	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* arch/arm/mach-s3c2410/include/mach/bast-pmu.h
  *
- * Copyright (c) 2003,2004 Simtec Electronics
+ * Copyright (c) 2003-2004 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *	Vincent Sanders <vince@simtec.co.uk>
  *
Index: b/arch/arm/mach-s3c2410/include/mach/regs-clock.h
===================================================================
--- a/arch/arm/mach-s3c2410/include/mach/regs-clock.h	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/mach-s3c2410/include/mach/regs-clock.h	2009-11-10 15:09:41.000000000 +0000
@@ -1,7 +1,7 @@
 /* arch/arm/mach-s3c2410/include/mach/regs-clock.h
  *
- * Copyright (c) 2003,2004,2005,2006 Simtec Electronics <linux@simtec.co.uk>
- *		      http://armlinux.simtec.co.uk/
+ * Copyright (c) 2003-2006 Simtec Electronics <linux@simtec.co.uk>
+ *	http://armlinux.simtec.co.uk/
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
Index: b/arch/arm/mach-s3c2410/pll.c
===================================================================
--- a/arch/arm/mach-s3c2410/pll.c	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/mach-s3c2410/pll.c	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* arch/arm/mach-s3c2410/pll.c
  *
- * Copyright (c) 2006,2007 Simtec Electronics
+ * Copyright (c) 2006-2007 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
  *	Vincent Sanders <vince@arm.linux.org.uk>
Index: b/arch/arm/plat-s3c/include/plat/regs-nand.h
===================================================================
--- a/arch/arm/plat-s3c/include/plat/regs-nand.h	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/plat-s3c/include/plat/regs-nand.h	2009-11-10 15:09:41.000000000 +0000
@@ -1,7 +1,7 @@
 /* arch/arm/mach-s3c2410/include/mach/regs-nand.h
  *
- * Copyright (c) 2004,2005 Simtec Electronics <linux@simtec.co.uk>
- *		      http://www.simtec.co.uk/products/SWLINUX/
+ * Copyright (c) 2004-2005 Simtec Electronics <linux@simtec.co.uk>
+ *	http://www.simtec.co.uk/products/SWLINUX/
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
Index: b/arch/arm/mach-s3c24a0/include/mach/regs-clock.h
===================================================================
--- a/arch/arm/mach-s3c24a0/include/mach/regs-clock.h	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/mach-s3c24a0/include/mach/regs-clock.h	2009-11-10 15:09:41.000000000 +0000
@@ -1,7 +1,7 @@
 /* linux/arch/arm/mach-s3c24a0/include/mach/regs-clock.h
  *
- * Copyright (c) 2003,2004,2005,2006 Simtec Electronics <linux@simtec.co.uk>
- *		      http://armlinux.simtec.co.uk/
+ * Copyright (c) 2003-2006 Simtec Electronics <linux@simtec.co.uk>
+ *	http://armlinux.simtec.co.uk/
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
Index: b/arch/arm/mach-s3c2410/usb-simtec.c
===================================================================
--- a/arch/arm/mach-s3c2410/usb-simtec.c	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/mach-s3c2410/usb-simtec.c	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s3c2410/usb-simtec.c
  *
- * Copyright 2004,2005 Simtec Electronics
+ * Copyright 2004-2005 Simtec Electronics
  *   Ben Dooks <ben@simtec.co.uk>
  *
  * http://www.simtec.co.uk/products/EB2410ITX/
Index: b/arch/arm/plat-s3c/include/plat/cpu-freq.h
===================================================================
--- a/arch/arm/plat-s3c/include/plat/cpu-freq.h	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/plat-s3c/include/plat/cpu-freq.h	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* arch/arm/plat-s3c/include/plat/cpu-freq.h
  *
- * Copyright (c) 2006,2007 Simtec Electronics
+ * Copyright (c) 2006-2007 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
  *
Index: b/arch/arm/plat-s3c/dev-i2c0.c
===================================================================
--- a/arch/arm/plat-s3c/dev-i2c0.c	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/plat-s3c/dev-i2c0.c	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c/dev-i2c0.c
  *
- * Copyright 2008,2009 Simtec Electronics
+ * Copyright 2008-2009 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *	http://armlinux.simtec.co.uk/
  *
Index: b/arch/arm/plat-s3c/dev-i2c1.c
===================================================================
--- a/arch/arm/plat-s3c/dev-i2c1.c	2009-11-10 15:09:17.000000000 +0000
+++ b/arch/arm/plat-s3c/dev-i2c1.c	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c/dev-i2c1.c
  *
- * Copyright 2008,2009 Simtec Electronics
+ * Copyright 2008-2009 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *	http://armlinux.simtec.co.uk/
  *
Index: b/arch/arm/mach-s3c2440/irq.c
===================================================================
--- a/arch/arm/mach-s3c2440/irq.c	2009-11-10 15:09:13.000000000 +0000
+++ b/arch/arm/mach-s3c2440/irq.c	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s3c2440/irq.c
  *
- * Copyright (c) 2003,2004 Simtec Electronics
+ * Copyright (c) 2003-2004 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * This program is free software; you can redistribute it and/or modify
Index: b/arch/arm/mach-s3c2440/mach-rx3715.c
===================================================================
--- a/arch/arm/mach-s3c2440/mach-rx3715.c	2009-11-10 15:09:13.000000000 +0000
+++ b/arch/arm/mach-s3c2440/mach-rx3715.c	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s3c2440/mach-rx3715.c
  *
- * Copyright (c) 2003,2004 Simtec Electronics
+ * Copyright (c) 2003-2004 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * http://www.handhelds.org/projects/rx3715.html
Index: b/arch/arm/plat-s3c24xx/dma.c
===================================================================
--- a/arch/arm/plat-s3c24xx/dma.c	2009-11-10 15:09:14.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/dma.c	2009-11-10 15:09:41.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c24xx/dma.c
  *
- * Copyright 2003-2005,2006 Simtec Electronics
+ * Copyright 2003-2006 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * S3C2410 DMA core
@@ -1310,7 +1310,7 @@ int __init s3c24xx_dma_init(unsigned int
 	int channel;
 	int ret;
 
-	printk("S3C24XX DMA Driver, Copyright 2003-2004,2006 Simtec Electronics\n");
+	printk("S3C24XX DMA Driver, Copyright 2003-2006 Simtec Electronics\n");
 
 	dma_channels = channels;
 
Index: b/Documentation/arm/Samsung-S3C24XX/Overview.txt
===================================================================
--- a/Documentation/arm/Samsung-S3C24XX/Overview.txt	2009-11-10 15:09:13.000000000 +0000
+++ b/Documentation/arm/Samsung-S3C24XX/Overview.txt	2009-11-10 15:09:41.000000000 +0000
@@ -299,4 +299,4 @@ Port Contributors
 Document Author
 ---------------
 
-Ben Dooks, Copyright 2004-2005,2006 Simtec Electronics
+Ben Dooks, Copyright 2004-2006 Simtec Electronics
