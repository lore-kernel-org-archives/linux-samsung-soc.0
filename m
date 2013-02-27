From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V2 3/3] ARM: Exynos5: add FIMD AUXDATA entry for exynos5 DT
Date: Wed, 27 Feb 2013 04:40:47 -0500
Message-ID: <1361958047-21994-4-git-send-email-l.krishna@samsung.com>
References: <1361958047-21994-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28882 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754981Ab3B0JUT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Feb 2013 04:20:19 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MIV00KMKGLRAZT0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Feb 2013 18:20:15 +0900 (KST)
In-reply-to: <1361958047-21994-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Adds the FIMD AUXDATA entry for Exynos5

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/mach-exynos/include/mach/map.h | 1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 1df6abb..5e3f789 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -178,6 +178,7 @@
 #define EXYNOS4_PA_MIPI_CSIS1		0x11890000
 
 #define EXYNOS4_PA_FIMD0		0x11C00000
+#define EXYNOS5_PA_FIMD1		0x14400000
 
 #define EXYNOS4_PA_HSMMC(x)		(0x12510000 + ((x) * 0x10000))
 #define EXYNOS4_PA_DWMCI		0x12550000
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index e99d3d8..4c69c23 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -104,6 +104,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("samsung,mfc-v6", 0x11000000, "s5p-mfc-v6", NULL),
 	OF_DEV_AUXDATA("samsung,exynos5250-tmu", 0x10060000,
 				"exynos-tmu", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5250-fimd", EXYNOS5_PA_FIMD1,
+				"exynos5-fb.1", NULL),
 	{},
 };
 
-- 
1.8.0
