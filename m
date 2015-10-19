From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v4 2/8] ARM: EXYNOS: code cleanup in map.h
Date: Mon, 19 Oct 2015 17:16:40 +0530
Message-ID: <1445255206-11148-3-git-send-email-pankaj.dubey@samsung.com>
References: <1445255206-11148-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1445255206-11148-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, k.kozlowski@samsung.com, p.fedin@samsung.com, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Remove unused exynos5440 uart offset macro.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/mach-exynos/include/mach/map.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index a2acba3..86d8085 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -35,8 +35,4 @@
 #define EXYNOS4_PA_SROMC		0x12570000
 #define EXYNOS5_PA_SROMC		0x12250000
 
-/* Compatibility UART */
-
-#define EXYNOS5440_PA_UART0		0x000B0000
-
 #endif /* __ASM_ARCH_MAP_H */
-- 
2.4.5
