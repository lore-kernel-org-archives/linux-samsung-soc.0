From: kgene@kernel.org
Subject: [PATCH 10/11] ARM: EXYNOS: remove <mach/regs-clock.h> for exynos
Date: Tue, 17 Dec 2013 20:53:07 +0900
Message-ID: <116801cefb1e$8d3d5280$a7b7f780$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:64962 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752786Ab3LQLxI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Dec 2013 06:53:08 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MXY000VV90JP150@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Dec 2013 20:53:08 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

From: Kukjin Kim <kgene.kim@samsung.com>

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/include/mach/regs-clock.h |   19 -------------------
 arch/arm/mach-exynos/platsmp.c                 |    1 -
 arch/arm/mach-exynos/pmu.c                     |    2 +-
 arch/arm/plat-samsung/pm.c                     |    2 +-
 4 files changed, 2 insertions(+), 22 deletions(-)
 delete mode 100644 arch/arm/mach-exynos/include/mach/regs-clock.h

diff --git a/arch/arm/mach-exynos/include/mach/regs-clock.h
b/arch/arm/mach-exynos/include/mach/regs-clock.h
deleted file mode 100644
index cc121a5..0000000
--- a/arch/arm/mach-exynos/include/mach/regs-clock.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* linux/arch/arm/mach-exynos4/include/mach/regs-clock.h
- *
- * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com
- *
- * EXYNOS4 - Clock register definitions
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#ifndef __ASM_ARCH_REGS_CLOCK_H
-#define __ASM_ARCH_REGS_CLOCK_H __FILE__
-
-#include <plat/cpu.h>
-#include <mach/map.h>
-
-#endif /* __ASM_ARCH_REGS_CLOCK_H */
diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index b5b34f8..474432f 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -27,7 +27,6 @@
 #include <asm/firmware.h>
 
 #include <mach/hardware.h>
-#include <mach/regs-clock.h>
 
 #include <plat/cpu.h>
 
diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
index 0116d5b..7f8c5ee 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -13,7 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/bug.h>
 
-#include <mach/regs-clock.h>
+#include <plat/cpu.h>
 
 #include "common.h"
 #include "regs-pmu.h"
diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
index 47ec54b..5f2add9 100644
--- a/arch/arm/plat-samsung/pm.c
+++ b/arch/arm/plat-samsung/pm.c
@@ -28,8 +28,8 @@
 #ifdef CONFIG_SAMSUNG_ATAGS
 #include <mach/hardware.h>
 #include <mach/map.h>
-#include <mach/regs-clock.h>
 #ifndef CONFIG_ARCH_EXYNOS
+#include <mach/regs-clock.h>
 #include <mach/regs-irq.h>
 #endif
 #include <mach/irqs.h>
-- 
1.7.10.4
