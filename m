From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] drivers: soc: samsung: Enable COMPILE_TEST
Date: Tue, 02 Feb 2016 16:06:17 +0900
Message-ID: <1454396777-20034-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:47408 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752455AbcBBHGf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Feb 2016 02:06:35 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>

Get some build coverage of Exynos SROM controller and PMU drivers. The
PMU driver depends on asm/cputype.h so its compilation is limited to ARM
architectures.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---
The SROM driver was compile-tested on x86, x86_64, ppc64, arm, arm64 and
mips. The PMU driver on arm and arm64.
---
 drivers/soc/samsung/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index 895f16934b75..e5c11ac88a38 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -1,17 +1,17 @@
 #
 # SAMSUNG SoC drivers
 #
-menu "Samsung SOC driver support"
+menuconfig SOC_SAMSUNG
+	bool "Samsung SoC driver support" if COMPILE_TEST
 
-config SOC_SAMSUNG
-	bool
+if SOC_SAMSUNG
 
 config EXYNOS_SROM
-	bool
-	depends on ARM && ARCH_EXYNOS
+	bool "Exynos SROM controller driver" if COMPILE_TEST
+	depends on (ARM && ARCH_EXYNOS) || COMPILE_TEST
 
 config EXYNOS_PMU
-	bool
-	depends on ARM && ARCH_EXYNOS
+	bool "Exynos PMU controller driver" if COMPILE_TEST
+	depends on (ARM && ARCH_EXYNOS) || ((ARM || ARM64) && COMPILE_TEST)
 
-endmenu
+endif
-- 
1.9.1
