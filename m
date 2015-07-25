From: Kukjin Kim <kgene@kernel.org>
Subject: [[PATCH 1/3] ARM: SAMSUNG: make local setup-camif in mach-s3c24xx
Date: Sat, 25 Jul 2015 11:27:59 +0900
Message-ID: <064e01d0c681$862e3380$928a9a80$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53981 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753030AbbGYC2C (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jul 2015 22:28:02 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NS002J7FUUOLY70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 25 Jul 2015 11:28:00 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>


This patch moves setup-camif from plat-samsung into mach-s3c24xx
because it can be used only for s3c24xx no other platforms.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/mach-s3c24xx/Kconfig                         | 5 +++++
 arch/arm/mach-s3c24xx/Makefile                        | 1 +
 arch/arm/{plat-samsung => mach-s3c24xx}/setup-camif.c | 0
 arch/arm/plat-samsung/Kconfig                         | 6 ------
 arch/arm/plat-samsung/Makefile                        | 2 --
 5 files changed, 6 insertions(+), 8 deletions(-)
 rename arch/arm/{plat-samsung => mach-s3c24xx}/setup-camif.c (100%)

diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index 23bec3a..ef68ecb 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -124,6 +124,11 @@ config S3C24XX_PLL
 	  This also means that the PLL tables for the selected CPU(s) will
 	  be built which may increase the size of the kernel image.
 
+config S3C_SETUP_CAMIF
+	bool
+	help
+	  Compile in common setup code for S3C CAMIF devices
+
 # cpu frequency items common between s3c2410 and s3c2440/s3c2442
 
 config S3C2410_IOTIMING
diff --git a/arch/arm/mach-s3c24xx/Makefile b/arch/arm/mach-s3c24xx/Makefile
index 05920c8..8ac2f58 100644
--- a/arch/arm/mach-s3c24xx/Makefile
+++ b/arch/arm/mach-s3c24xx/Makefile
@@ -99,3 +99,4 @@ obj-$(CONFIG_S3C2416_SETUP_SDHCI_GPIO)	+= setup-sdhci-gpio.o
 obj-$(CONFIG_S3C2443_SETUP_SPI)		+= setup-spi.o
 obj-$(CONFIG_ARCH_S3C24XX)		+= setup-i2c.o
 obj-$(CONFIG_S3C24XX_SETUP_TS)		+= setup-ts.o
+obj-$(CONFIG_S3C_SETUP_CAMIF)		+= setup-camif.o
diff --git a/arch/arm/plat-samsung/setup-camif.c b/arch/arm/mach-s3c24xx/setup-camif.c
similarity index 100%
rename from arch/arm/plat-samsung/setup-camif.c
rename to arch/arm/mach-s3c24xx/setup-camif.c
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index cb8e3d6..f115c81 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -231,18 +231,12 @@ config S3C24XX_PWM
 	  Support for exporting the PWM timer blocks via the pwm device
 	  system
 
-config S3C_SETUP_CAMIF
-	bool
-	help
-	  Compile in common setup code for S3C CAMIF devices
-
 config SAMSUNG_PM_GPIO
 	bool
 	default y if GPIO_SAMSUNG && PM
 	help
 	  Include legacy GPIO power management code for platforms not using
 	  pinctrl-samsung driver.
-
 endif
 
 config S5P_DEV_MFC
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index 1a29ab1..c48a2cc 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -24,8 +24,6 @@ obj-$(CONFIG_S5P_DEV_MFC)	+= s5p-dev-mfc.o
 
 obj-$(CONFIG_SAMSUNG_DEV_BACKLIGHT)	+= dev-backlight.o
 
-obj-$(CONFIG_S3C_SETUP_CAMIF)	+= setup-camif.o
-
 # PM support
 
 obj-$(CONFIG_PM_SLEEP)		+= pm-common.o
-- 
2.0.0
