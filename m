From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/7 (RE-SEND)] gpio/s3c64xx: move gpio driver into drivers/gpio/
Date: Tue, 30 Aug 2011 21:27:24 +0900
Message-ID: <1314707249-12241-3-git-send-email-kgene.kim@samsung.com>
References: <1314707249-12241-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:59553 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753755Ab1H3Moq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Aug 2011 08:44:46 -0400
In-Reply-To: <1314707249-12241-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>

Cc: Ben Dooks <ben-linux@fluff.org>
Cc: Grant Likely <grant.likely@secretlab.ca>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s3c64xx/Makefile                     |    1 -
 drivers/gpio/Kconfig                               |    4 ++++
 drivers/gpio/Makefile                              |    1 +
 .../gpiolib.c => drivers/gpio/gpio-s3c64xx.c       |    3 +--
 4 files changed, 6 insertions(+), 3 deletions(-)
 rename arch/arm/mach-s3c64xx/gpiolib.c => drivers/gpio/gpio-s3c64xx.c (99%)

diff --git a/arch/arm/mach-s3c64xx/Makefile b/arch/arm/mach-s3c64xx/Makefile
index 61b4034..f0102d7 100644
--- a/arch/arm/mach-s3c64xx/Makefile
+++ b/arch/arm/mach-s3c64xx/Makefile
@@ -13,7 +13,6 @@ obj-				:=
 # Core files
 obj-y				+= cpu.o
 obj-y				+= clock.o
-obj-y				+= gpiolib.o
 
 # Core support for S3C6400 system
 
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5654e1b..6368730 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -139,6 +139,10 @@ config GPIO_S3C24XX
 	def_bool y
 	depends on PLAT_S3C24XX
 
+config GPIO_S3C64XX
+	def_bool y
+	depends on ARCH_S3C64XX
+
 config GPIO_S5PC100
 	def_bool y
 	depends on CPU_S5PC100
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c7f1c00..8c1fb23 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_GPIO_RDC321X)	+= gpio-rdc321x.o
 
 obj-$(CONFIG_GPIO_PLAT_SAMSUNG)	+= gpio-plat-samsung.o
 obj-$(CONFIG_GPIO_S3C24XX)	+= gpio-s3c24xx.o
+obj-$(CONFIG_GPIO_S3C64XX)	+= gpio-s3c64xx.o
 obj-$(CONFIG_GPIO_S5PC100)	+= gpio-s5pc100.o
 obj-$(CONFIG_GPIO_S5PV210)	+= gpio-s5pv210.o
 
diff --git a/arch/arm/mach-s3c64xx/gpiolib.c b/drivers/gpio/gpio-s3c64xx.c
similarity index 99%
rename from arch/arm/mach-s3c64xx/gpiolib.c
rename to drivers/gpio/gpio-s3c64xx.c
index 92b0908..b4f1c82 100644
--- a/arch/arm/mach-s3c64xx/gpiolib.c
+++ b/drivers/gpio/gpio-s3c64xx.c
@@ -1,5 +1,4 @@
-/* arch/arm/plat-s3c64xx/gpiolib.c
- *
+/*
  * Copyright 2008 Openmoko, Inc.
  * Copyright 2008 Simtec Electronics
  *      Ben Dooks <ben@simtec.co.uk>
-- 
1.7.1
