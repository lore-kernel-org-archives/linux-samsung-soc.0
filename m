From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: SAMSUNG: Clean up platform header files
Date: Fri, 27 Dec 2013 14:15:42 +0530
Message-ID: <1388133942-31879-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:53443 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754066Ab3L0ItO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Dec 2013 03:49:14 -0500
Received: by mail-pd0-f177.google.com with SMTP id q10so8804145pdj.36
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Dec 2013 00:49:13 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Commit 436d42c61c3e ("ARM: samsung: move platform_data definitions")
moved the files to the current location but forgot to remove the pointer
to its previous location. Clean it up. While at it also change the header
file protection macros appropriately.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 include/linux/platform_data/asoc-s3c.h            |    3 +--
 include/linux/platform_data/asoc-s3c24xx_simtec.h |    3 +--
 include/linux/platform_data/ata-samsung_cf.h      |    9 ++++-----
 include/linux/platform_data/i2c-s3c2410.h         |    9 ++++-----
 include/linux/platform_data/leds-s3c24xx.h        |    9 ++++-----
 include/linux/platform_data/mmc-s3cmci.h          |    6 +++---
 include/linux/platform_data/mtd-nand-s3c2410.h    |    3 +--
 include/linux/platform_data/spi-s3c64xx.h         |    9 ++++-----
 include/linux/platform_data/touchscreen-s3c2410.h |   17 ++++++++---------
 include/linux/platform_data/usb-ohci-s3c2410.h    |    9 ++++-----
 include/linux/platform_data/usb-s3c2410_udc.h     |    9 ++++-----
 11 files changed, 38 insertions(+), 48 deletions(-)

diff --git a/include/linux/platform_data/asoc-s3c.h b/include/linux/platform_data/asoc-s3c.h
index 9efc04dd255a..709c6f7e2f8c 100644
--- a/include/linux/platform_data/asoc-s3c.h
+++ b/include/linux/platform_data/asoc-s3c.h
@@ -1,5 +1,4 @@
-/* arch/arm/plat-samsung/include/plat/audio.h
- *
+/*
  * Copyright (c) 2009 Samsung Electronics Co. Ltd
  * Author: Jaswinder Singh <jassi.brar@samsung.com>
  *
diff --git a/include/linux/platform_data/asoc-s3c24xx_simtec.h b/include/linux/platform_data/asoc-s3c24xx_simtec.h
index 376af5286a3e..d220e54123aa 100644
--- a/include/linux/platform_data/asoc-s3c24xx_simtec.h
+++ b/include/linux/platform_data/asoc-s3c24xx_simtec.h
@@ -1,5 +1,4 @@
-/* arch/arm/plat-samsung/include/plat/audio-simtec.h
- *
+/*
  * Copyright 2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
diff --git a/include/linux/platform_data/ata-samsung_cf.h b/include/linux/platform_data/ata-samsung_cf.h
index 2a3855a8372a..01a93509df25 100644
--- a/include/linux/platform_data/ata-samsung_cf.h
+++ b/include/linux/platform_data/ata-samsung_cf.h
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-samsung/include/plat/ata.h
- *
+/*
  * Copyright (c) 2010 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  *
@@ -10,8 +9,8 @@
  * published by the Free Software Foundation.
 */
 
-#ifndef __ASM_PLAT_ATA_H
-#define __ASM_PLAT_ATA_H __FILE__
+#ifndef __ATA_SAMSUNG_CF_ATA_H
+#define __ATA_SAMSUNG_CF_ATA_H
 
 /**
  * struct s3c_ide_platdata - S3C IDE driver platform data.
@@ -33,4 +32,4 @@ extern void s3c64xx_ide_setup_gpio(void);
 extern void s5pc100_ide_setup_gpio(void);
 extern void s5pv210_ide_setup_gpio(void);
 
-#endif /*__ASM_PLAT_ATA_H */
+#endif /* __ATA_SAMSUNG_CF_ATA_H */
diff --git a/include/linux/platform_data/i2c-s3c2410.h b/include/linux/platform_data/i2c-s3c2410.h
index 2a50048c1c44..bd55054c51c9 100644
--- a/include/linux/platform_data/i2c-s3c2410.h
+++ b/include/linux/platform_data/i2c-s3c2410.h
@@ -1,5 +1,4 @@
-/* arch/arm/plat-s3c/include/plat/iic.h
- *
+/*
  * Copyright 2004-2009 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
@@ -10,8 +9,8 @@
  * published by the Free Software Foundation.
 */
 
