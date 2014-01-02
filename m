From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/5] ARM: SAMSUNG: Remove incorrect file references
Date: Thu,  2 Jan 2014 14:24:14 +0530
Message-ID: <1388652858-25337-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:60440 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751388AbaABI6D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jan 2014 03:58:03 -0500
Received: by mail-pb0-f51.google.com with SMTP id up15so14143327pbc.24
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jan 2014 00:58:02 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

The incorrect references are as a result of file/folder movements/renaming.
Since the references do not convey any useful information, remove them
altogether rather than fixing to ease future maintenance.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/plat-samsung/clock.c                      |    3 +--
 arch/arm/plat-samsung/include/plat/clock.h         |    3 +--
 arch/arm/plat-samsung/include/plat/dma-core.h      |    3 +--
 arch/arm/plat-samsung/include/plat/gpio-cfg.h      |    3 +--
 arch/arm/plat-samsung/include/plat/gpio-core.h     |    3 +--
 arch/arm/plat-samsung/include/plat/iic-core.h      |    5 ++---
 arch/arm/plat-samsung/include/plat/regs-adc.h      |    3 +--
 arch/arm/plat-samsung/include/plat/regs-irqtype.h  |    3 +--
 .../plat-samsung/include/plat/regs-usb-hsotg-phy.h |    3 +--
 .../arm/plat-samsung/include/plat/watchdog-reset.h |    3 +--
 arch/arm/plat-samsung/init.c                       |    3 +--
 arch/arm/plat-samsung/pm-check.c                   |    4 +---
 arch/arm/plat-samsung/pm-gpio.c                    |    4 +---
 arch/arm/plat-samsung/pm.c                         |    3 +--
 14 files changed, 15 insertions(+), 31 deletions(-)

diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
index 47c9fad43f00..494deadb4602 100644
--- a/arch/arm/plat-samsung/clock.c
+++ b/arch/arm/plat-samsung/clock.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c24xx/clock.c
- *
+/*
  * Copyright 2004-2005 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/plat-samsung/include/plat/clock.h
index 63239f409807..4f19dd1e83e2 100644
--- a/arch/arm/plat-samsung/include/plat/clock.h
+++ b/arch/arm/plat-samsung/include/plat/clock.h
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c/include/plat/clock.h
- *
+/*
  * Copyright (c) 2004-2005 Simtec Electronics
  *	http://www.simtec.co.uk/products/SWLINUX/
  *	Written by Ben Dooks, <ben@simtec.co.uk>
diff --git a/arch/arm/plat-samsung/include/plat/dma-core.h b/arch/arm/plat-samsung/include/plat/dma-core.h
index 32ff2a92cb3c..6cf5aafb4f64 100644
--- a/arch/arm/plat-samsung/include/plat/dma-core.h
+++ b/arch/arm/plat-samsung/include/plat/dma-core.h
@@ -1,5 +1,4 @@
-/* arch/arm/plat-s3c/include/plat/dma.h
- *
+/*
  * Copyright 2008 Openmoko, Inc.
  * Copyright 2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
diff --git a/arch/arm/plat-samsung/include/plat/gpio-cfg.h b/arch/arm/plat-samsung/include/plat/gpio-cfg.h
index 08740eed050c..fd41eaf79774 100644
--- a/arch/arm/plat-samsung/include/plat/gpio-cfg.h
+++ b/arch/arm/plat-samsung/include/plat/gpio-cfg.h
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c/include/plat/gpio-cfg.h
- *
+/*
  * Copyright 2008 Openmoko, Inc.
  * Copyright 2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
diff --git a/arch/arm/plat-samsung/include/plat/gpio-core.h b/arch/arm/plat-samsung/include/plat/gpio-core.h
index cf5aae5b0975..98cf6b90373a 100644
--- a/arch/arm/plat-samsung/include/plat/gpio-core.h
+++ b/arch/arm/plat-samsung/include/plat/gpio-core.h
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c/include/plat/gpio-core.h
- *
+/*
  * Copyright 2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
diff --git a/arch/arm/plat-samsung/include/plat/iic-core.h b/arch/arm/plat-samsung/include/plat/iic-core.h
index f182669b8e8e..c2825ce0eda0 100644
--- a/arch/arm/plat-samsung/include/plat/iic-core.h
+++ b/arch/arm/plat-samsung/include/plat/iic-core.h
@@ -1,5 +1,4 @@
-/* arch/arm/mach-s3c2410/include/mach/iic-core.h
- *
+/*
  * Copyright 2008 Openmoko, Inc.
  * Copyright 2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
@@ -39,4 +38,4 @@ static inline void s3c_i2c2_setname(char *name)
 #endif
 }
 
-#endif /* __ASM_ARCH_IIC_H */
+#endif /* __ASM_ARCH_IIC_CORE_H */
diff --git a/arch/arm/plat-samsung/include/plat/regs-adc.h b/arch/arm/plat-samsung/include/plat/regs-adc.h
index 70612100120f..edf4bab91414 100644
--- a/arch/arm/plat-samsung/include/plat/regs-adc.h
+++ b/arch/arm/plat-samsung/include/plat/regs-adc.h
@@ -1,5 +1,4 @@
-/* arch/arm/mach-s3c2410/include/mach/regs-adc.h
- *
+/*
  * Copyright (c) 2004 Shannon Holland <holland@loser.net>
  *
  * This program is free software; yosu can redistribute it and/or modify
diff --git a/arch/arm/plat-samsung/include/plat/regs-irqtype.h b/arch/arm/plat-samsung/include/plat/regs-irqtype.h
index c63cd3fc5ad3..12dfa6f8603e 100644
--- a/arch/arm/plat-samsung/include/plat/regs-irqtype.h
+++ b/arch/arm/plat-samsung/include/plat/regs-irqtype.h
@@ -1,5 +1,4 @@
-/* arch/arm/plat-s3c/include/plat/regs-irqtype.h
- *
+/*
  * Copyright 2008 Simtec Electronics
  *      Ben Dooks <ben@simtec.co.uk>
  *      http://armlinux.simtec.co.uk/
diff --git a/arch/arm/plat-samsung/include/plat/regs-usb-hsotg-phy.h b/arch/arm/plat-samsung/include/plat/regs-usb-hsotg-phy.h
index fcf279662067..eae3c311e590 100644
--- a/arch/arm/plat-samsung/include/plat/regs-usb-hsotg-phy.h
+++ b/arch/arm/plat-samsung/include/plat/regs-usb-hsotg-phy.h
@@ -1,5 +1,4 @@
-/* arch/arm/plat-s3c/include/plat/regs-usb-hsotg-phy.h
- *
+/*
  * Copyright 2008 Openmoko, Inc.
  * Copyright 2008 Simtec Electronics
  *      http://armlinux.simtec.co.uk/
diff --git a/arch/arm/plat-samsung/include/plat/watchdog-reset.h b/arch/arm/plat-samsung/include/plat/watchdog-reset.h
index 0386b8f76623..42707dfbda9c 100644
--- a/arch/arm/plat-samsung/include/plat/watchdog-reset.h
+++ b/arch/arm/plat-samsung/include/plat/watchdog-reset.h
@@ -1,5 +1,4 @@
-/* arch/arm/plat-s3c/include/plat/watchdog-reset.h
- *
+/*
  * Copyright (c) 2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/init.c
index aa9511b6914a..e63e3cea9dac 100644
--- a/arch/arm/plat-samsung/init.c
+++ b/arch/arm/plat-samsung/init.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c/init.c
- *
+/*
  * Copyright (c) 2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *	http://armlinux.simtec.co.uk/
diff --git a/arch/arm/plat-samsung/pm-check.c b/arch/arm/plat-samsung/pm-check.c
index 3cbd62666b1e..a81c7a0d3c7e 100644
--- a/arch/arm/plat-samsung/pm-check.c
+++ b/arch/arm/plat-samsung/pm-check.c
@@ -1,6 +1,4 @@
-/* linux/arch/arm/plat-s3c/pm-check.c
- *  originally in linux/arch/arm/plat-s3c24xx/pm.c
- *
+/*
  * Copyright (c) 2004-2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk
  *	Ben Dooks <ben@simtec.co.uk>
diff --git a/arch/arm/plat-samsung/pm-gpio.c b/arch/arm/plat-samsung/pm-gpio.c
index 81b0a207fefb..133b9ee2af69 100644
--- a/arch/arm/plat-samsung/pm-gpio.c
+++ b/arch/arm/plat-samsung/pm-gpio.c
@@ -1,6 +1,4 @@
-
-/* linux/arch/arm/plat-s3c/pm-gpio.c
- *
+/*
  * Copyright 2008 Openmoko, Inc.
  * Copyright 2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
index e5b0f2c2d884..72e8e8f234f4 100644
--- a/arch/arm/plat-samsung/pm.c
+++ b/arch/arm/plat-samsung/pm.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c/pm.c
- *
+/*
  * Copyright 2008 Openmoko, Inc.
  * Copyright 2004-2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
-- 
1.7.9.5
