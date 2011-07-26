From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/2] ARM: Exynos4: use s5p-timer for UniversalC210 board
Date: Tue, 26 Jul 2011 07:50:56 +0200
Message-ID: <1311659456-6659-3-git-send-email-m.szyprowski@samsung.com>
References: <1311659456-6659-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:46620 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751337Ab1GZFvF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jul 2011 01:51:05 -0400
Received: from spt2.w1.samsung.com ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LOX00IMCEX2RM90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Jul 2011 06:51:02 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOX00C6REX11A@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Jul 2011 06:51:01 +0100 (BST)
In-reply-to: <1311659456-6659-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Angus Ainslie <angus.ainslie@linaro.org>

Commit 069d4e743 removed support for local timers and forced to use MCT as
event source. However MCT is not operating properly on early revision (EVT0)
of Exynos4 SoCs. All UniversalC210 boards are based on Exynos4 EVT0, so that
commit broke support for it. This patch provides a workaround that enables
UniversalC210 boards to boot again. s5p-timer is used as an event source.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig               |    3 +++
 arch/arm/mach-exynos4/mach-universal_c210.c |    4 +++-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 9d62e13..2aad73f 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -173,6 +173,9 @@ config MACH_ARMLEX4210
 config MACH_UNIVERSAL_C210
 	bool "Mobile UNIVERSAL_C210 Board"
 	select CPU_EXYNOS4210
+	select S5P_HRT
+	select CLKSRC_MMIO
+	select HAVE_SCHED_CLOCK
 	select S5P_GPIO_INT
 	select S5P_DEV_FIMC0
 	select S5P_DEV_FIMC1
diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/mach-exynos4/mach-universal_c210.c
index 0e280d1..ca9e7b7 100644
--- a/arch/arm/mach-exynos4/mach-universal_c210.c
+++ b/arch/arm/mach-exynos4/mach-universal_c210.c
@@ -34,6 +34,7 @@
 #include <plat/mfc.h>
 #include <plat/sdhci.h>
 #include <plat/pd.h>
+#include <plat/s5p-time.h>
 
 #include <mach/map.h>
 
@@ -730,6 +731,7 @@ static void __init universal_map_io(void)
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(universal_uartcfgs, ARRAY_SIZE(universal_uartcfgs));
+	s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
 }
 
 static void __init universal_reserve(void)
@@ -766,6 +768,6 @@ MACHINE_START(UNIVERSAL_C210, "UNIVERSAL_C210")
 	.init_irq	= exynos4_init_irq,
 	.map_io		= universal_map_io,
 	.init_machine	= universal_machine_init,
-	.timer		= &exynos4_timer,
+	.timer		= &s5p_timer,
 	.reserve        = &universal_reserve,
 MACHINE_END
-- 
1.7.1.569.g6f426
