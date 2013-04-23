From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v3 10/13] ARM: SAMSUNG: Do not register legacy timer interrupts
 on Exynos
Date: Tue, 23 Apr 2013 17:46:31 +0200
Message-ID: <1366731994-7478-11-git-send-email-t.figa@samsung.com>
References: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:45371 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756077Ab3DWPtS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 11:49:18 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLP00KPHT9O4980@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Apr 2013 00:49:17 +0900 (KST)
In-reply-to: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, tomasz.figa@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de, olof@lixom.net, ben-linux@fluff.org, thomas.abraham@linaro.org, Tomasz Figa <t.figa@samsung.com>

This patch removes legacy PWM timer interrupt initialization from
exynos{4,5}_init_irq() functions, since it conflicts with internal
interrupt handling of the new PWM clocksource driver.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/common.c | 15 ---------------
 arch/arm/plat-samsung/Kconfig |  4 ++--
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 64ef39e..9574498 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -492,13 +492,6 @@ void __init exynos4_init_irq(void)
 		combiner_init(S5P_VA_COMBINER_BASE, NULL,
 			      max_combiner_nr(), COMBINER_IRQ(0, 0));
 
-	/*
-	 * The parameters of s5p_init_irq() are for VIC init.
-	 * Theses parameters should be NULL and 0 because EXYNOS4
-	 * uses GIC instead of VIC.
-	 */
-	s5p_init_irq(NULL, 0);
-
 	gic_arch_extn.irq_set_wake = s3c_irq_wake;
 }
 
@@ -507,14 +500,6 @@ void __init exynos5_init_irq(void)
 #ifdef CONFIG_OF
 	irqchip_init();
 #endif
-	/*
-	 * The parameters of s5p_init_irq() are for VIC init.
-	 * Theses parameters should be NULL and 0 because EXYNOS4
-	 * uses GIC instead of VIC.
-	 */
-	if (!of_machine_is_compatible("samsung,exynos5440"))
-		s5p_init_irq(NULL, 0);
-
 	gic_arch_extn.irq_set_wake = s3c_irq_wake;
 }
 
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 53e7eeb..04410da 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -97,9 +97,9 @@ config SAMSUNG_IRQ_VIC_TIMER
          Internal configuration to build the VIC timer interrupt code.
 
 config S5P_IRQ
-	def_bool (ARCH_S5P64X0 || ARCH_S5PC100 || ARCH_S5PV210 || ARCH_EXYNOS)
+	def_bool (ARCH_S5P64X0 || ARCH_S5PC100 || ARCH_S5PV210)
 	help
-	  Support common interrup part for ARCH_S5P and ARCH_EXYNOS SoCs
+	  Support common interrupt part for ARCH_S5P SoCs
 
 config S5P_EXT_INT
 	bool
-- 
1.8.2.1
