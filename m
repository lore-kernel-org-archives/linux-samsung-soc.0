From: Seungwhan Youn <sw.youn@samsung.com>
Subject: [PATCH 1/4] ARM: Kconfig: Add audio support dependency
Date: Fri, 24 Dec 2010 15:36:09 +0900
Message-ID: <1293172569-21465-1-git-send-email-sw.youn@samsung.com>
References: <1293171965-24416-1-git-send-email-sw.youn@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:60767 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750784Ab0LXG6D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Dec 2010 01:58:03 -0500
In-Reply-To: <1293171965-24416-1-git-send-email-sw.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: linux@arm.linux.org.uk, ben-linux@fluff.org, kgene.kim@samsung.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com, Seungwhan Youn <sw.youn@samsung.com>

This patch adds Samsung ASoC audio support dependency for Samsung SoCs.

Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
---
 arch/arm/Kconfig |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index d56d21c..ef32a61 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -647,6 +647,7 @@ config ARCH_S3C2410
 	select HAVE_CLK
 	select ARCH_USES_GETTIMEOFFSET
 	select HAVE_S3C2410_I2C if I2C
+	select ASOC_SAMSUNG if SND_SOC
 	help
 	  Samsung S3C2410X CPU based systems, such as the Simtec Electronics
 	  BAST (<http://www.simtec.co.uk/products/EB110ITX/>), the IPAQ 1940 or
@@ -678,6 +679,7 @@ config ARCH_S3C64XX
 	select SAMSUNG_GPIOLIB_4BIT
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
+	select ASOC_SAMSUNG if SND_SOC
 	help
 	  Samsung S3C64XX series based systems
 
@@ -690,6 +692,7 @@ config ARCH_S5P64X0
 	select ARCH_USES_GETTIMEOFFSET
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C_RTC if RTC_CLASS
+	select ASOC_SAMSUNG if SND_SOC
 	help
 	  Samsung S5P64X0 CPU based systems, such as the Samsung SMDK6440,
 	  SMDK6450.
@@ -701,6 +704,7 @@ config ARCH_S5P6442
 	select HAVE_CLK
 	select ARCH_USES_GETTIMEOFFSET
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
+	select ASOC_SAMSUNG if SND_SOC
 	help
 	  Samsung S5P6442 CPU based systems
 
@@ -714,6 +718,7 @@ config ARCH_S5PC100
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C_RTC if RTC_CLASS
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
+	select ASOC_SAMSUNG if SND_SOC
 	help
 	  Samsung S5PC100 series based systems
 
@@ -729,6 +734,7 @@ config ARCH_S5PV210
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C_RTC if RTC_CLASS
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
+	select ASOC_SAMSUNG if SND_SOC
 	help
 	  Samsung S5PV210/S5PC110 series based systems
 
@@ -742,6 +748,7 @@ config ARCH_S5PV310
 	select HAVE_S3C_RTC if RTC_CLASS
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
+	select ASOC_SAMSUNG if SND_SOC
 	help
 	  Samsung S5PV310 series based systems
 
-- 
1.6.2.5
