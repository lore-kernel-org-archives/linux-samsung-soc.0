From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH] ARM: EXYNOS: exynos4-dt: Set .smp field of machine descriptor
Date: Fri, 12 Oct 2012 11:49:38 +0200
Message-ID: <1350035378-31989-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44207 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933654Ab2JLJuK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Oct 2012 05:50:10 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBR00CEHXZHFR60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Oct 2012 18:50:08 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBR002BOXYYGPB0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Oct 2012 18:50:08 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com, thomas.abraham@linaro.org

This patch adds missing initializer of .smp field of machine descriptor
of Exynos 4 DT machine.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/mach-exynos4-dt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index 7222e3c..d6bdcfb 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -119,6 +119,7 @@ static char const *exynos4_dt_compat[] __initdata = {
 
 DT_MACHINE_START(EXYNOS4210_DT, "Samsung Exynos4 (Flattened Device Tree)")
 	/* Maintainer: Thomas Abraham <thomas.abraham@linaro.org> */
+	.smp		= smp_ops(exynos_smp_ops),
 	.init_irq	= exynos4_init_irq,
 	.map_io		= exynos4_dt_map_io,
 	.handle_irq	= gic_handle_irq,
-- 
1.7.12
