From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v4 1/8] ARM: EXYNOS: remove unused static mapping of CMU for
 exynos5
Date: Mon, 19 Oct 2015 17:16:39 +0530
Message-ID: <1445255206-11148-2-git-send-email-pankaj.dubey@samsung.com>
References: <1445255206-11148-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52236 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752209AbbJSLuZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 07:50:25 -0400
In-reply-to: <1445255206-11148-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, k.kozlowski@samsung.com, p.fedin@samsung.com, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

Remove unused static mapping of exynos5 CMU and related code.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/mach-exynos/exynos.c           | 5 -----
 arch/arm/mach-exynos/include/mach/map.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 1c47aee..524aa6f 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -70,11 +70,6 @@ static struct map_desc exynos5_iodesc[] __initdata = {
 		.pfn		= __phys_to_pfn(EXYNOS5_PA_SROMC),
 		.length		= SZ_4K,
 		.type		= MT_DEVICE,
-	}, {
-		.virtual	= (unsigned long)S5P_VA_CMU,
-		.pfn		= __phys_to_pfn(EXYNOS5_PA_CMU),
-		.length		= 144 * SZ_1K,
-		.type		= MT_DEVICE,
 	},
 };
 
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index de3ae59..a2acba3 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -25,7 +25,6 @@
 #define EXYNOS_PA_CHIPID		0x10000000
 
 #define EXYNOS4_PA_CMU			0x10030000
-#define EXYNOS5_PA_CMU			0x10010000
 
 #define EXYNOS4_PA_DMC0			0x10400000
 #define EXYNOS4_PA_DMC1			0x10410000
-- 
2.4.5
