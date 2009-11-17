From: arnaud.patard@rtp-net.org
Subject: [patch 4/4] Convert h1940 bluetooth driver to rfkill
Date: Tue, 17 Nov 2009 14:54:59 +0100
Message-ID: <20091117140418.622968171@rtp-net.org>
References: <20091117135455.913565760@rtp-net.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sat78-1-82-232-42-61.fbx.proxad.net ([82.232.42.61]:57542 "EHLO
	jules.rtp-net.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751267AbZKQOM5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Nov 2009 09:12:57 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org
Cc: linux-samsung-soc@vger.kernel.org, Arnaud Patard <arnaud.patard@rtp-net.org>

Hi,
Content-Disposition: inline; filename=h1940bt_rfkill.patch

Better using standard interfaces to enable/disable bluetooth

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
---
 arch/arm/mach-s3c2410/Kconfig           |    8 	8 +	0 -	0 !
 arch/arm/mach-s3c2410/Makefile          |    3 	2 +	1 -	0 !
 arch/arm/mach-s3c2410/h1940-bluetooth.c |   88 	42 +	46 -	0 !
 3 files changed, 52 insertions(+), 47 deletions(-)

Index: linux/arch/arm/mach-s3c2410/Kconfig
===================================================================
--- linux.orig/arch/arm/mach-s3c2410/Kconfig	2009-11-17 12:28:19.000000000 +0100
+++ linux/arch/arm/mach-s3c2410/Kconfig	2009-11-17 14:09:12.000000000 +0100
@@ -81,6 +81,14 @@ config ARCH_H1940
 	help
 	  Say Y here if you are using the HP IPAQ H1940
 
+config H1940BT
+        tristate "Control the state of H1940 bluetooth chip"
+        depends on ARCH_H1940
+        select RFKILL
+        help
+          This is a simple driver that is able to control
+          the state of built in bluetooth chip on h1940.
+
 config PM_H1940
 	bool
 	help
Index: linux/arch/arm/mach-s3c2410/Makefile
===================================================================
--- linux.orig/arch/arm/mach-s3c2410/Makefile	2009-11-17 11:54:19.000000000 +0100
+++ linux/arch/arm/mach-s3c2410/Makefile	2009-11-17 14:09:42.000000000 +0100
@@ -21,7 +21,8 @@ obj-$(CONFIG_S3C2410_PLLTABLE)	+= pll.o
 # Machine support
 
 obj-$(CONFIG_ARCH_SMDK2410)	+= mach-smdk2410.o
-obj-$(CONFIG_ARCH_H1940)	+= mach-h1940.o h1940-bluetooth.o
+obj-$(CONFIG_ARCH_H1940)	+= mach-h1940.o
+obj-$(CONFIG_H1940BT)		+= h1940-bluetooth.o
 obj-$(CONFIG_PM_H1940)		+= pm-h1940.o
 obj-$(CONFIG_MACH_N30)		+= mach-n30.o
 obj-$(CONFIG_ARCH_BAST)		+= mach-bast.o usb-simtec.o
Index: linux/arch/arm/mach-s3c2410/h1940-bluetooth.c
===================================================================
--- linux.orig/arch/arm/mach-s3c2410/h1940-bluetooth.c	2009-11-17 11:54:19.000000000 +0100
+++ linux/arch/arm/mach-s3c2410/h1940-bluetooth.c	2009-11-17 14:09:12.000000000 +0100
@@ -17,6 +17,7 @@
 #include <linux/ctype.h>
 #include <linux/leds.h>
 #include <linux/gpio.h>
+#include <linux/rfkill.h>
 
 #include <mach/regs-gpio.h>
 #include <mach/hardware.h>
@@ -24,21 +25,10 @@
 
 #define DRV_NAME              "h1940-bt"
 
-#ifdef CONFIG_LEDS_H1940
-DEFINE_LED_TRIGGER(bt_led_trigger);
-#endif
-
-static int state;
-
 /* Bluetooth control */
 static void h1940bt_enable(int on)
 {
 	if (on) {
-#ifdef CONFIG_LEDS_H1940
-		/* flashing Blue */
-		led_trigger_event(bt_led_trigger, LED_HALF);
-#endif
-
 		/* Power on the chip */
 		h1940_latch_control(0, H1940_LATCH_BLUETOOTH_POWER);
 		/* Reset the chip */
@@ -46,48 +36,31 @@ static void h1940bt_enable(int on)
 		s3c2410_gpio_setpin(S3C2410_GPH(1), 1);
 		mdelay(10);
 		s3c2410_gpio_setpin(S3C2410_GPH(1), 0);
-
-		state = 1;
 	}
 	else {
-#ifdef CONFIG_LEDS_H1940
-		led_trigger_event(bt_led_trigger, 0);
-#endif
-
 		s3c2410_gpio_setpin(S3C2410_GPH(1), 1);
 		mdelay(10);
 		s3c2410_gpio_setpin(S3C2410_GPH(1), 0);
 		mdelay(10);
 		h1940_latch_control(H1940_LATCH_BLUETOOTH_POWER, 0);
-
-		state = 0;
 	}
 }
 
-static ssize_t h1940bt_show(struct device *dev, struct device_attribute *attr, char *buf)
+static int h1940bt_set_block(void *data, bool blocked)
 {
-	return snprintf(buf, PAGE_SIZE, "%d\n", state);
+	h1940bt_enable(!blocked);
+	return 0;
 }
 
-static ssize_t h1940bt_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
-{
-	int new_state;
-	char *endp;
-
-	new_state = simple_strtoul(buf, &endp, 0);
-	if (*endp && !isspace(*endp))
-		return -EINVAL;
-
-	h1940bt_enable(new_state);
-
-	return count;
-}
-static DEVICE_ATTR(enable, 0644,
-		h1940bt_show,
-		h1940bt_store);
+static const struct rfkill_ops h1940bt_rfkill_ops = {
+	.set_block = h1940bt_set_block,
+};
 
 static int __init h1940bt_probe(struct platform_device *pdev)
 {
+	struct rfkill *rfk;
+	int ret = 0;
+
 	/* Configures BT serial port GPIOs */
 	s3c2410_gpio_cfgpin(S3C2410_GPH(0), S3C2410_GPH0_nCTS0);
 	s3c2410_gpio_pullup(S3C2410_GPH(0), 1);
@@ -98,21 +71,44 @@ static int __init h1940bt_probe(struct p
 	s3c2410_gpio_cfgpin(S3C2410_GPH(3), S3C2410_GPH3_RXD0);
 	s3c2410_gpio_pullup(S3C2410_GPH(3), 1);
 
-#ifdef CONFIG_LEDS_H1940
-	led_trigger_register_simple("h1940-bluetooth", &bt_led_trigger);
-#endif
 
-	/* disable BT by default */
-	h1940bt_enable(0);
+	rfk = rfkill_alloc(DRV_NAME, &pdev->dev, RFKILL_TYPE_BLUETOOTH,
+			&h1940bt_rfkill_ops, NULL);
+	if (!rfk) {
+		ret = -ENOMEM;
+		goto err_rfk_alloc;
+	}
+
+	rfkill_set_led_trigger_name(rfk, "h1940-bluetooth");
+
+	ret = rfkill_register(rfk);
+	if (ret)
+		goto err_rfkill;
+
+	platform_set_drvdata(pdev, rfk);
+
+	return 0;
 
-	return device_create_file(&pdev->dev, &dev_attr_enable);
+err_rfkill:
+	rfkill_destroy(rfk);
+err_rfk_alloc:
+	return ret;
 }
 
 static int h1940bt_remove(struct platform_device *pdev)
 {
-#ifdef CONFIG_LEDS_H1940
-	led_trigger_unregister_simple(bt_led_trigger);
-#endif
+	struct rfkill *rfk = platform_get_drvdata(pdev);
+
+	platform_set_drvdata(pdev, NULL);
+
+	if (rfk) {
+		rfkill_unregister(rfk);
+		rfkill_destroy(rfk);
+	}
+	rfk = NULL;
+
+	h1940bt_enable(0);
+
 	return 0;
 }
 

-- 
