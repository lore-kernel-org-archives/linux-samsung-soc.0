From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/3] gpio/s5p64x0: move gpio driver into drivers/gpio/
Date: Mon, 27 Jun 2011 20:15:40 +0900
Message-ID: <1309173340-12369-4-git-send-email-kgene.kim@samsung.com>
References: <1309173340-12369-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45196 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758230Ab1F0LW5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jun 2011 07:22:57 -0400
In-Reply-To: <1309173340-12369-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>

Cc: Grant Likely <grant.likely@secretlab.ca>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p64x0/Makefile                     |    2 +-
 drivers/gpio/Kconfig                               |    4 ++++
 drivers/gpio/Makefile                              |    1 +
 .../gpiolib.c => drivers/gpio/gpio-s5p64x0.c       |    3 +--
 4 files changed, 7 insertions(+), 3 deletions(-)
 rename arch/arm/mach-s5p64x0/gpiolib.c => drivers/gpio/gpio-s5p64x0.c (99%)

diff --git a/arch/arm/mach-s5p64x0/Makefile b/arch/arm/mach-s5p64x0/Makefile
index ae6bf6f..7bb29f2 100644
--- a/arch/arm/mach-s5p64x0/Makefile
+++ b/arch/arm/mach-s5p64x0/Makefile
@@ -12,7 +12,7 @@ obj-				:=
 
 # Core support for S5P64X0 system
 
-obj-$(CONFIG_ARCH_S5P64X0)	+= cpu.o init.o clock.o dma.o gpiolib.o
+obj-$(CONFIG_ARCH_S5P64X0)	+= cpu.o init.o clock.o dma.o
 obj-$(CONFIG_ARCH_S5P64X0)	+= setup-i2c0.o
 obj-$(CONFIG_CPU_S5P6440)	+= clock-s5p6440.o
 obj-$(CONFIG_CPU_S5P6450)	+= clock-s5p6450.o
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d5538ef..d9844d7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -117,6 +117,10 @@ config GPIO_S3C64XX
 	def_bool y
 	depends on ARCH_S3C64XX
 
+config GPIO_S5P64X0
+	def_bool y
+	depends on ARCH_S5P64X0
+
 config GPIO_S5PC100
 	def_bool y
 	depends on CPU_S5PC100
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index b5e2f09..7071154 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_GPIO_RDC321X)	+= gpio-rdc321x.o
 obj-$(CONFIG_GPIO_PLAT_SAMSUNG)	+= gpio-plat-samsung.o
 obj-$(CONFIG_GPIO_S3C24XX)	+= gpio-s3c24xx.o
 obj-$(CONFIG_GPIO_S3C64XX)	+= gpio-s3c64xx.o
+obj-$(CONFIG_GPIO_S5P64X0)	+= gpio-s5p64x0.o
 obj-$(CONFIG_GPIO_S5PC100)	+= gpio-s5pc100.o
 obj-$(CONFIG_GPIO_S5PV210)	+= gpio-s5pv210.o
 
diff --git a/arch/arm/mach-s5p64x0/gpiolib.c b/drivers/gpio/gpio-s5p64x0.c
similarity index 99%
rename from arch/arm/mach-s5p64x0/gpiolib.c
rename to drivers/gpio/gpio-s5p64x0.c
index e7fb3b0..96e816f 100644
--- a/arch/arm/mach-s5p64x0/gpiolib.c
+++ b/drivers/gpio/gpio-s5p64x0.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/mach-s5p64x0/gpiolib.c
- *
+/*
  * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  *
-- 
1.7.1
