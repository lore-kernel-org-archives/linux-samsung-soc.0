From: Ben Dooks <ben@simtec.co.uk>
Subject: [patch 1/3] ARM: S3C: Fix Simtec copyright statements in Documentation/S3C24XX
Date: Fri, 13 Nov 2009 22:54:43 +0000
Message-ID: <20091113225514.015935853@fluff.org.uk>
References: <20091113225442.869542648@fluff.org.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from aeryn.fluff.org.uk ([87.194.8.8]:45363 "EHLO
	kira.home.fluff.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932350AbZKMWzO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Nov 2009 17:55:14 -0500
Content-Disposition: inline; filename=copyright-fix1.patch
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Simtec Linux Team <linux@simtec.co.uk>

The (c) alone is not a sufficient copyright statement, nor is it a
good replacement for the proper encircled &copy; symbol [1]. Add the
word copyright to the apropriate places and remove the (c) symbol.

[1] http://www.copyrightservice.co.uk/copyright/p03_copyright_notices
    section 4 'What does a notice consist of?'

Signed-off-by: Ben Dooks <ben@simtec.co.uk>
Signed-off-by: Simtec Linux Team <linux@simtec.co.uk>

---
 Documentation/arm/Samsung-S3C24XX/EB2410ITX.txt |    2 +-
 Documentation/arm/Samsung-S3C24XX/GPIO.txt      |    2 +-
 Documentation/arm/Samsung-S3C24XX/Overview.txt  |    2 +-
 Documentation/arm/Samsung-S3C24XX/S3C2412.txt   |    2 +-
 Documentation/arm/Samsung-S3C24XX/S3C2413.txt   |    2 +-
 Documentation/arm/Samsung-S3C24XX/Suspend.txt   |    2 +-
 Documentation/arm/Samsung-S3C24XX/USB-Host.txt  |    2 +-
 arch/arm/mach-s3c2410/bast-irq.c                |    4 ++--
 arch/arm/mach-s3c2410/include/mach/osiris-map.h |    2 +-
 arch/arm/mach-s3c2410/mach-bast.c               |    4 ++--
 arch/arm/mach-s3c2410/usb-simtec.c              |    4 ++--
 arch/arm/mach-s3c2440/mach-anubis.c             |    4 ++--
 arch/arm/plat-s3c/clock.c                       |    4 ++--
 arch/arm/plat-s3c/include/plat/regs-serial.h    |    2 +-
 arch/arm/plat-s3c24xx/dma.c                     |    4 ++--
 arch/arm/plat-s3c24xx/pm-simtec.c               |    4 ++--
 16 files changed, 23 insertions(+), 23 deletions(-)

Index: b/Documentation/arm/Samsung-S3C24XX/GPIO.txt
===================================================================
--- a/Documentation/arm/Samsung-S3C24XX/GPIO.txt	2009-11-10 15:53:56.000000000 +0000
+++ b/Documentation/arm/Samsung-S3C24XX/GPIO.txt	2009-11-10 15:54:04.000000000 +0000
@@ -134,4 +134,4 @@ Authour
 
 
 Ben Dooks, 03 October 2004
-(c) 2004 Ben Dooks, Simtec Electronics
+Copyright 2004 Ben Dooks, Simtec Electronics
Index: b/Documentation/arm/Samsung-S3C24XX/Overview.txt
===================================================================
--- a/Documentation/arm/Samsung-S3C24XX/Overview.txt	2009-11-10 15:53:56.000000000 +0000
+++ b/Documentation/arm/Samsung-S3C24XX/Overview.txt	2009-11-10 15:54:04.000000000 +0000
@@ -299,4 +299,4 @@ Port Contributors
 Document Author
 ---------------
 
-Ben Dooks, (c) 2004-2005,2006 Simtec Electronics
+Ben Dooks, Copyright 2004-2005,2006 Simtec Electronics
Index: b/Documentation/arm/Samsung-S3C24XX/EB2410ITX.txt
===================================================================
--- a/Documentation/arm/Samsung-S3C24XX/EB2410ITX.txt	2009-11-10 15:53:56.000000000 +0000
+++ b/Documentation/arm/Samsung-S3C24XX/EB2410ITX.txt	2009-11-10 15:54:04.000000000 +0000
@@ -55,4 +55,4 @@ Maintainers
   This board is maintained by Simtec Electronics.
 
 
-(c) 2004 Ben Dooks, Simtec Electronics
+Copyright 2004 Ben Dooks, Simtec Electronics
Index: b/Documentation/arm/Samsung-S3C24XX/S3C2412.txt
===================================================================
--- a/Documentation/arm/Samsung-S3C24XX/S3C2412.txt	2009-11-10 15:53:56.000000000 +0000
+++ b/Documentation/arm/Samsung-S3C24XX/S3C2412.txt	2009-11-10 15:54:04.000000000 +0000
@@ -117,4 +117,4 @@ ATA
 Document Author
 ---------------
 
-Ben Dooks, (c) 2006 Simtec Electronics
+Ben Dooks, Copyright 2006 Simtec Electronics
Index: b/Documentation/arm/Samsung-S3C24XX/S3C2413.txt
===================================================================
--- a/Documentation/arm/Samsung-S3C24XX/S3C2413.txt	2009-11-10 15:53:56.000000000 +0000
+++ b/Documentation/arm/Samsung-S3C24XX/S3C2413.txt	2009-11-10 15:54:04.000000000 +0000
@@ -18,4 +18,4 @@ Camera Interface
 Document Author
 ---------------
 
-Ben Dooks, (c) 2006 Simtec Electronics
+Ben Dooks, Copyright 2006 Simtec Electronics
Index: b/Documentation/arm/Samsung-S3C24XX/Suspend.txt
===================================================================
--- a/Documentation/arm/Samsung-S3C24XX/Suspend.txt	2009-11-10 15:53:56.000000000 +0000
+++ b/Documentation/arm/Samsung-S3C24XX/Suspend.txt	2009-11-10 15:54:04.000000000 +0000
@@ -133,5 +133,5 @@ Configuration
 Document Author
 ---------------
 
-Ben Dooks, (c) 2004 Simtec Electronics
+Ben Dooks, Copyright 2004 Simtec Electronics
 
Index: b/Documentation/arm/Samsung-S3C24XX/USB-Host.txt
===================================================================
--- a/Documentation/arm/Samsung-S3C24XX/USB-Host.txt	2009-11-10 15:53:56.000000000 +0000
+++ b/Documentation/arm/Samsung-S3C24XX/USB-Host.txt	2009-11-10 15:54:04.000000000 +0000
@@ -90,4 +90,4 @@ Platform Data
 Document Author
 ---------------
 
-Ben Dooks, (c) 2005 Simtec Electronics
+Ben Dooks, Copyright 2005 Simtec Electronics
Index: b/arch/arm/mach-s3c2410/bast-irq.c
===================================================================
--- a/arch/arm/mach-s3c2410/bast-irq.c	2009-11-10 15:53:56.000000000 +0000
+++ b/arch/arm/mach-s3c2410/bast-irq.c	2009-11-10 15:54:04.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s3c2410/bast-irq.c
  *
- * Copyright (c) 2003,2005 Simtec Electronics
+ * Copyright 2003,2005 Simtec Electronics
  *   Ben Dooks <ben@simtec.co.uk>
  *
  * http://www.simtec.co.uk/products/EB2410ITX/
@@ -141,7 +141,7 @@ static __init int bast_irq_init(void)
 	unsigned int i;
 
 	if (machine_is_bast()) {
-		printk(KERN_INFO "BAST PC104 IRQ routing, (c) 2005 Simtec Electronics\n");
+		printk(KERN_INFO "BAST PC104 IRQ routing, Copyright 2005 Simtec Electronics\n");
 
 		/* zap all the IRQs */
 
Index: b/arch/arm/mach-s3c2410/include/mach/osiris-map.h
===================================================================
--- a/arch/arm/mach-s3c2410/include/mach/osiris-map.h	2009-11-10 15:53:56.000000000 +0000
+++ b/arch/arm/mach-s3c2410/include/mach/osiris-map.h	2009-11-10 15:54:04.000000000 +0000
@@ -1,6 +1,6 @@
 /* arch/arm/mach-s3c2410/include/mach/osiris-map.h
  *
- * (c) 2005 Simtec Electronics
+ * Copyright 2005 Simtec Electronics
  *	http://www.simtec.co.uk/products/
  *	Ben Dooks <ben@simtec.co.uk>
  *
Index: b/arch/arm/mach-s3c2410/mach-bast.c
===================================================================
--- a/arch/arm/mach-s3c2410/mach-bast.c	2009-11-10 15:53:56.000000000 +0000
+++ b/arch/arm/mach-s3c2410/mach-bast.c	2009-11-10 15:54:04.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s3c2410/mach-bast.c
  *
- * Copyright (c) 2003-2005,2008 Simtec Electronics
+ * Copyright 2003-2005,2008 Simtec Electronics
  *   Ben Dooks <ben@simtec.co.uk>
  *
  * http://www.simtec.co.uk/products/EB2410ITX/
@@ -66,7 +66,7 @@
 #include "usb-simtec.h"
 #include "nor-simtec.h"
 
-#define COPYRIGHT ", (c) 2004-2005 Simtec Electronics"
+#define COPYRIGHT ", Copyright 2004-2005 Simtec Electronics"
 
 /* macros for virtual address mods for the io space entries */
 #define VA_C5(item) ((unsigned long)(item) + BAST_VAM_CS5)
Index: b/arch/arm/mach-s3c2410/usb-simtec.c
===================================================================
--- a/arch/arm/mach-s3c2410/usb-simtec.c	2009-11-10 15:53:56.000000000 +0000
+++ b/arch/arm/mach-s3c2410/usb-simtec.c	2009-11-10 15:54:04.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s3c2410/usb-simtec.c
  *
- * Copyright (c) 2004,2005 Simtec Electronics
+ * Copyright 2004,2005 Simtec Electronics
  *   Ben Dooks <ben@simtec.co.uk>
  *
  * http://www.simtec.co.uk/products/EB2410ITX/
@@ -108,7 +108,7 @@ int usb_simtec_init(void)
 {
 	int ret;
 
-	printk("USB Power Control, (c) 2004 Simtec Electronics\n");
+	printk("USB Power Control, Copyright 2004 Simtec Electronics\n");
 
 	ret = gpio_request(S3C2410_GPB(4), "USB power control");
 	if (ret < 0) {
Index: b/arch/arm/mach-s3c2440/mach-anubis.c
===================================================================
--- a/arch/arm/mach-s3c2440/mach-anubis.c	2009-11-10 15:53:56.000000000 +0000
+++ b/arch/arm/mach-s3c2440/mach-anubis.c	2009-11-10 15:54:04.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s3c2440/mach-anubis.c
  *
- * Copyright (c) 2003-2005,2008 Simtec Electronics
+ * Copyright 2003-2009 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
  *
@@ -55,7 +55,7 @@
 #include <plat/cpu.h>
 #include <plat/audio-simtec.h>
 
-#define COPYRIGHT ", (c) 2005-2009 Simtec Electronics"
+#define COPYRIGHT ", Copyright 2005-2009 Simtec Electronics"
 
 static struct map_desc anubis_iodesc[] __initdata = {
   /* ISA IO areas */
Index: b/arch/arm/plat-s3c/clock.c
===================================================================
--- a/arch/arm/plat-s3c/clock.c	2009-11-10 15:53:56.000000000 +0000
+++ b/arch/arm/plat-s3c/clock.c	2009-11-10 15:54:04.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c24xx/clock.c
  *
- * Copyright (c) 2004-2005 Simtec Electronics
+ * Copyright 2004-2005 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * S3C24XX Core clock control support
@@ -337,7 +337,7 @@ int s3c24xx_register_clocks(struct clk *
 
 int __init s3c24xx_register_baseclocks(unsigned long xtal)
 {
-	printk(KERN_INFO "S3C24XX Clocks, (c) 2004 Simtec Electronics\n");
+	printk(KERN_INFO "S3C24XX Clocks, Copyright 2004 Simtec Electronics\n");
 
 	clk_xtal.rate = xtal;
 
Index: b/arch/arm/plat-s3c/include/plat/regs-serial.h
===================================================================
--- a/arch/arm/plat-s3c/include/plat/regs-serial.h	2009-11-10 15:53:56.000000000 +0000
+++ b/arch/arm/plat-s3c/include/plat/regs-serial.h	2009-11-10 15:54:04.000000000 +0000
@@ -6,7 +6,7 @@
  *
  *  Copyright (C) 2002 Shane Nay (shane@minirl.com)
  *
- *  Additional defines, (c) 2003 Simtec Electronics (linux@simtec.co.uk)
+ *  Additional defines, Copyright 2003 Simtec Electronics (linux@simtec.co.uk)
  *
  *  Adapted from:
  *
Index: b/arch/arm/plat-s3c24xx/dma.c
===================================================================
--- a/arch/arm/plat-s3c24xx/dma.c	2009-11-10 15:53:56.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/dma.c	2009-11-10 15:54:04.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c24xx/dma.c
  *
- * Copyright (c) 2003-2005,2006 Simtec Electronics
+ * Copyright 2003-2005,2006 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * S3C2410 DMA core
@@ -1310,7 +1310,7 @@ int __init s3c24xx_dma_init(unsigned int
 	int channel;
 	int ret;
 
-	printk("S3C24XX DMA Driver, (c) 2003-2004,2006 Simtec Electronics\n");
+	printk("S3C24XX DMA Driver, Copyright 2003-2004,2006 Simtec Electronics\n");
 
 	dma_channels = channels;
 
Index: b/arch/arm/plat-s3c24xx/pm-simtec.c
===================================================================
--- a/arch/arm/plat-s3c24xx/pm-simtec.c	2009-11-10 15:53:56.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/pm-simtec.c	2009-11-10 15:54:04.000000000 +0000
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c24xx/pm-simtec.c
  *
- * Copyright (c) 2004 Simtec Electronics
+ * Copyright 2004 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * http://armlinux.simtec.co.uk/
@@ -35,7 +35,7 @@
 
 #include <plat/pm.h>
 
-#define COPYRIGHT ", (c) 2005 Simtec Electronics"
+#define COPYRIGHT ", Copyright 2005 Simtec Electronics"
 
 /* pm_simtec_init
  *
