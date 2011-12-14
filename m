From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v2 4/4] ARM Exynos4210-Nuri: support Exynos4210-bus Devfreq
 driver.
Date: Wed, 14 Dec 2011 20:28:45 +0900
Message-ID: <1323862125-10699-5-git-send-email-myungjoo.ham@samsung.com>
References: <1323862125-10699-1-git-send-email-myungjoo.ham@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41398 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755292Ab1LNL2d (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Dec 2011 06:28:33 -0500
In-reply-to: <1323862125-10699-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Kevin Hilman <khilman@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Russell King <linux@arm.linux.org.uk>, Jongpill Lee <boyko.lee@samsung.com>, myungjoo.ham@gmail.com

Support varying voltages:
- GPIODVS for Buck2 is removed.
- Voltage ragne for Buck2 is widen.

Support Buck2 regulator for Exynos4210-bus devfreq driver:
- Added device name for buck2 regulator
- Added exynos4210-busfreq platform device fro Nuri board.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/mach-nuri.c |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index 236bbe1..c28f045 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -434,7 +434,7 @@ static struct regulator_consumer_supply __initdata max8997_buck1_[] = {
 	REGULATOR_SUPPLY("vdd_arm", NULL), /* CPUFREQ */
 };
 static struct regulator_consumer_supply __initdata max8997_buck2_[] = {
-	REGULATOR_SUPPLY("vdd_int", NULL), /* CPUFREQ */
+	REGULATOR_SUPPLY("vdd_int", "exynos4210-busfreq.0"), /* CPUFREQ */
 };
 static struct regulator_consumer_supply __initdata max8997_buck3_[] = {
 	REGULATOR_SUPPLY("vdd", "mali_dev.0"), /* G3D of Exynos 4 */
@@ -745,7 +745,7 @@ static struct regulator_init_data __initdata max8997_buck2_data = {
 	.constraints	= {
 		.name		= "VINT_1.1V_C210",
 		.min_uV		= 900000,
-		.max_uV		= 1100000,
+		.max_uV		= 1200000,
 		.valid_ops_mask	= REGULATOR_CHANGE_VOLTAGE,
 		.always_on	= 1,
 		.state_mem	= {
@@ -960,7 +960,6 @@ static struct max8997_platform_data __initdata nuri_max8997_pdata = {
 	.regulators		= nuri_max8997_regulators,
 
 	.buck125_gpios = { EXYNOS4_GPX0(5), EXYNOS4_GPX0(6), EXYNOS4_GPL0(0) },
-	.buck2_gpiodvs = true,
 
 	.buck1_voltage[0] = 1350000, /* 1.35V */
 	.buck1_voltage[1] = 1300000, /* 1.3V */
@@ -1242,6 +1241,11 @@ static struct s3c2410_platform_i2c nuri_i2c0_platdata __initdata = {
 	.sda_delay	= 200,
 };
 
+/* DEVFREQ controlling memory/bus */
+static struct platform_device exynos4_bus_devfreq = {
+	.name			= "exynos4210-busfreq",
+};
+
 static struct platform_device *nuri_devices[] __initdata = {
 	/* Samsung Platform Devices */
 	&s3c_device_i2c5, /* PMIC should initialize first */
@@ -1279,6 +1283,7 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&nuri_max8903_device,
 	&cam_vdda_fixed_rdev,
 	&cam_8m_12v_fixed_rdev,
+	&exynos4_bus_devfreq,
 };
 
 static void __init nuri_map_io(void)
-- 
1.7.4.1
