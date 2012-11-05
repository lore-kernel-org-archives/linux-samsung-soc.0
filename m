From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 1/2] ARM: EXYNOS: Add AUXDATA for DP controller
Date: Mon, 05 Nov 2012 18:48:58 +0900
Message-ID: <004801cdbb3a$c74b98d0$55e2ca70$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:61166 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753471Ab2KEJtA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Nov 2012 04:49:00 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD000G48DXMWI11@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Nov 2012 18:48:59 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.99])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD0008YHDXMH260@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Nov 2012 18:48:58 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Ajay Kumar' <ajaykumar.rs@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

Use AUXDATA to set the device names for DP controller instance
discovered from device tree.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/mach-exynos/include/mach/map.h |    2 ++
 arch/arm/mach-exynos/mach-exynos5-dt.c  |    1 +
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index ef4958b..c00a72e 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -221,6 +221,8 @@
 #define EXYNOS4_PA_TIMER		0x139D0000
 #define EXYNOS5_PA_TIMER		0x12DD0000
 
+#define EXYNOS5_PA_DP			0x145B0000
+
 #define EXYNOS4_PA_SDRAM		0x40000000
 #define EXYNOS5_PA_SDRAM		0x40000000
 
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index ed37273..8cebe12 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -86,6 +86,7 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 				"exynos5-hdmi", NULL),
 	OF_DEV_AUXDATA("samsung,exynos5-mixer", 0x14450000,
 				"exynos5-mixer", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5-dp", EXYNOS5_PA_DP, "exynos-dp", NULL),
 	{},
 };
 
-- 
1.7.1
