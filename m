From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 01/23] ARM: exynos: introduce EXYNOS_ATAGS symbol
Date: Tue,  5 Mar 2013 18:42:11 +0100
Message-ID: <1362505353-8873-2-git-send-email-arnd@arndb.de>
References: <1362505353-8873-1-git-send-email-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:54299 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757151Ab3CERmm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 12:42:42 -0500
In-Reply-To: <1362505353-8873-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Deepak Saxena <dsaxena@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>

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
index 70f94c8..3291a72 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -176,7 +176,20 @@ config EXYNOS_SETUP_SPI
 	help
 	  Common setup code for SPI GPIO configurations.
 
+
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
 # machine support
+if EXYNOS_ATAGS
 
 if ARCH_EXYNOS4
 
@@ -400,6 +413,8 @@ config MACH_SMDK4412
 	  Machine support for Samsung SMDK4412
 endif
 
+endif
+
 comment "Flattened Device Tree based board for EXYNOS SoCs"
 
 config MACH_EXYNOS4_DT
-- 
1.8.1.2
