From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 2/2] ARM: EXYNOS: Add hdmi-en regulator for Origen board
Date: Fri, 28 Dec 2012 14:04:30 +0530
Message-ID: <1356683670-30451-3-git-send-email-tushar.behera@linaro.org>
References: <1356683670-30451-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f41.google.com ([209.85.210.41]:41000 "EHLO
	mail-da0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750892Ab2L1Im0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Dec 2012 03:42:26 -0500
Received: by mail-da0-f41.google.com with SMTP id e20so4729789dak.28
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Dec 2012 00:42:26 -0800 (PST)
In-Reply-To: <1356683670-30451-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

HDMI driver requires hdmi-en regulator for enabling power to HDMI
connector. A fixed 5V line is used on Origen board for this purpose.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/mach-origen.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index 4d290e8..12429f9 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -68,6 +68,7 @@
 
 enum fixed_regulator_id {
 	FIXED_REG_ID_MMC = 0,
+	FIXED_REG_ID_5V,
 };
 
 static struct s3c2410_uartcfg origen_uartcfgs[] __initdata = {
@@ -101,6 +102,10 @@ static struct s3c2410_uartcfg origen_uartcfgs[] __initdata = {
 	},
 };
 
+static struct regulator_consumer_supply __initdata fixed_5v_supply[] = {
+	REGULATOR_SUPPLY("hdmi-en", "exynos4-hdmi"), /* HDMI */
+};
+
 static struct regulator_consumer_supply __initdata ldo3_consumer[] = {
 	REGULATOR_SUPPLY("vddcore", "s5p-mipi-csis.0"), /* MIPI */
 	REGULATOR_SUPPLY("vdd", "exynos4-hdmi"), /* HDMI */
@@ -836,6 +841,9 @@ static void __init origen_machine_init(void)
 	s5p_fimd0_set_platdata(&origen_lcd_pdata);
 #endif
 
+	regulator_register_always_on(FIXED_REG_ID_5V, "Fixed 5V",
+		fixed_5v_supply, ARRAY_SIZE(fixed_5v_supply), 5000000);
+
 	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
 
 	pwm_add_table(origen_pwm_lookup, ARRAY_SIZE(origen_pwm_lookup));
-- 
1.7.4.1
