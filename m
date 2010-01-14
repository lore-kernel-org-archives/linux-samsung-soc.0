From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/2] ARM: S5P6440: Add Kconfig and Makefiles for S5P6440 GPIO support
Date: Thu, 14 Jan 2010 20:27:13 +0900
Message-ID: <1263468433-24915-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:33499 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752001Ab0ANLeM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Jan 2010 06:34:12 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch adds the Kconfig and Makefile for the S5P6440 GPIO.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6440/Makefile |    2 +-
 arch/arm/plat-s5p/Kconfig      |    4 ++++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5p6440/Makefile b/arch/arm/mach-s5p6440/Makefile
index a3ffda9..a79b130 100644
--- a/arch/arm/mach-s5p6440/Makefile
+++ b/arch/arm/mach-s5p6440/Makefile
@@ -12,7 +12,7 @@ obj-				:=
 
 # Core support for S5P6440 system
 
-obj-$(CONFIG_CPU_S5P6440)	+= cpu.o
+obj-$(CONFIG_CPU_S5P6440)	+= cpu.o s5p6440-gpio.o
 
 # machine support
 
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index 7e08b40..9d8686c 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -14,6 +14,10 @@ config PLAT_S5P
 	select NO_IOPORT
 	select ARCH_REQUIRE_GPIOLIB
 	select S3C_GPIO_TRACK
+	select SAMSUNG_GPIOLIB
+	select S3C_GPIO_CFG_S3C64XX
+	select S3C_GPIO_PULL_UPDOWN
+	select S3C_GPIO_CFG_S3C24XX
 	select PLAT_SAMSUNG
 	select SAMSUNG_CLKSRC
 	select SAMSUNG_IRQ_VIC_TIMER
-- 
1.6.2.5
