From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V2 7/7] ARM: S5P6450: Enable LCD-LTE480 and Framebuffer support
Date: Mon, 25 Jul 2011 16:00:25 -0400
Message-ID: <1311624025-2643-8-git-send-email-ajaykumar.rs@samsung.com>
References: <1311624025-2643-1-git-send-email-ajaykumar.rs@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:20892 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752048Ab1GYOJD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2011 10:09:03 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOW000A67B0RIF0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 23:09:02 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOW00ITF7ANNI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 23:09:02 +0900 (KST)
In-reply-to: <1311624025-2643-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jg1.han@samsung.com, m.szyprowski@samsung.com

This patch enables s3c-fb support and platform-lcd support for SMDK6450.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/mach-s5p64x0/Kconfig         |    3 +++
 arch/arm/mach-s5p64x0/mach-smdk6450.c |    5 +++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/Kconfig b/arch/arm/mach-s5p64x0/Kconfig
index 0596673..620e6af 100644
--- a/arch/arm/mach-s5p64x0/Kconfig
+++ b/arch/arm/mach-s5p64x0/Kconfig
@@ -60,6 +60,7 @@ config MACH_SMDK6440
 config MACH_SMDK6450
 	bool "SMDK6450"
 	select CPU_S5P6450
+	select S3C_DEV_FB
 	select S3C_DEV_I2C1
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
@@ -68,7 +69,9 @@ config MACH_SMDK6450
 	select SAMSUNG_DEV_BACKLIGHT
 	select SAMSUNG_DEV_PWM
 	select SAMSUNG_DEV_TS
+	select S5P64X0_SETUP_FB
 	select S5P64X0_SETUP_I2C1
+	select COMMON_FB
 	help
 	  Machine support for the Samsung SMDK6450
 
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6450.c b/arch/arm/mach-s5p64x0/mach-smdk6450.c
index 33f2adf..8108963 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6450.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6450.c
@@ -34,6 +34,7 @@
 #include <mach/regs-clock.h>
 #include <mach/i2c.h>
 #include <mach/regs-gpio.h>
+#include <mach/common-fb.h>
 
 #include <plat/regs-serial.h>
 #include <plat/gpio-cfg.h>
@@ -119,6 +120,8 @@ static struct platform_device *smdk6450_devices[] __initdata = {
 	&s3c_device_wdt,
 	&samsung_asoc_dma,
 	&s5p6450_device_iis0,
+	&s3c_device_fb,
+	&smdk64x0_lcd_lte480wv,
 	/* s5p6450_device_spi0 will be added */
 };
 
@@ -184,6 +187,8 @@ static void __init smdk6450_machine_init(void)
 			ARRAY_SIZE(smdk6450_i2c_devs1));
 
 	samsung_bl_set(&smdk6450_bl_gpio_info, &smdk6450_bl_data);
+	s3c_fb_set_platdata(&smdk64x0_lcd_pdata);
+	s5p64x0_fb_init(S5P64X0_SPCON0_LCD_SEL_RGB);
 
 	platform_add_devices(smdk6450_devices, ARRAY_SIZE(smdk6450_devices));
 }
-- 
1.7.0.4
