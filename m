From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 07/12] ARM: Exynos5: Modify the GIC physical address for static
 io-mapping
Date: Tue, 17 Apr 2012 11:16:30 +0530
Message-ID: <1334641595-25301-8-git-send-email-thomas.abraham@linaro.org>
References: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25110 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752248Ab2DQFif (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Apr 2012 01:38:35 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M2L00M32ZM06YN0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Apr 2012 14:38:34 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M2L00E01ZNEZ8D2@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Apr 2012 14:38:34 +0900 (KST)
In-reply-to: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, Changhwan Youn <chaos.youn@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

Adapt to changes in GIC physical address in rev1 of Exynos5.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
---
 arch/arm/mach-exynos/common.c           |    4 ++--
 arch/arm/mach-exynos/include/mach/map.h |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 35ac675..457d031 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -265,12 +265,12 @@ static struct map_desc exynos5_iodesc[] __initdata = {
 	}, {
 		.virtual	= (unsigned long)S5P_VA_GIC_CPU,
 		.pfn		= __phys_to_pfn(EXYNOS5_PA_GIC_CPU),
-		.length		= SZ_64K,
+		.length		= SZ_8K,
 		.type		= MT_DEVICE,
 	}, {
 		.virtual	= (unsigned long)S5P_VA_GIC_DIST,
 		.pfn		= __phys_to_pfn(EXYNOS5_PA_GIC_DIST),
-		.length		= SZ_64K,
+		.length		= SZ_4K,
 		.type		= MT_DEVICE,
 	},
 };
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 0e2292d..648d59b 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -78,8 +78,8 @@
 
 #define EXYNOS4_PA_GIC_CPU		0x10480000
 #define EXYNOS4_PA_GIC_DIST		0x10490000
-#define EXYNOS5_PA_GIC_CPU		0x10480000
-#define EXYNOS5_PA_GIC_DIST		0x10490000
+#define EXYNOS5_PA_GIC_CPU		0x10482000
+#define EXYNOS5_PA_GIC_DIST		0x10481000
 
 #define EXYNOS4_PA_COREPERI		0x10500000
 #define EXYNOS4_PA_TWD			0x10500600
-- 
1.6.6.rc2
