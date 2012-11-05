From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 5/5] arm: exynos: enable helper functions for dt based platforms
Date: Mon, 05 Nov 2012 13:01:25 +0530
Message-ID: <1352100685-7695-6-git-send-email-rahul.sharma@samsung.com>
References: <1352100685-7695-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58235 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751107Ab2KEHU4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Nov 2012 02:20:56 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD0005TG72QKLP0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Nov 2012 16:20:55 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD0000R36MFH8E0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Nov 2012 16:20:54 +0900 (KST)
In-reply-to: <1352100685-7695-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: tomasz.figa@gmail.com, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com

This patch enables the support for helper function platform_set_sysmmu
for DT based platform which is defined under CONFIG_IOMMU_API. Earlier
CONFIG_EXYNOS_DEV_SYSMMU was restricting its usage for DT platforms like
exynos5250_DT.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/mach-exynos/include/mach/sysmmu.h |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/sysmmu.h b/arch/arm/mach-exynos/include/mach/sysmmu.h
index 88a4543..ad0f211 100644
--- a/arch/arm/mach-exynos/include/mach/sysmmu.h
+++ b/arch/arm/mach-exynos/include/mach/sysmmu.h
@@ -12,6 +12,8 @@
 #ifndef _ARM_MACH_EXYNOS_SYSMMU_H_
 #define _ARM_MACH_EXYNOS_SYSMMU_H_
 
+#include <linux/device.h>
+
 struct sysmmu_platform_data {
 	char *dbgname;
 	/* comma(,) separated list of clock names for clock gating */
@@ -24,7 +26,6 @@ struct sysmmu_platform_data {
 #define SYSMMU_CLOCK_NAME2 "sysmmu_mc"
 
 #ifdef CONFIG_EXYNOS_DEV_SYSMMU
-#include <linux/device.h>
 struct platform_device;
 
 #define SYSMMU_PLATDEV(ipname) exynos_device_sysmmu_##ipname
@@ -49,15 +50,15 @@ extern struct platform_device SYSMMU_PLATDEV(camif0);
 extern struct platform_device SYSMMU_PLATDEV(camif1);
 extern struct platform_device SYSMMU_PLATDEV(2d);
 
+#endif
+
 #ifdef CONFIG_IOMMU_API
 static inline void platform_set_sysmmu(
 				struct device *sysmmu, struct device *dev)
 {
 	dev->archdata.iommu = sysmmu;
 }
-#endif
-
-#else /* !CONFIG_EXYNOS_DEV_SYSMMU */
+#else /* !CONFIG_IOMMU_API */
 #define platform_set_sysmmu(sysmmu, dev) do { } while (0)
 #endif
 
-- 
1.7.0.4