-#ifndef __ASM_ARCH_IIC_H
-#define __ASM_ARCH_IIC_H __FILE__
+#ifndef __I2C_S3C2410_H
+#define __I2C_S3C2410_H
 
 #define S3C_IICFLG_FILTER	(1<<0)	/* enable s3c2440 filter */
 
@@ -76,4 +75,4 @@ extern void s3c_i2c7_cfg_gpio(struct platform_device *dev);
 
 extern struct s3c2410_platform_i2c default_i2c_data;
 
-#endif /* __ASM_ARCH_IIC_H */
+#endif /* __I2C_S3C2410_H */
diff --git a/include/linux/platform_data/leds-s3c24xx.h b/include/linux/platform_data/leds-s3c24xx.h
index d8a7672519b6..441a6f290649 100644
--- a/include/linux/platform_data/leds-s3c24xx.h
+++ b/include/linux/platform_data/leds-s3c24xx.h
@@ -1,5 +1,4 @@
-/* arch/arm/mach-s3c2410/include/mach/leds-gpio.h
- *
+/*
  * Copyright (c) 2006 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
@@ -11,8 +10,8 @@
  * published by the Free Software Foundation.
 */
 
-#ifndef __ASM_ARCH_LEDSGPIO_H
-#define __ASM_ARCH_LEDSGPIO_H "leds-gpio.h"
+#ifndef __LEDS_S3C24XX_H
+#define __LEDS_S3C24XX_H
 
 #define S3C24XX_LEDF_ACTLOW	(1<<0)		/* LED is on when GPIO low */
 #define S3C24XX_LEDF_TRISTATE	(1<<1)		/* tristate to turn off */
@@ -25,4 +24,4 @@ struct s3c24xx_led_platdata {
 	char			*def_trigger;
 };
 
-#endif /* __ASM_ARCH_LEDSGPIO_H */
+#endif /* __LEDS_S3C24XX_H */
diff --git a/include/linux/platform_data/mmc-s3cmci.h b/include/linux/platform_data/mmc-s3cmci.h
index c42d31711944..c2b8fa6401ee 100644
--- a/include/linux/platform_data/mmc-s3cmci.h
+++ b/include/linux/platform_data/mmc-s3cmci.h
@@ -1,5 +1,5 @@
-#ifndef _ARCH_MCI_H
-#define _ARCH_MCI_H
+#ifndef __MMC_S3CMCI_H
+#define __MMC_S3CMCI_H
 
 /**
  * struct s3c24xx_mci_pdata - sd/mmc controller platform data
@@ -49,4 +49,4 @@ struct s3c24xx_mci_pdata {
  */
 extern void s3c24xx_mci_set_platdata(struct s3c24xx_mci_pdata *pdata);
 
-#endif /* _ARCH_NCI_H */
+#endif /* __MMC_S3CMCI_H */
diff --git a/include/linux/platform_data/mtd-nand-s3c2410.h b/include/linux/platform_data/mtd-nand-s3c2410.h
index b64115fa93a4..4ed02edfd79f 100644
--- a/include/linux/platform_data/mtd-nand-s3c2410.h
+++ b/include/linux/platform_data/mtd-nand-s3c2410.h
@@ -1,5 +1,4 @@
-/* arch/arm/mach-s3c2410/include/mach/nand.h
- *
+/*
  * Copyright (c) 2004 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
diff --git a/include/linux/platform_data/spi-s3c64xx.h b/include/linux/platform_data/spi-s3c64xx.h
index 8447f634c7f5..00fea87996b1 100644
--- a/include/linux/platform_data/spi-s3c64xx.h
+++ b/include/linux/platform_data/spi-s3c64xx.h
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
- *
+/*
  * Copyright (C) 2009 Samsung Electronics Ltd.
  *	Jaswinder Singh <jassi.brar@samsung.com>
  *
@@ -8,8 +7,8 @@
  * published by the Free Software Foundation.
  */
 
-#ifndef __S3C64XX_PLAT_SPI_H
-#define __S3C64XX_PLAT_SPI_H
+#ifndef __SPI_S3C64XX_H
+#define __SPI_S3C64XX_H
 
 #include <linux/dmaengine.h>
 
@@ -68,4 +67,4 @@ extern int s3c64xx_spi2_cfg_gpio(void);
 extern struct s3c64xx_spi_info s3c64xx_spi0_pdata;
 extern struct s3c64xx_spi_info s3c64xx_spi1_pdata;
 extern struct s3c64xx_spi_info s3c64xx_spi2_pdata;
