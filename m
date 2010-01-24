From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 4/6] ARM: S5P6442: Update Kconfig and Makefiles
Date: Mon, 25 Jan 2010 08:54:09 +0900
Message-ID: <1264377249-9234-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:48341 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753944Ab0AYABa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Jan 2010 19:01:30 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch adds Kconfig and Makefile for building the S5P6442 SoC support.
This patch also modifies the plat-s5p Kconfig file to include
the support for S5P6442.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/Kconfig          |   12 +++++++++++-
 arch/arm/Makefile         |    1 +
 arch/arm/plat-s5p/Kconfig |    2 +-
 drivers/serial/Kconfig    |    2 +-
 4 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 3bc5169..a3b0551 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -641,6 +641,14 @@ config ARCH_S5P6440
 	help
 	  Samsung S5P6440 CPU based systems
 
+config ARCH_S5P6442
+	bool "Samsung S5P6442"
+	select CPU_V6
+	select GENERIC_GPIO
+	select HAVE_CLK
+	help
+	  Samsung S5P6442 CPU based systems
+
 config ARCH_S5PC1XX
 	bool "Samsung S5PC1XX"
 	select GENERIC_GPIO
@@ -805,6 +813,8 @@ endif
 
 source "arch/arm/mach-s5p6440/Kconfig"
 
+source "arch/arm/mach-s5p6442/Kconfig"
+
 source "arch/arm/plat-stmp3xxx/Kconfig"
 
 if ARCH_S5PC1XX
@@ -1085,7 +1095,7 @@ source kernel/Kconfig.preempt
 config HZ
 	int
 	default 128 if ARCH_L7200
-	default 200 if ARCH_EBSA110 || ARCH_S3C2410 || ARCH_S5P6440
+	default 200 if ARCH_EBSA110 || ARCH_S3C2410 || ARCH_S5P6440 || ARCH_S5P6442
 	default OMAP_32K_TIMER_HZ if ARCH_OMAP && OMAP_32K_TIMER
 	default AT91_TIMER_HZ if ARCH_AT91
 	default 100
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index bbcd512..553fe62 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -162,6 +162,7 @@ machine-$(CONFIG_ARCH_S3C2410)		:= s3c2410 s3c2400 s3c2412 s3c2440 s3c2442 s3c24
 machine-$(CONFIG_ARCH_S3C24A0)		:= s3c24a0
 machine-$(CONFIG_ARCH_S3C64XX)		:= s3c6400 s3c6410
 machine-$(CONFIG_ARCH_S5P6440)		:= s5p6440
+machine-$(CONFIG_ARCH_S5P6442)		:= s5p6442
 machine-$(CONFIG_ARCH_S5PC1XX)		:= s5pc100
 machine-$(CONFIG_ARCH_SA1100)		:= sa1100
 machine-$(CONFIG_ARCH_SHARK)		:= shark
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index e7c31e7..f581a76 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -7,7 +7,7 @@
 
 config PLAT_S5P
 	bool
-	depends on ARCH_S5P6440
+	depends on (ARCH_S5P6440 || ARCH_S5P6442)
 	default y
 	select PLAT_S3C
 	select ARM_VIC
diff --git a/drivers/serial/Kconfig b/drivers/serial/Kconfig
index ebdd2b9..f587b88 100644
--- a/drivers/serial/Kconfig
+++ b/drivers/serial/Kconfig
@@ -542,7 +542,7 @@ config SERIAL_S5PC100
 
 config SERIAL_S5PV210
 	tristate "Samsung S5PV210 Serial port support"
-	depends on SERIAL_SAMSUNG && CPU_S5PV210
+	depends on SERIAL_SAMSUNG && (CPU_S5PV210 || CPU_S5P6442)
 	default y
 	help
 	  Serial port support for Samsung's S5P Family of SoC's
-- 
1.6.2.5
