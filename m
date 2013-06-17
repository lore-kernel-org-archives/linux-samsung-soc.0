From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 09/38] ARM: EXYNOS: common: Remove legacy timer
 initialization code
Date: Mon, 17 Jun 2013 18:33:54 +0200
Message-ID: <1371486863-12398-10-git-send-email-t.figa@samsung.com>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:10306 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751486Ab3FQQer (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 12:34:47 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOJ0085OQ1L6450@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 17:34:43 +0100 (BST)
In-reply-to: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch removes legacy timer initialization code that was used to
set up system timers when booting with ATAGS, which is not supported
on Exynos any more.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/common.c | 39 ++-------------------------------------
 1 file changed, 2 insertions(+), 37 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 9626ce4..b1d0afa 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -299,13 +299,6 @@ static struct map_desc exynos5440_iodesc0[] __initdata = {
 	},
 };
 
-static struct samsung_pwm_variant exynos4_pwm_variant = {
-	.bits		= 32,
-	.div_base	= 0,
-	.has_tint_cstat	= true,
-	.tclk_mask	= 0,
-};
-
 void exynos4_restart(char mode, const char *cmd)
 {
 	__raw_writel(0x1, S5P_SWRESET);
@@ -451,38 +444,10 @@ static void __init exynos5440_map_io(void)
 	iotable_init(exynos5440_iodesc0, ARRAY_SIZE(exynos5440_iodesc0));
 }
 
-void __init exynos_set_timer_source(u8 channels)
-{
-	exynos4_pwm_variant.output_mask = BIT(SAMSUNG_PWM_NUM) - 1;
-	exynos4_pwm_variant.output_mask &= ~channels;
-}
-
 void __init exynos_init_time(void)
 {
-	unsigned int timer_irqs[SAMSUNG_PWM_NUM] = {
-		EXYNOS4_IRQ_TIMER0_VIC, EXYNOS4_IRQ_TIMER1_VIC,
-		EXYNOS4_IRQ_TIMER2_VIC, EXYNOS4_IRQ_TIMER3_VIC,
-		EXYNOS4_IRQ_TIMER4_VIC,
-	};
-
-	if (of_have_populated_dt()) {
-		of_clk_init(NULL);
-		clocksource_of_init();
-	} else {
-		/* todo: remove after migrating legacy E4 platforms to dt */
-#ifdef CONFIG_ARCH_EXYNOS4
-		exynos4_clk_init(NULL, !soc_is_exynos4210(), S5P_VA_CMU, readl(S5P_VA_CHIPID + 8) & 1);
-		exynos4_clk_register_fixed_ext(xxti_f, xusbxti_f);
-#endif
-#ifdef CONFIG_CLKSRC_SAMSUNG_PWM
-		if (soc_is_exynos4210() && samsung_rev() == EXYNOS4210_REV_0)
-			samsung_pwm_clocksource_init(S3C_VA_TIMER,
-					timer_irqs, &exynos4_pwm_variant);
-		else
-#endif
-			mct_init(S5P_VA_SYSTIMER, EXYNOS4_IRQ_MCT_G0,
-					EXYNOS4_IRQ_MCT_L0, EXYNOS4_IRQ_MCT_L1);
-	}
+	of_clk_init(NULL);
+	clocksource_of_init();
 }
 
 void __init exynos4_init_irq(void)
-- 
1.8.2.1
