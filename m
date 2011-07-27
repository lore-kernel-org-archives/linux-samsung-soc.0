From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V3 4/7] ARM: S5P64X0: Add GPIO and SPCON settings for LCD
Date: Wed, 27 Jul 2011 13:31:15 -0400
Message-ID: <1311787878-16193-5-git-send-email-ajaykumar.rs@samsung.com>
References: <1311787878-16193-1-git-send-email-ajaykumar.rs@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38560 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752435Ab1G0Ljd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2011 07:39:33 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOZ00LYMPPNEJQ0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jul 2011 20:39:32 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOZ0092EPPJ2V@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jul 2011 20:39:32 +0900 (KST)
In-reply-to: <1311787878-16193-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jg1.han@samsung.com, m.szyprowski@samsung.com

This patch adds:
	-- GPIO lines settings(HSYNC, VSYNC, VCLK and VD) for LCD.
	-- Function to select LCD interface (RGB/i80)

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/mach-s5p64x0/Kconfig                  |    6 +++
 arch/arm/mach-s5p64x0/Makefile                 |    1 +
 arch/arm/mach-s5p64x0/include/mach/regs-gpio.h |    4 ++
 arch/arm/mach-s5p64x0/setup-fb.c               |   48 ++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/fb.h        |   14 +++++++
 5 files changed, 73 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5p64x0/setup-fb.c

diff --git a/arch/arm/mach-s5p64x0/Kconfig b/arch/arm/mach-s5p64x0/Kconfig
index 65c7518..4fee745 100644
--- a/arch/arm/mach-s5p64x0/Kconfig
+++ b/arch/arm/mach-s5p64x0/Kconfig
@@ -21,6 +21,12 @@ config CPU_S5P6450
 	help
 	  Enable S5P6450 CPU support
 
+config S5P64X0_SETUP_FB
+	bool
+	help
+	  Common setup code for S5P64X0 based boards with a LCD display
+	  through RGB interface.
+
 config S5P64X0_SETUP_I2C1
 	bool
 	help
diff --git a/arch/arm/mach-s5p64x0/Makefile b/arch/arm/mach-s5p64x0/Makefile
index 5f6afdf..487d179 100644
--- a/arch/arm/mach-s5p64x0/Makefile
+++ b/arch/arm/mach-s5p64x0/Makefile
@@ -28,3 +28,4 @@ obj-y				+= dev-audio.o
 obj-$(CONFIG_S3C64XX_DEV_SPI)	+= dev-spi.o
 
 obj-$(CONFIG_S5P64X0_SETUP_I2C1)	+= setup-i2c1.o
+obj-$(CONFIG_S5P64X0_SETUP_FB)		+= setup-fb.o
diff --git a/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h b/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
index 6ce2547..34d4412 100644
--- a/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
+++ b/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
@@ -44,4 +44,8 @@
 #define S5P64X0_EINT0MASK		(S5P_VA_GPIO + EINT0MASK_OFFSET)
 #define S5P64X0_EINT0PEND		(S5P_VA_GPIO + EINT0PEND_OFFSET)
 
+#define S5P64X0_SPCON0			(S5P_VA_GPIO + 0x1A0)
+#define S5P64X0_SPCON0_LCD_SEL_MASK	(0x3 << 0)
+#define S5P64X0_SPCON0_LCD_SEL_RGB	(0x1 << 0)
+
 #endif /* __ASM_ARCH_REGS_GPIO_H */
diff --git a/arch/arm/mach-s5p64x0/setup-fb.c b/arch/arm/mach-s5p64x0/setup-fb.c
new file mode 100644
index 0000000..0d9903a
--- /dev/null
+++ b/arch/arm/mach-s5p64x0/setup-fb.c
@@ -0,0 +1,48 @@
+/* linux/arch/arm/mach-s5p64x0/setup-fb.c
+ *
+ * Copyright (c) 2011 Samsung Electronics Co., Ltd.
+ *         http://www.samsung.com/
+ *
+ * Base S5P64X0 GPIO setup information for LCD framebuffer
+ *
+ * GPIO settings for LCD on any other board based on s5p64x0
+ * should go in this file.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/fb.h>
+#include <linux/gpio.h>
+
+#include <plat/fb.h>
+#include <plat/gpio-cfg.h>
+
+#include <mach/regs-clock.h>
+#include <mach/regs-gpio.h>
+
+void s5p64x0_fb_init(int lcd_interface_type)
+{
+	unsigned int cfg;
+
+	/* select TFT LCD type (RGB I/F) */
+	cfg = __raw_readl(S5P64X0_SPCON0);
+	cfg &= ~S5P64X0_SPCON0_LCD_SEL_MASK;
+	cfg |= lcd_interface_type;
+	__raw_writel(cfg, S5P64X0_SPCON0);
+}
+
+void s5p64x0_fb_gpio_setup_24bpp(void)
+{
+	unsigned int chipid;
+
+	chipid = __raw_readl(S5P64X0_SYS_ID) & 0xf0000;
+	if (chipid == 0x40000) {
+		s3c_gpio_cfgrange_nopull(S5P6440_GPI(0), 16, S3C_GPIO_SFN(2));
+		s3c_gpio_cfgrange_nopull(S5P6440_GPJ(0), 12, S3C_GPIO_SFN(2));
+	} else if (chipid == 0x50000) {
+		s3c_gpio_cfgrange_nopull(S5P6450_GPI(0), 16, S3C_GPIO_SFN(2));
+		s3c_gpio_cfgrange_nopull(S5P6450_GPJ(0), 12, S3C_GPIO_SFN(2));
+	}
+}
diff --git a/arch/arm/plat-samsung/include/plat/fb.h b/arch/arm/plat-samsung/include/plat/fb.h
index 01f10e4..bd79c0a 100644
--- a/arch/arm/plat-samsung/include/plat/fb.h
+++ b/arch/arm/plat-samsung/include/plat/fb.h
@@ -109,4 +109,18 @@ extern void s5pv210_fb_gpio_setup_24bpp(void);
  */
 extern void exynos4_fimd0_gpio_setup_24bpp(void);
 
+/**
+ * s5p64x0_fb_init() - Common setup function for LCD
+ *
+ * Select LCD I/F configuration-RGB style or i80 style
+ */
+extern void s5p64x0_fb_init(int lcd_interface_type);
+
+/**
+ * s5p64x0_fb_gpio_setup_24bpp() - Common GPIO setup function for LCD
+ *
+ * Initialise the GPIO for a LCD display on the RGB interface.
+ */
+extern void s5p64x0_fb_gpio_setup_24bpp(void);
+
 #endif /* __PLAT_S3C_FB_H */
-- 
1.7.0.4
