From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/5] ARM: S3C64XX: Remove incorrect file references
Date: Thu,  2 Jan 2014 14:24:16 +0530
Message-ID: <1388652858-25337-3-git-send-email-sachin.kamat@linaro.org>
References: <1388652858-25337-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:56095 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751388AbaABI6H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jan 2014 03:58:07 -0500
Received: by mail-pb0-f50.google.com with SMTP id rr13so14173155pbb.23
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jan 2014 00:58:07 -0800 (PST)
In-Reply-To: <1388652858-25337-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, Mark Brown <broonie@kernel.org>

The incorrect references are as a result of file/folder movements/renaming.
Since the references do not convey any useful information, remove them
altogether rather than fixing to ease future maintenance.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
---
 arch/arm/mach-s3c64xx/dev-audio.c               |    3 +--
 arch/arm/mach-s3c64xx/dev-uart.c                |    3 +--
 arch/arm/mach-s3c64xx/include/mach/regs-clock.h |    9 ++++-----
 arch/arm/mach-s3c64xx/include/mach/regs-gpio.h  |    3 +--
 arch/arm/mach-s3c64xx/irq-pm.c                  |    3 +--
 arch/arm/mach-s3c64xx/pm.c                      |    3 +--
 arch/arm/mach-s3c64xx/setup-fb-24bpp.c          |    3 +--
 arch/arm/mach-s3c64xx/setup-i2c0.c              |    3 +--
 arch/arm/mach-s3c64xx/setup-i2c1.c              |    3 +--
 arch/arm/mach-s3c64xx/setup-sdhci-gpio.c        |    3 +--
 arch/arm/mach-s3c64xx/sleep.S                   |    3 +--
 11 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/dev-audio.c b/arch/arm/mach-s3c64xx/dev-audio.c
index 6f58c80235dc..e13d0bdedfa9 100644
--- a/arch/arm/mach-s3c64xx/dev-audio.c
+++ b/arch/arm/mach-s3c64xx/dev-audio.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c/dev-audio.c
- *
+/*
  * Copyright 2009 Wolfson Microelectronics
  *      Mark Brown <broonie@opensource.wolfsonmicro.com>
  *
diff --git a/arch/arm/mach-s3c64xx/dev-uart.c b/arch/arm/mach-s3c64xx/dev-uart.c
index 46e18d77ea93..19eb3be57bb3 100644
--- a/arch/arm/mach-s3c64xx/dev-uart.c
+++ b/arch/arm/mach-s3c64xx/dev-uart.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c64xx/dev-uart.c
- *
+/*
  * Copyright 2008 Openmoko, Inc.
  * Copyright 2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
diff --git a/arch/arm/mach-s3c64xx/include/mach/regs-clock.h b/arch/arm/mach-s3c64xx/include/mach/regs-clock.h
index 4f44aac77092..1832638c96ea 100644
--- a/arch/arm/mach-s3c64xx/include/mach/regs-clock.h
+++ b/arch/arm/mach-s3c64xx/include/mach/regs-clock.h
@@ -1,5 +1,4 @@
-/* arch/arm/plat-s3c64xx/include/plat/regs-clock.h
- *
+/*
  * Copyright 2008 Openmoko, Inc.
  * Copyright 2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
@@ -12,8 +11,8 @@
  * published by the Free Software Foundation.
 */
 
