From: Gusakov Andrey <dron0gus@gmail.com>
Subject: [PATCH] S3C: fix order of MACH_S3C* checks on GPIO count define
Date: Thu, 29 Dec 2011 17:07:14 +0400
Message-ID: <1325164036-15638-1-git-send-email-dron0gus@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:52683 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754008Ab1L2NHu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Dec 2011 08:07:50 -0500
Received: by wibhm6 with SMTP id hm6so6261499wib.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Dec 2011 05:07:48 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Gusakov Andrey <dron_gus@mail.ru>, Gusakov Andrey <dron0gus@gmail.com>

From: Gusakov Andrey <dron_gus@mail.ru>

Differnt S3C24XX SoC have different number of GPIO. When building
kernel for many S3C24XX SoCs GPIO number defined to minimun possible.
This patch reordef ifdef's to define GPIO number to muximum possible.

Signed-off-by: Gusakov Andrey <dron0gus@gmail.com>
---
 arch/arm/mach-s3c2410/include/mach/gpio.h |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/gpio.h b/arch/arm/mach-s3c2410/include/mach/gpio.h
index 6fac70f..07257da 100644
--- a/arch/arm/mach-s3c2410/include/mach/gpio.h
+++ b/arch/arm/mach-s3c2410/include/mach/gpio.h
@@ -15,10 +15,10 @@
  * devices that need GPIO.
  */
 
-#ifdef CONFIG_CPU_S3C244X
-#define ARCH_NR_GPIOS	(32 * 9 + CONFIG_S3C24XX_GPIO_EXTRA)
-#elif defined(CONFIG_CPU_S3C2443) || defined(CONFIG_CPU_S3C2416)
+#if defined(CONFIG_CPU_S3C2443) || defined(CONFIG_CPU_S3C2416)
 #define ARCH_NR_GPIOS	(32 * 12 + CONFIG_S3C24XX_GPIO_EXTRA)
+#elif defined(CONFIG_CPU_S3C244X)
+#define ARCH_NR_GPIOS	(32 * 9 + CONFIG_S3C24XX_GPIO_EXTRA)
 #else
 #define ARCH_NR_GPIOS	(256 + CONFIG_S3C24XX_GPIO_EXTRA)
 #endif
@@ -26,10 +26,10 @@
 #include <mach/gpio-nrs.h>
 #include <mach/gpio-fns.h>
 
-#ifdef CONFIG_CPU_S3C244X
-#define S3C_GPIO_END	(S3C2410_GPJ(0) + 32)
-#elif defined(CONFIG_CPU_S3C2443) || defined(CONFIG_CPU_S3C2416)
+#if defined(CONFIG_CPU_S3C2443) || defined(CONFIG_CPU_S3C2416)
 #define S3C_GPIO_END	(S3C2410_GPM(0) + 32)
+#elif defined(CONFIG_CPU_S3C244X)
+#define S3C_GPIO_END	(S3C2410_GPJ(0) + 32)
 #else
 #define S3C_GPIO_END	(S3C2410_GPH(0) + 32)
 #endif
-- 
1.7.0.4
