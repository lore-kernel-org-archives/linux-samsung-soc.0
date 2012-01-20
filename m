From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: [PATCH] ARM: Exynos4: Make exynos4-dt compile again
Date: Fri, 20 Jan 2012 20:21:35 +0100
Message-ID: <1327087295-10243-1-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:28521 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753412Ab2ATTWj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jan 2012 14:22:39 -0500
Received: from euspt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LY4002QW35P84@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jan 2012 19:22:37 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LY4007RU35PIF@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jan 2012 19:22:37 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Karol Lewandowski <k.lewandowsk@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

Commit cc511b8d84d88ab788cddbfe8d21485b1c387493 replaced plat/exynos4.h
with common.h, requiring all boards to be adjusted appropriately.

This commit fixes exynos4-dt.c, missed out in original patch.

Signed-off-by: Karol Lewandowski <k.lewandowsk@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/mach-exynos4-dt.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index 85fa027..98e79c9 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -19,7 +19,8 @@
 
 #include <plat/cpu.h>
 #include <plat/regs-serial.h>
-#include <plat/exynos4.h>
+
+#include "common.h"
 
 /*
  * The following lookup table is used to override device names when devices
@@ -60,7 +61,7 @@ static const struct of_dev_auxdata exynos4210_auxdata_lookup[] __initconst = {
 
 static void __init exynos4210_dt_map_io(void)
 {
-	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
+	exynos_init_io(NULL, 0);
 	s3c24xx_init_clocks(24000000);
 }
 
-- 
1.7.8.3
