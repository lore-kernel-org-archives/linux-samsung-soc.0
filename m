Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE16ECAAD3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  1 Sep 2022 08:18:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234102AbiIAIS6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 1 Sep 2022 04:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234039AbiIAIS4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Sep 2022 04:18:56 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E734FD86C0
        for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Sep 2022 01:18:54 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id v26so13072264lfd.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Sep 2022 01:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=c98RAKfMabMzBoRjuo3V1IGSVItU/Y9QhNP63MxBmtE=;
        b=tyV8qoG/xlaDf6/9h1JkXXNbypSpBBQr2Y+vgBpDs9TUToAwh8wS9jOnREb5Uy/ZyQ
         G1fdZ3qYe+dyvSJrgj+9sbRE86Vfusre+kKLA0N0aS+tj4DisU+atfKro8i1MrB1RO7D
         60UZb7br6d66YL/jVZEzw9R4skzGBnA0TpVxvThsYHg/1QcyJGaTHBaORYD19JbGhTqt
         oNhvXLcP88XzJOBNfJxxVmeVPHRlGSAp3QfMyt2YDi3ggs1cjA94/TkvT8Iz83CQmEQK
         QVdRCHS3oat3NWbmiOPMrjqzdMKxeeBOygLV5yH5UrtauyVNRzNgeDa2XHTciOaHoPF7
         34fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=c98RAKfMabMzBoRjuo3V1IGSVItU/Y9QhNP63MxBmtE=;
        b=voUanoP6itHTUFuZxPzDmEHBrI8LeDi0Os7CE4TkYGJ++IHJo7ZygukBCb946dhuZ7
         jxhueUw0r4jw4DybGlLzylQbeUheM91vmZbwVkupwActfAxT87LEE3JChCrr4FMgCzn6
         CfKtObAlFX4tcxgu3ak27TSPKcEBtTba5nGsDNyhFdKx1RPaswA14DkOzcet/2Mq8eGI
         JHT3jFkjD8pAUl7GXP4f0jum9sHzlw6JXX+9p5/13NkvgQTVsaCbQWlnzSj9F/r6lLoD
         zb7O8xfOllJztgx4eewExUN7Wv/UyXiQS924FsAMvNO4cbwpLWx3OJKrw0bALVtnOHj6
         cIGA==
X-Gm-Message-State: ACgBeo3MKxWuY5VlKiEhrWr8dY2wKKXCxxmbvrVuldbuwGT/Ay/3UnoC
        SDklYc0+2LrYaBPfAp+1/EoAVX1KvDw9ww==
X-Google-Smtp-Source: AA6agR7tIh+5P+WiHlnNyeZ+QFgeYB/tHYwmGPTc4MUeNGInFiaHaPF5dctPD3WSAn9Vun010XHLmw==
X-Received: by 2002:a05:6512:3408:b0:494:9aa0:b3b6 with SMTP id i8-20020a056512340800b004949aa0b3b6mr731595lfr.318.1662020333264;
        Thu, 01 Sep 2022 01:18:53 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id p5-20020a2e9a85000000b0025e4c49969fsm1512048lji.98.2022.09.01.01.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 01:18:52 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH] USB/ARM: Switch S3C2410 UDC to GPIO descriptors
Date:   Thu,  1 Sep 2022 10:16:49 +0200
Message-Id: <20220901081649.564348-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This converts the S3C2410 UDC USB device controller to use
GPIO descriptor tables and modern GPIO.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
If the Samsung S3C maintainers can ACK this I think it's
best to take it into the USB tree where the bigger changes
are.
---
 arch/arm/mach-s3c/mach-gta02.c                | 10 ++-
 arch/arm/mach-s3c/mach-h1940.c                | 13 +++-
 arch/arm/mach-s3c/mach-jive.c                 | 10 ++-
 arch/arm/mach-s3c/mach-mini2440.c             |  9 ++-
 arch/arm/mach-s3c/mach-n30.c                  | 13 +++-
 arch/arm/mach-s3c/mach-rx1950.c               | 13 +++-
 arch/arm/mach-s3c/mach-smdk2413.c             | 12 ++-
 drivers/usb/gadget/udc/s3c2410_udc.c          | 78 ++++++++-----------
 drivers/usb/gadget/udc/s3c2410_udc.h          |  3 +
 include/linux/platform_data/usb-s3c2410_udc.h |  6 --
 10 files changed, 100 insertions(+), 67 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-gta02.c b/arch/arm/mach-s3c/mach-gta02.c
