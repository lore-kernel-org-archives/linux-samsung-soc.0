From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 1/2] ARM: EXYNOS: cleanup header files inclusion
Date: Thu, 25 Feb 2016 09:39:59 +0530
Message-ID: <1456373400-10633-2-git-send-email-pankaj.dubey@samsung.com>
References: <1456373400-10633-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57052 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758528AbcBYEIp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Feb 2016 23:08:45 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O3302CND4UJ5F20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 25 Feb 2016 13:08:43 +0900 (KST)
In-reply-to: <1456373400-10633-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, daniel.lezcano@linaro.org, thomas.ab@samsung.com, linux@arm.linux.org.uk, Pankaj Dubey <pankaj.dubey@samsung.com>

This includes trivial cleanup in exynos files such as
    - remove unused header files inclusion from exynos.c, s5p-dev-mfc.c,
      firmware.c, pm.c.
    - move inclusion of of.h from common.h to pm.c where it is really
      required

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/common.h      | 1 -
 arch/arm/mach-exynos/exynos.c      | 4 ----
 arch/arm/mach-exynos/firmware.c    | 2 --
 arch/arm/mach-exynos/platsmp.c     | 1 -
 arch/arm/mach-exynos/pm.c          | 4 +---
 arch/arm/mach-exynos/s5p-dev-mfc.c | 1 -
 6 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index e349a03..5365bf1 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -12,7 +12,6 @@
 #ifndef __ARCH_ARM_MACH_EXYNOS_COMMON_H
 #define __ARCH_ARM_MACH_EXYNOS_COMMON_H
 
-#include <linux/of.h>
 #include <linux/platform_data/cpuidle-exynos.h>
 
 #define EXYNOS3250_SOC_ID	0xE3472000
diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 99947ad..f977eea 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -11,14 +11,11 @@
 
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/kernel.h>
-#include <linux/serial_s3c.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_fdt.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
-#include <linux/pm_domain.h>
 #include <linux/irqchip.h>
 #include <linux/soc/samsung/exynos-regs-pmu.h>
 
@@ -26,7 +23,6 @@
 #include <asm/hardware/cache-l2x0.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
-#include <asm/memory.h>
 
 #include <mach/map.h>
 
diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index 111cfbf..1bfd1b0 100644
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@ -20,8 +20,6 @@
 #include <asm/hardware/cache-l2x0.h>
 #include <asm/suspend.h>
 
-#include <mach/map.h>
-
 #include "common.h"
 #include "smc.h"
 
diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index da46c63..85c3be6 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -15,7 +15,6 @@
 #include <linux/init.h>
 #include <linux/errno.h>
 #include <linux/delay.h>
-#include <linux/device.h>
 #include <linux/jiffies.h>
 #include <linux/smp.h>
 #include <linux/io.h>
diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index b9b9186..c43b776 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -17,7 +17,7 @@
 #include <linux/suspend.h>
 #include <linux/cpu_pm.h>
 #include <linux/io.h>
-#include <linux/err.h>
+#include <linux/of.h>
 #include <linux/soc/samsung/exynos-regs-pmu.h>
 #include <linux/soc/samsung/exynos-pmu.h>
 
@@ -28,8 +28,6 @@
 
 #include <mach/map.h>
 
-#include <plat/pm-common.h>
-
 #include "common.h"
 
 static inline void __iomem *exynos_boot_vector_addr(void)
diff --git a/arch/arm/mach-exynos/s5p-dev-mfc.c b/arch/arm/mach-exynos/s5p-dev-mfc.c
index 0b04b6b..8ef1f3e 100644
--- a/arch/arm/mach-exynos/s5p-dev-mfc.c
+++ b/arch/arm/mach-exynos/s5p-dev-mfc.c
@@ -9,7 +9,6 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/memblock.h>
-- 
2.4.5
