From: Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: [PATCH] ARM: Exynos4: fixed SYSMMU setup definition to mate parameter
 name
Date: Mon, 27 Aug 2012 16:01:43 +0900
Message-ID: <1346050903-4450-1-git-send-email-sw0312.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:23152 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752386Ab2H0HBi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Aug 2012 03:01:38 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9E00F9HJDTRJD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Aug 2012 16:01:36 +0900 (KST)
Received: from localhost.localdomain ([10.90.51.68])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9E00HP9JILREI0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Aug 2012 16:01:36 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
Cc: sw0312.kim@samsung.com, kyungmin.park@samsung.com, pullip.cho@samsung.com

This is trivial patch to mate parameter name between iommu api enabled case and
disabled case.

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/include/mach/sysmmu.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/sysmmu.h b/arch/arm/mach-exynos/include/mach/sysmmu.h
index 998daf2..81e4c66 100644
--- a/arch/arm/mach-exynos/include/mach/sysmmu.h
+++ b/arch/arm/mach-exynos/include/mach/sysmmu.h
@@ -58,7 +58,7 @@ static inline void platform_set_sysmmu(
 #endif
 
 #else /* !CONFIG_EXYNOS_DEV_SYSMMU */
-#define platform_set_sysmmu(dev, sysmmu) do { } while (0)
+#define platform_set_sysmmu(sysmu, dev) do { } while (0)
 #endif
 
 #define SYSMMU_CLOCK_DEVNAME(ipname, id) (SYSMMU_DEVNAME_BASE "." #id)
-- 
1.7.4.1
