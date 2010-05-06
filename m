From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 13/23] ARM: S3C24XX: Drop s3c2410 specific s3c2410_gpio_cfgpin()
Date: Fri,  7 May 2010 08:15:35 +0900
Message-ID: <1273187745-6566-14-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60636 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752785Ab0EFXQH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:07 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

The s3c_gpio_cfgpin() call should be functionally equivalent, so replace
the s3c2410_gpio_cfgpin() calls in the s3c24xx code with s3c_gpio_cfgpin
to allow moving away from a fixed GPIO number to register address mapping

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/h1940-bluetooth.c      |    8 ++++----
 arch/arm/mach-s3c2410/mach-amlm5900.c        |    3 ++-
 arch/arm/mach-s3c2410/mach-bast.c            |    3 ++-
 arch/arm/mach-s3c2410/mach-h1940.c           |    3 ++-
 arch/arm/mach-s3c2410/mach-qt2410.c          |    3 ++-
 arch/arm/mach-s3c2412/mach-jive.c            |    7 ++++---
 arch/arm/mach-s3c2440/mach-mini2440.c        |   11 ++++++-----
 arch/arm/mach-s3c2440/mach-nexcoder.c        |    9 +++++----
 arch/arm/mach-s3c2440/mach-osiris.c          |    5 +++--
 arch/arm/plat-s3c24xx/common-smdk.c          |    9 +++++----
 arch/arm/plat-s3c24xx/pm.c                   |    3 ++-
 arch/arm/plat-s3c24xx/setup-i2c.c            |    5 +++--
 arch/arm/plat-s3c24xx/spi-bus0-gpe11_12_13.c |   10 +++++-----
 arch/arm/plat-s3c24xx/spi-bus1-gpd8_9_10.c   |   10 +++++-----
 arch/arm/plat-s3c24xx/spi-bus1-gpg5_6_7.c    |   10 +++++-----
 15 files changed, 55 insertions(+), 44 deletions(-)

diff --git a/arch/arm/mach-s3c2410/h1940-bluetooth.c b/arch/arm/mach-s3c2410/h1940-bluetooth.c
index 171a7c3..8cdeb14 100644
--- a/arch/arm/mach-s3c2410/h1940-bluetooth.c
+++ b/arch/arm/mach-s3c2410/h1940-bluetooth.c
@@ -69,13 +69,13 @@ static int __devinit h1940bt_probe(struct platform_device *pdev)
 	}
 
 	/* Configures BT serial port GPIOs */
-	s3c2410_gpio_cfgpin(S3C2410_GPH(0), S3C2410_GPH0_nCTS0);
+	s3c_gpio_cfgpin(S3C2410_GPH(0), S3C2410_GPH0_nCTS0);
 	s3c_gpio_cfgpull(S3C2410_GPH(0), S3C_GPIO_PULL_NONE);
-	s3c2410_gpio_cfgpin(S3C2410_GPH(1), S3C2410_GPIO_OUTPUT);
+	s3c_gpio_cfgpin(S3C2410_GPH(1), S3C2410_GPIO_OUTPUT);
 	s3c_gpio_cfgpull(S3C2410_GPH(1), S3C_GPIO_PULL_NONE);
-	s3c2410_gpio_cfgpin(S3C2410_GPH(2), S3C2410_GPH2_TXD0);
+	s3c_gpio_cfgpin(S3C2410_GPH(2), S3C2410_GPH2_TXD0);
 	s3c_gpio_cfgpull(S3C2410_GPH(2), S3C_GPIO_PULL_NONE);
-	s3c2410_gpio_cfgpin(S3C2410_GPH(3), S3C2410_GPH3_RXD0);
+	s3c_gpio_cfgpin(S3C2410_GPH(3), S3C2410_GPH3_RXD0);
 	s3c_gpio_cfgpull(S3C2410_GPH(3), S3C_GPIO_PULL_NONE);
 
 
