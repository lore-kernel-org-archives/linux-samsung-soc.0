From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] regulator: max8997: skip gpio dvs setup if not used
Date: Wed, 21 Nov 2012 19:53:15 +0530
Message-ID: <1353507795-3516-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: broonie@opensource.wolfsonmicro.com, myungjoo.ham@samsung.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

If gpio based voltage selection for buck 1/2/5 are not used, then the execution
of gpio dvs setup code during probe can be skipped completly.

Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 drivers/regulator/max8997.c |   31 ++++++++++++++++++-------------
 1 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/regulator/max8997.c b/drivers/regulator/max8997.c
index cea9ec9..e81a381 100644
--- a/drivers/regulator/max8997.c
+++ b/drivers/regulator/max8997.c
@@ -973,6 +973,10 @@ static int max8997_pmic_probe(struct platform_device *pdev)
 	memcpy(max8997->buck125_gpios, pdata->buck125_gpios, sizeof(int) * 3);
 	max8997->ignore_gpiodvs_side_effect = pdata->ignore_gpiodvs_side_effect;
 
+	if (!pdata->buck1_gpiodvs && !pdata->buck2_gpiodvs &&
+			!pdata->buck5_gpiodvs)
+		goto skip_gpiodvs;
+
 	for (i = 0; i < 8; i++) {
 		max8997->buck1_vol[i] = ret =
 			max8997_get_voltage_proper_val(
@@ -1019,6 +1023,19 @@ static int max8997_pmic_probe(struct platform_device *pdev)
 				max_buck5, 0x3f);
 	}
 
+	/* Initialize all the DVS related BUCK registers */
+	for (i = 0; i < 8; i++) {
+		max8997_update_reg(i2c, MAX8997_REG_BUCK1DVS1 + i,
+				max8997->buck1_vol[i],
+				0x3f);
+		max8997_update_reg(i2c, MAX8997_REG_BUCK2DVS1 + i,
+				max8997->buck2_vol[i],
+				0x3f);
+		max8997_update_reg(i2c, MAX8997_REG_BUCK5DVS1 + i,
+				max8997->buck5_vol[i],
+				0x3f);
+	}
+
 	/*
 	 * If buck 1, 2, and 5 do not care DVS GPIO settings, ignore them.
 	 * If at least one of them cares, set gpios.
@@ -1060,6 +1077,7 @@ static int max8997_pmic_probe(struct platform_device *pdev)
 				& 0x1); /* SET3 */
 	}
 
+skip_gpiodvs:
 	/* DVS-GPIO disabled */
 	max8997_update_reg(i2c, MAX8997_REG_BUCK1CTRL, (pdata->buck1_gpiodvs) ?
 			(1 << 1) : (0 << 1), 1 << 1);
@@ -1068,19 +1086,6 @@ static int max8997_pmic_probe(struct platform_device *pdev)
 	max8997_update_reg(i2c, MAX8997_REG_BUCK5CTRL, (pdata->buck5_gpiodvs) ?
 			(1 << 1) : (0 << 1), 1 << 1);
 
-	/* Initialize all the DVS related BUCK registers */
-	for (i = 0; i < 8; i++) {
-		max8997_update_reg(i2c, MAX8997_REG_BUCK1DVS1 + i,
-				max8997->buck1_vol[i],
-				0x3f);
-		max8997_update_reg(i2c, MAX8997_REG_BUCK2DVS1 + i,
-				max8997->buck2_vol[i],
-				0x3f);
-		max8997_update_reg(i2c, MAX8997_REG_BUCK5DVS1 + i,
-				max8997->buck5_vol[i],
-				0x3f);
-	}
-
 	/* Misc Settings */
 	max8997->ramp_delay = 10; /* set 10mV/us, which is the default */
 	max8997_write_reg(i2c, MAX8997_REG_BUCKRAMP, (0xf << 4) | 0x9);
-- 
1.6.6.rc2
