From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 2/3] ARM: EXYNOS: Fix support of Exynos4210 rev0 SoC
Date: Mon, 15 Apr 2013 16:42:01 +0200
Message-ID: <1366036922-4103-3-git-send-email-t.figa@samsung.com>
References: <1366036922-4103-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31497 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751335Ab3DOOnf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Apr 2013 10:43:35 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLA004MPWWLCU00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Apr 2013 23:43:33 +0900 (KST)
In-reply-to: <1366036922-4103-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, thomas.abraham@linaro.org, arnd@arndb.de, Tomasz Figa <t.figa@samsung.com>

This patch extends exynos_init_time() function to handle Exynos4210 rev0
SoC, which differs in availability of system timers and needs different
clocksource initialization.

This makes it possible to use exynos_init_time() function as init_time
callback for all Exynos-based boards, including Universal_C210, which
originally had to use samsung_timer_init().

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/common.c              | 6 +++++-
 arch/arm/mach-exynos/mach-universal_c210.c | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index b65229d..ec596fc 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -51,6 +51,7 @@
 #include <plat/fimc-core.h>
 #include <plat/iic-core.h>
 #include <plat/tv-core.h>
+#include <plat/samsung-time.h>
 #include <plat/spi-core.h>
 #include <plat/regs-serial.h>
 
@@ -457,7 +458,10 @@ void __init exynos_init_time(void)
 		exynos4_clk_init(NULL);
 		exynos4_clk_register_fixed_ext(xxti_f, xusbxti_f);
 #endif
-		mct_init();
+		if (soc_is_exynos4210() && samsung_rev() == EXYNOS4210_REV_0)
+			samsung_timer_init();
+		else
+			mct_init();
 	}
 }
 
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index 020e1f4..a728812 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -1177,7 +1177,7 @@ MACHINE_START(UNIVERSAL_C210, "UNIVERSAL_C210")
 	.map_io		= universal_map_io,
 	.init_machine	= universal_machine_init,
 	.init_late	= exynos_init_late,
-	.init_time	= samsung_timer_init,
+	.init_time	= exynos_init_time,
 	.reserve        = &universal_reserve,
 	.restart	= exynos4_restart,
 MACHINE_END
-- 
1.8.1.5
