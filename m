From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v4] ARM: S5P6440: Move CPU specific code in plat-s5p to machine directory
Date: Mon, 25 Jan 2010 14:24:04 +0900
Message-ID: <1264397044-21015-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:54846 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751207Ab0AYFbb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jan 2010 00:31:31 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

The s5p6440-clock.c and s5p6440-init.c code in the plat-s5p is specific to
s5p6440 SoC based systems. So these files are being moved to the machine
directory of s5p6440. And these files are renamed in the machine directory.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6440/Kconfig                      |    2 --
 arch/arm/mach-s5p6440/Makefile                     |    2 +-
 .../s5p6440-clock.c => mach-s5p6440/clock.c}       |    2 +-
 arch/arm/mach-s5p6440/{s5p6440-gpio.c => gpio.c}   |    2 +-
 .../s5p6440-init.c => mach-s5p6440/init.c}         |    4 +++-
 arch/arm/plat-s5p/Kconfig                          |   16 ----------------
 arch/arm/plat-s5p/Makefile                         |    5 -----
 7 files changed, 6 insertions(+), 27 deletions(-)
 rename arch/arm/{plat-s5p/s5p6440-clock.c => mach-s5p6440/clock.c} (99%)
 rename arch/arm/mach-s5p6440/{s5p6440-gpio.c => gpio.c} (99%)
 rename arch/arm/{plat-s5p/s5p6440-init.c => mach-s5p6440/init.c} (94%)

diff --git a/arch/arm/mach-s5p6440/Kconfig b/arch/arm/mach-s5p6440/Kconfig
index 3aa2462..4c29ff8 100644
--- a/arch/arm/mach-s5p6440/Kconfig
+++ b/arch/arm/mach-s5p6440/Kconfig
@@ -9,8 +9,6 @@ if ARCH_S5P6440
 
 config CPU_S5P6440
 	bool
-	select CPU_S5P6440_INIT
-	select CPU_S5P6440_CLOCK
 	help
 	  Enable S5P6440 CPU support
 
diff --git a/arch/arm/mach-s5p6440/Makefile b/arch/arm/mach-s5p6440/Makefile
index a79b130..1ad894b 100644
--- a/arch/arm/mach-s5p6440/Makefile
+++ b/arch/arm/mach-s5p6440/Makefile
@@ -12,7 +12,7 @@ obj-				:=
 
 # Core support for S5P6440 system
 
-obj-$(CONFIG_CPU_S5P6440)	+= cpu.o s5p6440-gpio.o
+obj-$(CONFIG_CPU_S5P6440)	+= cpu.o init.o clock.o gpio.o
 
 # machine support
 
diff --git a/arch/arm/plat-s5p/s5p6440-clock.c b/arch/arm/mach-s5p6440/clock.c
similarity index 99%
rename from arch/arm/plat-s5p/s5p6440-clock.c
rename to arch/arm/mach-s5p6440/clock.c
index 2f412f8..b2672e1 100644
--- a/arch/arm/plat-s5p/s5p6440-clock.c
+++ b/arch/arm/mach-s5p6440/clock.c
@@ -1,4 +1,4 @@
-/* linux/arch/arm/plat-s5p/s5p6440-clock.c
+/* linux/arch/arm/mach-s5p6440/clock.c
  *
  * Copyright (c) 2009 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
diff --git a/arch/arm/mach-s5p6440/s5p6440-gpio.c b/arch/arm/mach-s5p6440/gpio.c
similarity index 99%
rename from arch/arm/mach-s5p6440/s5p6440-gpio.c
rename to arch/arm/mach-s5p6440/gpio.c
index 742264c..b0ea741 100644
--- a/arch/arm/mach-s5p6440/s5p6440-gpio.c
+++ b/arch/arm/mach-s5p6440/gpio.c
@@ -1,4 +1,4 @@
-/* arch/arm/mach-s5p6440/s5p6440-gpio.c
+/* arch/arm/mach-s5p6440/gpio.c
  *
  * Copyright (c) 2009 Samsung Electronics Co., Ltd.
  * 		http://www.samsung.com/
diff --git a/arch/arm/plat-s5p/s5p6440-init.c b/arch/arm/mach-s5p6440/init.c
similarity index 94%
rename from arch/arm/plat-s5p/s5p6440-init.c
rename to arch/arm/mach-s5p6440/init.c
index 9017825..a1f3727 100644
--- a/arch/arm/plat-s5p/s5p6440-init.c
+++ b/arch/arm/mach-s5p6440/init.c
@@ -1,8 +1,10 @@
-/* linux/arch/arm/plat-s5p/s5p6440-init.c
+/* linux/arch/arm/mach-s5p6440/init.c
  *
  * Copyright (c) 2009 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
  *
+ * S5P6440 - Init support
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index e7c31e7..fca6dad 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -24,19 +24,3 @@ config PLAT_S5P
 	select SAMSUNG_IRQ_UART
 	help
 	  Base platform code for Samsung's S5P series SoC.
-
-if (PLAT_S5P && ARCH_S5P6440)
-
-# Configuration options shared by all S5P64XX implementations
-
-config CPU_S5P6440_INIT
-	bool
-	help
-	 Initialisation code for the S5P6440.
-
-config CPU_S5P6440_CLOCK
-	bool
-	help
-	  Clock support code for the S5P6440.
-
-endif
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index 92b6474..a7c54b3 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -17,8 +17,3 @@ obj-y				+= cpu.o
 obj-y				+= clock.o
 obj-y				+= irq.o
 obj-y				+= setup-i2c0.o
-
-# CPU support
-
-obj-$(CONFIG_CPU_S5P6440_INIT)	+= s5p6440-init.o
-obj-$(CONFIG_CPU_S5P6440_CLOCK)	+= s5p6440-clock.o
-- 
1.6.2.5
