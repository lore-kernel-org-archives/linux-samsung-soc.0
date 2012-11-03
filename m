From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 4/5] ARM: Exynos: remove static io-remapping of mct registers
 for Exynos5
Date: Sat, 03 Nov 2012 20:15:37 +0530
Message-ID: <1351953938-13487-5-git-send-email-thomas.abraham@linaro.org>
References: <1351953938-13487-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:9279 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752543Ab2KCOVG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 Nov 2012 10:21:06 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCX007581730O50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 03 Nov 2012 23:21:05 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCX00DCN163LTA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 03 Nov 2012 23:21:05 +0900 (KST)
In-reply-to: <1351953938-13487-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.figa@samsung.com, Changhwan Youn <chaos.youn@samsung.com>

With device tree support enabled for MCT controller, the static io-remapping
of the MCT controller address space is removed for Exynos5 platforms (which
supports only device tree based boot).

Cc: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/common.c           |    5 -----
 arch/arm/mach-exynos/include/mach/map.h |    1 -
 2 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 56844d1..44be55d 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -234,11 +234,6 @@ static struct map_desc exynos5_iodesc[] __initdata = {
 		.length		= SZ_4K,
 		.type		= MT_DEVICE,
 	}, {
-		.virtual	= (unsigned long)S5P_VA_SYSTIMER,
-		.pfn		= __phys_to_pfn(EXYNOS5_PA_SYSTIMER),
-		.length		= SZ_4K,
-		.type		= MT_DEVICE,
-	}, {
 		.virtual	= (unsigned long)S5P_VA_SYSRAM,
 		.pfn		= __phys_to_pfn(EXYNOS5_PA_SYSRAM),
 		.length		= SZ_4K,
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index e737331..9355552 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -64,7 +64,6 @@
 #define EXYNOS5_PA_CMU			0x10010000
 
 #define EXYNOS4_PA_SYSTIMER		0x10050000
-#define EXYNOS5_PA_SYSTIMER		0x101C0000
 
 #define EXYNOS4_PA_WATCHDOG		0x10060000
 #define EXYNOS5_PA_WATCHDOG		0x101D0000
-- 
1.6.6.rc2
