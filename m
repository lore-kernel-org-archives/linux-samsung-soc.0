From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 2/2] arm: exynos: allow platform-lcd driver to control lcd
 regulator source on origen
Date: Mon, 05 Dec 2011 14:22:28 +0530
Message-ID: <1323075148-29356-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46005 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752602Ab1LEIus (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Dec 2011 03:50:48 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVQ006Z738K4TD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Dec 2011 17:50:47 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVQ0005738G9A10@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 05 Dec 2011 17:50:47 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: rpurdie@rpsys.net, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, patches@linaro.org, jhkim@insignal.co.kr, inderpal.singh@linaro.org, tushar.behera@linaro.org

The buck7 regulator of max8997 pmic which provides the power source to lcd panel
and the lvds transmitter is allowed to be controlled by the platform-lcd driver.
It is not required to apply the voltage source by default. Also, the voltage
range for buck7 regulator is modified as the per the values in the datasheet.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/mach-origen.c |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index f56d027..5456254 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -126,7 +126,7 @@ static struct regulator_consumer_supply __initdata buck3_consumer[] = {
 	REGULATOR_SUPPLY("vdd_g3d", "mali_drm"), /* G3D */
 };
 static struct regulator_consumer_supply __initdata buck7_consumer[] = {
-	REGULATOR_SUPPLY("vcc", "platform-lcd"), /* LCD */
+	REGULATOR_SUPPLY("vcc_lcd", "platform-lcd.0"), /* LCD */
 };
 
 static struct regulator_init_data __initdata max8997_ldo1_data = {
@@ -379,11 +379,11 @@ static struct regulator_init_data __initdata max8997_buck5_data = {
 static struct regulator_init_data __initdata max8997_buck7_data = {
 	.constraints	= {
 		.name		= "VDD_LCD_3.3V",
-		.min_uV		= 3300000,
-		.max_uV		= 3300000,
+		.min_uV		= 750000,
+		.max_uV		= 3900000,
 		.boot_on	= 1,
-		.apply_uV	= 1,
-		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS |
+					REGULATOR_CHANGE_VOLTAGE,
 		.state_mem	= {
 			.disabled	= 1
 		},
@@ -562,6 +562,8 @@ static void lcd_hv070wsa_set_power(struct plat_lcd_data *pd, unsigned int power)
 
 static struct plat_lcd_data origen_lcd_hv070wsa_data = {
 	.set_power = lcd_hv070wsa_set_power,
+	.min_uV		= 3300000,
+	.max_uV		= 3300000,
 };
 
 static struct platform_device origen_lcd_hv070wsa = {
-- 
1.6.6.rc2