index abfdce765525..d50a81d85ae1 100644
--- a/arch/arm/mach-s3c/mach-gta02.c
+++ b/arch/arm/mach-s3c/mach-gta02.c
@@ -421,7 +421,14 @@ static struct s3c2410_platform_nand __initdata gta02_nand_info = {
 /* Get PMU to set USB current limit accordingly. */
 static struct s3c2410_udc_mach_info gta02_udc_cfg __initdata = {
 	.vbus_draw	= gta02_udc_vbus_draw,
-	.pullup_pin = GTA02_GPIO_USB_PULLUP,
+};
+
+static struct gpiod_lookup_table gta02_udc_gpio_table = {
+	.dev_id = "s3c2410-usbgadget",
+	.table = {
+		GPIO_LOOKUP("GPIOB", 9, "pullup", GPIO_ACTIVE_HIGH),
+		{ },
+	},
 };
 
 /* USB */
@@ -555,6 +562,7 @@ static void __init gta02_machine_init(void)
 	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
 			      S3C_GPIO_PULL_NONE);
 
+	gpiod_add_lookup_table(&gta02_udc_gpio_table);
 	gpiod_add_lookup_table(&gta02_audio_gpio_table);
 	gpiod_add_lookup_table(&gta02_mmc_gpio_table);
 	platform_add_devices(gta02_devices, ARRAY_SIZE(gta02_devices));
