From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 01/30] ARM: exynos: introduce EXYNOS_ATAGS symbol
Date: Thu, 11 Apr 2013 02:04:43 +0200
Message-ID: <1365638712-1028578-2-git-send-email-arnd@arndb.de>
References: <1365638712-1028578-1-git-send-email-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1365638712-1028578-1-git-send-email-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-samsung-soc@vger.kernel.org

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
index a62cfa0..e815057 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -82,6 +82,19 @@ config SOC_EXYNOS5440
 	help
 	  Enable EXYNOS5440 SoC support
 
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
@@ -386,6 +399,8 @@ config MACH_SMDK4412
 	  Machine support for Samsung SMDK4412
 endif
 
+endif
+
 comment "Flattened Device Tree based board for EXYNOS SoCs"
 
 config MACH_EXYNOS4_DT
-- 
1.8.1.2
