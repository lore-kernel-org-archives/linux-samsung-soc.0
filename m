From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 12/17] ARM: S5PC1xx: add platform helpers for i2c adapter
 devices
Date: Tue, 13 Oct 2009 09:57:07 +0200
Message-ID: <1255420632-21116-13-git-send-email-m.szyprowski@samsung.com>
References: <1255420632-21116-1-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-2-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-3-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-4-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-5-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-6-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-7-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-8-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-9-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-10-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-11-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-12-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:11613 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933617AbZJMILg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Oct 2009 04:11:36 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0KRG007V60V25S80@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Oct 2009 08:59:26 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KRG0051X0V1CO@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Oct 2009 08:59:26 +0100 (BST)
In-reply-to: <1255420632-21116-12-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.arm.linux.org.uk, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com

Samsung S5PC100 has I2C bus controller compatible with the one known from
previous SoCs series. Add required platform setup and support code that
it can be used with s3c2410-i2c driver.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-s5pc100/cpu.c        |    4 ++++
 arch/arm/plat-s5pc1xx/Kconfig      |    4 ++--
 arch/arm/plat-s5pc1xx/Makefile     |    4 ++--
 arch/arm/plat-s5pc1xx/setup-i2c0.c |    7 ++++++-
 arch/arm/plat-s5pc1xx/setup-i2c1.c |    7 ++++++-
 5 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s5pc100/cpu.c b/arch/arm/mach-s5pc100/cpu.c
index a23ca57..1319e3d 100644
--- a/arch/arm/mach-s5pc100/cpu.c
+++ b/arch/arm/mach-s5pc100/cpu.c
@@ -75,6 +75,10 @@ void __init s5pc100_map_io(void)
 	iotable_init(s5pc100_iodesc, ARRAY_SIZE(s5pc100_iodesc));
 
 	/* initialise device information early */
+
+	/* the i2c devices are directly compatible with s3c2440 */
+	s3c_i2c0_setname("s3c2440-i2c");
+	s3c_i2c1_setname("s3c2440-i2c");
 }
 
 void __init s5pc100_init_clocks(int xtal)
diff --git a/arch/arm/plat-s5pc1xx/Kconfig b/arch/arm/plat-s5pc1xx/Kconfig
index 6ac48a6..1fc25b9 100644
--- a/arch/arm/plat-s5pc1xx/Kconfig
+++ b/arch/arm/plat-s5pc1xx/Kconfig
@@ -42,7 +42,7 @@ config S5PC1XX_SETUP_FB_24BPP
 	help
           Common setup code for S5PC1XX with an 24bpp RGB display helper.
 
-config S5PC100_SETUP_I2C0
+config S5PC1XX_SETUP_I2C0
 	bool
 	default y
 	help
@@ -51,7 +51,7 @@ config S5PC100_SETUP_I2C0
 	  Note, currently since i2c0 is always compiled, this setup helper
 	  is always compiled with it.
 
-config S5PC100_SETUP_I2C1
+config S5PC1XX_SETUP_I2C1
 	bool
 	help
 	  Common setup code for i2c bus 1.
diff --git a/arch/arm/plat-s5pc1xx/Makefile b/arch/arm/plat-s5pc1xx/Makefile
index 34c8da5..15c800e 100644
--- a/arch/arm/plat-s5pc1xx/Makefile
+++ b/arch/arm/plat-s5pc1xx/Makefile
@@ -25,5 +25,5 @@ obj-$(CONFIG_CPU_S5PC100_CLOCK)	+= s5pc100-clock.o
 # Device setup
 
 obj-$(CONFIG_S5PC1XX_SETUP_FB_24BPP) += setup-fb-24bpp.o
-obj-$(CONFIG_S5PC100_SETUP_I2C0) += setup-i2c0.o
-obj-$(CONFIG_S5PC100_SETUP_I2C1) += setup-i2c1.o
+obj-$(CONFIG_S5PC1XX_SETUP_I2C0) += setup-i2c0.o
+obj-$(CONFIG_S5PC1XX_SETUP_I2C1) += setup-i2c1.o
diff --git a/arch/arm/plat-s5pc1xx/setup-i2c0.c b/arch/arm/plat-s5pc1xx/setup-i2c0.c
index 3d00c02..09d5a2d 100644
--- a/arch/arm/plat-s5pc1xx/setup-i2c0.c
+++ b/arch/arm/plat-s5pc1xx/setup-i2c0.c
@@ -17,9 +17,14 @@
 
 struct platform_device; /* don't need the contents */
 
+#include <mach/gpio.h>
 #include <plat/iic.h>
+#include <plat/gpio-cfg.h>
 
 void s3c_i2c0_cfg_gpio(struct platform_device *dev)
 {
-	/* Pin configuration would be needed */
+	s3c_gpio_cfgpin(S5PC100_GPD(3), S3C_GPIO_SFN(2));
+	s3c_gpio_setpull(S5PC100_GPD(3), S3C_GPIO_PULL_UP);
+	s3c_gpio_cfgpin(S5PC100_GPD(4), S3C_GPIO_SFN(2));
+	s3c_gpio_setpull(S5PC100_GPD(4), S3C_GPIO_PULL_UP);
 }
diff --git a/arch/arm/plat-s5pc1xx/setup-i2c1.c b/arch/arm/plat-s5pc1xx/setup-i2c1.c
index c8f3ca4..3c13613 100644
--- a/arch/arm/plat-s5pc1xx/setup-i2c1.c
+++ b/arch/arm/plat-s5pc1xx/setup-i2c1.c
@@ -17,9 +17,14 @@
 
 struct platform_device; /* don't need the contents */
 
+#include <mach/gpio.h>
 #include <plat/iic.h>
+#include <plat/gpio-cfg.h>
 
 void s3c_i2c1_cfg_gpio(struct platform_device *dev)
 {
-	/* Pin configuration would be needed */
+	s3c_gpio_cfgpin(S5PC100_GPD(5), S3C_GPIO_SFN(2));
+	s3c_gpio_setpull(S5PC100_GPD(5), S3C_GPIO_PULL_UP);
+	s3c_gpio_cfgpin(S5PC100_GPD(6), S3C_GPIO_SFN(2));
+	s3c_gpio_setpull(S5PC100_GPD(6), S3C_GPIO_PULL_UP);
 }
-- 
1.6.4
