From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 01/10] ARM: exynos: introduce EXYNOS_ATAGS symbol
Date: Thu, 11 Apr 2013 23:37:16 +0200
Message-ID: <1365716245-99231-2-git-send-email-arnd@arndb.de>
References: <1365716245-99231-1-git-send-email-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:61835 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752119Ab3DKVhl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Apr 2013 17:37:41 -0400
In-Reply-To: <1365716245-99231-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

As a preparation for multiplatform support, this introduces
a new Kconfig symbol to split the ATAGS based EXYNOS platforms
from the DT based ones. Turning off CONFIG_EXYNOS_ATAGS disables
all platforms that are not yet converted to DT, and we can
have code that relies on DT checking for this symbol being
disabled.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-exynos/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 70f94c8..33e2336 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -85,6 +85,19 @@ config EXYNOS4_MCT
 	help
 	  Use MCT (Multi Core Timer) as kernel timers
 
+config EXYNOS_ATAGS
+	bool "ATAGS based boot for EXYNOS (deprecated)"
+	depends on ARCH_EXYNOS_SINGLE
+	depends on ATAGS
+	default y
+	help
+	  The EXYNOS platform is moving towards being completely probed
+	  through device tree. This enables support for board files using
+	  the traditional ATAGS boot format.
+	  Note that this option is not available for multiplatform builds.
+
+if EXYNOS_ATAGS
+
 config EXYNOS_DEV_DMA
 	bool
 	help
@@ -400,6 +413,8 @@ config MACH_SMDK4412
 	  Machine support for Samsung SMDK4412
 endif
 
+endif
+
 comment "Flattened Device Tree based board for EXYNOS SoCs"
 
 config MACH_EXYNOS4_DT
-- 
1.8.1.2
