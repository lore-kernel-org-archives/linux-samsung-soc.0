From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/6] ARM: Samsung: Moving a touchscreen related header file to plat-samsung
Date: Fri,  7 May 2010 15:31:16 +0900
Message-ID: <1273213876-6430-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38272 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750929Ab0EGGir (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 May 2010 02:38:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Naveen Krishna <ch.naveen@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Naveen Krishna <ch.naveen@samsung.com>

As code can be reused by touchscreens on all Samsung SoCs
Also makes required modifications in some machines to avoid build breaks.

Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s3c2410/include/mach/ts.h |   21 ---------------------
 arch/arm/mach-s3c2410/mach-h1940.c      |    2 +-
 arch/arm/plat-s3c24xx/devs.c            |    2 +-
 arch/arm/plat-samsung/include/plat/ts.h |   21 +++++++++++++++++++++
 drivers/input/touchscreen/s3c2410_ts.c  |    2 +-
 5 files changed, 24 insertions(+), 24 deletions(-)
 delete mode 100644 arch/arm/mach-s3c2410/include/mach/ts.h
 create mode 100644 arch/arm/plat-samsung/include/plat/ts.h

diff --git a/arch/arm/mach-s3c2410/include/mach/ts.h b/arch/arm/mach-s3c2410/include/mach/ts.h
deleted file mode 100644
index dc36170..0000000
--- a/arch/arm/mach-s3c2410/include/mach/ts.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* linux/include/asm/arch-s3c2410/ts.h
- *
- * Copyright (c) 2005 Arnaud Patard <arnaud.patard@rtp-net.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#ifndef __ASM_ARM_TS_H
-#define __ASM_ARM_TS_H
-
-struct s3c2410_ts_mach_info {
-       int             delay;
-       int             presc;
-       int             oversampling_shift;
-};
-
-extern void s3c24xx_ts_set_platdata(struct s3c2410_ts_mach_info *);
-
-#endif /* __ASM_ARM_TS_H */
diff --git a/arch/arm/mach-s3c2410/mach-h1940.c b/arch/arm/mach-s3c2410/mach-h1940.c
index fbedd07..a8575a6 100644
--- a/arch/arm/mach-s3c2410/mach-h1940.c
+++ b/arch/arm/mach-s3c2410/mach-h1940.c
@@ -46,7 +46,7 @@
 #include <mach/h1940.h>
 #include <mach/h1940-latch.h>
 #include <mach/fb.h>
-#include <mach/ts.h>
+#include <plat/ts.h>
 #include <plat/udc.h>
 #include <plat/iic.h>
 
diff --git a/arch/arm/plat-s3c24xx/devs.c b/arch/arm/plat-s3c24xx/devs.c
index 8c6de1c..06c22b1 100644
--- a/arch/arm/plat-s3c24xx/devs.c
+++ b/arch/arm/plat-s3c24xx/devs.c
@@ -38,7 +38,7 @@
 #include <plat/cpu.h>
 #include <plat/regs-spi.h>
 
-#include <mach/ts.h>
+#include <plat/ts.h>
 
 /* Serial port registrations */
 
diff --git a/arch/arm/plat-samsung/include/plat/ts.h b/arch/arm/plat-samsung/include/plat/ts.h
new file mode 100644
index 0000000..954b695
--- /dev/null
+++ b/arch/arm/plat-samsung/include/plat/ts.h
@@ -0,0 +1,21 @@
+/* linux/arch/arm/plat-samsung/include/plat/ts.h
+ *
+ * Copyright (c) 2005 Arnaud Patard <arnaud.patard@rtp-net.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_ARM_TS_H
+#define __ASM_ARM_TS_H
+
+struct s3c2410_ts_mach_info {
+	int	delay;
+	int	presc;
+	int	oversampling_shift;
+};
+
+extern void s3c24xx_ts_set_platdata(struct s3c2410_ts_mach_info *);
+
+#endif /* __ASM_ARM_TS_H */
diff --git a/drivers/input/touchscreen/s3c2410_ts.c b/drivers/input/touchscreen/s3c2410_ts.c
index 3755a47..ba4d1e8 100644
--- a/drivers/input/touchscreen/s3c2410_ts.c
+++ b/drivers/input/touchscreen/s3c2410_ts.c
@@ -40,7 +40,7 @@
 #include <plat/regs-adc.h>
 
 #include <mach/regs-gpio.h>
-#include <mach/ts.h>
+#include <plat/ts.h>
 
 #define TSC_SLEEP  (S3C2410_ADCTSC_PULL_UP_DISABLE | S3C2410_ADCTSC_XY_PST(0))
 
-- 
1.6.6.1
