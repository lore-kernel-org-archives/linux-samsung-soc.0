From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 30/38] ARM: EXYNOS: Remove CONFIG_SOC_EXYNOS4412
Date: Mon, 17 Jun 2013 18:34:15 +0200
Message-ID: <1371486863-12398-31-git-send-email-t.figa@samsung.com>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41745 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752907Ab3FQQe7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 12:34:59 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOJ00MBNQ1N6260@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 17:34:54 +0100 (BST)
In-reply-to: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Exynos4212 and Exynos4412 SoCs differ only in number of ARM cores and
there is no need to have separate Kconfig options for them, since they
use the same code.

This patch removes CONFIG_SOC_EXYNOS4412, leaving CONFIG_SOC_EXYNOS4212
as the one supporting both SoCs from this series.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig             | 11 +----------
 arch/arm/plat-samsung/include/plat/cpu.h |  6 +-----
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 65ca3ac..fcebdfb 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -46,7 +46,7 @@ config CPU_EXYNOS4210
 	  Enable EXYNOS4210 CPU support
 
 config SOC_EXYNOS4212
-	bool "SAMSUNG EXYNOS4212"
+	bool "SAMSUNG EXYNOS4212/4412"
 	default y
 	depends on ARCH_EXYNOS4
 	select PINCTRL_EXYNOS
@@ -56,15 +56,6 @@ config SOC_EXYNOS4212
 	help
 	  Enable EXYNOS4212 SoC support
 
-config SOC_EXYNOS4412
-	bool "SAMSUNG EXYNOS4412"
-	default y
-	depends on ARCH_EXYNOS4
-	select PINCTRL_EXYNOS
-	select SAMSUNG_DMADEV
-	help
-	  Enable EXYNOS4412 SoC support
-
 config SOC_EXYNOS5250
 	bool "SAMSUNG EXYNOS5250"
 	default y
diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
index 989fefe..87b03bb 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -122,13 +122,9 @@ IS_SAMSUNG_CPU(exynos5440, EXYNOS5440_SOC_ID, EXYNOS5_SOC_MASK)
 
 #if defined(CONFIG_SOC_EXYNOS4212)
 # define soc_is_exynos4212()	is_samsung_exynos4212()
-#else
-# define soc_is_exynos4212()	0
-#endif
-
-#if defined(CONFIG_SOC_EXYNOS4412)
 # define soc_is_exynos4412()	is_samsung_exynos4412()
 #else
+# define soc_is_exynos4212()	0
 # define soc_is_exynos4412()	0
 #endif
 
-- 
1.8.2.1
