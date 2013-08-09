From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: EXYNOS: always enable PM domains support for EXYNOS4x12
Date: Fri, 09 Aug 2013 13:56:05 +0200
Message-ID: <2897494.fSQeGUd9YR@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55173 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965820Ab3HIL4f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Aug 2013 07:56:35 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MR900B89IHUQQK0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Aug 2013 20:56:33 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Currently PM domains support will be enabled for EXYNOS4x12 SoCs
only if EXYNOS4210 SoC or EXYNOS5250 SoC support is also enabled.

Fix it by explicitly selecting PM domains support (if PM support
is enabled) by SOC_EXYNOS4212 and SOC_EXYNOS4412 config options.

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

Index: b/arch/arm/mach-exynos/Kconfig
===================================================================
--- a/arch/arm/mach-exynos/Kconfig	2013-08-08 14:36:02.000000000 +0200
+++ b/arch/arm/mach-exynos/Kconfig	2013-08-08 14:38:48.967486318 +0200
@@ -52,6 +52,7 @@ config SOC_EXYNOS4212
 	depends on ARCH_EXYNOS4
 	select ARCH_HAS_BANDGAP
 	select PINCTRL_EXYNOS
+	select PM_GENERIC_DOMAINS if PM
 	select S5P_PM if PM
 	select S5P_SLEEP if PM
 	select SAMSUNG_DMADEV
@@ -64,6 +65,7 @@ config SOC_EXYNOS4412
 	depends on ARCH_EXYNOS4
 	select ARCH_HAS_BANDGAP
 	select PINCTRL_EXYNOS
+	select PM_GENERIC_DOMAINS if PM
 	select SAMSUNG_DMADEV
 	help
 	  Enable EXYNOS4412 SoC support
