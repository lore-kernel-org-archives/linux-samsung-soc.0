From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v3 4/5] ARM: Exynos: remove static io-remapping of mct registers for Exynos5
Date: Sat, 29 Dec 2012 12:50:37 -0800
Message-ID: <1356814238-23895-5-git-send-email-thomas.abraham@linaro.org>
References: <1356814238-23895-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:57998 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753106Ab2L2U56 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 29 Dec 2012 15:57:58 -0500
Received: by mail-pa0-f52.google.com with SMTP id fb1so6545118pad.11
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Dec 2012 12:57:58 -0800 (PST)
In-Reply-To: <1356814238-23895-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, t.figa@samsung.com, chaos.youn@samsung.com, sylvester.nawrocki@gmail.com

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
index 578a610..30592f0 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -284,11 +284,6 @@ static struct map_desc exynos5_iodesc[] __initdata = {
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
index b8ea67e..99e0a79 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -68,7 +68,6 @@
 #define EXYNOS5_PA_CMU			0x10010000
 
 #define EXYNOS4_PA_SYSTIMER		0x10050000
-#define EXYNOS5_PA_SYSTIMER		0x101C0000
 
 #define EXYNOS4_PA_WATCHDOG		0x10060000
 #define EXYNOS5_PA_WATCHDOG		0x101D0000
-- 
1.7.5.4