diff --git a/arch/arm/mach-s3c2410/mach-amlm5900.c b/arch/arm/mach-s3c2410/mach-amlm5900.c
index 7047317..b42a760 100644
--- a/arch/arm/mach-s3c2410/mach-amlm5900.c
+++ b/arch/arm/mach-s3c2410/mach-amlm5900.c
@@ -56,6 +56,7 @@
 #include <plat/iic.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/gpio-cfg.h>
 
 #ifdef CONFIG_MTD_PARTITIONS
 
@@ -225,7 +226,7 @@ static void amlm5900_init_pm(void)
 	} else {
 		enable_irq_wake(IRQ_EINT9);
 		/* configure the suspend/resume status pin */
-		s3c2410_gpio_cfgpin(S3C2410_GPF(2), S3C2410_GPIO_OUTPUT);
+		s3c_gpio_cfgpin(S3C2410_GPF(2), S3C2410_GPIO_OUTPUT);
 		s3c2410_gpio_pullup(S3C2410_GPF(2), 0);
 	}
 }
diff --git a/arch/arm/mach-s3c2410/mach-bast.c b/arch/arm/mach-s3c2410/mach-bast.c
index d03cbe2..b061ddc 100644
--- a/arch/arm/mach-s3c2410/mach-bast.c
+++ b/arch/arm/mach-s3c2410/mach-bast.c
@@ -61,6 +61,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/cpu-freq.h>
+#include <plat/gpio-cfg.h>
 #include <plat/audio-simtec.h>
 
 #include "usb-simtec.h"
@@ -222,7 +223,7 @@ static int bast_pm_suspend(struct sys_device *sd, pm_message_t state)
 
 static int bast_pm_resume(struct sys_device *sd)
 {
-	s3c2410_gpio_cfgpin(S3C2410_GPA(21), S3C2410_GPA21_nRSTOUT);
+	s3c_gpio_cfgpin(S3C2410_GPA(21), S3C2410_GPA21_nRSTOUT);
 	return 0;
 }
 
diff --git a/arch/arm/mach-s3c2410/mach-h1940.c b/arch/arm/mach-s3c2410/mach-h1940.c
index 5527f74..e2f7e64 100644
--- a/arch/arm/mach-s3c2410/mach-h1940.c
+++ b/arch/arm/mach-s3c2410/mach-h1940.c
@@ -50,6 +50,7 @@
 #include <plat/udc.h>
 #include <plat/iic.h>
 
+#include <plat/gpio-cfg.h>
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
@@ -209,7 +210,7 @@ static int h1940_backlight_init(struct device *dev)
 
 	gpio_direction_output(S3C2410_GPB(0), 0);
 	s3c2410_gpio_pullup(S3C2410_GPB(0), 0);
-	s3c2410_gpio_cfgpin(S3C2410_GPB(0), S3C2410_GPB0_TOUT0);
+	s3c_gpio_cfgpin(S3C2410_GPB(0), S3C2410_GPB0_TOUT0);
 
 	return 0;
 }
diff --git a/arch/arm/mach-s3c2410/mach-qt2410.c b/arch/arm/mach-s3c2410/mach-qt2410.c
index e9762fb..d0e87b6 100644
--- a/arch/arm/mach-s3c2410/mach-qt2410.c
+++ b/arch/arm/mach-s3c2410/mach-qt2410.c
@@ -58,6 +58,7 @@
 #include <plat/iic.h>
 
 #include <plat/common-smdk.h>
+#include <plat/gpio-cfg.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/pm.h>
@@ -347,7 +348,7 @@ static void __init qt2410_machine_init(void)
 	}
 	s3c24xx_fb_set_platdata(&qt2410_fb_info);
 
