From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/6] regulator: s2mps11: Add support for disabling S2MPS11 regulators in suspend
Date: Thu, 20 Jun 2019 20:35:27 +0200
Message-ID: <20190620183530.5386-3-krzk@kernel.org>
References: <20190620183530.5386-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190620183530.5386-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, notify@kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

The driver supported turning off regulators in suspend only for S2MPS14
device.  However this makes also sense for S2MPS11 and can reduce the
power consumption during suspend to RAM.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/regulator/s2mps11.c         | 210 +++++++++++++++-------------
 include/linux/mfd/samsung/s2mps11.h |   5 +
 2 files changed, 120 insertions(+), 95 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index da3a746e65dc..6a83960822d4 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -34,7 +34,7 @@ struct s2mps11_info {
 	enum sec_device_type dev_type;
 
 	/*
-	 * One bit for each S2MPS13/S2MPS14/S2MPU02 regulator whether
+	 * One bit for each S2MPS11/S2MPS13/S2MPS14/S2MPU02 regulator whether
 	 * the suspend mode was enabled.
 	 */
 	DECLARE_BITMAP(suspend_state, S2MPS_REGULATOR_MAX);
@@ -225,27 +225,133 @@ static int s2mps11_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
 				  1 << enable_shift, 0);
 }
 
+static int s2mps11_regulator_enable(struct regulator_dev *rdev)
+{
+	struct s2mps11_info *s2mps11 = rdev_get_drvdata(rdev);
+	int rdev_id = rdev_get_id(rdev);
+	unsigned int val;
+
+	switch (s2mps11->dev_type) {
+	case S2MPS11X:
+		if (test_bit(rdev_id, s2mps11->suspend_state))
+			val = S2MPS14_ENABLE_SUSPEND;
+		else
+			val = rdev->desc->enable_mask;
+		break;
+	case S2MPS13X:
+	case S2MPS14X:
+		if (test_bit(rdev_id, s2mps11->suspend_state))
+			val = S2MPS14_ENABLE_SUSPEND;
+		else if (s2mps11->ext_control_gpiod[rdev_id])
+			val = S2MPS14_ENABLE_EXT_CONTROL;
+		else
+			val = rdev->desc->enable_mask;
+		break;
+	case S2MPU02:
+		if (test_bit(rdev_id, s2mps11->suspend_state))
+			val = S2MPU02_ENABLE_SUSPEND;
+		else
+			val = rdev->desc->enable_mask;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
+			rdev->desc->enable_mask, val);
+}
+
+static int s2mps11_regulator_set_suspend_disable(struct regulator_dev *rdev)
+{
+	int ret;
+	unsigned int val, state;
+	struct s2mps11_info *s2mps11 = rdev_get_drvdata(rdev);
+	int rdev_id = rdev_get_id(rdev);
+
+	/* Below LDO should be always on or does not support suspend mode. */
+	switch (s2mps11->dev_type) {
+	case S2MPS11X:
+		switch (rdev_id) {
+		case S2MPS11_LDO2:
+		case S2MPS11_LDO36:
+		case S2MPS11_LDO37:
+		case S2MPS11_LDO38:
+			return 0;
+		default:
+			state = S2MPS14_ENABLE_SUSPEND;
+			break;
+		}
+		break;
+	case S2MPS13X:
+	case S2MPS14X:
+		switch (rdev_id) {
+		case S2MPS14_LDO3:
+			return 0;
+		default:
+			state = S2MPS14_ENABLE_SUSPEND;
+			break;
+		}
+		break;
+	case S2MPU02:
+		switch (rdev_id) {
+		case S2MPU02_LDO13:
+		case S2MPU02_LDO14:
+		case S2MPU02_LDO15:
+		case S2MPU02_LDO17:
+		case S2MPU02_BUCK7:
+			state = S2MPU02_DISABLE_SUSPEND;
+			break;
+		default:
+			state = S2MPU02_ENABLE_SUSPEND;
+			break;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = regmap_read(rdev->regmap, rdev->desc->enable_reg, &val);
+	if (ret < 0)
+		return ret;
+
+	set_bit(rdev_id, s2mps11->suspend_state);
+	/*
+	 * Don't enable suspend mode if regulator is already disabled because
+	 * this would effectively for a short time turn on the regulator after
+	 * resuming.
+	 * However we still want to toggle the suspend_state bit for regulator
+	 * in case if it got enabled before suspending the system.
+	 */
+	if (!(val & rdev->desc->enable_mask))
+		return 0;
+
+	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
+				  rdev->desc->enable_mask, state);
+}
+
 static const struct regulator_ops s2mps11_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
-	.enable			= regulator_enable_regmap,
+	.enable			= s2mps11_regulator_enable,
 	.disable		= regulator_disable_regmap,
 	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+	.set_suspend_disable	= s2mps11_regulator_set_suspend_disable,
 };
 
 static const struct regulator_ops s2mps11_buck_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
-	.enable			= regulator_enable_regmap,
+	.enable			= s2mps11_regulator_enable,
 	.disable		= regulator_disable_regmap,
 	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.set_voltage_time_sel	= s2mps11_regulator_set_voltage_time_sel,
 	.set_ramp_delay		= s2mps11_set_ramp_delay,