diff --git a/arch/arm/mach-s3c/mach-h1940.c b/arch/arm/mach-s3c/mach-h1940.c
index 032b18837855..83ac6cfdb1d8 100644
--- a/arch/arm/mach-s3c/mach-h1940.c
+++ b/arch/arm/mach-s3c/mach-h1940.c
@@ -167,9 +167,15 @@ static struct gpio_chip h1940_latch_gpiochip = {
 };
 
 static struct s3c2410_udc_mach_info h1940_udc_cfg __initdata = {
-	.vbus_pin		= S3C2410_GPG(5),
-	.vbus_pin_inverted	= 1,
-	.pullup_pin		= H1940_LATCH_USB_DP,
+};
+
+static struct gpiod_lookup_table h1940_udc_gpio_table = {
+	.dev_id = "s3c2410-usbgadget",
+	.table = {
+		GPIO_LOOKUP("GPIOG", 5, "vbus", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("H1940_LATCH", 7, "pullup", GPIO_ACTIVE_HIGH),
+		{ },
+	},
 };
 
 static struct s3c2410_ts_mach_info h1940_ts_cfg __initdata = {
@@ -725,6 +731,7 @@ static void __init h1940_init(void)
 	u32 tmp;
 
 	s3c24xx_fb_set_platdata(&h1940_fb_info);
+	gpiod_add_lookup_table(&h1940_udc_gpio_table);
 	gpiod_add_lookup_table(&h1940_mmc_gpio_table);
 	gpiod_add_lookup_table(&h1940_audio_gpio_table);
 	gpiod_add_lookup_table(&h1940_bat_gpio_table);
diff --git a/arch/arm/mach-s3c/mach-jive.c b/arch/arm/mach-s3c/mach-jive.c
index e32773175944..16859bb3bb13 100644
--- a/arch/arm/mach-s3c/mach-jive.c
+++ b/arch/arm/mach-s3c/mach-jive.c
@@ -493,7 +493,14 @@ static struct platform_device *jive_devices[] __initdata = {
 };
 
 static struct s3c2410_udc_mach_info jive_udc_cfg __initdata = {
-	.vbus_pin	= S3C2410_GPG(1),		/* detect is on GPG1 */
+};
+
+static struct gpiod_lookup_table jive_udc_gpio_table = {
+	.dev_id = "s3c2410-usbgadget",
+	.table = {
+		GPIO_LOOKUP("GPIOG", 1, "vbus", GPIO_ACTIVE_HIGH),
+		{ },
+	},
 };
 
 /* Jive power management device */
@@ -669,6 +676,7 @@ static void __init jive_machine_init(void)
 
 	pm_power_off = jive_power_off;
 
+	gpiod_add_lookup_table(&jive_udc_gpio_table);
 	gpiod_add_lookup_table(&jive_lcdspi_gpiod_table);
 	gpiod_add_lookup_table(&jive_wm8750_gpiod_table);
 	platform_add_devices(jive_devices, ARRAY_SIZE(jive_devices));
diff --git a/arch/arm/mach-s3c/mach-mini2440.c b/arch/arm/mach-s3c/mach-mini2440.c
index a6d17ffcdba1..283be70ca622 100644
--- a/arch/arm/mach-s3c/mach-mini2440.c
+++ b/arch/arm/mach-s3c/mach-mini2440.c
@@ -93,9 +93,15 @@ static struct s3c2410_uartcfg mini2440_uartcfgs[] __initdata = {
 /* USB device UDC support */
 
 static struct s3c2410_udc_mach_info mini2440_udc_cfg __initdata = {
-	.pullup_pin = S3C2410_GPC(5),
 };
 
+static struct gpiod_lookup_table mini2440_udc_gpio_table = {
+	.dev_id = "s3c2410-usbgadget",
+	.table = {
+		GPIO_LOOKUP("GPIOC", 5, "pullup", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
 
 /* LCD timing and setup */
 
@@ -755,6 +761,7 @@ static void __init mini2440_init(void)
 		s3c24xx_fb_set_platdata(&mini2440_fb_info);
 	}
 
+	gpiod_add_lookup_table(&mini2440_udc_gpio_table);
 	s3c24xx_udc_set_platdata(&mini2440_udc_cfg);
 	gpiod_add_lookup_table(&mini2440_mmc_gpio_table);
 	s3c24xx_mci_set_platdata(&mini2440_mmc_cfg);
diff --git a/arch/arm/mach-s3c/mach-n30.c b/arch/arm/mach-s3c/mach-n30.c
index 75f5dc6351a1..90122fc6b2aa 100644
--- a/arch/arm/mach-s3c/mach-n30.c
+++ b/arch/arm/mach-s3c/mach-n30.c
@@ -84,9 +84,15 @@ static struct s3c2410_uartcfg n30_uartcfgs[] = {
 };
 
 static struct s3c2410_udc_mach_info n30_udc_cfg __initdata = {
-	.vbus_pin		= S3C2410_GPG(1),
-	.vbus_pin_inverted	= 0,
-	.pullup_pin		= S3C2410_GPB(3),
+};
+
+static struct gpiod_lookup_table n30_udc_gpio_table = {
+	.dev_id = "s3c2410-usbgadget",
+	.table = {
+		GPIO_LOOKUP("GPIOG", 1, "vbus", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("GPIOB", 3, "pullup", GPIO_ACTIVE_HIGH),
+		{ },
+	},
 };
 
 static struct gpio_keys_button n30_buttons[] = {
@@ -595,6 +601,7 @@ static void __init n30_init(void)
 	WARN_ON(gpio_request(S3C2410_GPG(4), "mmc power"));
 
 	s3c24xx_fb_set_platdata(&n30_fb_info);
+	gpiod_add_lookup_table(&n30_udc_gpio_table);
 	s3c24xx_udc_set_platdata(&n30_udc_cfg);
 	gpiod_add_lookup_table(&n30_mci_gpio_table);
 	s3c24xx_mci_set_platdata(&n30_mci_cfg);
diff --git a/arch/arm/mach-s3c/mach-rx1950.c b/arch/arm/mach-s3c/mach-rx1950.c
index 7a3e7c0a6484..d8c49e562660 100644
--- a/arch/arm/mach-s3c/mach-rx1950.c
+++ b/arch/arm/mach-s3c/mach-rx1950.c
@@ -643,9 +643,15 @@ static struct s3c2410_platform_nand rx1950_nand_info = {
 };
 
 static struct s3c2410_udc_mach_info rx1950_udc_cfg __initdata = {
-	.vbus_pin = S3C2410_GPG(5),
-	.vbus_pin_inverted = 1,
-	.pullup_pin = S3C2410_GPJ(5),
+};
+
+static struct gpiod_lookup_table rx1950_udc_gpio_table = {
+	.dev_id = "s3c2410-usbgadget",
+	.table = {
+		GPIO_LOOKUP("GPIOG", 5, "vbus", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("GPIOJ", 5, "pullup", GPIO_ACTIVE_HIGH),
+		{ },
+	},
 };
 
 static struct s3c2410_ts_mach_info rx1950_ts_cfg __initdata = {
@@ -847,6 +853,7 @@ static void __init rx1950_init_machine(void)
 	gpio_direction_output(S3C2410_GPJ(6), 0);
 
 	pwm_add_table(rx1950_pwm_lookup, ARRAY_SIZE(rx1950_pwm_lookup));
+	gpiod_add_lookup_table(&rx1950_udc_gpio_table);
 	gpiod_add_lookup_table(&rx1950_audio_gpio_table);
 	gpiod_add_lookup_table(&rx1950_bat_gpio_table);
 	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
diff --git a/arch/arm/mach-s3c/mach-smdk2413.c b/arch/arm/mach-s3c/mach-smdk2413.c
index f1f0ec174579..2b4e20aaa346 100644
--- a/arch/arm/mach-s3c/mach-smdk2413.c
+++ b/arch/arm/mach-s3c/mach-smdk2413.c
@@ -12,7 +12,7 @@
 #include <linux/list.h>
 #include <linux/timer.h>
 #include <linux/init.h>
-#include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/serial_core.h>
 #include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
@@ -74,9 +74,15 @@ static struct s3c2410_uartcfg smdk2413_uartcfgs[] __initdata = {
 
 
 static struct s3c2410_udc_mach_info smdk2413_udc_cfg __initdata = {
-	.pullup_pin = S3C2410_GPF(2),
 };
 
+static struct gpiod_lookup_table smdk2413_udc_gpio_table = {
+	.dev_id = "s3c2410-usbgadget",
+	.table = {
+		GPIO_LOOKUP("GPIOF", 2, "pullup", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
 
 static struct platform_device *smdk2413_devices[] __initdata = {
 	&s3c_device_ohci,
@@ -115,7 +121,7 @@ static void __init smdk2413_machine_init(void)
 			      S3C2410_MISCCR_USBSUSPND0 |
 			      S3C2410_MISCCR_USBSUSPND1, 0x0);
 
-
+	gpiod_add_lookup_table(&smdk2413_udc_gpio_table);
  	s3c24xx_udc_set_platdata(&smdk2413_udc_cfg);
 	s3c_i2c0_set_platdata(NULL);
 	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
diff --git a/drivers/usb/gadget/udc/s3c2410_udc.c b/drivers/usb/gadget/udc/s3c2410_udc.c
index c6625aeb7bca..8c57b191e52b 100644
--- a/drivers/usb/gadget/udc/s3c2410_udc.c
+++ b/drivers/usb/gadget/udc/s3c2410_udc.c
@@ -23,7 +23,7 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/prefetch.h>
 #include <linux/io.h>
 
@@ -1419,8 +1419,7 @@ static int s3c2410_udc_set_pullup(struct s3c2410_udc *udc, int is_on)
 {
 	dprintk(DEBUG_NORMAL, "%s()\n", __func__);
 
-	if (udc_info && (udc_info->udc_command ||
-		gpio_is_valid(udc_info->pullup_pin))) {
+	if (udc_info && (udc_info->udc_command || udc->pullup_gpiod)) {
 
 		if (is_on)
 			s3c2410_udc_enable(udc);
@@ -1467,9 +1466,7 @@ static irqreturn_t s3c2410_udc_vbus_irq(int irq, void *_dev)
 
 	dprintk(DEBUG_NORMAL, "%s()\n", __func__);
 
-	value = gpio_get_value(udc_info->vbus_pin) ? 1 : 0;
-	if (udc_info->vbus_pin_inverted)
-		value = !value;
+	value = gpiod_get_value(dev->vbus_gpiod);
 
 	if (value != dev->vbus)
 		s3c2410_udc_vbus_session(&dev->gadget, value);
@@ -1504,14 +1501,15 @@ static const struct usb_gadget_ops s3c2410_ops = {
 	.udc_stop		= s3c2410_udc_stop,
 };
 
-static void s3c2410_udc_command(enum s3c2410_udc_cmd_e cmd)
+static void s3c2410_udc_command(struct s3c2410_udc *udc,
+				enum s3c2410_udc_cmd_e cmd)
 {
 	if (!udc_info)
 		return;
 
 	if (udc_info->udc_command) {
 		udc_info->udc_command(cmd);
-	} else if (gpio_is_valid(udc_info->pullup_pin)) {
+	} else if (udc->pullup_gpiod) {
 		int value;
 
 		switch (cmd) {
@@ -1524,9 +1522,8 @@ static void s3c2410_udc_command(enum s3c2410_udc_cmd_e cmd)
 		default:
 			return;
 		}
-		value ^= udc_info->pullup_pin_inverted;
 
-		gpio_set_value(udc_info->pullup_pin, value);
+		gpiod_set_value(udc->pullup_gpiod, value);
 	}
 }
 
@@ -1551,7 +1548,7 @@ static void s3c2410_udc_disable(struct s3c2410_udc *dev)
 	udc_write(0x1F, S3C2410_UDC_EP_INT_REG);
 
 	/* Good bye, cruel world */
-	s3c2410_udc_command(S3C2410_UDC_P_DISABLE);
+	s3c2410_udc_command(dev, S3C2410_UDC_P_DISABLE);
 
 	/* Set speed to unknown */
 	dev->gadget.speed = USB_SPEED_UNKNOWN;
@@ -1613,7 +1610,7 @@ static void s3c2410_udc_enable(struct s3c2410_udc *dev)
 	udc_write(S3C2410_UDC_INT_EP0, S3C2410_UDC_EP_INT_EN_REG);
 
 	/* time to say "hello, world" */
-	s3c2410_udc_command(S3C2410_UDC_P_ENABLE);
+	s3c2410_udc_command(dev, S3C2410_UDC_P_ENABLE);
 }
 
 static int s3c2410_udc_start(struct usb_gadget *g,
@@ -1802,14 +1799,15 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 
 	dev_dbg(dev, "got irq %i\n", irq_usbd);
 
-	if (udc_info && udc_info->vbus_pin > 0) {
-		retval = gpio_request(udc_info->vbus_pin, "udc vbus");
-		if (retval < 0) {
-			dev_err(dev, "cannot claim vbus pin\n");
-			goto err_int;
-		}
+	udc->vbus_gpiod = gpiod_get_optional(dev, "vbus", GPIOD_IN);
+	if (IS_ERR(udc->vbus_gpiod)) {
+		retval = PTR_ERR(udc->vbus_gpiod);
+		goto err_int;
+	}
+	if (udc->vbus_gpiod) {
+		gpiod_set_consumer_name(udc->vbus_gpiod, "udc vbus");
 
-		irq = gpio_to_irq(udc_info->vbus_pin);
+		irq = gpiod_to_irq(udc->vbus_gpiod);
 		if (irq < 0) {
 			dev_err(dev, "no irq for gpio vbus pin\n");
 			retval = irq;
@@ -1833,16 +1831,12 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 		udc->vbus = 1;
 	}
 
-	if (udc_info && !udc_info->udc_command &&
-		gpio_is_valid(udc_info->pullup_pin)) {
-
-		retval = gpio_request_one(udc_info->pullup_pin,
-				udc_info->vbus_pin_inverted ?
-				GPIOF_OUT_INIT_HIGH : GPIOF_OUT_INIT_LOW,
-				"udc pullup");
-		if (retval)
-			goto err_vbus_irq;
+	udc->pullup_gpiod = gpiod_get_optional(dev, "pullup", GPIOD_OUT_LOW);
+	if (IS_ERR(udc->pullup_gpiod)) {
+		retval = PTR_ERR(udc->pullup_gpiod);
+		goto err_vbus_irq;
 	}
+	gpiod_set_consumer_name(udc->pullup_gpiod, "udc pullup");
 
 	retval = usb_add_gadget_udc(&pdev->dev, &udc->gadget);
 	if (retval)
@@ -1856,15 +1850,10 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 	return 0;
 
 err_add_udc:
-	if (udc_info && !udc_info->udc_command &&
-			gpio_is_valid(udc_info->pullup_pin))
-		gpio_free(udc_info->pullup_pin);
 err_vbus_irq:
-	if (udc_info && udc_info->vbus_pin > 0)
-		free_irq(gpio_to_irq(udc_info->vbus_pin), udc);
+	if (udc->vbus_gpiod)
+		free_irq(gpiod_to_irq(udc->vbus_gpiod), udc);
 err_gpio_claim:
-	if (udc_info && udc_info->vbus_pin > 0)
-		gpio_free(udc_info->vbus_pin);
 err_int:
 	free_irq(irq_usbd, udc);
 err_udc_clk:
@@ -1885,7 +1874,6 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 static int s3c2410_udc_remove(struct platform_device *pdev)
 {
 	struct s3c2410_udc *udc = platform_get_drvdata(pdev);
-	unsigned int irq;
 
 	dev_dbg(&pdev->dev, "%s()\n", __func__);
 
@@ -1895,14 +1883,8 @@ static int s3c2410_udc_remove(struct platform_device *pdev)
 	usb_del_gadget_udc(&udc->gadget);
 	debugfs_remove(debugfs_lookup("registers", s3c2410_udc_debugfs_root));
 
-	if (udc_info && !udc_info->udc_command &&
-		gpio_is_valid(udc_info->pullup_pin))
-		gpio_free(udc_info->pullup_pin);
-
-	if (udc_info && udc_info->vbus_pin > 0) {
-		irq = gpio_to_irq(udc_info->vbus_pin);
-		free_irq(irq, udc);
-	}
+	if (udc->vbus_gpiod)
+		free_irq(gpiod_to_irq(udc->vbus_gpiod), udc);
 
 	free_irq(irq_usbd, udc);
 
@@ -1926,14 +1908,18 @@ static int s3c2410_udc_remove(struct platform_device *pdev)
 static int
 s3c2410_udc_suspend(struct platform_device *pdev, pm_message_t message)
 {
-	s3c2410_udc_command(S3C2410_UDC_P_DISABLE);
+	struct s3c2410_udc *udc = platform_get_drvdata(pdev);
+
+	s3c2410_udc_command(udc, S3C2410_UDC_P_DISABLE);
 
 	return 0;
 }
 
 static int s3c2410_udc_resume(struct platform_device *pdev)
 {
-	s3c2410_udc_command(S3C2410_UDC_P_ENABLE);
+	struct s3c2410_udc *udc = platform_get_drvdata(pdev);
+
+	s3c2410_udc_command(udc, S3C2410_UDC_P_ENABLE);
 
 	return 0;
 }
diff --git a/drivers/usb/gadget/udc/s3c2410_udc.h b/drivers/usb/gadget/udc/s3c2410_udc.h
index 135a5bff3c74..cdbf202e5ee8 100644
--- a/drivers/usb/gadget/udc/s3c2410_udc.h
+++ b/drivers/usb/gadget/udc/s3c2410_udc.h
@@ -83,6 +83,9 @@ struct s3c2410_udc {
 	u32				port_status;
 	int				ep0state;
 
+	struct gpio_desc		*vbus_gpiod;
+	struct gpio_desc		*pullup_gpiod;
+
 	unsigned			got_irq : 1;
 
 	unsigned			req_std : 1;
diff --git a/include/linux/platform_data/usb-s3c2410_udc.h b/include/linux/platform_data/usb-s3c2410_udc.h
index 07394819d03b..c0fbe1fe3426 100644
--- a/include/linux/platform_data/usb-s3c2410_udc.h
+++ b/include/linux/platform_data/usb-s3c2410_udc.h
@@ -22,12 +22,6 @@ enum s3c2410_udc_cmd_e {
 struct s3c2410_udc_mach_info {
 	void	(*udc_command)(enum s3c2410_udc_cmd_e);
 	void	(*vbus_draw)(unsigned int ma);
-
-	unsigned int pullup_pin;
-	unsigned int pullup_pin_inverted;
-
-	unsigned int vbus_pin;
-	unsigned char vbus_pin_inverted;
 };
 
 extern void __init s3c24xx_udc_set_platdata(struct s3c2410_udc_mach_info *);
-- 
2.37.2

