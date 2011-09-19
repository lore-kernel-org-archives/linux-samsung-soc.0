From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH RESEND V5 4/6] ARM: S5P64X0: Add GPIO setup for LCD
Date: Mon, 19 Sep 2011 13:53:59 -0400
Message-ID: <1316454841-20869-5-git-send-email-ajaykumar.rs@samsung.com>
References: <1316454841-20869-1-git-send-email-ajaykumar.rs@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:65014 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755255Ab1ISLwq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Sep 2011 07:52:46 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRR00MKEQB1EU80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Sep 2011 20:52:24 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRR00G4JQAZ9R@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Sep 2011 20:52:24 +0900 (KST)
In-reply-to: <1316454841-20869-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jg1.han@samsung.com

This patch adds GPIO lines settings(HSYNC, VSYNC, VCLK and VD) for LCD.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/mach-s5p64x0/Kconfig           |    6 ++++++
 arch/arm/mach-s5p64x0/Makefile          |    1 +
 arch/arm/mach-s5p64x0/setup-fb-24bpp.c  |   29 +++++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/fb.h |    7 +++++++
 4 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5p64x0/setup-fb-24bpp.c

diff --git a/arch/arm/mach-s5p64x0/Kconfig b/arch/arm/mach-s5p64x0/Kconfig
index 65c7518..7bec400 100644
--- a/arch/arm/mach-s5p64x0/Kconfig
+++ b/arch/arm/mach-s5p64x0/Kconfig
@@ -21,6 +21,12 @@ config CPU_S5P6450
 	help
 	  Enable S5P6450 CPU support
 
+config S5P64X0_SETUP_FB_24BPP
+	bool
+	help
+	  Common setup code for S5P64X0 based boards with a LCD display
+	  through RGB interface.
+
 config S5P64X0_SETUP_I2C1
 	bool
 	help
diff --git a/arch/arm/mach-s5p64x0/Makefile b/arch/arm/mach-s5p64x0/Makefile
index 5f6afdf..1bf54b2 100644
--- a/arch/arm/mach-s5p64x0/Makefile
+++ b/arch/arm/mach-s5p64x0/Makefile
@@ -28,3 +28,4 @@ obj-y				+= dev-audio.o
 obj-$(CONFIG_S3C64XX_DEV_SPI)	+= dev-spi.o
 
 obj-$(CONFIG_S5P64X0_SETUP_I2C1)	+= setup-i2c1.o
+obj-$(CONFIG_S5P64X0_SETUP_FB_24BPP)	+= setup-fb-24bpp.o
diff --git a/arch/arm/mach-s5p64x0/setup-fb-24bpp.c b/arch/arm/mach-s5p64x0/setup-fb-24bpp.c
new file mode 100644
index 0000000..f346ee4
--- /dev/null
+++ b/arch/arm/mach-s5p64x0/setup-fb-24bpp.c
@@ -0,0 +1,29 @@
+/* linux/arch/arm/mach-s5p64x0/setup-fb-24bpp.c
+ *
+ * Copyright (c) 2011 Samsung Electronics Co., Ltd.
+ *             http://www.samsung.com/
+ *
+ * Base S5P64X0 GPIO setup information for LCD framebuffer
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/fb.h>
+#include <linux/gpio.h>
+
+#include <plat/cpu.h>
+#include <plat/fb.h>
+#include <plat/gpio-cfg.h>
+
+void s5p64x0_fb_gpio_setup_24bpp(void)
+{
+	if (soc_is_s5p6440()) {
+		s3c_gpio_cfgrange_nopull(S5P6440_GPI(0), 16, S3C_GPIO_SFN(2));
+		s3c_gpio_cfgrange_nopull(S5P6440_GPJ(0), 12, S3C_GPIO_SFN(2));
+	} else if (soc_is_s5p6450()) {
+		s3c_gpio_cfgrange_nopull(S5P6450_GPI(0), 16, S3C_GPIO_SFN(2));
+		s3c_gpio_cfgrange_nopull(S5P6450_GPJ(0), 12, S3C_GPIO_SFN(2));
+	}
+}
diff --git a/arch/arm/plat-samsung/include/plat/fb.h b/arch/arm/plat-samsung/include/plat/fb.h
index 01f10e4..0fedf47 100644
--- a/arch/arm/plat-samsung/include/plat/fb.h
+++ b/arch/arm/plat-samsung/include/plat/fb.h
@@ -109,4 +109,11 @@ extern void s5pv210_fb_gpio_setup_24bpp(void);
  */
 extern void exynos4_fimd0_gpio_setup_24bpp(void);
 
+/**
+ * s5p64x0_fb_gpio_setup_24bpp() - S5P6440/S5P6450 setup function for 24bpp LCD
+ *
+ * Initialise the GPIO for an 24bpp LCD display on the RGB interface.
+ */
+extern void s5p64x0_fb_gpio_setup_24bpp(void);
+
 #endif /* __PLAT_S3C_FB_H */
-- 
1.7.0.4
