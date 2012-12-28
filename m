From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 1/2] ARM: EXYNOS: Add vmmc regulator for Origen board
Date: Fri, 28 Dec 2012 14:04:29 +0530
Message-ID: <1356683670-30451-2-git-send-email-tushar.behera@linaro.org>
References: <1356683670-30451-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f50.google.com ([209.85.210.50]:51072 "EHLO
	mail-da0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750892Ab2L1ImX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Dec 2012 03:42:23 -0500
Received: by mail-da0-f50.google.com with SMTP id h15so4704805dan.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Dec 2012 00:42:22 -0800 (PST)
In-Reply-To: <1356683670-30451-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

SD/MMC driver requires an optional vmmc regulator. Enable this regulator
for Origen board.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/mach-origen.c |   36 ++++++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index 5e34b9c..4d290e8 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -20,6 +20,7 @@
 #include <linux/gpio_keys.h>
 #include <linux/i2c.h>
 #include <linux/regulator/machine.h>
+#include <linux/regulator/fixed.h>
 #include <linux/mfd/max8997.h>
 #include <linux/lcd.h>
 #include <linux/rfkill-gpio.h>
@@ -65,6 +66,10 @@
 				 S5PV210_UFCON_TXTRIG4 |	\
 				 S5PV210_UFCON_RXTRIG4)
 
+enum fixed_regulator_id {
+	FIXED_REG_ID_MMC = 0,
+};
+
 static struct s3c2410_uartcfg origen_uartcfgs[] __initdata = {
 	[0] = {
 		.hwport		= 0,
@@ -475,6 +480,36 @@ static struct i2c_board_info i2c0_devs[] __initdata = {
 	},
 };
 
+static struct regulator_consumer_supply mmc_supplies[] = {
+	REGULATOR_SUPPLY("vmmc", "exynos4-sdhci.0"),
+	REGULATOR_SUPPLY("vmmc", "exynos4-sdhci.2"),
+};
+
+static struct regulator_init_data mmc_fixed_voltage_init_data = {
+	.constraints		= {
+		.name		= "VMEM_VDD_2.8V",
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies	= ARRAY_SIZE(mmc_supplies),
+	.consumer_supplies	= mmc_supplies,
+};
+
+static struct fixed_voltage_config mmc_fixed_voltage_config = {
+	.supply_name		= "MMC_POWER_EN",
+	.microvolts		= 2800000,
+	.gpio			= EXYNOS4_GPX1(1),
+	.enable_high		= true,
+	.init_data		= &mmc_fixed_voltage_init_data,
+};
+
+static struct platform_device mmc_fixed_voltage = {
+	.name			= "reg-fixed-voltage",
+	.id			= FIXED_REG_ID_MMC,
+	.dev			= {
+		.platform_data	= &mmc_fixed_voltage_config,
+	},
+};
+
 static struct s3c_sdhci_platdata origen_hsmmc0_pdata __initdata = {
 	.cd_type		= S3C_SDHCI_CD_INTERNAL,
 };
@@ -690,6 +725,7 @@ static struct platform_device origen_device_bluetooth = {
 };
 
 static struct platform_device *origen_devices[] __initdata = {
+	&mmc_fixed_voltage,
 	&s3c_device_hsmmc2,
 	&s3c_device_hsmmc0,
 	&s3c_device_i2c0,
-- 
1.7.4.1
