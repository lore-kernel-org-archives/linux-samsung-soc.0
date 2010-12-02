From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 6/6] ARM: S5PV210: Add DM9000 support on SMDKV210
Date: Thu,  2 Dec 2010 18:29:21 +0900
Message-ID: <1291282161-1992-7-git-send-email-kgene.kim@samsung.com>
References: <1291282161-1992-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38949 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757369Ab0LBJnM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 04:43:12 -0500
In-Reply-To: <1291282161-1992-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

This patch adds DM9000 Ethernet Controller device support for SMDKV210.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/include/mach/map.h |    2 +
 arch/arm/mach-s5pv210/mach-smdkv210.c    |   57 ++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index f1ff7cb..b2e0a62 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -16,6 +16,8 @@
 #include <plat/map-base.h>
 #include <plat/map-s5p.h>
 
+#define S5PV210_PA_SROM_BANK5	(0xA8000000)
+
 #define S5PC110_PA_ONENAND	(0xB0000000)
 #define S5P_PA_ONENAND		S5PC110_PA_ONENAND
 
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index 1fbc45b..30eec11 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -14,6 +14,8 @@
 #include <linux/init.h>
 #include <linux/serial_core.h>
 #include <linux/sysdev.h>
+#include <linux/dm9000.h>
+#include <linux/gpio.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -24,6 +26,8 @@
 #include <mach/regs-clock.h>
 
 #include <plat/regs-serial.h>
+#include <plat/regs-srom.h>
+#include <plat/gpio-cfg.h>
 #include <plat/s5pv210.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
@@ -102,6 +106,39 @@ static struct samsung_keypad_platdata smdkv210_keypad_data __initdata = {
 	.cols		= 8,
 };
 
+static struct resource smdkv210_dm9000_resources[] = {
+	[0] = {
+		.start	= S5PV210_PA_SROM_BANK5,
+		.end	= S5PV210_PA_SROM_BANK5,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.start	= S5PV210_PA_SROM_BANK5 + 2,
+		.end	= S5PV210_PA_SROM_BANK5 + 2,
+		.flags	= IORESOURCE_MEM,
+	},
+	[2] = {
+		.start	= IRQ_EINT(9),
+		.end	= IRQ_EINT(9),
+		.flags	= IORESOURCE_IRQ | IORESOURCE_IRQ_HIGHLEVEL,
+	},
+};
+
+static struct dm9000_plat_data smdkv210_dm9000_platdata = {
+	.flags		= DM9000_PLATF_16BITONLY | DM9000_PLATF_NO_EEPROM,
+	.dev_addr	= { 0x00, 0x09, 0xc0, 0xff, 0xec, 0x48 },
+};
+
+struct platform_device smdkv210_dm9000 = {
+	.name		= "dm9000",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(smdkv210_dm9000_resources),
+	.resource	= smdkv210_dm9000_resources,
+	.dev		= {
+		.platform_data	= &smdkv210_dm9000_platdata,
+	},
+};
+
 static struct platform_device *smdkv210_devices[] __initdata = {
 	&s5pv210_device_iis0,
 	&s5pv210_device_ac97,
@@ -119,8 +156,26 @@ static struct platform_device *smdkv210_devices[] __initdata = {
 	&s3c_device_rtc,
 	&s3c_device_ts,
 	&s3c_device_wdt,
+	&smdkv210_dm9000,
 };
 
+static void __init smdkv210_dm9000_init(void)
+{
+	unsigned int tmp;
+
+	gpio_request(S5PV210_MP01(5), "nCS5");
+	s3c_gpio_cfgpin(S5PV210_MP01(5), S3C_GPIO_SFN(2));
+	gpio_free(S5PV210_MP01(5));
+
+	tmp = (5 << S5P_SROM_BCX__TACC__SHIFT);
+	__raw_writel(tmp, S5P_SROM_BC5);
+
+	tmp = __raw_readl(S5P_SROM_BW);
+	tmp &= (S5P_SROM_BW__CS_MASK << S5P_SROM_BW__NCS5__SHIFT);
+	tmp |= (1 << S5P_SROM_BW__NCS5__SHIFT);
+	__raw_writel(tmp, S5P_SROM_BW);
+}
+
 static struct i2c_board_info smdkv210_i2c_devs0[] __initdata = {
 	{ I2C_BOARD_INFO("24c08", 0x50), },     /* Samsung S524AD0XD1 */
 };
@@ -150,6 +205,8 @@ static void __init smdkv210_machine_init(void)
 {
 	s3c_pm_init();
 
+	smdkv210_dm9000_init();
+
 	samsung_keypad_set_platdata(&smdkv210_keypad_data);
 	s3c24xx_ts_set_platdata(&s3c_ts_platform);
 
-- 
1.6.2.5
