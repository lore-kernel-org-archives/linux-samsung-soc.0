From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 35/38] ARM: EXYNOS: Remove custom init_irq callbacks
Date: Mon, 17 Jun 2013 18:34:20 +0200
Message-ID: <1371486863-12398-36-git-send-email-t.figa@samsung.com>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:10306 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753256Ab3FQQe6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 12:34:58 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOJ0085OQ1L6450@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 17:34:57 +0100 (BST)
In-reply-to: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Since both exynos4_init_irq() and exynos5_init_irq() are just calling
irqchip_init(), there is no need for them to exist any more, since this
is the default that is called when init_irq callback is not specified.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/common.c          | 10 ----------
 arch/arm/mach-exynos/common.h          |  2 --
 arch/arm/mach-exynos/mach-exynos4-dt.c |  1 -
 arch/arm/mach-exynos/mach-exynos5-dt.c |  1 -
 4 files changed, 14 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 7b53e4c..91d457f 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -400,16 +400,6 @@ void __init exynos_init_time(void)
 	clocksource_of_init();
 }
 
-void __init exynos4_init_irq(void)
-{
-	irqchip_init();
-}
-
-void __init exynos5_init_irq(void)
-{
-	irqchip_init();
-}
-
 struct bus_type exynos_subsys = {
 	.name		= "exynos-core",
 	.dev_name	= "exynos-core",
diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index 11fc1e2..1c83f95 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -20,8 +20,6 @@ extern unsigned long xxti_f, xusbxti_f;
 
 struct map_desc;
 void exynos_init_io(struct map_desc *mach_desc, int size);
-void exynos4_init_irq(void);
-void exynos5_init_irq(void);
 void exynos4_restart(char mode, const char *cmd);
 void exynos5_restart(char mode, const char *cmd);
 void exynos_init_late(void);
diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index b9ed834..df15726 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -55,7 +55,6 @@ static void __init exynos4_reserve(void)
 DT_MACHINE_START(EXYNOS4210_DT, "Samsung Exynos4 (Flattened Device Tree)")
 	/* Maintainer: Thomas Abraham <thomas.abraham@linaro.org> */
 	.smp		= smp_ops(exynos_smp_ops),
-	.init_irq	= exynos4_init_irq,
 	.map_io		= exynos4_dt_map_io,
 	.init_early	= exynos_firmware_init,
 	.init_machine	= exynos4_dt_machine_init,
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 9596861..8777310 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -104,7 +104,6 @@ static void __init exynos5_reserve(void)
 
 DT_MACHINE_START(EXYNOS5_DT, "SAMSUNG EXYNOS5 (Flattened Device Tree)")
 	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
-	.init_irq	= exynos5_init_irq,
 	.smp		= smp_ops(exynos_smp_ops),
 	.map_io		= exynos5_dt_map_io,
 	.init_machine	= exynos5_dt_machine_init,
-- 
1.8.2.1
