From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 4/4] ARM: EXYNOS: Kconfig: Remove dependencies on particular
 SoCs from DT machines
Date: Mon, 08 Oct 2012 15:02:25 +0200
Message-ID: <1349701345-2681-5-git-send-email-t.figa@samsung.com>
References: <1349701345-2681-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40649 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752083Ab2JHNC7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Oct 2012 09:02:59 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBK000BTS8LUX20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 22:02:57 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBK00KZWS8CAK90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 22:02:57 +0900 (KST)
In-reply-to: <1349701345-2681-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

MACH_EXYNOS{4,5}_DT are used for whole SoC lines, so they should depend
on ARCH_EXYNOS{4,5} rather than on particular SoCs.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 6ea95f0..2e82ce7 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -404,7 +404,6 @@ comment "Flattened Device Tree based board for EXYNOS SoCs"
 config MACH_EXYNOS4_DT
 	bool "Samsung Exynos4 Machine using device tree"
 	depends on ARCH_EXYNOS4
-	select SOC_EXYNOS4210
 	select USE_OF
 	select ARM_AMBA
 	select HAVE_SAMSUNG_KEYPAD if INPUT_KEYBOARD
@@ -419,7 +418,6 @@ config MACH_EXYNOS4_DT
 config MACH_EXYNOS5_DT
 	bool "SAMSUNG EXYNOS5 Machine using device tree"
 	depends on ARCH_EXYNOS5
-	select SOC_EXYNOS5250
 	select USE_OF
 	select ARM_AMBA
 	help
-- 
1.7.12
