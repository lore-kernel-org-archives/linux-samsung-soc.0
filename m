From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Fix HAVE_S3C2410_I2C warnings
Date: Sat, 13 Nov 2010 16:28:40 +0900
Message-ID: <1289633320-7299-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38277 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754453Ab0KMHi5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Nov 2010 02:38:57 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch fixes following warnings.
warning: (ARCH_S3C2410 && <choice> || ARCH_S3C64XX && <choice> ||
          ARCH_S5P64X0 && <choice> || ARCH_S5PC100 && <choice> ||
          ARCH_S5PV210 && <choice> || ARCH_S5PV310 && <choice>)
          selects HAVE_S3C2410_I2C which has unmet direct dependencies (I2C)

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/Kconfig |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index a302713..30ef76a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -646,7 +646,7 @@ config ARCH_S3C2410
 	select ARCH_HAS_CPUFREQ
 	select HAVE_CLK
 	select ARCH_USES_GETTIMEOFFSET
-	select HAVE_S3C2410_I2C
+	select HAVE_S3C2410_I2C if I2C
 	help
 	  Samsung S3C2410X CPU based systems, such as the Simtec Electronics
 	  BAST (<http://www.simtec.co.uk/products/EB110ITX/>), the IPAQ 1940 or
@@ -676,7 +676,7 @@ config ARCH_S3C64XX
 	select S3C_DEV_NAND
 	select USB_ARCH_HAS_OHCI
 	select SAMSUNG_GPIOLIB_4BIT
-	select HAVE_S3C2410_I2C
+	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	help
 	  Samsung S3C64XX series based systems
@@ -688,7 +688,7 @@ config ARCH_S5P64X0
 	select HAVE_CLK
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	select ARCH_USES_GETTIMEOFFSET
-	select HAVE_S3C2410_I2C
+	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C_RTC
 	help
 	  Samsung S5P64X0 CPU based systems, such as the Samsung SMDK6440,
@@ -711,7 +711,7 @@ config ARCH_S5PC100
 	select CPU_V7
 	select ARM_L1_CACHE_SHIFT_6
 	select ARCH_USES_GETTIMEOFFSET
-	select HAVE_S3C2410_I2C
+	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C_RTC
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	help
@@ -726,7 +726,7 @@ config ARCH_S5PV210
 	select ARM_L1_CACHE_SHIFT_6
 	select ARCH_HAS_CPUFREQ
 	select ARCH_USES_GETTIMEOFFSET
-	select HAVE_S3C2410_I2C
+	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C_RTC
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	help
@@ -740,7 +740,7 @@ config ARCH_S5PV310
 	select HAVE_CLK
 	select GENERIC_CLOCKEVENTS
 	select HAVE_S3C_RTC
-	select HAVE_S3C2410_I2C
+	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	help
 	  Samsung S5PV310 series based systems
-- 
1.6.2.5
