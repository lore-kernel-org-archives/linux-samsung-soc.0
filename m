From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 09/15] ARM: S5PC100: Move i2c helpers from plat-s5pc1xx to
 mach-s5pc100
Date: Fri, 14 May 2010 08:19:00 +0200
Message-ID: <1273817946-29404-10-git-send-email-m.szyprowski@samsung.com>
References: <1273817946-29404-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:56106 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754832Ab0ENGTV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 May 2010 02:19:21 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L2E00HXOC80TQ80@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 07:19:13 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L2E0026BC80LU@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 07:19:12 +0100 (BST)
In-reply-to: <1273817946-29404-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com

Move i2c helpers from plat-s5pc1xx to mach-s5pc100.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pc100/Kconfig                      |    8 ++++++--
 arch/arm/mach-s5pc100/Makefile                     |    2 ++
 .../{plat-s5pc1xx => mach-s5pc100}/setup-i2c0.c    |    4 ++--
 .../{plat-s5pc1xx => mach-s5pc100}/setup-i2c1.c    |    4 ++--
 arch/arm/plat-s5pc1xx/Kconfig                      |   14 --------------
 arch/arm/plat-s5pc1xx/Makefile                     |    2 --
 6 files changed, 12 insertions(+), 22 deletions(-)
 rename arch/arm/{plat-s5pc1xx => mach-s5pc100}/setup-i2c0.c (89%)
 rename arch/arm/{plat-s5pc1xx => mach-s5pc100}/setup-i2c1.c (89%)

diff --git a/arch/arm/mach-s5pc100/Kconfig b/arch/arm/mach-s5pc100/Kconfig
index b24c66d..9b10541 100644
--- a/arch/arm/mach-s5pc100/Kconfig
+++ b/arch/arm/mach-s5pc100/Kconfig
@@ -23,6 +23,11 @@ config S5PC100_SETUP_SDHCI
         help
           Internal helper functions for S5PC100 based SDHCI systems
 
+config S5PC100_SETUP_I2C1
+	bool
+	help
+	  Common setup code for i2c bus 1.
+
 config MACH_SMDKC100
 	bool "SMDKC100"
 	select CPU_S5PC100
@@ -31,9 +36,8 @@ config MACH_SMDKC100
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC1
 	select S3C_DEV_HSMMC2
-	select S5PC1XX_SETUP_I2C0
-	select S5PC1XX_SETUP_I2C1
 	select S5PC100_SETUP_FB_24BPP
+	select S5PC100_SETUP_I2C1
 	select S5PC100_SETUP_SDHCI
 	help
 	  Machine support for the Samsung SMDKC100
diff --git a/arch/arm/mach-s5pc100/Makefile b/arch/arm/mach-s5pc100/Makefile
index ccf0dca..741fba0 100644
--- a/arch/arm/mach-s5pc100/Makefile
+++ b/arch/arm/mach-s5pc100/Makefile
@@ -12,10 +12,12 @@ obj-				:=
 # Core support for S5PC100 system
 
 obj-$(CONFIG_CPU_S5PC100)	+= cpu.o gpio.o
+obj-$(CONFIG_CPU_S5PC100)	+= setup-i2c0.o
 
 # Helper and device support
 
 obj-$(CONFIG_S5PC100_SETUP_FB_24BPP)	+= setup-fb-24bpp.o
+obj-$(CONFIG_S5PC100_SETUP_I2C1)	+= setup-i2c1.o
 obj-$(CONFIG_S5PC100_SETUP_SDHCI)       += setup-sdhci.o
 
 # machine support
diff --git a/arch/arm/plat-s5pc1xx/setup-i2c0.c b/arch/arm/mach-s5pc100/setup-i2c0.c
similarity index 89%
rename from arch/arm/plat-s5pc1xx/setup-i2c0.c
rename to arch/arm/mach-s5pc100/setup-i2c0.c
index 5e4a7c3..dd3174e 100644
--- a/arch/arm/plat-s5pc1xx/setup-i2c0.c
+++ b/arch/arm/mach-s5pc100/setup-i2c0.c
@@ -1,9 +1,9 @@
-/* linux/arch/arm/plat-s5pc1xx/setup-i2c0.c
+/* linux/arch/arm/mach-s5pc100/setup-i2c0.c
  *
  * Copyright 2009 Samsung Electronics Co.
  *	Byungho Min <bhmin@samsung.com>
  *
- * Base S5PC1XX I2C bus 0 gpio configuration
+ * Base S5PC100 I2C bus 0 gpio configuration
  *
  * Based on plat-s3c64xx/setup-i2c0.c
  *
diff --git a/arch/arm/plat-s5pc1xx/setup-i2c1.c b/arch/arm/mach-s5pc100/setup-i2c1.c
similarity index 89%
rename from arch/arm/plat-s5pc1xx/setup-i2c1.c
rename to arch/arm/mach-s5pc100/setup-i2c1.c
index a0a8b4a..d1fec26 100644
--- a/arch/arm/plat-s5pc1xx/setup-i2c1.c
+++ b/arch/arm/mach-s5pc100/setup-i2c1.c
@@ -1,9 +1,9 @@
-/* linux/arch/arm/plat-s3c64xx/setup-i2c1.c
+/* linux/arch/arm/mach-s5pc100/setup-i2c1.c
  *
  * Copyright 2009 Samsung Electronics Co.
  *	Byungho Min <bhmin@samsung.com>
  *
- * Base S5PC1XX I2C bus 1 gpio configuration
+ * Base S5PC100 I2C bus 1 gpio configuration
  *
  * Based on plat-s3c64xx/setup-i2c1.c
  *
diff --git a/arch/arm/plat-s5pc1xx/Kconfig b/arch/arm/plat-s5pc1xx/Kconfig
index 708f7a0..c7bd2bb 100644
--- a/arch/arm/plat-s5pc1xx/Kconfig
+++ b/arch/arm/plat-s5pc1xx/Kconfig
@@ -39,20 +39,6 @@ config CPU_S5PC100_CLOCK
 
 # platform specific device setup
 
-config S5PC1XX_SETUP_I2C0
-	bool
-	default y
-	help
-	  Common setup code for i2c bus 0.
-
-	  Note, currently since i2c0 is always compiled, this setup helper
-	  is always compiled with it.
-
-config S5PC1XX_SETUP_I2C1
-	bool
-	help
-	  Common setup code for i2c bus 1.
-
 config S5PC1XX_SETUP_SDHCI_GPIO
 	bool
 	help
diff --git a/arch/arm/plat-s5pc1xx/Makefile b/arch/arm/plat-s5pc1xx/Makefile
index a5b90c0..9ce6409 100644
--- a/arch/arm/plat-s5pc1xx/Makefile
+++ b/arch/arm/plat-s5pc1xx/Makefile
@@ -23,6 +23,4 @@ obj-$(CONFIG_CPU_S5PC100_CLOCK)	+= s5pc100-clock.o
 
 # Device setup
 
-obj-$(CONFIG_S5PC1XX_SETUP_I2C0) += setup-i2c0.o
-obj-$(CONFIG_S5PC1XX_SETUP_I2C1) += setup-i2c1.o
 obj-$(CONFIG_S5PC1XX_SETUP_SDHCI_GPIO)	+= setup-sdhci-gpio.o
-- 
1.6.4
