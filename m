From: Kukjin Kim <kgene@kernel.org>
Subject: [PATCH 2/3] ARM: SAMSUNG: make local dev-backlight in mach-s3c64xx
Date: Sat, 25 Jul 2015 11:28:10 +0900
Message-ID: <064f01d0c681$8cabe220$a603a660$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:33073 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753030AbbGYC2M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jul 2015 22:28:12 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NS001CNLUUYNO10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 25 Jul 2015 11:28:10 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>


This patch moves dev-backlight from plat-samsung into mach-s3c64xx
because it is used for only s3c64xx no other platforms.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/mach-s3c64xx/Kconfig                           | 6 ++++++
 arch/arm/mach-s3c64xx/Makefile                          | 2 ++
 arch/arm/{plat-samsung => mach-s3c64xx}/dev-backlight.c | 3 +--
 arch/arm/plat-samsung/Kconfig                           | 6 ------
 arch/arm/plat-samsung/Makefile                          | 2 --
 5 files changed, 9 insertions(+), 10 deletions(-)
 rename arch/arm/{plat-samsung => mach-s3c64xx}/dev-backlight.c (98%)

diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
index eff95e9..28c7097 100644
--- a/arch/arm/mach-s3c64xx/Kconfig
+++ b/arch/arm/mach-s3c64xx/Kconfig
@@ -34,6 +34,12 @@ config S3C64XX_DEV_ONENAND1
 	help
 	  Compile in platform device definition for OneNAND1 controller
 
+config SAMSUNG_DEV_BACKLIGHT
+	bool
+	depends on SAMSUNG_DEV_PWM
+	help
+	  Compile in platform device definition LCD backlight with PWM Timer
+
 # platform specific device setup
 
 config S3C64XX_SETUP_I2C0
diff --git a/arch/arm/mach-s3c64xx/Makefile b/arch/arm/mach-s3c64xx/Makefile
index 17f4b07..bb233f3 100644
--- a/arch/arm/mach-s3c64xx/Makefile
+++ b/arch/arm/mach-s3c64xx/Makefile
@@ -40,6 +40,8 @@ obj-$(CONFIG_S3C64XX_SETUP_SDHCI_GPIO)	+= setup-sdhci-gpio.o
 obj-$(CONFIG_S3C64XX_SETUP_SPI)		+= setup-spi.o
 obj-$(CONFIG_S3C64XX_SETUP_USB_PHY) += setup-usb-phy.o
 
+obj-$(CONFIG_SAMSUNG_DEV_BACKLIGHT)	+= dev-backlight.o
+
 # Machine support
 
 obj-$(CONFIG_MACH_ANW6410)		+= mach-anw6410.o
diff --git a/arch/arm/plat-samsung/dev-backlight.c b/arch/arm/mach-s3c64xx/dev-backlight.c
similarity index 98%
rename from arch/arm/plat-samsung/dev-backlight.c
rename to arch/arm/mach-s3c64xx/dev-backlight.c
index 2157c5b..62f4648 100644
--- a/arch/arm/plat-samsung/dev-backlight.c
+++ b/arch/arm/mach-s3c64xx/dev-backlight.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-samsung/dev-backlight.c
- *
+/*
  * Copyright (c) 2011 Samsung Electronics Co., Ltd.
  *              http://www.samsung.com
  *
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index f115c81..0e1874c 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -217,12 +217,6 @@ config SAMSUNG_DEV_PWM
 	help
 	  Compile in platform device definition for PWM Timer
 
-config SAMSUNG_DEV_BACKLIGHT
-	bool
-	depends on SAMSUNG_DEV_PWM
-	help
-	  Compile in platform device definition LCD backlight with PWM Timer
-
 config S3C24XX_PWM
 	bool "PWM device support"
 	select PWM
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index c48a2cc..624f5db 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -22,8 +22,6 @@ obj-$(CONFIG_SAMSUNG_ATAGS)	+= devs.o
 obj-$(CONFIG_SAMSUNG_ATAGS)	+= dev-uart.o
 obj-$(CONFIG_S5P_DEV_MFC)	+= s5p-dev-mfc.o
 
-obj-$(CONFIG_SAMSUNG_DEV_BACKLIGHT)	+= dev-backlight.o
-
 # PM support
 
 obj-$(CONFIG_PM_SLEEP)		+= pm-common.o
-- 
2.0.0
