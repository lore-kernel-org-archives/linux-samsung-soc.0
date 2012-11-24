From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] ARM: Exynos5: fix clock initialization for exynos5250
Date: Sat, 24 Nov 2012 15:23:30 +0530
Message-ID: <1353750810-21953-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25504 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964780Ab2KXJYH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Nov 2012 04:24:07 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDZ000BSJG6IY20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Nov 2012 18:24:06 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDZ005U9JG02A00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Nov 2012 18:24:05 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com

The machine compatible value cannot be checked in exynos5_dt_map_io function
since the tree is not unflattened yet. Fix this by using soc_is_exynos5250
macro.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/mach-exynos5-dt.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 77010f8..845d8e2 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -117,7 +117,7 @@ static void __init exynos5_dt_map_io(void)
 {
 	exynos_init_io(NULL, 0);
 
-	if (of_machine_is_compatible("samsung,exynos5250"))
+	if (soc_is_exynos5250())
 		s3c24xx_init_clocks(24000000);
 }
 
-- 
1.6.6.rc2
