From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/3] ARM: EXYNOS: Remove hardware.h file
Date: Fri,  3 Jan 2014 14:54:39 +0530
Message-ID: <1388741079-16202-3-git-send-email-sachin.kamat@linaro.org>
References: <1388741079-16202-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:40202 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751086AbaACJ2a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jan 2014 04:28:30 -0500
Received: by mail-pb0-f52.google.com with SMTP id uo5so15492198pbc.39
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jan 2014 01:28:29 -0800 (PST)
In-Reply-To: <1388741079-16202-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

This is a dummy placeholder file. Delete it.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/include/mach/hardware.h |   18 ------------------
 arch/arm/mach-exynos/platsmp.c               |    2 --
 2 files changed, 20 deletions(-)
 delete mode 100644 arch/arm/mach-exynos/include/mach/hardware.h

diff --git a/arch/arm/mach-exynos/include/mach/hardware.h b/arch/arm/mach-exynos/include/mach/hardware.h
deleted file mode 100644
index 5109eb232f23..000000000000
--- a/arch/arm/mach-exynos/include/mach/hardware.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* linux/arch/arm/mach-exynos4/include/mach/hardware.h
- *
- * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com
- *
- * EXYNOS4 - Hardware support
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#ifndef __ASM_ARCH_HARDWARE_H
-#define __ASM_ARCH_HARDWARE_H __FILE__
-
-/* currently nothing here, placeholder */
-
-#endif /* __ASM_ARCH_HARDWARE_H */
diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index b681f899511d..7197d9ab9fcc 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -26,8 +26,6 @@
 #include <asm/smp_scu.h>
 #include <asm/firmware.h>
 
-#include <mach/hardware.h>
-
 #include <plat/cpu.h>
 
 #include "common.h"
-- 
1.7.9.5
