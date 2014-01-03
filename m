From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/3] ARM: SAMSUNG: Remove hardware.h inclusion
Date: Fri,  3 Jan 2014 14:54:38 +0530
Message-ID: <1388741079-16202-2-git-send-email-sachin.kamat@linaro.org>
References: <1388741079-16202-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:43364 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751086AbaACJ21 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jan 2014 04:28:27 -0500
Received: by mail-pa0-f46.google.com with SMTP id kp14so13543863pab.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jan 2014 01:28:27 -0800 (PST)
In-Reply-To: <1388741079-16202-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

The contents of this header file are not referenced anywhere in the
included .c files except in devs.c. Remove its inclusion. For devs.c,
explicitly include sizes.h header for SZ_* macros.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/plat-samsung/clock.c        |    1 -
 arch/arm/plat-samsung/devs.c         |    2 +-
 arch/arm/plat-samsung/init.c         |    2 --
 arch/arm/plat-samsung/pm.c           |    1 -
 arch/arm/plat-samsung/s5p-dev-uart.c |    1 -
 5 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
index 494deadb4602..179bdc17b667 100644
--- a/arch/arm/plat-samsung/clock.c
+++ b/arch/arm/plat-samsung/clock.c
@@ -42,7 +42,6 @@
 #include <linux/debugfs.h>
 #endif
 
-#include <mach/hardware.h>
 #include <asm/irq.h>
 
 #include <plat/cpu-freq.h>
diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 78460f836e89..7a29f1256439 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -30,6 +30,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/mmc/host.h>
 #include <linux/ioport.h>
+#include <linux/sizes.h>
 #include <linux/platform_data/s3c-hsudc.h>
 #include <linux/platform_data/s3c-hsotg.h>
 #include <linux/platform_data/dma-s3c24xx.h>
@@ -41,7 +42,6 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <mach/hardware.h>
 #include <mach/dma.h>
 #include <mach/irqs.h>
 #include <mach/map.h>
diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/init.c
index e63e3cea9dac..9183ded63552 100644
--- a/arch/arm/plat-samsung/init.c
+++ b/arch/arm/plat-samsung/init.c
@@ -23,8 +23,6 @@
 #include <linux/platform_device.h>
 #include <linux/of.h>
 
-#include <mach/hardware.h>
-
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
index 72e8e8f234f4..0f70339d60da 100644
--- a/arch/arm/plat-samsung/pm.c
+++ b/arch/arm/plat-samsung/pm.c
@@ -25,7 +25,6 @@
 #include <plat/regs-serial.h>
 
 #ifdef CONFIG_SAMSUNG_ATAGS
-#include <mach/hardware.h>
 #include <mach/map.h>
 #ifndef CONFIG_ARCH_EXYNOS
 #include <mach/regs-clock.h>
diff --git a/arch/arm/plat-samsung/s5p-dev-uart.c b/arch/arm/plat-samsung/s5p-dev-uart.c
index cafa3deddcc1..8c4487af98c8 100644
--- a/arch/arm/plat-samsung/s5p-dev-uart.c
+++ b/arch/arm/plat-samsung/s5p-dev-uart.c
@@ -18,7 +18,6 @@
 
 #include <asm/mach/arch.h>
 #include <asm/mach/irq.h>
-#include <mach/hardware.h>
 #include <mach/map.h>
 
 #include <plat/devs.h>
-- 
1.7.9.5
