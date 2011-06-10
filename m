From: Anand Kumar N <anand.kn@samsung.com>
Subject: [RE-SEND] [PATCH 4/4] ARM: EXYNOS4: Add platform data for EXYNOS4 FIMD
 and LTE480WV platform-lcd
Date: Fri, 10 Jun 2011 13:45:23 +0530
Message-ID: <1307693723-14971-5-git-send-email-anand.kn@samsung.com>
References: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:9501 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754728Ab1FJIQZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2011 04:16:25 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMK0083MEYSKPP0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 17:16:23 +0900 (KST)
Received: from anand-ubuntu.sisodomain.com (unknown [107.108.215.66])
 by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LMK009OSEYVA360@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 17:16:23 +0900 (KST)
In-reply-to: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: lethal@linux-sh.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com, anand.kn@samsung.com

From: Jonghun Han <jonghun.han@samsung.com>

This patch adds support EXYNOS4 FIMD0 and LTE480WV LCD pannel.

Change-Id: Ib89dc0fab2283c275f35e465cbfcd710ec0fef56
Signed-off-by: Jonghun Han <jonghun.han@samsung.com>
Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/mach-exynos4/mach-smdkc210.c |   72 +++++++++++++++++++++++++++++++++
 arch/arm/mach-exynos4/mach-smdkv310.c |   72 +++++++++++++++++++++++++++++++++
 2 files changed, 144 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-smdkc210.c b/arch/arm/mach-exynos4/mach-smdkc210.c
index ac53e49..6098e15 100644
--- a/arch/arm/mach-exynos4/mach-smdkc210.c
+++ b/arch/arm/mach-exynos4/mach-smdkc210.c
@@ -9,7 +9,9 @@
 */
 
 #include <linux/serial_core.h>
+#include <linux/delay.h>
 #include <linux/gpio.h>
+#include <linux/lcd.h>
 #include <linux/mmc/host.h>
 #include <linux/platform_device.h>
 #include <linux/smsc911x.h>
@@ -19,16 +21,20 @@
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
 
+#include <video/platform_lcd.h>
+
 #include <plat/regs-serial.h>
 #include <plat/regs-srom.h>
 #include <plat/exynos4.h>
 #include <plat/cpu.h>
 #include <plat/devs.h>
+#include <plat/fb.h>
 #include <plat/sdhci.h>
 #include <plat/iic.h>
 #include <plat/pd.h>
 
 #include <mach/map.h>
+#include <mach/regs-fb.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define SMDKC210_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
@@ -111,6 +117,68 @@ static struct s3c_sdhci_platdata smdkc210_hsmmc3_pdata __initdata = {
 	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
 };
 