-	s3c2410_gpio_cfgpin(S3C2410_GPB(0), S3C2410_GPIO_OUTPUT);
+	s3c_gpio_cfgpin(S3C2410_GPB(0), S3C2410_GPIO_OUTPUT);
 	s3c2410_gpio_setpin(S3C2410_GPB(0), 1);
 
 	s3c24xx_udc_set_platdata(&qt2410_udc_cfg);
diff --git a/arch/arm/mach-s3c2412/mach-jive.c b/arch/arm/mach-s3c2412/mach-jive.c
index d2bb7d2..4316018 100644
--- a/arch/arm/mach-s3c2412/mach-jive.c
+++ b/arch/arm/mach-s3c2412/mach-jive.c
@@ -48,6 +48,7 @@
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
+#include <plat/gpio-cfg.h>
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
@@ -530,7 +531,7 @@ static void jive_power_off(void)
 	printk(KERN_INFO "powering system down...\n");
 
 	s3c2410_gpio_setpin(S3C2410_GPC(5), 1);
-	s3c2410_gpio_cfgpin(S3C2410_GPC(5), S3C2410_GPIO_OUTPUT);
+	s3c_gpio_cfgpin(S3C2410_GPC(5), S3C2410_GPIO_OUTPUT);
 }
 
 static void __init jive_machine_init(void)
@@ -642,10 +643,10 @@ static void __init jive_machine_init(void)
 	gpio_direction_output(S3C2410_GPB(7), 1);
 
 	s3c2410_gpio_setpin(S3C2410_GPB(6), 0);
-	s3c2410_gpio_cfgpin(S3C2410_GPB(6), S3C2410_GPIO_OUTPUT);
+	s3c_gpio_cfgpin(S3C2410_GPB(6), S3C2410_GPIO_OUTPUT);
 
 	s3c2410_gpio_setpin(S3C2410_GPG(8), 1);
-	s3c2410_gpio_cfgpin(S3C2410_GPG(8), S3C2410_GPIO_OUTPUT);
+	s3c_gpio_cfgpin(S3C2410_GPG(8), S3C2410_GPIO_OUTPUT);
 
 	/* initialise the WM8750 spi */
 
diff --git a/arch/arm/mach-s3c2440/mach-mini2440.c b/arch/arm/mach-s3c2440/mach-mini2440.c
index 571b176..362a2f9 100644
--- a/arch/arm/mach-s3c2440/mach-mini2440.c
+++ b/arch/arm/mach-s3c2440/mach-mini2440.c
@@ -53,6 +53,7 @@
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
+#include <plat/gpio-cfg.h>
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
@@ -632,24 +633,24 @@ static void __init mini2440_init(void)
 	mini2440_parse_features(&features, mini2440_features_str);
 
 	/* turn LCD on */
-	s3c2410_gpio_cfgpin(S3C2410_GPC(0), S3C2410_GPC0_LEND);
+	s3c_gpio_cfgpin(S3C2410_GPC(0), S3C2410_GPC0_LEND);
 
 	/* Turn the backlight early on */
 	s3c2410_gpio_setpin(S3C2410_GPG(4), 1);
-	s3c2410_gpio_cfgpin(S3C2410_GPG(4), S3C2410_GPIO_OUTPUT);
+	s3c_gpio_cfgpin(S3C2410_GPG(4), S3C2410_GPIO_OUTPUT);
 
 	/* remove pullup on optional PWM backlight -- unused on 3.5 and 7"s */
 	s3c2410_gpio_pullup(S3C2410_GPB(1), 0);
 	s3c2410_gpio_setpin(S3C2410_GPB(1), 0);
-	s3c2410_gpio_cfgpin(S3C2410_GPB(1), S3C2410_GPIO_INPUT);
+	s3c_gpio_cfgpin(S3C2410_GPB(1), S3C2410_GPIO_INPUT);
 
 	/* Make sure the D+ pullup pin is output */
