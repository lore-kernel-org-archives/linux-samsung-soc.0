From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 19/28] ARM: EXYNOS: Do not select legacy Kconfig symbols any
 more
Date: Fri, 14 Jun 2013 21:32:55 +0200
Message-ID: <1371238384-1504-20-git-send-email-t.figa@samsung.com>
References: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:20222 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753872Ab3FNTd3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 15:33:29 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOE00E84E2KE880@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Jun 2013 20:33:26 +0100 (BST)
In-reply-to: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch removes selection of several legacy Kconfig symbols from
ARCH_EXYNOS to bypass compilation of code used only for ATAGS based
boot.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 21bf253..61dff79 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -802,16 +802,11 @@ config ARCH_EXYNOS
 	select COMMON_CLK
 	select CPU_V7
 	select GENERIC_CLOCKEVENTS
-	select GPIO_SAMSUNG
 	select HAVE_CLK
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	select HAVE_S3C_RTC if RTC_CLASS
-	select NEED_MACH_GPIO_H
 	select NEED_MACH_MEMORY_H
-	select S5P_GPIO_DRVSTR
-	select SAMSUNG_ATAGS
-	select SAMSUNG_GPIOLIB_4BIT
 	select USE_OF
 	help
 	  Support for SAMSUNG's EXYNOS SoCs (EXYNOS4/5)
-- 
1.8.2.1
