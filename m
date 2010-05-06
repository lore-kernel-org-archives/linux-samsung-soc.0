From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 02/23] ARM: S3C24XX: Add the gpio pull configuration for pull-up
Date: Fri,  7 May 2010 08:15:24 +0900
Message-ID: <1273187745-6566-3-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60606 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752746Ab0EFXQA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:00 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Add the necessary gpio configuration helper for the devices which
have a single-bit pull-up resistor disabled.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/Kconfig                      |    1 +
 arch/arm/mach-s3c2410/s3c2410.c                    |    8 +++++
 arch/arm/mach-s3c2440/Kconfig                      |    1 +
 arch/arm/mach-s3c2440/s3c2440.c                    |    8 +++++
 arch/arm/plat-samsung/gpio-config.c                |   32 ++++++++++++++++++++
 .../plat-samsung/include/plat/gpio-cfg-helpers.h   |   11 +++++++
 6 files changed, 61 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2410/Kconfig b/arch/arm/mach-s3c2410/Kconfig
index 5547318..9e5e96f 100644
--- a/arch/arm/mach-s3c2410/Kconfig
+++ b/arch/arm/mach-s3c2410/Kconfig
@@ -6,6 +6,7 @@ config CPU_S3C2410
 	bool
 	depends on ARCH_S3C2410
 	select CPU_ARM920T
+	select S3C_GPIO_PULL_UP
 	select S3C2410_CLOCK
 	select S3C2410_GPIO
 	select CPU_LLSERIAL_S3C2410
diff --git a/arch/arm/mach-s3c2410/s3c2410.c b/arch/arm/mach-s3c2410/s3c2410.c
index 91ba42f..adc90a3 100644
--- a/arch/arm/mach-s3c2410/s3c2410.c
+++ b/arch/arm/mach-s3c2410/s3c2410.c
@@ -16,6 +16,7 @@
 #include <linux/list.h>
 #include <linux/timer.h>
 #include <linux/init.h>
+#include <linux/gpio.h>
 #include <linux/clk.h>
 #include <linux/sysdev.h>
 #include <linux/serial_core.h>
@@ -40,6 +41,10 @@
 #include <plat/clock.h>
 #include <plat/pll.h>
 
+#include <plat/gpio-core.h>
+#include <plat/gpio-cfg.h>
+#include <plat/gpio-cfg-helpers.h>
+
 /* Initial IO mappings */
 
 static struct map_desc s3c2410_iodesc[] __initdata = {
@@ -65,6 +70,9 @@ void __init s3c2410_init_uarts(struct s3c2410_uartcfg *cfg, int no)
 
 void __init s3c2410_map_io(void)
 {
+	s3c24xx_gpiocfg_default.set_pull = s3c_gpio_setpull_1up;
+	s3c24xx_gpiocfg_default.get_pull = s3c_gpio_getpull_1up;
+
 	iotable_init(s3c2410_iodesc, ARRAY_SIZE(s3c2410_iodesc));
 }
 
diff --git a/arch/arm/mach-s3c2440/Kconfig b/arch/arm/mach-s3c2440/Kconfig
index 7f46526..9d102b9 100644
--- a/arch/arm/mach-s3c2440/Kconfig
+++ b/arch/arm/mach-s3c2440/Kconfig
@@ -6,6 +6,7 @@ config CPU_S3C2440
 	bool
 	depends on ARCH_S3C2410
 	select CPU_ARM920T
+	select S3C_GPIO_PULL_UP
 	select S3C2410_CLOCK
 	select S3C2410_PM if PM
 	select S3C2410_GPIO
diff --git a/arch/arm/mach-s3c2440/s3c2440.c b/arch/arm/mach-s3c2440/s3c2440.c
index 2b68f7e..d50f3ae 100644
--- a/arch/arm/mach-s3c2440/s3c2440.c
+++ b/arch/arm/mach-s3c2440/s3c2440.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
 #include <linux/sysdev.h>
+#include <linux/gpio.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 
@@ -33,6 +34,10 @@
 #include <plat/cpu.h>
 #include <plat/s3c244x.h>
 
+#include <plat/gpio-core.h>
+#include <plat/gpio-cfg.h>
+#include <plat/gpio-cfg-helpers.h>
+
 static struct sys_device s3c2440_sysdev = {
 	.cls		= &s3c2440_sysclass,
 };
@@ -41,6 +46,9 @@ int __init s3c2440_init(void)
 {
 	printk("S3C2440: Initialising architecture\n");
 
+	s3c24xx_gpiocfg_default.set_pull = s3c_gpio_setpull_1up;
+	s3c24xx_gpiocfg_default.get_pull = s3c_gpio_getpull_1up;
+
 	/* change irq for watchdog */
 
 	s3c_device_wdt.resource[1].start = IRQ_S3C2440_WDT;
diff --git a/arch/arm/plat-samsung/gpio-config.c b/arch/arm/plat-samsung/gpio-config.c
index c583282..8aca88d 100644
--- a/arch/arm/plat-samsung/gpio-config.c
+++ b/arch/arm/plat-samsung/gpio-config.c
@@ -164,3 +164,35 @@ s3c_gpio_pull_t s3c_gpio_getpull_updown(struct s3c_gpio_chip *chip,
 	return (__force s3c_gpio_pull_t)pup;
 }
 #endif
+
+#ifdef CONFIG_S3C_GPIO_PULL_UP
+int s3c_gpio_setpull_1up(struct s3c_gpio_chip *chip,
+			 unsigned int off, s3c_gpio_pull_t pull)
+{
+	void __iomem *reg = chip->base + 0x08;
+	u32 pup = __raw_readl(reg);
+
+	pup = __raw_readl(reg);
+
+	if (pup == S3C_GPIO_PULL_UP)
+		pup &= ~(1 << off);
+	else if (pup == S3C_GPIO_PULL_NONE)
+		pup |= (1 << off);
+	else
+		return -EINVAL;
+
+	__raw_writel(pup, reg);
+	return 0;
+}
+
+s3c_gpio_pull_t s3c_gpio_getpull_1up(struct s3c_gpio_chip *chip,
+				     unsigned int off)
+{
+	void __iomem *reg = chip->base + 0x08;
+	u32 pup = __raw_readl(reg);
+
+	pup &= (1 << off);
+	return pup ? S3C_GPIO_PULL_NONE : S3C_GPIO_PULL_UP;
+}
+#endif /* CONFIG_S3C_GPIO_PULL_UP */
+
diff --git a/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h b/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
index dda19da..885e9ac 100644
--- a/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
+++ b/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
@@ -146,6 +146,17 @@ extern s3c_gpio_pull_t s3c_gpio_getpull_updown(struct s3c_gpio_chip *chip,
 					       unsigned int off);
 
 /**
+ * s3c_gpio_getpull_1up() - Get configuration for choice of up or none
+ * @chip: The gpio chip that the GPIO pin belongs to
+ * @off: The offset to the pin to get the configuration of.
+ *
+ * This helper function reads the state of the pull-up resistor for the
+ * given GPIO in the same case as s3c_gpio_setpull_1up.
+*/
+extern s3c_gpio_pull_t s3c_gpio_getpull_1up(struct s3c_gpio_chip *chip,
+					    unsigned int off);
+
+/**
  * s3c_gpio_setpull_s3c2443() - Pull configuration for s3c2443.
  * @chip: The gpio chip that is being configured.
  * @off: The offset for the GPIO being configured.
-- 
1.7.0.4
