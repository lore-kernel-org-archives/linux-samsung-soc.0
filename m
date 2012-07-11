From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 4/7] ARM: EXYNOS: Adding DRM platform device
Date: Wed, 11 Jul 2012 14:54:38 +0530
Message-ID: <1341998681-1888-5-git-send-email-l.krishna@samsung.com>
References: <1341998681-1888-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36091 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751835Ab2GKJKz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jul 2012 05:10:55 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6Z000PFO66FX90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 18:10:54 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6Z008NXO5HIZ50@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 18:10:54 +0900 (KST)
In-reply-to: <1341998681-1888-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, prashanth.g@samsung.com

Add DRM platform device to machine file for exynos5.

Signed-off-by: Prathyush K <prathyush.k@samsung.com>
Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/mach-exynos/mach-exynos5-dt.c |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 652a537..a91c928 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -17,6 +17,7 @@
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
+#include <asm/io.h>
 #include <mach/map.h>
 
 #include <plat/cpu.h>
@@ -29,6 +30,22 @@
 #include <video/platform_lcd.h>
 
 
+static void exynos_fimd_gpio_setup_24bpp(void)
+{
+	unsigned int reg = 0;
+	/*
+	 * Set DISP1BLK_CFG register for Display path selection
+	 * FIMD of DISP1_BLK Bypass selection : DISP1BLK_CFG[15]
+	 * ---------------------
+	 * 0 | MIE/MDNIE
+	 * 1 | FIMD : selected
+	 */
+	reg = __raw_readl(S3C_VA_SYS + 0x0214);
+	reg &= ~(1 << 15);      /* To save other reset values */
+	reg |= (1 << 15);
+	__raw_writel(reg, S3C_VA_SYS + 0x0214);
+}
+
 static int smdk5250_bl_notify(struct device *unused, int brightness)
 {
 	/* manage lcd_bl_en signal */
@@ -51,6 +68,14 @@ static struct platform_pwm_backlight_data smdk5250_bl_data = {
 	.notify		= smdk5250_bl_notify,
 };
 
+static struct platform_device exynos_drm_device = {
+	.name		= "exynos-drm",
+	.dev = {
+		.dma_mask = &exynos_drm_device.dev.coherent_dma_mask,
+		.coherent_dma_mask = 0xffffffffUL,
+	}
+};
+
 static void lcd_set_power(struct plat_lcd_data *pd,
 			unsigned int power)
 {
@@ -134,6 +159,7 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 
 static struct platform_device *smdk5250_devices[] __initdata = {
 	&smdk5250_lcd, /* for platform_lcd device */
+	&exynos_drm_device,
 };
 
 static void __init exynos5250_dt_map_io(void)
@@ -147,6 +173,7 @@ static void __init exynos5250_dt_machine_init(void)
 	samsung_bl_set(&smdk5250_bl_gpio_info, &smdk5250_bl_data);
 	of_platform_populate(NULL, of_default_bus_match_table,
 				exynos5250_auxdata_lookup, NULL);
+	exynos_fimd_gpio_setup_24bpp();
 	platform_add_devices(smdk5250_devices, ARRAY_SIZE(smdk5250_devices));
 }
 
-- 
1.7.0.4
