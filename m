From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v6 2/3] regulator: max77802: Remove suspend_enable
Date: Wed, 29 Oct 2014 12:14:53 +0100
Message-ID: <1414581294-1315-3-git-send-email-k.kozlowski@samsung.com>
References: <1414581294-1315-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:53669 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932383AbaJ2LPM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Oct 2014 07:15:12 -0400
In-reply-to: <1414581294-1315-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

The Maxim 77802 PMIC regulators do not have special enable configuration
for suspend. The driver instead enabled them manually which is not a
best way to deal with suspend.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/regulator/max77802.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/regulator/max77802.c b/drivers/regulator/max77802.c
index 5839c4509e1f..b9958d927297 100644
--- a/drivers/regulator/max77802.c
+++ b/drivers/regulator/max77802.c
@@ -295,7 +295,6 @@ static struct regulator_ops max77802_ldo_ops_logic1 = {
 	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
-	.set_suspend_enable	= max77802_enable,
 	.set_suspend_disable	= max77802_set_suspend_disable,
 	.set_suspend_mode	= max77802_set_suspend_mode,
 };
@@ -328,7 +327,6 @@ static struct regulator_ops max77802_buck_16_dvs_ops = {
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
 	.set_ramp_delay		= max77802_set_ramp_delay_4bit,
-	.set_suspend_enable	= max77802_enable,
 	.set_suspend_disable	= max77802_set_suspend_disable,
 };
 
@@ -343,7 +341,6 @@ static struct regulator_ops max77802_buck_234_ops = {
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
 	.set_ramp_delay		= max77802_set_ramp_delay_2bit,
-	.set_suspend_enable	= max77802_enable,
 	.set_suspend_disable	= max77802_set_suspend_disable,
 	.set_suspend_mode	= max77802_set_suspend_mode,
 };
@@ -359,7 +356,6 @@ static struct regulator_ops max77802_buck_dvs_ops = {
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
 	.set_ramp_delay		= max77802_set_ramp_delay_2bit,
-	.set_suspend_enable	= max77802_enable,
 	.set_suspend_disable	= max77802_set_suspend_disable,
 };
 
-- 
1.9.1