+	.set_suspend_disable	= s2mps11_regulator_set_suspend_disable,
 };
 
 #define regulator_desc_s2mps11_ldo(num, step) {		\
@@ -501,102 +607,16 @@ static const struct regulator_desc s2mps13_regulators[] = {
 	regulator_desc_s2mps13_buck8_10(10, MIN_500_MV,  STEP_6_25_MV, 0x10),
 };
 
-static int s2mps14_regulator_enable(struct regulator_dev *rdev)
-{
-	struct s2mps11_info *s2mps11 = rdev_get_drvdata(rdev);
-	int rdev_id = rdev_get_id(rdev);
-	unsigned int val;
-
-	switch (s2mps11->dev_type) {
-	case S2MPS13X:
-	case S2MPS14X:
-		if (test_bit(rdev_id, s2mps11->suspend_state))
-			val = S2MPS14_ENABLE_SUSPEND;
-		else if (s2mps11->ext_control_gpiod[rdev_id])
-			val = S2MPS14_ENABLE_EXT_CONTROL;
-		else
-			val = rdev->desc->enable_mask;
-		break;
-	case S2MPU02:
-		if (test_bit(rdev_id, s2mps11->suspend_state))
-			val = S2MPU02_ENABLE_SUSPEND;
-		else
-			val = rdev->desc->enable_mask;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
-			rdev->desc->enable_mask, val);
-}
-
-static int s2mps14_regulator_set_suspend_disable(struct regulator_dev *rdev)
-{
-	int ret;
-	unsigned int val, state;
-	struct s2mps11_info *s2mps11 = rdev_get_drvdata(rdev);
-	int rdev_id = rdev_get_id(rdev);
-
-	/* Below LDO should be always on or does not support suspend mode. */
-	switch (s2mps11->dev_type) {
-	case S2MPS13X:
-	case S2MPS14X:
-		switch (rdev_id) {
-		case S2MPS14_LDO3:
-			return 0;
-		default:
-			state = S2MPS14_ENABLE_SUSPEND;
-			break;
-		}
-		break;
-	case S2MPU02:
-		switch (rdev_id) {
-		case S2MPU02_LDO13:
-		case S2MPU02_LDO14:
-		case S2MPU02_LDO15:
-		case S2MPU02_LDO17:
-		case S2MPU02_BUCK7:
-			state = S2MPU02_DISABLE_SUSPEND;
-			break;
-		default:
-			state = S2MPU02_ENABLE_SUSPEND;
-			break;
-		}
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	ret = regmap_read(rdev->regmap, rdev->desc->enable_reg, &val);
-	if (ret < 0)
-		return ret;
-
-	set_bit(rdev_id, s2mps11->suspend_state);
-	/*
-	 * Don't enable suspend mode if regulator is already disabled because
-	 * this would effectively for a short time turn on the regulator after
-	 * resuming.
-	 * However we still want to toggle the suspend_state bit for regulator
-	 * in case if it got enabled before suspending the system.
-	 */
-	if (!(val & rdev->desc->enable_mask))
-		return 0;
-
-	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
-			rdev->desc->enable_mask, state);
-}
-
 static const struct regulator_ops s2mps14_reg_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
-	.enable			= s2mps14_regulator_enable,
+	.enable			= s2mps11_regulator_enable,
 	.disable		= regulator_disable_regmap,
 	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
-	.set_suspend_disable	= s2mps14_regulator_set_suspend_disable,
+	.set_suspend_disable	= s2mps11_regulator_set_suspend_disable,
 };
 
 #define regulator_desc_s2mps14_ldo(num, min, step) {	\
@@ -889,24 +909,24 @@ static const struct regulator_ops s2mpu02_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
-	.enable			= s2mps14_regulator_enable,
+	.enable			= s2mps11_regulator_enable,
 	.disable		= regulator_disable_regmap,
 	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
-	.set_suspend_disable	= s2mps14_regulator_set_suspend_disable,
+	.set_suspend_disable	= s2mps11_regulator_set_suspend_disable,
 };
 
 static const struct regulator_ops s2mpu02_buck_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
-	.enable			= s2mps14_regulator_enable,
+	.enable			= s2mps11_regulator_enable,
 	.disable		= regulator_disable_regmap,
 	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
-	.set_suspend_disable	= s2mps14_regulator_set_suspend_disable,
+	.set_suspend_disable	= s2mps11_regulator_set_suspend_disable,
 	.set_ramp_delay		= s2mpu02_set_ramp_delay,
 };
 
diff --git a/include/linux/mfd/samsung/s2mps11.h b/include/linux/mfd/samsung/s2mps11.h
index 6e7668a389a1..f6c035eb87be 100644
--- a/include/linux/mfd/samsung/s2mps11.h
+++ b/include/linux/mfd/samsung/s2mps11.h
@@ -188,4 +188,9 @@ enum s2mps11_regulators {
 #define S2MPS11_BUCK6_RAMP_EN_SHIFT	0
 #define S2MPS11_PMIC_EN_SHIFT	6
 
+/*
+ * Bits for "enable suspend" (On/Off controlled by PWREN)
+ * are the same as in S2MPS14: S2MPS14_ENABLE_SUSPEND
+ */
+
 #endif /*  __LINUX_MFD_S2MPS11_H */
-- 
2.17.1
