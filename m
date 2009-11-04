From: jassisinghbrar@gmail.com
Subject: [PATCH 6/7] S3C64XX PCM: Defined PCM controller platform devices
Date: Wed,  4 Nov 2009 17:29:08 +0900
Message-ID: <1257323349-18481-6-git-send-email-jassisinghbrar@gmail.com>
References: <1257323349-18481-1-git-send-email-jassisinghbrar@gmail.com>
 <1257323349-18481-2-git-send-email-jassisinghbrar@gmail.com>
 <1257323349-18481-3-git-send-email-jassisinghbrar@gmail.com>
 <1257323349-18481-4-git-send-email-jassisinghbrar@gmail.com>
 <1257323349-18481-5-git-send-email-jassisinghbrar@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:37785 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752178AbZKDIdX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Nov 2009 03:33:23 -0500
In-Reply-To: <1257323349-18481-5-git-send-email-jassisinghbrar@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jassi Brar <jassi.brar@samsung.com>

From: Jassi Brar <jassi.brar@samsung.com>

Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
---
 arch/arm/plat-s3c/include/plat/devs.h |    3 +
 arch/arm/plat-s3c64xx/dev-audio.c     |  101 ++++++++++++++++++++++++++++++++-
 2 files changed, 103 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-s3c/include/plat/devs.h b/arch/arm/plat-s3c/include/plat/devs.h
index 0f540ea..932cbbb 100644
--- a/arch/arm/plat-s3c/include/plat/devs.h
+++ b/arch/arm/plat-s3c/include/plat/devs.h
@@ -28,6 +28,9 @@ extern struct platform_device s3c64xx_device_iis0;
 extern struct platform_device s3c64xx_device_iis1;
 extern struct platform_device s3c64xx_device_iisv4;
 
+extern struct platform_device s3c64xx_device_pcm0;
+extern struct platform_device s3c64xx_device_pcm1;
+
 extern struct platform_device s3c_device_fb;
 extern struct platform_device s3c_device_usb;
 extern struct platform_device s3c_device_lcd;
diff --git a/arch/arm/plat-s3c64xx/dev-audio.c b/arch/arm/plat-s3c64xx/dev-audio.c
index 1322beb..c7f1acc 100644
--- a/arch/arm/plat-s3c64xx/dev-audio.c
+++ b/arch/arm/plat-s3c64xx/dev-audio.c
@@ -15,9 +15,14 @@
 
 #include <mach/irqs.h>
 #include <mach/map.h>
+#include <mach/dma.h>
+#include <mach/gpio.h>
 
 #include <plat/devs.h>
-
+#include <plat/audio.h>
+#include <plat/gpio-bank-d.h>
+#include <plat/gpio-bank-e.h>
+#include <plat/gpio-cfg.h>
 
 static struct resource s3c64xx_iis0_resource[] = {
 	[0] = {
@@ -66,3 +71,97 @@ struct platform_device s3c64xx_device_iisv4 = {
 	.resource	  = s3c64xx_iisv4_resource,
 };
 EXPORT_SYMBOL(s3c64xx_device_iisv4);
+
+
+/* PCM Controller platform_devices */
+
+static int s3c64xx_pcm_cfg_gpio(struct platform_device *pdev)
+{
+	switch (pdev->id) {
+	case 0:
+		s3c_gpio_cfgpin(S3C64XX_GPD(0), S3C64XX_GPD0_PCM0_SCLK);
+		s3c_gpio_cfgpin(S3C64XX_GPD(1), S3C64XX_GPD1_PCM0_EXTCLK);
+		s3c_gpio_cfgpin(S3C64XX_GPD(2), S3C64XX_GPD2_PCM0_FSYNC);
+		s3c_gpio_cfgpin(S3C64XX_GPD(3), S3C64XX_GPD3_PCM0_SIN);
+		s3c_gpio_cfgpin(S3C64XX_GPD(4), S3C64XX_GPD4_PCM0_SOUT);
+		break;
+	case 1:
+		s3c_gpio_cfgpin(S3C64XX_GPE(0), S3C64XX_GPE0_PCM1_SCLK);
+		s3c_gpio_cfgpin(S3C64XX_GPE(1), S3C64XX_GPE1_PCM1_EXTCLK);
+		s3c_gpio_cfgpin(S3C64XX_GPE(2), S3C64XX_GPE2_PCM1_FSYNC);
+		s3c_gpio_cfgpin(S3C64XX_GPE(3), S3C64XX_GPE3_PCM1_SIN);
+		s3c_gpio_cfgpin(S3C64XX_GPE(4), S3C64XX_GPE4_PCM1_SOUT);
+		break;
+	default:
+		printk(KERN_DEBUG "Invalid PCM Controller number!");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static struct resource s3c64xx_pcm0_resource[] = {
+	[0] = {
+		.start = S3C64XX_PA_PCM0,
+		.end   = S3C64XX_PA_PCM0 + 0x100 - 1,
+		.flags = IORESOURCE_MEM,
+	},
+	[1] = {
+		.start = DMACH_PCM0_TX,
+		.end   = DMACH_PCM0_TX,
+		.flags = IORESOURCE_DMA,
+	},
+	[2] = {
+		.start = DMACH_PCM0_RX,
+		.end   = DMACH_PCM0_RX,
+		.flags = IORESOURCE_DMA,
+	},
+};
+
+struct s3c_audio_pdata s3c_pcm0_pdata = {
+	.cfg_gpio = s3c64xx_pcm_cfg_gpio,
+};
+
+struct platform_device s3c64xx_device_pcm0 = {
+	.name		  = "s3c-pcm",
+	.id		  = 0,
+	.num_resources	  = ARRAY_SIZE(s3c64xx_pcm0_resource),
+	.resource	  = s3c64xx_pcm0_resource,
+	.dev = {
+		.platform_data = &s3c_pcm0_pdata,
+	},
+};
+EXPORT_SYMBOL(s3c64xx_device_pcm0);
+
+static struct resource s3c64xx_pcm1_resource[] = {
+	[0] = {
+		.start = S3C64XX_PA_PCM1,
+		.end   = S3C64XX_PA_PCM1 + 0x100 - 1,
+		.flags = IORESOURCE_MEM,
+	},
+	[1] = {
+		.start = DMACH_PCM1_TX,
+		.end   = DMACH_PCM1_TX,
+		.flags = IORESOURCE_DMA,
+	},
+	[2] = {
+		.start = DMACH_PCM1_RX,
+		.end   = DMACH_PCM1_RX,
+		.flags = IORESOURCE_DMA,
+	},
+};
+
+struct s3c_audio_pdata s3c_pcm1_pdata = {
+	.cfg_gpio = s3c64xx_pcm_cfg_gpio,
+};
+
+struct platform_device s3c64xx_device_pcm1 = {
+	.name		  = "s3c-pcm",
+	.id		  = 1,
+	.num_resources	  = ARRAY_SIZE(s3c64xx_pcm1_resource),
+	.resource	  = s3c64xx_pcm1_resource,
+	.dev = {
+		.platform_data = &s3c_pcm1_pdata,
+	},
+};
+EXPORT_SYMBOL(s3c64xx_device_pcm1);
-- 
1.6.2.5
