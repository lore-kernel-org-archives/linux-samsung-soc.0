From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 24/28] ARM: EXYNOS: Select SPARSE_IRQ for Exynos
Date: Fri, 14 Jun 2013 21:33:00 +0200
Message-ID: <1371238384-1504-25-git-send-email-t.figa@samsung.com>
References: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:20222 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753907Ab3FNTdb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 15:33:31 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOE00E84E2KE880@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Jun 2013 20:33:29 +0100 (BST)
In-reply-to: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch adds selection of CONFIG_SPARSE_IRQ for ARCH_EXYNOS, since it
is required by multiplatform and allows to remove the legacy mach/irqs.h
header.

To make this possible, a dummy IRQ_EINT_BIT macro is added to pm-core.h
header to allow plat-samsung/pm.c compile. This macro is irrelevant for
Exynos and will be removed after reworking Samsung pm code for
multiplatform compatibility.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/Kconfig                            | 1 +
 arch/arm/mach-exynos/include/mach/pm-core.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 61dff79..ff2fe0f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -807,6 +807,7 @@ config ARCH_EXYNOS
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	select HAVE_S3C_RTC if RTC_CLASS
 	select NEED_MACH_MEMORY_H
+	select SPARSE_IRQ
 	select USE_OF
 	help
 	  Support for SAMSUNG's EXYNOS SoCs (EXYNOS4/5)
diff --git a/arch/arm/mach-exynos/include/mach/pm-core.h b/arch/arm/mach-exynos/include/mach/pm-core.h
index dd62559..71e6b89 100644
--- a/arch/arm/mach-exynos/include/mach/pm-core.h
+++ b/arch/arm/mach-exynos/include/mach/pm-core.h
@@ -70,6 +70,7 @@ static inline void samsung_pm_saved_gpios(void)
 }
 
 /* Compatibility definitions to make plat-samsung/pm.c compile */
+#define IRQ_EINT_BIT(x)		1
 #define s3c_irqwake_intallow	0
 #define s3c_irqwake_eintallow	0
 
-- 
1.8.2.1
