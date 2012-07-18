From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 2/8] ARM: EXYNOS5: Add machine data for USB 2.0
Date: Wed, 18 Jul 2012 19:15:22 +0530
Message-ID: <1342619128-25013-3-git-send-email-gautam.vivek@samsung.com>
References: <1342619128-25013-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:32829 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751590Ab2GRNbA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jul 2012 09:31:00 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7C00I6FYVD56O0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Jul 2012 22:30:59 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7C00MXCYV9WD70@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Jul 2012 22:30:59 +0900 (KST)
In-reply-to: <1342619128-25013-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, l.majewski@samsung.com, kyungmin.park@samsung.com, thomas.abraham@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, m.szyprowski@samsung.com
Cc: a.kesavan@samsung.com, yulgon.kim@samsung.com, boyko.lee@samsung.com, av.tikhomirov@samsung.com, joshi@samsung.com, olofj@google.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

From: Ajay Kumar <ajaykumar.rs@samsung.com>

This patch adds address mapping of USB 2.0 PHY for exynos5

Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 4eb39cd..92d5e61 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -275,6 +275,11 @@ static struct map_desc exynos5_iodesc[] __initdata = {
 		.pfn		= __phys_to_pfn(EXYNOS5_PA_GIC_DIST),
 		.length		= SZ_4K,
 		.type		= MT_DEVICE,
+	}, {
+		.virtual	= (unsigned long)S3C_VA_USB_HSPHY,
+		.pfn		= __phys_to_pfn(EXYNOS5_PA_USB_PHY),
+		.length		= SZ_4K,
+		.type		= MT_DEVICE,
 	},
 };
 
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index c72b675..331ae57 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -192,6 +192,8 @@
 #define EXYNOS4_PA_UART			0x13800000
 #define EXYNOS5_PA_UART			0x12C00000
 
+#define EXYNOS5_PA_USB_PHY		0x12130000
+
 #define EXYNOS4_PA_VP			0x12C00000
 #define EXYNOS4_PA_MIXER		0x12C10000
 #define EXYNOS4_PA_SDO			0x12C20000
-- 
1.7.0.4
