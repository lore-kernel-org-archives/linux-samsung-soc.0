From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 2/6] ARM: EXYNOS: exynos4-dt: Use exynos4 prefix instead of
 exynos4210
Date: Thu, 30 Aug 2012 09:31:39 +0200
Message-ID: <1346311903-15920-3-git-send-email-t.figa@samsung.com>
References: <1346311903-15920-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33686 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751194Ab2H3HcT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Aug 2012 03:32:19 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9K00I9W4WU26C0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Aug 2012 16:32:14 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9K00G074XCNR40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Aug 2012 16:32:14 +0900 (KST)
In-reply-to: <1346311903-15920-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, thomas.abraham@linaro.org, Tomasz Figa <t.figa@samsung.com>

Since mach-exynos4-dt.c is also going to be used for other SoCs from Exynos4
line, rename internal structures and functions to use exynos4_ prefix, instead
of exynos4210_.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/mach-exynos4-dt.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index b2b5d5f..8dad4ec 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -1,5 +1,5 @@
 /*
- * Samsung's Exynos4210 flattened device tree enabled machine
+ * Samsung's Exynos4 flattened device tree enabled machine
  *
  * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
@@ -36,7 +36,7 @@
  * at some point, the drivers should be capable of parsing all the platform
  * data from the device tree.
  */
-static const struct of_dev_auxdata exynos4210_auxdata_lookup[] __initconst = {
+static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("samsung,exynos4210-uart", EXYNOS4_PA_UART0,
 				"exynos4210-uart.0", NULL),
 	OF_DEV_AUXDATA("samsung,exynos4210-uart", EXYNOS4_PA_UART1,
@@ -66,19 +66,19 @@ static const struct of_dev_auxdata exynos4210_auxdata_lookup[] __initconst = {
 	{},
 };
 
-static void __init exynos4210_dt_map_io(void)
+static void __init exynos4_dt_map_io(void)
 {
 	exynos_init_io(NULL, 0);
 	s3c24xx_init_clocks(24000000);
 }
 
-static void __init exynos4210_dt_machine_init(void)
+static void __init exynos4_dt_machine_init(void)
 {
 	of_platform_populate(NULL, of_default_bus_match_table,
-				exynos4210_auxdata_lookup, NULL);
+				exynos4_auxdata_lookup, NULL);
 }
 
-static char const *exynos4210_dt_compat[] __initdata = {
+static char const *exynos4_dt_compat[] __initdata = {
 	"samsung,exynos4210",
 	NULL
 };
@@ -86,11 +86,11 @@ static char const *exynos4210_dt_compat[] __initdata = {
 DT_MACHINE_START(EXYNOS4210_DT, "Samsung Exynos4 (Flattened Device Tree)")
 	/* Maintainer: Thomas Abraham <thomas.abraham@linaro.org> */
 	.init_irq	= exynos4_init_irq,
-	.map_io		= exynos4210_dt_map_io,
+	.map_io		= exynos4_dt_map_io,
 	.handle_irq	= gic_handle_irq,
-	.init_machine	= exynos4210_dt_machine_init,
+	.init_machine	= exynos4_dt_machine_init,
 	.init_late	= exynos_init_late,
 	.timer		= &exynos4_timer,
-	.dt_compat	= exynos4210_dt_compat,
+	.dt_compat	= exynos4_dt_compat,
 	.restart        = exynos4_restart,
 MACHINE_END
-- 
1.7.12