-	s3c2410_gpio_cfgpin(S3C2410_GPC(5), S3C2410_GPIO_OUTPUT);
+	s3c_gpio_cfgpin(S3C2410_GPC(5), S3C2410_GPIO_OUTPUT);
 
 	/* mark the key as input, without pullups (there is one on the board) */
 	for (i = 0; i < ARRAY_SIZE(mini2440_buttons); i++) {
 		s3c2410_gpio_pullup(mini2440_buttons[i].gpio, 0);
-		s3c2410_gpio_cfgpin(mini2440_buttons[i].gpio,
+		s3c_gpio_cfgpin(mini2440_buttons[i].gpio,
 					S3C2410_GPIO_INPUT);
 	}
 	if (features.lcd_index != -1) {
diff --git a/arch/arm/mach-s3c2440/mach-nexcoder.c b/arch/arm/mach-s3c2440/mach-nexcoder.c
index 3420415..3ff62de 100644
--- a/arch/arm/mach-s3c2440/mach-nexcoder.c
+++ b/arch/arm/mach-s3c2440/mach-nexcoder.c
@@ -40,6 +40,7 @@
 #include <plat/regs-serial.h>
 #include <plat/iic.h>
 
+#include <plat/gpio-cfg.h>
 #include <plat/s3c2410.h>
 #include <plat/s3c244x.h>
 #include <plat/clock.h>
@@ -122,15 +123,15 @@ static void __init nexcoder_sensorboard_init(void)
 {
 	// Initialize SCCB bus
 	s3c2410_gpio_setpin(S3C2410_GPE(14), 1); // IICSCL
-	s3c2410_gpio_cfgpin(S3C2410_GPE(14), S3C2410_GPIO_OUTPUT);
+	s3c_gpio_cfgpin(S3C2410_GPE(14), S3C2410_GPIO_OUTPUT);
 	s3c2410_gpio_setpin(S3C2410_GPE(15), 1); // IICSDA
-	s3c2410_gpio_cfgpin(S3C2410_GPE(15), S3C2410_GPIO_OUTPUT);
+	s3c_gpio_cfgpin(S3C2410_GPE(15), S3C2410_GPIO_OUTPUT);
 
 	// Power up the sensor board
 	s3c2410_gpio_setpin(S3C2410_GPF(1), 1);
-	s3c2410_gpio_cfgpin(S3C2410_GPF(1), S3C2410_GPIO_OUTPUT); // CAM_GPIO7 => nLDO_PWRDN
+	s3c_gpio_cfgpin(S3C2410_GPF(1), S3C2410_GPIO_OUTPUT); // CAM_GPIO7 => nLDO_PWRDN
 	s3c2410_gpio_setpin(S3C2410_GPF(2), 0);
-	s3c2410_gpio_cfgpin(S3C2410_GPF(2), S3C2410_GPIO_OUTPUT); // CAM_GPIO6 => CAM_PWRDN
+	s3c_gpio_cfgpin(S3C2410_GPF(2), S3C2410_GPIO_OUTPUT); // CAM_GPIO6 => CAM_PWRDN
 }
 
 static void __init nexcoder_map_io(void)
diff --git a/arch/arm/mach-s3c2440/mach-osiris.c b/arch/arm/mach-s3c2440/mach-osiris.c
index f35371d..319458d 100644
--- a/arch/arm/mach-s3c2440/mach-osiris.c
+++ b/arch/arm/mach-s3c2440/mach-osiris.c
@@ -49,6 +49,7 @@
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
+#include <plat/gpio-cfg.h>
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
@@ -298,7 +299,7 @@ static int osiris_pm_suspend(struct sys_device *sd, pm_message_t state)
 
 	/* ensure that an nRESET is not generated on resume. */
 	s3c2410_gpio_setpin(S3C2410_GPA(21), 1);
-	s3c2410_gpio_cfgpin(S3C2410_GPA(21), S3C2410_GPIO_OUTPUT);
+	s3c_gpio_cfgpin(S3C2410_GPA(21), S3C2410_GPIO_OUTPUT);
 
 	return 0;
 }
@@ -310,7 +311,7 @@ static int osiris_pm_resume(struct sys_device *sd)
 
 	__raw_writeb(pm_osiris_ctrl0, OSIRIS_VA_CTRL0);
 
-	s3c2410_gpio_cfgpin(S3C2410_GPA(21), S3C2410_GPA21_nRSTOUT);
+	s3c_gpio_cfgpin(S3C2410_GPA(21), S3C2410_GPA21_nRSTOUT);
 
 	return 0;
 }
