From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 14/28] ARM: SAMSUNG: Introduce GPIO_SAMSUNG Kconfig entry
Date: Fri, 14 Jun 2013 21:32:50 +0200
Message-ID: <1371238384-1504-15-git-send-email-t.figa@samsung.com>
References: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:20222 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753778Ab3FNTd2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 15:33:28 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOE00E84E2KE880@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Jun 2013 20:33:24 +0100 (BST)
In-reply-to: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>

This patch adds Kconfig entry that selects whether legacy Samsung GPIO
driver should be built or not. For platforms that support only DT based
boot, the new pinctrl driver is used and so the old one is not needed.

Cc: Grant Likely <grant.likely@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/Kconfig                        | 6 ++++++
 arch/arm/plat-samsung/Makefile          | 5 +++--
 arch/arm/plat-samsung/include/plat/pm.h | 5 +++++
 drivers/gpio/Kconfig                    | 7 +++++++
 drivers/gpio/Makefile                   | 2 +-
 5 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ae7247d..9c69e6c 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -695,6 +695,7 @@ config ARCH_S3C24XX
 	select CLKDEV_LOOKUP
 	select CLKSRC_MMIO
 	select GENERIC_CLOCKEVENTS
+	select GPIO_SAMSUNG
 	select HAVE_CLK
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
@@ -718,6 +719,7 @@ config ARCH_S3C64XX
 	select CLKSRC_MMIO
 	select CPU_V6
 	select GENERIC_CLOCKEVENTS
+	select GPIO_SAMSUNG
 	select HAVE_CLK
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
@@ -741,6 +743,7 @@ config ARCH_S5P64X0
 	select CLKSRC_MMIO
 	select CPU_V6
 	select GENERIC_CLOCKEVENTS
+	select GPIO_SAMSUNG
 	select HAVE_CLK
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
@@ -758,6 +761,7 @@ config ARCH_S5PC100
 	select CLKSRC_MMIO
 	select CPU_V7
 	select GENERIC_CLOCKEVENTS
+	select GPIO_SAMSUNG
 	select HAVE_CLK
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
@@ -776,6 +780,7 @@ config ARCH_S5PV210
 	select CLKSRC_MMIO
 	select CPU_V7
 	select GENERIC_CLOCKEVENTS
+	select GPIO_SAMSUNG
 	select HAVE_CLK
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
@@ -795,6 +800,7 @@ config ARCH_EXYNOS
 	select COMMON_CLK
 	select CPU_V7
 	select GENERIC_CLOCKEVENTS
+	select GPIO_SAMSUNG
 	select HAVE_CLK
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index b549ea9..8d95c15 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -52,10 +52,11 @@ obj-$(CONFIG_SAMSUNG_DMADEV)	+= dma-ops.o
 # PM support
 
 obj-$(CONFIG_PM)		+= pm.o
-obj-$(CONFIG_PM)		+= pm-gpio.o
+obj-$(CONFIG_GPIO_SAMSUNG)	+= pm-gpio.o
 obj-$(CONFIG_SAMSUNG_PM_CHECK)	+= pm-check.o
 
 obj-$(CONFIG_SAMSUNG_WAKEMASK)	+= wakeup-mask.o
 
-obj-$(CONFIG_S5P_PM)		+= s5p-pm.o s5p-irq-pm.o
+obj-$(CONFIG_S5P_PM)		+= s5p-pm.o
+obj-$(CONFIG_S5P_PM)		+= s5p-irq-pm.o
 obj-$(CONFIG_S5P_SLEEP)		+= s5p-sleep.o
diff --git a/arch/arm/plat-samsung/include/plat/pm.h b/arch/arm/plat-samsung/include/plat/pm.h
index f6fcade..5d47ca3 100644
--- a/arch/arm/plat-samsung/include/plat/pm.h
+++ b/arch/arm/plat-samsung/include/plat/pm.h
@@ -166,6 +166,7 @@ extern void s3c_pm_check_store(void);
  */
 extern void s3c_pm_configure_extint(void);
 
+#ifdef CONFIG_GPIO_SAMSUNG
 /**
  * samsung_pm_restore_gpios() - restore the state of the gpios after sleep.
  *
@@ -181,6 +182,10 @@ extern void samsung_pm_restore_gpios(void);
  * Save the GPIO states for resotration on resume. See samsung_pm_restore_gpios().
  */
 extern void samsung_pm_save_gpios(void);
+#else
+static inline void samsung_pm_restore_gpios(void) {}
+static inline void samsung_pm_save_gpios(void) {}
+#endif
 
 extern void s3c_pm_save_core(void);
 extern void s3c_pm_restore_core(void);
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 573c449..9c993ed 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -209,6 +209,13 @@ config GPIO_RCAR
 	help
 	  Say yes here to support GPIO on Renesas R-Car SoCs.
 
+config GPIO_SAMSUNG
+	bool
+	depends on PLAT_SAMSUNG
+	help
+	  Legacy GPIO support. Use only for platforms without support for
+	  pinctrl.
+
 config GPIO_SPEAR_SPICS
 	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
 	depends on PLAT_SPEAR
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 0cb2d65..ef3e983 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -59,7 +59,7 @@ obj-$(CONFIG_GPIO_PXA)		+= gpio-pxa.o
 obj-$(CONFIG_GPIO_RC5T583)	+= gpio-rc5t583.o
 obj-$(CONFIG_GPIO_RDC321X)	+= gpio-rdc321x.o
 obj-$(CONFIG_GPIO_RCAR)		+= gpio-rcar.o
-obj-$(CONFIG_PLAT_SAMSUNG)	+= gpio-samsung.o
+obj-$(CONFIG_GPIO_SAMSUNG)	+= gpio-samsung.o
 obj-$(CONFIG_ARCH_SA1100)	+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SCH)		+= gpio-sch.o
 obj-$(CONFIG_GPIO_SODAVILLE)	+= gpio-sodaville.o
-- 
1.8.2.1
