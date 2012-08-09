From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: Exynos: Enable DT support by default for Exynos5 SoC
Date: Thu,  9 Aug 2012 09:45:19 +0530
Message-ID: <1344485719-26111-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:46115 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751684Ab2HIEQx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Aug 2012 00:16:53 -0400
Received: by pbbrr13 with SMTP id rr13so221434pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Aug 2012 21:16:52 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Since support for Exynos5 SoC based boards is going to be only
device tree (DT) based, it makes no sense to provide DT as a user
selectable feature in menuconfig (De-selecting it gives
"no machine record defined" linker error). Hence enabling it along with
ARCH_EXYNOS5 option.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
---
 arch/arm/mach-exynos/Kconfig       |   17 +++++------------
 arch/arm/mach-exynos/Makefile      |    2 +-
 arch/arm/mach-exynos/Makefile.boot |    2 +-
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index b5b4c8c..72abbb8 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -20,10 +20,13 @@ config ARCH_EXYNOS4
 	  Samsung EXYNOS4 SoCs based systems
 
 config ARCH_EXYNOS5
-	bool "SAMSUNG EXYNOS5"
+	bool "SAMSUNG EXYNOS5 (using DT)"
 	select HAVE_SMP
+	select USE_OF
+	select ARM_AMBA
 	help
-	  Samsung EXYNOS5 (Cortex-A15) SoC based systems
+	  Samsung EXYNOS5 (Cortex-A15) SoC based systems using
+	  device tree (DT)
 
 comment "EXYNOS SoCs"
 
@@ -411,16 +414,6 @@ config MACH_EXYNOS4_DT
 	  Note: This is under development and not all peripherals can be supported
 	  with this machine file.
 
-config MACH_EXYNOS5_DT
-	bool "SAMSUNG EXYNOS5 Machine using device tree"
-	depends on ARCH_EXYNOS5
-	select SOC_EXYNOS5250
-	select USE_OF
-	select ARM_AMBA
-	help
-	  Machine support for Samsung Exynos4 machine with device tree enabled.
-	  Select this if a fdt blob is available for the EXYNOS4 SoC based board.
-
 if ARCH_EXYNOS4
 
 comment "Configuration for HSMMC 8-bit bus width"
diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
index 9b58024..5f04692 100644
--- a/arch/arm/mach-exynos/Makefile
+++ b/arch/arm/mach-exynos/Makefile
@@ -43,7 +43,7 @@ obj-$(CONFIG_MACH_SMDK4212)		+= mach-smdk4x12.o
 obj-$(CONFIG_MACH_SMDK4412)		+= mach-smdk4x12.o
 
 obj-$(CONFIG_MACH_EXYNOS4_DT)		+= mach-exynos4-dt.o
-obj-$(CONFIG_MACH_EXYNOS5_DT)		+= mach-exynos5-dt.o
+obj-$(CONFIG_ARCH_EXYNOS5)		+= mach-exynos5-dt.o
 
 # device support
 
diff --git a/arch/arm/mach-exynos/Makefile.boot b/arch/arm/mach-exynos/Makefile.boot
index 31bd181..2fc5b8c 100644
--- a/arch/arm/mach-exynos/Makefile.boot
+++ b/arch/arm/mach-exynos/Makefile.boot
@@ -2,4 +2,4 @@
 params_phys-y	:= 0x40000100
 
 dtb-$(CONFIG_MACH_EXYNOS4_DT) += exynos4210-origen.dtb exynos4210-smdkv310.dtb
-dtb-$(CONFIG_MACH_EXYNOS5_DT) += exynos5250-smdk5250.dtb
+dtb-$(CONFIG_ARCH_EXYNOS5) += exynos5250-smdk5250.dtb
-- 
1.7.4.1