+static void lcd_lte480wv_set_power(struct plat_lcd_data *pd,
+				   unsigned int power)
+{
+	if (power) {
+#if !defined(CONFIG_BACKLIGHT_PWM)
+		gpio_request(EXYNOS4_GPD0(1), "GPD0");
+		gpio_direction_output(EXYNOS4_GPD0(1), 1);
+		gpio_free(EXYNOS4_GPD0(1));
+#endif
+		/* fire nRESET on power up */
+		gpio_request(EXYNOS4_GPX0(6), "GPX0");
+
+		gpio_direction_output(EXYNOS4_GPX0(6), 1);
+		mdelay(100);
+
+		gpio_set_value(EXYNOS4_GPX0(6), 0);
+		mdelay(10);
+
+		gpio_set_value(EXYNOS4_GPX0(6), 1);
+		mdelay(10);
+
+		gpio_free(EXYNOS4_GPX0(6));
+	} else {
+#if !defined(CONFIG_BACKLIGHT_PWM)
+		gpio_request(EXYNOS4_GPD0(1), "GPD0");
+		gpio_direction_output(EXYNOS4_GPD0(1), 0);
+		gpio_free(EXYNOS4_GPD0(1));
+#endif
+	}
+}
+
+static struct plat_lcd_data smdkc210_lcd_lte480wv_data = {
+	.set_power      = lcd_lte480wv_set_power,
+};
+
+static struct platform_device smdkc210_lcd_lte480wv = {
+	.name                   = "platform-lcd",
+	.dev.parent             = &s5p_device_fimd0.dev,
+	.dev.platform_data      = &smdkc210_lcd_lte480wv_data,
+};
+
+static struct s3c_fb_pd_win smdkc210_fb_win0 = {
+	.win_mode = {
+		.left_margin    = 13,
+		.right_margin   = 8,
+		.upper_margin   = 7,
+		.lower_margin   = 5,
+		.hsync_len      = 3,
+		.vsync_len      = 1,
+		.xres   = 800,
+		.yres   = 480,
+	},
+	.max_bpp        = 32,
+	.default_bpp    = 24,
+};
+static struct s3c_fb_platdata smdkc210_lcd0_pdata __initdata = {
+	.win[0]         = &smdkc210_fb_win0,
+	.vidcon0        = VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB,
+	.vidcon1        = VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
+	.setup_gpio     = exynos4_fimd0_gpio_setup_24bpp,
+};
+
 static struct resource smdkc210_smsc911x_resources[] = {
 	[0] = {
 		.start	= EXYNOS4_PA_SROM_BANK(1),
@@ -152,6 +220,7 @@ static struct i2c_board_info i2c_devs1[] __initdata = {
 };
 
 static struct platform_device *smdkc210_devices[] __initdata = {
+	&s5p_device_fimd0,
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc1,
 	&s3c_device_hsmmc2,
@@ -171,6 +240,7 @@ static struct platform_device *smdkc210_devices[] __initdata = {
 	&exynos4_device_pd[PD_GPS],
 	&exynos4_device_sysmmu,
 	&samsung_asoc_dma,
+	&smdkc210_lcd_lte480wv,
 	&smdkc210_smsc911x,
 	&smdkc210_pcm_device,
 };
@@ -217,6 +287,8 @@ static void __init smdkc210_machine_init(void)
 	s3c_sdhci2_set_platdata(&smdkc210_hsmmc2_pdata);
 	s3c_sdhci3_set_platdata(&smdkc210_hsmmc3_pdata);
 
+	s5p_fimd0_set_platdata(&smdkc210_lcd0_pdata);
+
 	platform_add_devices(smdkc210_devices, ARRAY_SIZE(smdkc210_devices));
 }
 
diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index 7e3ee6c..25ca91d 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -9,7 +9,9 @@
 */
 
 #include <linux/serial_core.h>
+#include <linux/delay.h>
 #include <linux/gpio.h>
+#include <linux/lcd.h>
 #include <linux/mmc/host.h>
 #include <linux/platform_device.h>
 #include <linux/smsc911x.h>
@@ -20,17 +22,21 @@
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
 
+#include <video/platform_lcd.h>
+
 #include <plat/regs-serial.h>
 #include <plat/regs-srom.h>
 #include <plat/exynos4.h>
 #include <plat/cpu.h>
 #include <plat/devs.h>
+#include <plat/fb.h>
 #include <plat/keypad.h>
 #include <plat/sdhci.h>
 #include <plat/iic.h>
 #include <plat/pd.h>
 
 #include <mach/map.h>
+#include <mach/regs-fb.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define SMDKV310_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
@@ -113,6 +119,68 @@ static struct s3c_sdhci_platdata smdkv310_hsmmc3_pdata __initdata = {
 	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
 };
 
+static void lcd_lte480wv_set_power(struct plat_lcd_data *pd,
+				   unsigned int power)
+{
+	if (power) {
+#if !defined(CONFIG_BACKLIGHT_PWM)
+		gpio_request(EXYNOS4_GPD0(1), "GPD0");
+		gpio_direction_output(EXYNOS4_GPD0(1), 1);
+		gpio_free(EXYNOS4_GPD0(1));
+#endif
+		/* fire nRESET on power up */
+		gpio_request(EXYNOS4_GPX0(6), "GPX0");
+
+		gpio_direction_output(EXYNOS4_GPX0(6), 1);
+		mdelay(100);
+
+		gpio_set_value(EXYNOS4_GPX0(6), 0);
+		mdelay(10);
+
+		gpio_set_value(EXYNOS4_GPX0(6), 1);
+		mdelay(10);
+
+		gpio_free(EXYNOS4_GPX0(6));
+	} else {
+#if !defined(CONFIG_BACKLIGHT_PWM)
+		gpio_request(EXYNOS4_GPD0(1), "GPD0");
+		gpio_direction_output(EXYNOS4_GPD0(1), 0);
+		gpio_free(EXYNOS4_GPD0(1));
+#endif
+	}
+}
+
+static struct plat_lcd_data smdkv310_lcd_lte480wv_data = {
+	.set_power      = lcd_lte480wv_set_power,
+};
+
+static struct platform_device smdkv310_lcd_lte480wv = {
+	.name                   = "platform-lcd",
+	.dev.parent             = &s5p_device_fimd0.dev,
+	.dev.platform_data      = &smdkv310_lcd_lte480wv_data,
+};
+
+static struct s3c_fb_pd_win smdkv310_fb_win0 = {
+	.win_mode = {
+		.left_margin    = 13,
+		.right_margin   = 8,
+		.upper_margin   = 7,
+		.lower_margin   = 5,
+		.hsync_len      = 3,
+		.vsync_len      = 1,
+		.xres   = 800,
+		.yres   = 480,
+	},
+	.max_bpp        = 32,
+	.default_bpp    = 24,
+};
+static struct s3c_fb_platdata smdkv310_lcd0_pdata __initdata = {
+	.win[0]         = &smdkv310_fb_win0,
+	.vidcon0        = VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB,
+	.vidcon1        = VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
+	.setup_gpio     = exynos4_fimd0_gpio_setup_24bpp,
+};
+
 static struct resource smdkv310_smsc911x_resources[] = {
 	[0] = {
 		.start	= EXYNOS4_PA_SROM_BANK(1),
@@ -173,6 +241,7 @@ static struct i2c_board_info i2c_devs1[] __initdata = {
 };
 
 static struct platform_device *smdkv310_devices[] __initdata = {
+	&s5p_device_fimd0,
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc1,
 	&s3c_device_hsmmc2,
@@ -193,6 +262,7 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&exynos4_device_sysmmu,
 	&exynos4_device_pcm0,
 	&samsung_asoc_dma,
+	&smdkv310_lcd_lte480wv,
 	&smdkv310_smsc911x,
 	&smdkv310_pcm_device,
 };
@@ -239,6 +309,8 @@ static void __init smdkv310_machine_init(void)
 	s3c_sdhci2_set_platdata(&smdkv310_hsmmc2_pdata);
 	s3c_sdhci3_set_platdata(&smdkv310_hsmmc3_pdata);
 
+	s5p_fimd0_set_platdata(&smdkv310_lcd0_pdata);
+
 	samsung_keypad_set_platdata(&smdkv310_keypad_data);
 
 	platform_add_devices(smdkv310_devices, ARRAY_SIZE(smdkv310_devices));
-- 
1.7.4.1
