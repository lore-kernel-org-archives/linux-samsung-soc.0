From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] regulator: s2mps11: Remove unused set_voltage_time_sel
Date: Mon, 18 Apr 2016 09:42:58 +0200
Message-ID: <1460965378-5256-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:28954 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751454AbcDRHna (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Apr 2016 03:43:30 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On S2MPS11 and S2MPS14 devices the default implementation of
set_voltage_time_sel() for LDO regulators was not doing anything useful
because users did not provide ramp delay in Device Tree so the
set_voltage_time_sel() exited with status 0. This could be seen in
dmesg, e.g. on Odroid XU4:

[    1.486076] vdd_ldo9: ramp_delay not set
[    1.506875] vddq_mmc2: ramp_delay not set
[    1.523766] vdd_ldo15: ramp_delay not set
[    1.544702] vdd_sd: ramp_delay not set

The datasheet for these devices is inconsistent and does not specify
unambiguously the value of ramp delay for LDO. It mentions 30 mV/us in
one timing diagram but then omits it completely in LDO regulator
characteristics table (it is specified for bucks). To make more
confusion, the vendor kernel for Galaxy S5 and Odroid XU3 uses sometimes
value of 12 mV/us.

Overall, since the ramp delay is not currently provided by DT and it is
unclear what is the correct value anyway, the safest choice seems to be
to remove the implementation of set_voltage_time_sel() for S2MPS11 and
S2MPS14 LDOs thus getting rid of the warning.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/regulator/s2mps11.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 64a262f10845..437b1b3b26c9 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -246,7 +246,6 @@ static struct regulator_ops s2mps11_ldo_ops = {
 	.disable		= regulator_disable_regmap,
 	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
-	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
 };
 
 static struct regulator_ops s2mps11_buck_ops = {
@@ -606,7 +605,6 @@ static struct regulator_ops s2mps14_reg_ops = {
 	.disable		= regulator_disable_regmap,
 	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
-	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
 	.set_suspend_disable	= s2mps14_regulator_set_suspend_disable,
 };
 
-- 
1.9.1
