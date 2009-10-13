From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 10/17] SMDKC100: enable S3C FrameBuffer
Date: Tue, 13 Oct 2009 09:57:05 +0200
Message-ID: <1255420632-21116-11-git-send-email-m.szyprowski@samsung.com>
References: <1255420632-21116-1-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-2-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-3-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-4-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-5-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-6-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-7-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-8-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-9-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-10-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:31640 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933758AbZJMINA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Oct 2009 04:13:00 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0KRG00DN00V6HA80@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Oct 2009 08:59:30 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KRG00E2N0V1TT@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Oct 2009 08:59:30 +0100 (BST)
In-reply-to: <1255420632-21116-10-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.arm.linux.org.uk, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com

Add required machine definitions for s3c-fb device.
A 800x480 lcd device (simmilar to the one known from SMDK6410 boards) has
been defined. The lcd controller is attached to GPIO lines and can be
enabled/disabled with platform-lcd driver.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-s5pc100/Kconfig         |    2 +
 arch/arm/mach-s5pc100/mach-smdkc100.c |   67 +++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pc100/Kconfig b/arch/arm/mach-s5pc100/Kconfig
index b1a4ba5..5e6b9a3 100644
--- a/arch/arm/mach-s5pc100/Kconfig
+++ b/arch/arm/mach-s5pc100/Kconfig
@@ -17,6 +17,8 @@ config CPU_S5PC100
 config MACH_SMDKC100
 	bool "SMDKC100"
 	select CPU_S5PC100
+	select S3C_DEV_FB
 	select S5PC1XX_SETUP_I2C1
+	select S5PC1XX_SETUP_FB_24BPP
 	help
 	  Machine support for the Samsung SMDKC100
diff --git a/arch/arm/mach-s5pc100/mach-smdkc100.c b/arch/arm/mach-s5pc100/mach-smdkc100.c
index 05bb20a..098956d 100644
--- a/arch/arm/mach-s5pc100/mach-smdkc100.c
+++ b/arch/arm/mach-s5pc100/mach-smdkc100.c
@@ -27,16 +27,21 @@
 #include <asm/mach/map.h>
 
 #include <mach/map.h>
+#include <mach/regs-fb.h>
+#include <video/platform_lcd.h>
 
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
 #include <plat/regs-serial.h>
+#include <plat/gpio-cfg.h>
+#include <plat/regs-gpio.h>
 
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/s5pc100.h>
+#include <plat/fb.h>
 
 #define UCON (S3C2410_UCON_DEFAULT | S3C2410_UCON_UCLK)
 #define ULCON (S3C2410_LCON_CS8 | S3C2410_LCON_PNONE | S3C2410_LCON_STOPB)
@@ -73,9 +78,65 @@ static struct s3c2410_uartcfg smdkc100_uartcfgs[] __initdata = {
 	},
 };
 
+/* LCD power controller */
+static void smdkc100_lcd_power_set(struct plat_lcd_data *pd,
+				   unsigned int power)
+{
+	/* backlight */
+	gpio_direction_output(S5PC100_GPD(0), power);
+
+	if (power) {
+		/* module reset */
+		gpio_direction_output(S5PC100_GPH0(6), 1);
+		mdelay(100);
+		gpio_direction_output(S5PC100_GPH0(6), 0);
+		mdelay(10);
+		gpio_direction_output(S5PC100_GPH0(6), 1);
+		mdelay(10);
+	}
+}
+
+static struct plat_lcd_data smdkc100_lcd_power_data = {
+	.set_power	= smdkc100_lcd_power_set,
+};
+
+static struct platform_device smdkc100_lcd_powerdev = {
+	.name			= "platform-lcd",
+	.dev.parent		= &s3c_device_fb.dev,
+	.dev.platform_data	= &smdkc100_lcd_power_data,
+};
+
+/* Frame Buffer */
+static struct s3c_fb_pd_win smdkc100_fb_win0 = {
+	/* this is to ensure we use win0 */
+	.win_mode	= {
+		.refresh	= 70,
+		.pixclock	= (8+13+3+800)*(7+5+1+480),
+		.left_margin	= 8,
+		.right_margin	= 13,
+		.upper_margin	= 7,
+		.lower_margin	= 5,
+		.hsync_len	= 3,
+		.vsync_len	= 1,
+		.xres		= 800,
+		.yres		= 480,
+	},
+	.max_bpp	= 32,
+	.default_bpp	= 16,
+};
+
+static struct s3c_fb_platdata smdkc100_lcd_pdata __initdata = {
+	.win[0]		= &smdkc100_fb_win0,
+	.vidcon0	= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB,
+	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
+	.setup_gpio	= s5pc100_fb_gpio_setup_24bpp,
+};
+
 static struct map_desc smdkc100_iodesc[] = {};
 
 static struct platform_device *smdkc100_devices[] __initdata = {
+	&s3c_device_fb,
+	&smdkc100_lcd_powerdev,
 };
 
 static void __init smdkc100_map_io(void)
@@ -87,6 +148,12 @@ static void __init smdkc100_map_io(void)
 
 static void __init smdkc100_machine_init(void)
 {
+	s3c_fb_set_platdata(&smdkc100_lcd_pdata);
+
+	/* LCD init */
+	gpio_request(S5PC100_GPD(0), "GPD");
+	gpio_request(S5PC100_GPH0(6), "GPH0");
+	smdkc100_lcd_power_set(&smdkc100_lcd_power_data, 0);
 	platform_add_devices(smdkc100_devices, ARRAY_SIZE(smdkc100_devices));
 }
 
-- 
1.6.4