diff --git a/arch/arm/plat-s3c24xx/common-smdk.c b/arch/arm/plat-s3c24xx/common-smdk.c
index 9e0e20a..7b44d0c 100644
--- a/arch/arm/plat-s3c24xx/common-smdk.c
+++ b/arch/arm/plat-s3c24xx/common-smdk.c
@@ -42,6 +42,7 @@
 #include <plat/nand.h>
 
 #include <plat/common-smdk.h>
+#include <plat/gpio-cfg.h>
 #include <plat/devs.h>
 #include <plat/pm.h>
 
@@ -185,10 +186,10 @@ void __init smdk_machine_init(void)
 {
 	/* Configure the LEDs (even if we have no LED support)*/
 
-	s3c2410_gpio_cfgpin(S3C2410_GPF(4), S3C2410_GPIO_OUTPUT);
-	s3c2410_gpio_cfgpin(S3C2410_GPF(5), S3C2410_GPIO_OUTPUT);
-	s3c2410_gpio_cfgpin(S3C2410_GPF(6), S3C2410_GPIO_OUTPUT);
-	s3c2410_gpio_cfgpin(S3C2410_GPF(7), S3C2410_GPIO_OUTPUT);
+	s3c_gpio_cfgpin(S3C2410_GPF(4), S3C2410_GPIO_OUTPUT);
+	s3c_gpio_cfgpin(S3C2410_GPF(5), S3C2410_GPIO_OUTPUT);
+	s3c_gpio_cfgpin(S3C2410_GPF(6), S3C2410_GPIO_OUTPUT);
+	s3c_gpio_cfgpin(S3C2410_GPF(7), S3C2410_GPIO_OUTPUT);
 
 	s3c2410_gpio_setpin(S3C2410_GPF(4), 1);
 	s3c2410_gpio_setpin(S3C2410_GPF(5), 1);
diff --git a/arch/arm/plat-s3c24xx/pm.c b/arch/arm/plat-s3c24xx/pm.c
index 3620dd2..37ea822 100644
--- a/arch/arm/plat-s3c24xx/pm.c
+++ b/arch/arm/plat-s3c24xx/pm.c
@@ -43,6 +43,7 @@
 
 #include <asm/mach/time.h>
 
+#include <plat/gpio-cfg.h>
 #include <plat/pm.h>
 
 #define PFX "s3c24xx-pm: "
@@ -105,7 +106,7 @@ static void s3c_pm_check_resume_pin(unsigned int pin, unsigned int irqoffs)
 	} else {
 		if (pinstate == S3C2410_GPIO_IRQ) {
 			S3C_PMDBG("Disabling IRQ %d (pin %d)\n", irq, pin);
-			s3c2410_gpio_cfgpin(pin, S3C2410_GPIO_INPUT);
+			s3c_gpio_cfgpin(pin, S3C2410_GPIO_INPUT);
 		}
 	}
 }
diff --git a/arch/arm/plat-s3c24xx/setup-i2c.c b/arch/arm/plat-s3c24xx/setup-i2c.c
index 71a6acc..9e90a7c 100644
--- a/arch/arm/plat-s3c24xx/setup-i2c.c
+++ b/arch/arm/plat-s3c24xx/setup-i2c.c
@@ -15,12 +15,13 @@
 
 struct platform_device;
 
