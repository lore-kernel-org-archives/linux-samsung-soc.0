From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v4 10/12] ARM: EXYNOS: add support ARCH_EXYNOS5 for EXYNOS5 SoCs
Date: Wed, 14 Mar 2012 07:42:16 -0700
Message-ID: <1331736138-28964-11-git-send-email-kgene.kim@samsung.com>
References: <1331736138-28964-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:35540 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030670Ab2CNOnI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Mar 2012 10:43:08 -0400
Received: by mail-gx0-f174.google.com with SMTP id e5so1877131ggh.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Mar 2012 07:43:08 -0700 (PDT)
In-Reply-To: <1331736138-28964-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: arnd@arndb.de, olof@lixom.net, Kukjin Kim <kgene.kim@samsung.com>

This patch adds CONFIG_ARCH_EXYNOS5 and CONFIG_SOC_EXYNOS5250
for supporting EXYNOS5250 SoC and allows supporting EXYNOS4
and EXYNOS5 together.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/Kconfig  |   18 +++++++++++++-----
 arch/arm/mach-exynos/Makefile |    1 +
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 5e0a456..a2ed05c 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -11,18 +11,19 @@ if ARCH_EXYNOS
 
 menu "SAMSUNG EXYNOS SoCs Support"
 
-choice
-	prompt "EXYNOS System Type"
-	default ARCH_EXYNOS4
-
 config ARCH_EXYNOS4
 	bool "SAMSUNG EXYNOS4"
+	default y
 	select HAVE_SMP
 	select MIGHT_HAVE_CACHE_L2X0
 	help
 	  Samsung EXYNOS4 SoCs based systems
 
-endchoice
+config ARCH_EXYNOS5
+	bool "SAMSUNG EXYNOS5"
+	select HAVE_SMP
+	help
+	  Samsung EXYNOS5 (Cortex-A15) SoC based systems
 
 comment "EXYNOS SoCs"
 
@@ -55,6 +56,13 @@ config SOC_EXYNOS4412
 	help
 	  Enable EXYNOS4412 SoC support
 
+config SOC_EXYNOS5250
+	bool "SAMSUNG EXYNOS5250"
+	default y
+	depends on ARCH_EXYNOS5
+	help
+	  Enable EXYNOS5250 SoC support
+
 config EXYNOS4_MCT
 	bool
 	default y
diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
index f8a3770..7214092 100644
--- a/arch/arm/mach-exynos/Makefile
+++ b/arch/arm/mach-exynos/Makefile
@@ -14,6 +14,7 @@ obj-				:=
 
 obj-$(CONFIG_ARCH_EXYNOS)	+= common.o
 obj-$(CONFIG_ARCH_EXYNOS4)	+= clock-exynos4.o
+obj-$(CONFIG_ARCH_EXYNOS5)	+= clock-exynos5.o
 obj-$(CONFIG_CPU_EXYNOS4210)	+= clock-exynos4210.o
 obj-$(CONFIG_SOC_EXYNOS4212)	+= clock-exynos4212.o
 
-- 
1.7.4.4
