From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 06/28] ARM: EXYNOS: common: Remove legacy UART initialization
 code
Date: Fri, 14 Jun 2013 21:32:42 +0200
Message-ID: <1371238384-1504-7-git-send-email-t.figa@samsung.com>
References: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:31659 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751648Ab3FNTdX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 15:33:23 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOE00FZSE9PI770@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Jun 2013 20:33:20 +0100 (BST)
In-reply-to: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch removes legacy UART initialization code that was used to
set up UART platform devices when booting with ATAGS, which is not
supported on Exynos any more.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/common.c | 17 -----------------
 arch/arm/plat-samsung/init.c  |  8 +++++---
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 488d9bd..598e4b8 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -69,7 +69,6 @@ static const char name_exynos5440[] = "EXYNOS5440";
 static void exynos4_map_io(void);
 static void exynos5_map_io(void);
 static void exynos5440_map_io(void);
-static void exynos4_init_uarts(struct s3c2410_uartcfg *cfg, int no);
 static int exynos_init(void);
 
 unsigned long xxti_f = 0, xusbxti_f = 0;
@@ -79,21 +78,18 @@ static struct cpu_table cpu_ids[] __initdata = {
 		.idcode		= EXYNOS4210_CPU_ID,
 		.idmask		= EXYNOS4_CPU_MASK,
 		.map_io		= exynos4_map_io,
-		.init_uarts	= exynos4_init_uarts,
 		.init		= exynos_init,
 		.name		= name_exynos4210,
 	}, {
 		.idcode		= EXYNOS4212_CPU_ID,
 		.idmask		= EXYNOS4_CPU_MASK,
 		.map_io		= exynos4_map_io,
-		.init_uarts	= exynos4_init_uarts,
 		.init		= exynos_init,
 		.name		= name_exynos4212,
 	}, {
 		.idcode		= EXYNOS4412_CPU_ID,
 		.idmask		= EXYNOS4_CPU_MASK,
 		.map_io		= exynos4_map_io,
-		.init_uarts	= exynos4_init_uarts,
 		.init		= exynos_init,
 		.name		= name_exynos4412,
 	}, {
@@ -602,16 +598,3 @@ static int __init exynos_init(void)
 
 	return device_register(&exynos4_dev);
 }
-
-/* uart registration process */
-
-static void __init exynos4_init_uarts(struct s3c2410_uartcfg *cfg, int no)
-{
-	struct s3c2410_uartcfg *tcfg = cfg;
-	u32 ucnt;
-
-	for (ucnt = 0; ucnt < no; ucnt++, tcfg++)
-		tcfg->has_fracval = 1;
-
-	s3c24xx_init_uartdevs("exynos4210-uart", exynos4_uart_resources, cfg, no);
-}
diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/init.c
index 79d10fc..3e5c461 100644
--- a/arch/arm/plat-samsung/init.c
+++ b/arch/arm/plat-samsung/init.c
@@ -87,7 +87,7 @@ void __init s3c24xx_init_clocks(int xtal)
 }
 
 /* uart management */
-
+#if IS_ENABLED(CONFIG_SAMSUNG_ATAGS)
 static int nr_uarts __initdata = 0;
 
 static struct s3c2410_uartcfg uart_cfgs[CONFIG_SERIAL_SAMSUNG_UARTS];
@@ -134,11 +134,12 @@ void __init s3c24xx_init_uarts(struct s3c2410_uartcfg *cfg, int no)
 	if (cpu == NULL)
 		return;
 
-	if (cpu->init_uarts == NULL) {
+	if (cpu->init_uarts == NULL && IS_ENABLED(CONFIG_SAMSUNG_ATAGS)) {
 		printk(KERN_ERR "s3c24xx_init_uarts: cpu has no uart init\n");
 	} else
 		(cpu->init_uarts)(cfg, no);
 }
+#endif
 
 static int __init s3c_arch_init(void)
 {
@@ -152,8 +153,9 @@ static int __init s3c_arch_init(void)
 	ret = (cpu->init)();
 	if (ret != 0)
 		return ret;
-
+#if IS_ENABLED(CONFIG_SAMSUNG_ATAGS)
 	ret = platform_add_devices(s3c24xx_uart_devs, nr_uarts);
+#endif
 	return ret;
 }
 
-- 
1.8.2.1
