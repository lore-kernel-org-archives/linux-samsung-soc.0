From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] ARM: EXYNOS: remove unnecessary header inclusions from
 exynos4/5 dt machine file
Date: Mon, 16 Sep 2013 17:51:06 +0900
Message-ID: <000001ceb2b9$e1936430$a4ba2c90$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48145 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750781Ab3IPIvN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Sep 2013 04:51:13 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MT700DS0N960140@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 Sep 2013 17:51:06 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

mach-exynos{4,5}-dt.c include several header files that are not
really used.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/mach-exynos/mach-exynos4-dt.c |    4 ----
 arch/arm/mach-exynos/mach-exynos5-dt.c |    4 ----
 2 files changed, 8 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index 0099c6c..3fc338f 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -11,12 +11,8 @@
  * published by the Free Software Foundation.
 */
 
-#include <linux/kernel.h>
 #include <linux/of_platform.h>
 #include <linux/of_fdt.h>
-#include <linux/serial_core.h>
-#include <linux/memblock.h>
-#include <linux/clocksource.h>
 
 #include <asm/mach/arch.h>
 #include <plat/mfc.h>
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index f874b77..217e84f 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -11,14 +11,10 @@
 
 #include <linux/of_platform.h>
 #include <linux/of_fdt.h>
-#include <linux/memblock.h>
 #include <linux/io.h>
-#include <linux/clocksource.h>
 
 #include <asm/mach/arch.h>
 #include <mach/regs-pmu.h>
-
-#include <plat/cpu.h>
 #include <plat/mfc.h>
 
 #include "common.h"
-- 
1.7.10.4
