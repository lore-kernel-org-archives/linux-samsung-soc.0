From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH RESEND] ARM: Exynos: use s5p-timer for UniversalC210 board
Date: Thu, 01 Mar 2012 13:30:32 +0100
Message-ID: <1330605032-17245-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:62682 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030833Ab2CAMap (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Mar 2012 07:30:45 -0500
Received: from euspt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M0700BA5HF7B4@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 12:30:43 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M07002IEHF7K3@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 12:30:43 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Commit 069d4e743 ("ARM: EXYNOS4: Remove clock event timers using ARM
private timers") removed support for local timers and forced to use MCT
as event source. However MCT is not operating properly on early revision
(EVT0) of Exynos4 SoCs. All UniversalC210 boards are based on Exynos4
EVT0, so that commit broke support for it. This patch provides a
workaround that enables UniversalC210 boards to boot again. s5p-timer is
used as an event source, it works only for non-SMP builds.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig               |    3 +++
 arch/arm/mach-exynos/mach-universal_c210.c |    4 +++-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index a95146b..c4eacc8 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -220,6 +220,9 @@ config MACH_ARMLEX4210
 config MACH_UNIVERSAL_C210
 	bool "Mobile UNIVERSAL_C210 Board"
 	select CPU_EXYNOS4210
+	select S5P_HRT
+	select CLKSRC_MMIO
+	select HAVE_SCHED_CLOCK
 	select S5P_GPIO_INT
 	select S5P_DEV_FIMC0
 	select S5P_DEV_FIMC1
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index 6017a21..ec1a3ce 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -38,6 +38,7 @@
 #include <plat/pd.h>
 #include <plat/regs-fb-v4.h>
 #include <plat/fimc-core.h>
+#include <plat/s5p-time.h>
 #include <plat/camport.h>
 #include <plat/mipi_csis.h>
 
@@ -1058,6 +1059,7 @@ static void __init universal_map_io(void)
 	exynos_init_io(NULL, 0);
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(universal_uartcfgs, ARRAY_SIZE(universal_uartcfgs));
+	s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
 }
 
 static void s5p_tv_setup(void)
@@ -1108,7 +1110,7 @@ MACHINE_START(UNIVERSAL_C210, "UNIVERSAL_C210")
 	.map_io		= universal_map_io,
 	.handle_irq	= gic_handle_irq,
 	.init_machine	= universal_machine_init,
-	.timer		= &exynos4_timer,
+	.timer		= &s5p_timer,
 	.reserve        = &universal_reserve,
 	.restart	= exynos4_restart,
 MACHINE_END
-- 
1.7.1.569.g6f426