+#include <plat/gpio-cfg.h>
 #include <plat/iic.h>
 #include <mach/hardware.h>
 #include <mach/regs-gpio.h>
 
 void s3c_i2c0_cfg_gpio(struct platform_device *dev)
 {
-	s3c2410_gpio_cfgpin(S3C2410_GPE(15), S3C2410_GPE15_IICSDA);
-	s3c2410_gpio_cfgpin(S3C2410_GPE(14), S3C2410_GPE14_IICSCL);
+	s3c_gpio_cfgpin(S3C2410_GPE(15), S3C2410_GPE15_IICSDA);
+	s3c_gpio_cfgpin(S3C2410_GPE(14), S3C2410_GPE14_IICSCL);
 }
diff --git a/arch/arm/plat-s3c24xx/spi-bus0-gpe11_12_13.c b/arch/arm/plat-s3c24xx/spi-bus0-gpe11_12_13.c
index 71256ad..9793544 100644
--- a/arch/arm/plat-s3c24xx/spi-bus0-gpe11_12_13.c
+++ b/arch/arm/plat-s3c24xx/spi-bus0-gpe11_12_13.c
@@ -21,14 +21,14 @@ void s3c24xx_spi_gpiocfg_bus0_gpe11_12_13(struct s3c2410_spi_info *spi,
 					  int enable)
 {
 	if (enable) {
-		s3c2410_gpio_cfgpin(S3C2410_GPE(13), S3C2410_GPE13_SPICLK0);
-		s3c2410_gpio_cfgpin(S3C2410_GPE(12), S3C2410_GPE12_SPIMOSI0);
-		s3c2410_gpio_cfgpin(S3C2410_GPE(11), S3C2410_GPE11_SPIMISO0);
+		s3c_gpio_cfgpin(S3C2410_GPE(13), S3C2410_GPE13_SPICLK0);
+		s3c_gpio_cfgpin(S3C2410_GPE(12), S3C2410_GPE12_SPIMOSI0);
+		s3c_gpio_cfgpin(S3C2410_GPE(11), S3C2410_GPE11_SPIMISO0);
 		s3c2410_gpio_pullup(S3C2410_GPE(11), 0);
 		s3c2410_gpio_pullup(S3C2410_GPE(13), 0);
 	} else {
-		s3c2410_gpio_cfgpin(S3C2410_GPE(13), S3C2410_GPIO_INPUT);
-		s3c2410_gpio_cfgpin(S3C2410_GPE(11), S3C2410_GPIO_INPUT);
+		s3c_gpio_cfgpin(S3C2410_GPE(13), S3C2410_GPIO_INPUT);
+		s3c_gpio_cfgpin(S3C2410_GPE(11), S3C2410_GPIO_INPUT);
 		s3c_gpio_cfgpull(S3C2410_GPE(11), S3C_GPIO_PULL_NONE);
 		s3c_gpio_cfgpull(S3C2410_GPE(12), S3C_GPIO_PULL_NONE);
 		s3c_gpio_cfgpull(S3C2410_GPE(13), S3C_GPIO_PULL_NONE);
diff --git a/arch/arm/plat-s3c24xx/spi-bus1-gpd8_9_10.c b/arch/arm/plat-s3c24xx/spi-bus1-gpd8_9_10.c
index 31bda55..db9e9e4 100644
--- a/arch/arm/plat-s3c24xx/spi-bus1-gpd8_9_10.c
+++ b/arch/arm/plat-s3c24xx/spi-bus1-gpd8_9_10.c
@@ -23,14 +23,14 @@ void s3c24xx_spi_gpiocfg_bus1_gpd8_9_10(struct s3c2410_spi_info *spi,
 
 	printk(KERN_INFO "%s(%d)\n", __func__, enable);
 	if (enable) {
-		s3c2410_gpio_cfgpin(S3C2410_GPD(10), S3C2440_GPD10_SPICLK1);
-		s3c2410_gpio_cfgpin(S3C2410_GPD(9), S3C2440_GPD9_SPIMOSI1);
-		s3c2410_gpio_cfgpin(S3C2410_GPD(8), S3C2440_GPD8_SPIMISO1);
+		s3c_gpio_cfgpin(S3C2410_GPD(10), S3C2440_GPD10_SPICLK1);
+		s3c_gpio_cfgpin(S3C2410_GPD(9), S3C2440_GPD9_SPIMOSI1);
+		s3c_gpio_cfgpin(S3C2410_GPD(8), S3C2440_GPD8_SPIMISO1);
 		s3c2410_gpio_pullup(S3C2410_GPD(10), 0);
 		s3c2410_gpio_pullup(S3C2410_GPD(9), 0);
 	} else {
-		s3c2410_gpio_cfgpin(S3C2410_GPD(8), S3C2410_GPIO_INPUT);
-		s3c2410_gpio_cfgpin(S3C2410_GPD(9), S3C2410_GPIO_INPUT);
+		s3c_gpio_cfgpin(S3C2410_GPD(8), S3C2410_GPIO_INPUT);
+		s3c_gpio_cfgpin(S3C2410_GPD(9), S3C2410_GPIO_INPUT);
 		s3c_gpio_cfgpull(S3C2410_GPD(10), S3C_GPIO_PULL_NONE);
 		s3c_gpio_cfgpull(S3C2410_GPD(9), S3C_GPIO_PULL_NONE);
 		s3c_gpio_cfgpull(S3C2410_GPD(8), S3C_GPIO_PULL_NONE);
diff --git a/arch/arm/plat-s3c24xx/spi-bus1-gpg5_6_7.c b/arch/arm/plat-s3c24xx/spi-bus1-gpg5_6_7.c
index 7910501..8ea663a 100644
--- a/arch/arm/plat-s3c24xx/spi-bus1-gpg5_6_7.c
+++ b/arch/arm/plat-s3c24xx/spi-bus1-gpg5_6_7.c
@@ -21,14 +21,14 @@ void s3c24xx_spi_gpiocfg_bus1_gpg5_6_7(struct s3c2410_spi_info *spi,
 				       int enable)
 {
 	if (enable) {
-		s3c2410_gpio_cfgpin(S3C2410_GPG(7), S3C2410_GPG7_SPICLK1);
-		s3c2410_gpio_cfgpin(S3C2410_GPG(6), S3C2410_GPG6_SPIMOSI1);
-		s3c2410_gpio_cfgpin(S3C2410_GPG(5), S3C2410_GPG5_SPIMISO1);
+		s3c_gpio_cfgpin(S3C2410_GPG(7), S3C2410_GPG7_SPICLK1);
+		s3c_gpio_cfgpin(S3C2410_GPG(6), S3C2410_GPG6_SPIMOSI1);
+		s3c_gpio_cfgpin(S3C2410_GPG(5), S3C2410_GPG5_SPIMISO1);
 		s3c2410_gpio_pullup(S3C2410_GPG(5), 0);
 		s3c2410_gpio_pullup(S3C2410_GPG(6), 0);
 	} else {
-		s3c2410_gpio_cfgpin(S3C2410_GPG(7), S3C2410_GPIO_INPUT);
-		s3c2410_gpio_cfgpin(S3C2410_GPG(5), S3C2410_GPIO_INPUT);
+		s3c_gpio_cfgpin(S3C2410_GPG(7), S3C2410_GPIO_INPUT);
+		s3c_gpio_cfgpin(S3C2410_GPG(5), S3C2410_GPIO_INPUT);
 		s3c_gpio_cfgpull(S3C2410_GPG(5), S3C_GPIO_PULL_NONE);
 		s3c_gpio_cfgpull(S3C2410_GPG(6), S3C_GPIO_PULL_NONE);
 		s3c_gpio_cfgpull(S3C2410_GPG(7), S3C_GPIO_PULL_NONE);
-- 
1.7.0.4
