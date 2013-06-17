From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 11/38] ARM: EXYNOS: common: Remove legacy mapping of chip ID
 block
Date: Mon, 17 Jun 2013 18:33:56 +0200
Message-ID: <1371486863-12398-12-git-send-email-t.figa@samsung.com>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:10306 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752350Ab3FQQes (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 12:34:48 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOJ0085OQ1L6450@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 17:34:45 +0100 (BST)
In-reply-to: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch removes static mapping of chip ID block that was used when
booting with ATAGS, which is not supported on Exynos any more.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/common.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 2c8527c..f81aa22 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -99,15 +99,6 @@ static struct cpu_table cpu_ids[] __initdata = {
 
 /* Initial IO mappings */
 
-static struct map_desc exynos_iodesc[] __initdata = {
-	{
-		.virtual	= (unsigned long)S5P_VA_CHIPID,
-		.pfn		= __phys_to_pfn(EXYNOS_PA_CHIPID),
-		.length		= SZ_4K,
-		.type		= MT_DEVICE,
-	},
-};
-
 static struct map_desc exynos4_iodesc[] __initdata = {
 	{
 		.virtual	= (unsigned long)S3C_VA_SYS,
@@ -365,10 +356,7 @@ void __init exynos_init_io(struct map_desc *mach_desc, int size)
 {
 	debug_ll_io_init();
 
-	if (initial_boot_params)
-		of_scan_flat_dt(exynos_fdt_map_chipid, NULL);
-	else
-		iotable_init(exynos_iodesc, ARRAY_SIZE(exynos_iodesc));
+	of_scan_flat_dt(exynos_fdt_map_chipid, NULL);
 
 	if (mach_desc)
 		iotable_init(mach_desc, size);
-- 
1.8.2.1