-#endif /* __S3C64XX_PLAT_SPI_H */
+#endif /* __SPI_S3C64XX_H */
diff --git a/include/linux/platform_data/touchscreen-s3c2410.h b/include/linux/platform_data/touchscreen-s3c2410.h
index 26fdb22e0fc2..f94126f9cad5 100644
--- a/include/linux/platform_data/touchscreen-s3c2410.h
+++ b/include/linux/platform_data/touchscreen-s3c2410.h
@@ -1,5 +1,4 @@
-/* arch/arm/plat-samsung/include/plat/ts.h
- *
+/*
  * Copyright (c) 2005 Arnaud Patard <arnaud.patard@rtp-net.org>
  *
  * This program is free software; you can redistribute it and/or modify
@@ -7,14 +6,14 @@
  * published by the Free Software Foundation.
 */
 
-#ifndef __ASM_ARM_TS_H
-#define __ASM_ARM_TS_H
+#ifndef __TOUCHSCREEN_S3C2410_H
+#define __TOUCHSCREEN_S3C2410_H
 
 struct s3c2410_ts_mach_info {
-       int             delay;
-       int             presc;
-       int             oversampling_shift;
-	void    (*cfg_gpio)(struct platform_device *dev);
+	int delay;
+	int presc;
+	int oversampling_shift;
+	void (*cfg_gpio)(struct platform_device *dev);
 };
 
 extern void s3c24xx_ts_set_platdata(struct s3c2410_ts_mach_info *);
@@ -22,4 +21,4 @@ extern void s3c24xx_ts_set_platdata(struct s3c2410_ts_mach_info *);
 /* defined by architecture to configure gpio */
 extern void s3c24xx_ts_cfg_gpio(struct platform_device *dev);
 
-#endif /* __ASM_ARM_TS_H */
+#endif /* __TOUCHSCREEN_S3C2410_H */
diff --git a/include/linux/platform_data/usb-ohci-s3c2410.h b/include/linux/platform_data/usb-ohci-s3c2410.h
index 7fa1fbefc3f2..65bae080f80e 100644
--- a/include/linux/platform_data/usb-ohci-s3c2410.h
+++ b/include/linux/platform_data/usb-ohci-s3c2410.h
@@ -1,5 +1,4 @@
-/* arch/arm/plat-samsung/include/plat/usb-control.h
- *
+/*
  * Copyright (c) 2004 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
@@ -10,8 +9,8 @@
  * published by the Free Software Foundation.
 */
 
-#ifndef __ASM_ARCH_USBCONTROL_H
-#define __ASM_ARCH_USBCONTROL_H
+#ifndef __USB_OHCI_S3C2410_H
+#define __USB_OHCI_S3C2410_H
 
 #define S3C_HCDFLG_USED	(1)
 
@@ -40,4 +39,4 @@ static void inline s3c2410_usb_report_oc(struct s3c2410_hcd_info *info, int port
 
 extern void s3c_ohci_set_platdata(struct s3c2410_hcd_info *info);
 
-#endif /*__ASM_ARCH_USBCONTROL_H */
+#endif /*__USB_OHCI_S3C2410_H */
diff --git a/include/linux/platform_data/usb-s3c2410_udc.h b/include/linux/platform_data/usb-s3c2410_udc.h
index de8e2288a509..f042114d32bd 100644
--- a/include/linux/platform_data/usb-s3c2410_udc.h
+++ b/include/linux/platform_data/usb-s3c2410_udc.h
@@ -1,5 +1,4 @@
-/* arch/arm/plat-samsung/include/plat/udc.h
- *
+/*
  * Copyright (c) 2005 Arnaud Patard <arnaud.patard@rtp-net.org>
  *
  *
@@ -15,8 +14,8 @@
  *	18-Jan-2007	HMW	Add per-platform vbus_draw function
 */
 
-#ifndef __ASM_ARM_ARCH_UDC_H
-#define __ASM_ARM_ARCH_UDC_H
+#ifndef __USB_S3C2410_UDC_H
+#define __USB_S3C2410_UDC_H
 
 enum s3c2410_udc_cmd_e {
 	S3C2410_UDC_P_ENABLE	= 1,	/* Pull-up enable        */
@@ -41,4 +40,4 @@ struct s3c24xx_hsudc_platdata;
 
 extern void __init s3c24xx_hsudc_set_platdata(struct s3c24xx_hsudc_platdata *pd);
 
-#endif /* __ASM_ARM_ARCH_UDC_H */
+#endif /* __USB_S3C2410_UDC_H */
-- 
1.7.9.5
