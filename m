From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 04/28] ARM: EXYNOS: common: Remove legacy PMU initialization
 code
Date: Fri, 14 Jun 2013 21:32:40 +0200
Message-ID: <1371238384-1504-5-git-send-email-t.figa@samsung.com>
References: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:20222 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753829Ab3FNTdX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 15:33:23 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOE00E84E2KE880@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Jun 2013 20:33:19 +0100 (BST)
In-reply-to: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch removes legacy PMU initialization code that was used to set
up PMU when booting with ATAGS, which is not supported any more.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/common.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 98343577..cb07f4a 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -922,30 +922,3 @@ static int __init exynos_init_irq_eint(void)
 	return 0;
 }
 arch_initcall(exynos_init_irq_eint);
-
-static struct resource exynos4_pmu_resource[] = {
-	DEFINE_RES_IRQ(EXYNOS4_IRQ_PMU),
-	DEFINE_RES_IRQ(EXYNOS4_IRQ_PMU_CPU1),
-#if defined(CONFIG_SOC_EXYNOS4412)
-	DEFINE_RES_IRQ(EXYNOS4_IRQ_PMU_CPU2),
-	DEFINE_RES_IRQ(EXYNOS4_IRQ_PMU_CPU3),
-#endif
-};
-
-static struct platform_device exynos4_device_pmu = {
-	.name		= "arm-pmu",
-	.num_resources	= ARRAY_SIZE(exynos4_pmu_resource),
-	.resource	= exynos4_pmu_resource,
-};
-
-static int __init exynos_armpmu_init(void)
-{
-	if (!of_have_populated_dt()) {
-		if (soc_is_exynos4210() || soc_is_exynos4212())
-			exynos4_device_pmu.num_resources = 2;
-		platform_device_register(&exynos4_device_pmu);
-	}
-
-	return 0;
-}
-arch_initcall(exynos_armpmu_init);
-- 
1.8.2.1
