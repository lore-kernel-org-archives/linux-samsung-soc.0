From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/2] ARM: S5PV210: Add support for NOON010PC30 sensor on GONI
 board
Date: Wed, 22 Jun 2011 18:34:12 +0200
Message-ID: <1308760452-30676-3-git-send-email-s.nawrocki@samsung.com>
References: <1308760452-30676-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:15435 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756627Ab1FVQeS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2011 12:34:18 -0400
Received: from spt2.w1.samsung.com ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LN700FMEA13CY20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Jun 2011 17:34:16 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LN700H00A12NB@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Jun 2011 17:34:15 +0100 (BST)
In-reply-to: <1308760452-30676-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, sw0312.kim@samsung.com, riverful.kim@samsung.com

Add platform data for CIF camera sensor and FIMC platform data
entries for it. Add platform device for s5p-fimc media device
driver and the camera port A I/O pins initialization.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig     |    1 +
 arch/arm/mach-s5pv210/mach-goni.c |   52 +++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 37b5a97..43d6dd8 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -98,6 +98,7 @@ config MACH_GONI
 	select S5PV210_SETUP_I2C2
 	select S5PV210_SETUP_KEYPAD
 	select S5PV210_SETUP_SDHCI
+	select S5PV210_SETUP_FIMC
 	help
 	  Machine support for Samsung GONI board
 	  S5PC110(MCP) is one of package option of S5PV210
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 31d5aa7..78de63b 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -47,6 +47,10 @@
 #include <plat/sdhci.h>
 #include <plat/clock.h>
 #include <plat/s5p-time.h>
+#include <plat/camport.h>
+
+#include <media/s5p_fimc.h>
+#include <media/noon010pc30.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define GONI_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
@@ -271,6 +275,14 @@ static void __init goni_tsp_init(void)
 	i2c2_devs[0].irq = gpio_to_irq(gpio);
 }
 
+static void goni_camera_init(void)
+{
+	s5pv210_fimc_setup_gpio(S5P_CAMPORT_A);
+
+	/* Set max driver strength on CAM_A_CLKOUT pin. */
+	s5p_gpio_set_drvstr(S5PV210_GPE1(3), S5P_GPIO_DRVSTR_LV4);
+}
+
 /* MAX8998 regulators */
 #if defined(CONFIG_REGULATOR_MAX8998) || defined(CONFIG_REGULATOR_MAX8998_MODULE)
 
@@ -800,6 +812,39 @@ static void goni_setup_sdhci(void)
 	s3c_sdhci2_set_platdata(&goni_hsmmc2_data);
 };
 
+struct platform_device s5p_device_fimc_md = {
+	.name		= "s5p-fimc-md",
+	.id		= -1,
+};
+
+static struct noon010pc30_platform_data noon010pc30_pldata = {
+	.clk_rate	= 16000000UL,
+	.gpio_nreset	= S5PV210_GPB(2), /* CAM_CIF_NRST */
+	.gpio_nstby	= S5PV210_GPB(0), /* CAM_CIF_NSTBY */
+};
+
+static struct i2c_board_info noon010pc30_board_info = {
+	I2C_BOARD_INFO("NOON010PC30", 0x60 >> 1),
+	.platform_data = &noon010pc30_pldata,
+};
+
+
+static struct s5p_fimc_isp_info goni_camera_sensors[] = {
+	{
+		.mux_id		= 0,
+		.flags		= FIMC_CLK_INV_PCLK | FIMC_CLK_INV_VSYNC,
+		.bus_type	= FIMC_ITU_601,
+		.board_info	= &noon010pc30_board_info,
+		.i2c_bus_num	= 0,
+		.clk_frequency	= 16000000UL,
+	},
+};
+
+struct s5p_platform_fimc goni_fimc_md_platdata __initdata = {
+	.isp_info	= goni_camera_sensors,
+	.num_clients	= ARRAY_SIZE(goni_camera_sensors),
+};
+
 static struct platform_device *goni_devices[] __initdata = {
 	&s3c_device_fb,
 	&s5p_device_onenand,
@@ -812,6 +857,7 @@ static struct platform_device *goni_devices[] __initdata = {
 	&s5p_device_fimc0,
 	&s5p_device_fimc1,
 	&s5p_device_fimc2,
+	&s5p_device_fimc_md,
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc1,
 	&s3c_device_hsmmc2,
@@ -875,6 +921,12 @@ static void __init goni_machine_init(void)
 	/* FB */
 	s3c_fb_set_platdata(&goni_lcd_pdata);
 
+	/* FIMC */
+	s3c_set_platdata(&goni_fimc_md_platdata, sizeof(goni_fimc_md_platdata),
+			 &s5p_device_fimc_md);
+
+	goni_camera_init();
+
 	/* SPI */
 	spi_register_board_info(spi_board_info, ARRAY_SIZE(spi_board_info));
 
-- 
1.7.5.4
