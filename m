From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [RESEND PATCH v5 1/8] ARM: EXYNOS: remove unused static mapping of CMU
 for exynos5
Date: Sat, 12 Dec 2015 13:13:55 +0530
Message-ID: <1449906242-20843-2-git-send-email-pankaj.dubey@samsung.com>
References: <1449906242-20843-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1449906242-20843-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, k.kozlowski@samsung.com, thomas.ab@samsung.com, p.fedin@samsung.com, andi.shyti@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Remove unused static mapping of exynos5 CMU and related code.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Kukjin Kim <kgene@kernel.org>
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
1.9.1
