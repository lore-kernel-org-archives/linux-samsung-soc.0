From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 04/20] ARM: EXYNOS: Modify the GIC physical address for static io-mapping
Date: Mon, 30 Apr 2012 12:14:14 -0700
Message-ID: <1335813270-13083-5-git-send-email-thomas.abraham@linaro.org>
References: <1335813270-13083-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:47061 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756515Ab2D3TQ4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Apr 2012 15:16:56 -0400
Received: by mail-pz0-f51.google.com with SMTP id z8so4463466dad.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Apr 2012 12:16:56 -0700 (PDT)
In-Reply-To: <1335813270-13083-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Changhwan Youn <chaos.youn@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

Adapt to changes in GIC physical address in rev1 of EXYNOS5.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/common.c           |    4 ++--
 arch/arm/mach-exynos/include/mach/map.h |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 5ccd6e8..eff4446 100644
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
index 6e6d11f..cf7d200 100644
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
1.7.5.4
