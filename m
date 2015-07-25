From: Kukjin Kim <kgene@kernel.org>
Subject: [PATCH 3/3] ARM: SAMSUNG: make local s5p-dev-mfc in mach-exynos
Date: Sat, 25 Jul 2015 11:28:30 +0900
Message-ID: <065001d0c681$98b6ebf0$ca24c3d0$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41516 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753030AbbGYC2c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jul 2015 22:28:32 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NS0033PKUVJ8G20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 25 Jul 2015 11:28:31 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>


This patch moves s5p-dev-mfc from plat-samsung into mach-exynos
because it is used for only exynos no other platforms.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/mach-exynos/Kconfig                         | 5 +++++
 arch/arm/mach-exynos/Makefile                        | 2 ++
 arch/arm/{plat-samsung => mach-exynos}/s5p-dev-mfc.c | 0
 arch/arm/plat-samsung/Kconfig                        | 5 -----
 arch/arm/plat-samsung/Makefile                       | 1 -
 5 files changed, 7 insertions(+), 6 deletions(-)
 rename arch/arm/{plat-samsung => mach-exynos}/s5p-dev-mfc.c (100%)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 81064cd..4c4858c 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -30,6 +30,11 @@ menuconfig ARCH_EXYNOS
 
 if ARCH_EXYNOS
 
+config S5P_DEV_MFC
+	bool
+	help
+	  Compile in setup memory (init) code for MFC
+
 config ARCH_EXYNOS3
 	bool "SAMSUNG EXYNOS3"
 	select ARM_CPU_SUSPEND if PM
diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
index bcefb54..2f30676 100644
--- a/arch/arm/mach-exynos/Makefile
+++ b/arch/arm/mach-exynos/Makefile
@@ -23,3 +23,5 @@ AFLAGS_sleep.o			:=-Wa,-march=armv7-a$(plus_sec)
 
 obj-$(CONFIG_EXYNOS5420_MCPM)	+= mcpm-exynos.o
 CFLAGS_mcpm-exynos.o		+= -march=armv7-a
+
+obj-$(CONFIG_S5P_DEV_MFC)	+= s5p-dev-mfc.o
diff --git a/arch/arm/plat-samsung/s5p-dev-mfc.c b/arch/arm/mach-exynos/s5p-dev-mfc.c
similarity index 100%
rename from arch/arm/plat-samsung/s5p-dev-mfc.c
rename to arch/arm/mach-exynos/s5p-dev-mfc.c
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 0e1874c..57729b9 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -233,11 +233,6 @@ config SAMSUNG_PM_GPIO
 	  pinctrl-samsung driver.
 endif
 
-config S5P_DEV_MFC
-	bool
-	help
-	  Compile in setup memory (init) code for MFC
-
 comment "Power management"
 
 config SAMSUNG_PM_DEBUG
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index 624f5db..8c91176 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -20,7 +20,6 @@ obj-$(CONFIG_SAMSUNG_ATAGS)	+= platformdata.o
 
 obj-$(CONFIG_SAMSUNG_ATAGS)	+= devs.o
 obj-$(CONFIG_SAMSUNG_ATAGS)	+= dev-uart.o
-obj-$(CONFIG_S5P_DEV_MFC)	+= s5p-dev-mfc.o
 
 # PM support
 
-- 
2.0.0