-#ifndef __PLAT_REGS_CLOCK_H
-#define __PLAT_REGS_CLOCK_H __FILE__
+#ifndef __MACH_REGS_CLOCK_H
+#define __MACH_REGS_CLOCK_H __FILE__
 
 /*
  * FIXME: Remove remaining definitions
@@ -35,4 +34,4 @@
 #define MEM_SYS_CFG_INDEP_CF		0x4000
 #define MEM_SYS_CFG_EBI_FIX_PRI_CFCON	0x30
 
-#endif /* _PLAT_REGS_CLOCK_H */
+#endif /* __MACH_REGS_CLOCK_H */
diff --git a/arch/arm/mach-s3c64xx/include/mach/regs-gpio.h b/arch/arm/mach-s3c64xx/include/mach/regs-gpio.h
index 81f7f6e6832e..ef02ae583756 100644
--- a/arch/arm/mach-s3c64xx/include/mach/regs-gpio.h
+++ b/arch/arm/mach-s3c64xx/include/mach/regs-gpio.h
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c64xx/include/mach/regs-gpio.h
- *
+/*
  * Copyright 2008 Openmoko, Inc.
  * Copyright 2008 Simtec Electronics
  *      Ben Dooks <ben@simtec.co.uk>
diff --git a/arch/arm/mach-s3c64xx/irq-pm.c b/arch/arm/mach-s3c64xx/irq-pm.c
index 1649c0d1c1b8..a0fbdde512b5 100644
--- a/arch/arm/mach-s3c64xx/irq-pm.c
+++ b/arch/arm/mach-s3c64xx/irq-pm.c
@@ -1,5 +1,4 @@
-/* arch/arm/plat-s3c64xx/irq-pm.c
- *
+/*
  * Copyright 2008 Openmoko, Inc.
  * Copyright 2008 Simtec Electronics
  *      Ben Dooks <ben@simtec.co.uk>
diff --git a/arch/arm/mach-s3c64xx/pm.c b/arch/arm/mach-s3c64xx/pm.c
index 99c778eecab6..53e5ac448c0d 100644
--- a/arch/arm/mach-s3c64xx/pm.c
+++ b/arch/arm/mach-s3c64xx/pm.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c64xx/pm.c
- *
+/*
  * Copyright 2008 Openmoko, Inc.
  * Copyright 2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
diff --git a/arch/arm/mach-s3c64xx/setup-fb-24bpp.c b/arch/arm/mach-s3c64xx/setup-fb-24bpp.c
index 222792691b41..24512fa07577 100644
--- a/arch/arm/mach-s3c64xx/setup-fb-24bpp.c
+++ b/arch/arm/mach-s3c64xx/setup-fb-24bpp.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c64xx/setup-fb-24bpp.c
- *
+/*
  * Copyright 2008 Openmoko, Inc.
  * Copyright 2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
diff --git a/arch/arm/mach-s3c64xx/setup-i2c0.c b/arch/arm/mach-s3c64xx/setup-i2c0.c
index f269dabc9593..ba3a72dfacfe 100644
--- a/arch/arm/mach-s3c64xx/setup-i2c0.c
+++ b/arch/arm/mach-s3c64xx/setup-i2c0.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c64xx/setup-i2c0.c
- *
+/*
  * Copyright 2008 Openmoko, Inc.
  * Copyright 2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
diff --git a/arch/arm/mach-s3c64xx/setup-i2c1.c b/arch/arm/mach-s3c64xx/setup-i2c1.c
index aa2bfcd5e818..c51538f09c0c 100644
--- a/arch/arm/mach-s3c64xx/setup-i2c1.c
+++ b/arch/arm/mach-s3c64xx/setup-i2c1.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c64xx/setup-i2c1.c
- *
+/*
  * Copyright 2008 Openmoko, Inc.
  * Copyright 2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
diff --git a/arch/arm/mach-s3c64xx/setup-sdhci-gpio.c b/arch/arm/mach-s3c64xx/setup-sdhci-gpio.c
index 79192b7217df..d4d80cd0a095 100644
--- a/arch/arm/mach-s3c64xx/setup-sdhci-gpio.c
+++ b/arch/arm/mach-s3c64xx/setup-sdhci-gpio.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c64xx/setup-sdhci-gpio.c
- *
+/*
  * Copyright 2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *	http://armlinux.simtec.co.uk/
diff --git a/arch/arm/mach-s3c64xx/sleep.S b/arch/arm/mach-s3c64xx/sleep.S
index 34313f9c8792..8a4d50160487 100644
--- a/arch/arm/mach-s3c64xx/sleep.S
+++ b/arch/arm/mach-s3c64xx/sleep.S
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c64xx/sleep.S
- *
+/*
  * Copyright 2008 Openmoko, Inc.
  * Copyright 2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
-- 
1.7.9.5
