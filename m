From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 2/7] ARM: EXYNOS: code cleanup in map.h
Date: Mon, 24 Aug 2015 13:32:23 +0530
Message-ID: <1440403348-8974-3-git-send-email-pankaj.dubey@samsung.com>
References: <1440403348-8974-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39267 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932239AbbHXIFT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 04:05:19 -0400
In-reply-to: <1440403348-8974-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: k.kozlowski@samsung.com, kgene@kernel.org, heiko@sntech.de, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

Remove unused exynos5440 uart offset macro.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
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
