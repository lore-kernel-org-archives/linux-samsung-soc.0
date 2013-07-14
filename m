From: Yadwinder Singh Brar <yadi.brar@samsung.com>
Subject: [PATCH 2/2] ARM: EXYNOS: Fix low level debug support
Date: Sun, 14 Jul 2013 18:16:59 +0530
Message-ID: <1373806020-7336-2-git-send-email-yadi.brar@samsung.com>
References: <1373806020-7336-1-git-send-email-yadi.brar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:65271 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932175Ab3GWM50 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 08:57:26 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQE00ADM3ZOJO40@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Jul 2013 21:57:24 +0900 (KST)
In-reply-to: <1373806020-7336-1-git-send-email-yadi.brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, arnd@arndb.de, olof@lixom.net, dianders@chromium.org, thomas.abraham@linaro.org, t.figa@samsung.com, yadi.brar01@gmail.com, Yadwinder Singh Brar <yadi.brar@samsung.com>

Presently, using exynos_defconfig with CONFIG_DEBUG_LL and CONFIG_EARLY_PRIN
on, kernel is not booting, we are getting following:

[    0.000000] ------------[ cut here ]------------
[    0.000000] kernel BUG at mm/vmalloc.c:1134!
[    0.000000] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 3.11.0-rc1 #633
[    0.000000] task: c052ec48 ti: c0524000 task.ti: c0524000
[    0.000000] PC is at vm_area_add_early+0x54/0x94
[    0.000000] LR is at add_static_vm_early+0xc/0x60

Its because exynos[4/5]_map_io() function ioremaps a single 512KB memory
size for all the four uart ports which envelopes the mapping created by
debug_ll_io_init(), called earlier in exynos_init_io().

This patch removes iodesc entries for UART controller for all Samsung SoC's,
since now the Samsung uart driver does a ioremap during probe and any needed
iomapping for earlyprintk will be handled by debug_ll_io_init().

Tested on smdk4412 and smdk5250.

Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
---
 arch/arm/mach-exynos/common.c |   26 --------------------------
 1 files changed, 0 insertions(+), 26 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 164685b..ba95e5d 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -58,7 +58,6 @@ static const char name_exynos5440[] = "EXYNOS5440";
 
 static void exynos4_map_io(void);
 static void exynos5_map_io(void);
-static void exynos5440_map_io(void);
 static int exynos_init(void);
 
 static struct cpu_table cpu_ids[] __initdata = {
@@ -95,7 +94,6 @@ static struct cpu_table cpu_ids[] __initdata = {
 	}, {
 		.idcode		= EXYNOS5440_SOC_ID,
 		.idmask		= EXYNOS5_SOC_MASK,
-		.map_io		= exynos5440_map_io,
 		.init		= exynos_init,
 		.name		= name_exynos5440,
 	},
@@ -150,11 +148,6 @@ static struct map_desc exynos4_iodesc[] __initdata = {
 		.length		= SZ_64K,
 		.type		= MT_DEVICE,
 	}, {
-		.virtual	= (unsigned long)S3C_VA_UART,
-		.pfn		= __phys_to_pfn(EXYNOS4_PA_UART),
-		.length		= SZ_512K,
-		.type		= MT_DEVICE,
-	}, {
 		.virtual	= (unsigned long)S5P_VA_CMU,
 		.pfn		= __phys_to_pfn(EXYNOS4_PA_CMU),
 		.length		= SZ_128K,
@@ -268,20 +261,6 @@ static struct map_desc exynos5_iodesc[] __initdata = {
 		.pfn		= __phys_to_pfn(EXYNOS5_PA_PMU),
 		.length		= SZ_64K,
 		.type		= MT_DEVICE,
-	}, {
-		.virtual	= (unsigned long)S3C_VA_UART,
-		.pfn		= __phys_to_pfn(EXYNOS5_PA_UART),
-		.length		= SZ_512K,
-		.type		= MT_DEVICE,
-	},
-};
-
-static struct map_desc exynos5440_iodesc0[] __initdata = {
-	{
-		.virtual	= (unsigned long)S3C_VA_UART,
-		.pfn		= __phys_to_pfn(EXYNOS5440_PA_UART0),
-		.length		= SZ_512K,
-		.type		= MT_DEVICE,
 	},
 };
 
@@ -388,11 +367,6 @@ static void __init exynos5_map_io(void)
 		iotable_init(exynos5250_iodesc, ARRAY_SIZE(exynos5250_iodesc));
 }
 
-static void __init exynos5440_map_io(void)
-{
-	iotable_init(exynos5440_iodesc0, ARRAY_SIZE(exynos5440_iodesc0));
-}
-
 void __init exynos_init_time(void)
 {
 	of_clk_init(NULL);
-- 
1.7.0.4
