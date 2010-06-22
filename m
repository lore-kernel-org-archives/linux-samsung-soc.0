From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v2 1/4] ARM: S3C24XX: Fix gpiolib support for ports K..M
Date: Tue, 22 Jun 2010 18:22:01 +0300
Message-ID: <1277220124-16225-2-git-send-email-jekhor@gmail.com>
References: <1277220124-16225-1-git-send-email-jekhor@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:58164 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756343Ab0FVPYk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jun 2010 11:24:40 -0400
Received: by mail-bw0-f46.google.com with SMTP id 9so60044bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jun 2010 08:24:40 -0700 (PDT)
In-Reply-To: <1277220124-16225-1-git-send-email-jekhor@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Yauhen Kharuzhy <jekhor@gmail.com>

S3C2443 and S3C2416 has 12 GPIO banks (from A to M), increase
ARCH_NR_GPIOS for this architectures.

Also typo from previous commit has been fixed: CONFIG_CPU_S3C24XX
instead CONFIG_CPU_244X.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
Tested-by: Vasily Khoruzhick <anarsoul@gmail.com>

---
 arch/arm/mach-s3c2410/include/mach/gpio.h |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/gpio.h b/arch/arm/mach-s3c2410/include/mach/gpio.h
index b649bf2..f7f6b07 100644
--- a/arch/arm/mach-s3c2410/include/mach/gpio.h
+++ b/arch/arm/mach-s3c2410/include/mach/gpio.h
@@ -22,6 +22,8 @@
 
 #ifdef CONFIG_CPU_S3C244X
 #define ARCH_NR_GPIOS	(32 * 9 + CONFIG_S3C24XX_GPIO_EXTRA)
+#elif defined(CONFIG_CPU_S3C2443) || defined(CONFIG_CPU_S3C2416)
+#define ARCH_NR_GPIOS	(32 * 12 + CONFIG_S3C24XX_GPIO_EXTRA)
 #else
 #define ARCH_NR_GPIOS	(256 + CONFIG_S3C24XX_GPIO_EXTRA)
 #endif
@@ -30,8 +32,10 @@
 #include <mach/gpio-nrs.h>
 #include <mach/gpio-fns.h>
 
-#ifdef CONFIG_CPU_S3C24XX
-#define S3C_GPIO_END	(S3C2410_GPIO_BANKJ + 32)
+#ifdef CONFIG_CPU_S3C244X
+#define S3C_GPIO_END	(S3C2410_GPJ(0) + 32)
+#elif defined(CONFIG_CPU_S3C2443) || defined(CONFIG_CPU_S3C2416)
+#define S3C_GPIO_END	(S3C2410_GPM(0) + 32)
 #else
-#define S3C_GPIO_END	(S3C2410_GPIO_BANKH + 32)
+#define S3C_GPIO_END	(S3C2410_GPH(0) + 32)
 #endif
-- 
1.7.1
