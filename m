From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 3/7] ARM: SAMSUNG: Move mach/ts.h to plat/ts.h
Date: Mon, 8 Mar 2010 19:38:50 +0100
Message-ID: <b2e8f9f71003081038t51104d37j2d0d9d9221a50ea3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f209.google.com ([209.85.218.209]:41075 "EHLO
	mail-bw0-f209.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755164Ab0CHSjL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Mar 2010 13:39:11 -0500
Received: by mail-bw0-f209.google.com with SMTP id 1so3099841bwz.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Mar 2010 10:39:10 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Ben Dooks <ben-linux@fluff.org>

This moves mach-s3c2410/include/mach/ts.h to plat-samsung/include/plat/ts.h in
order to prepare for s3c64xx support in the touchscreen driver.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/mach-s3c2410/mach-h1940.c                 |    2 +-
 arch/arm/plat-s3c24xx/devs.c                       |    3 +--
 .../mach => plat-samsung/include/plat}/ts.h        |    2 +-
 drivers/input/touchscreen/s3c2410_ts.c             |    2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)
 rename arch/arm/{mach-s3c2410/include/mach =>
plat-samsung/include/plat}/ts.h (92%)

diff --git a/arch/arm/mach-s3c2410/mach-h1940.c
b/arch/arm/mach-s3c2410/mach-h1940.c
index fbedd07..75e3ffb 100644
--- a/arch/arm/mach-s3c2410/mach-h1940.c
+++ b/arch/arm/mach-s3c2410/mach-h1940.c
@@ -46,7 +46,6 @@
 #include <mach/h1940.h>
 #include <mach/h1940-latch.h>
 #include <mach/fb.h>
-#include <mach/ts.h>
 #include <plat/udc.h>
 #include <plat/iic.h>

@@ -56,6 +55,7 @@
 #include <plat/pll.h>
 #include <plat/pm.h>
 #include <plat/mci.h>
+#include <plat/ts.h>

 static struct map_desc h1940_iodesc[] __initdata = {
 	[0] = {
diff --git a/arch/arm/plat-s3c24xx/devs.c b/arch/arm/plat-s3c24xx/devs.c
index 8c6de1c..a9dffd7 100644
--- a/arch/arm/plat-s3c24xx/devs.c
+++ b/arch/arm/plat-s3c24xx/devs.c
@@ -37,8 +37,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/regs-spi.h>
-
-#include <mach/ts.h>
+#include <plat/ts.h>

 /* Serial port registrations */

diff --git a/arch/arm/mach-s3c2410/include/mach/ts.h
b/arch/arm/plat-samsung/include/plat/ts.h
similarity index 92%
rename from arch/arm/mach-s3c2410/include/mach/ts.h
rename to arch/arm/plat-samsung/include/plat/ts.h
index dc36170..8a51675 100644
--- a/arch/arm/mach-s3c2410/include/mach/ts.h
+++ b/arch/arm/plat-samsung/include/plat/ts.h
@@ -1,4 +1,4 @@
-/* linux/include/asm/arch-s3c2410/ts.h
+/* arch/arm/plat-samsung/include/plat/ts.h
  *
  * Copyright (c) 2005 Arnaud Patard <arnaud.patard@rtp-net.org>
  *
diff --git a/drivers/input/touchscreen/s3c2410_ts.c
b/drivers/input/touchscreen/s3c2410_ts.c
index 6386b44..0cd0ca6 100644
--- a/drivers/input/touchscreen/s3c2410_ts.c
+++ b/drivers/input/touchscreen/s3c2410_ts.c
@@ -38,9 +38,9 @@

 #include <plat/adc.h>
 #include <plat/regs-adc.h>
+#include <plat/ts.h>

 #include <mach/regs-gpio.h>
-#include <mach/ts.h>

 #define TSC_SLEEP  (S3C2410_ADCTSC_PULL_UP_DISABLE | S3C2410_ADCTSC_XY_PST(0))

-- 
1.7.0.1
