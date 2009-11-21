From: Jassi Brar <jassi.brar@samsung.com>
Subject: [PATCH 6/6] SMDK6410 SPI: Added spidev support as an example
Date: Sat, 21 Nov 2009 11:52:28 +0900
Message-ID: <1258771948-14276-1-git-send-email-jassi.brar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38605 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754087AbZKUC5E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Nov 2009 21:57:04 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jassi Brar <jassi.brar@samsung.com>

As an illustration of using the newly implemented SPI driver,
'spidev' master device has been enabled on SMDK6410.

Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
---
 arch/arm/mach-s3c6410/mach-smdk6410.c |   47 +++++++++++++++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c6410/mach-smdk6410.c b/arch/arm/mach-s3c6410/mach-smdk6410.c
index ea51dbe..1230fa9 100644
--- a/arch/arm/mach-s3c6410/mach-smdk6410.c
+++ b/arch/arm/mach-s3c6410/mach-smdk6410.c
@@ -25,6 +25,7 @@
 #include <linux/gpio.h>
 #include <linux/delay.h>
 #include <linux/smsc911x.h>
+#include <linux/spi/spi.h>
 
 #ifdef CONFIG_SMDK6410_WM1190_EV1
 #include <linux/mfd/wm8350/core.h>
@@ -49,8 +50,10 @@
 #include <plat/regs-gpio.h>
 #include <plat/regs-sys.h>
 #include <plat/iic.h>
+#include <plat/spi.h>
 #include <plat/fb.h>
 #include <plat/gpio-cfg.h>
+#include <plat/gpio-bank-c.h>
 
 #include <plat/s3c6410.h>
 #include <plat/clock.h>
@@ -193,6 +196,7 @@ static struct platform_device *smdk6410_devices[] __initdata = {
 #ifdef CONFIG_SMDK6410_SD_CH1
 	&s3c_device_hsmmc1,
 #endif
+	&s3c64xx_device_spi0,
 	&s3c_device_i2c0,
 	&s3c_device_i2c1,
 	&s3c_device_fb,
@@ -351,6 +355,40 @@ static struct i2c_board_info i2c_devs1[] __initdata = {
 	{ I2C_BOARD_INFO("24c128", 0x57), },	/* Samsung S524AD0XD1 */
 };
 
+static void smdk6410_spidev_cs_set_level(int high)
+{
+	u32 val;
+
+	val = readl(S3C64XX_GPCDAT);
+
+	if (high)
+		val |= (1<<3);
+	else
+		val &= ~(1<<3);
+
+	writel(val, S3C64XX_GPCDAT);
+}
+
+#define SMDK6410_SPIDEV_CS 0
+
+static struct s3c64xx_spi_csinfo smdk6410_spi0_csi[] = {
+	[SMDK6410_SPIDEV_CS] = {
+		.set_level = smdk6410_spidev_cs_set_level,
+		.fb_delay = 0x3, /* 9ns feedback delay */
+	},
+};
+
+static struct spi_board_info smdk6410_spi_devices[] __initdata = {
+	{
+		.modalias	 = "spidev",
+		.mode		 = SPI_MODE_0,
+		.max_speed_hz    = 4000000,
+		.bus_num	 = 0,
+		.chip_select	 = 0,
+		.controller_data = &smdk6410_spi1_csi[SMDK6410_SPIDEV_CS],
+	},
+};
+
 static void __init smdk6410_map_io(void)
 {
 	u32 tmp;
@@ -385,6 +423,15 @@ static void __init smdk6410_machine_init(void)
 	i2c_register_board_info(0, i2c_devs0, ARRAY_SIZE(i2c_devs0));
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));
 
+	/* SPI Controller-0 generates its clocks from PCLK and
+	 * emulates ARRAY_SIZE(smdk6410_spi0_csi) chipselects.
+	 */
+	s3c64xx_spi_set_info(BUSNUM(0), S3C64XX_SPI_SRCCLK_PCLK,
+					 ARRAY_SIZE(smdk6410_spi0_csi));
+
+	spi_register_board_info(smdk6410_spi_devices,
+					ARRAY_SIZE(smdk6410_spi_devices));
+
 	platform_add_devices(smdk6410_devices, ARRAY_SIZE(smdk6410_devices));
 }
 
-- 
1.6.2.5
