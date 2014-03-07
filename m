From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 2/3] regulator: s2mps11: Add set_suspend_disable for S2MPS14
Date: Fri, 07 Mar 2014 11:10:51 +0100
Message-ID: <1394187052-591-3-git-send-email-k.kozlowski@samsung.com>
References: <1394187052-591-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1394187052-591-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

S2MPS14 regulators support suspend mode where their status is controlled
by PWREN coming from SoC. This patch implements the set_suspend_disable
for S2MPS14 regulators.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/regulator/s2mps11.c         |   51 ++++++++++++++++++++++++++++++++++-
 include/linux/mfd/samsung/s2mps14.h |    2 ++
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 1a732e54cd70..94901c47397e 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -39,6 +39,11 @@ struct s2mps11_info {
 	int ramp_delay16;
 	int ramp_delay7810;
 	int ramp_delay9;
+	/*
+	 * One bit for each S2MPS14 regulator whether the suspend mode
+	 * was enabled.
+	 */
+	unsigned int s2mps14_suspend_state:30;
 };
 
 static int get_ramp_delay(int ramp_delay)
@@ -399,15 +404,59 @@ static const struct regulator_desc s2mps11_regulators[] = {
 	regulator_desc_s2mps11_buck10,
 };
 
+static int s2mps14_regulator_enable(struct regulator_dev *rdev)
+{
+	struct s2mps11_info *s2mps11 = rdev_get_drvdata(rdev);
+	unsigned int val;
+
+	if (s2mps11->s2mps14_suspend_state & (1 << rdev_get_id(rdev)))
+		val = S2MPS14_ENABLE_SUSPEND;
+	else
+		val = rdev->desc->enable_mask;
+
+	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
+			rdev->desc->enable_mask, val);
+}
+
+static int s2mps14_regulator_set_suspend_disable(struct regulator_dev *rdev)
+{
+	int ret;
+	unsigned int val;
+	struct s2mps11_info *s2mps11 = rdev_get_drvdata(rdev);
+
+	/* LDO3 should be always on and does not support suspend mode */
+	if (rdev_get_id(rdev) == S2MPS14_LDO3)
+		return 0;
+
+	ret = regmap_read(rdev->regmap, rdev->desc->enable_reg, &val);
+	if (ret < 0)
+		return ret;
+
+	s2mps11->s2mps14_suspend_state |= (1 << rdev_get_id(rdev));
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
+			rdev->desc->enable_mask, S2MPS14_ENABLE_SUSPEND);
+}
+
 static struct regulator_ops s2mps14_reg_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
-	.enable			= regulator_enable_regmap,
+	.enable			= s2mps14_regulator_enable,
 	.disable		= regulator_disable_regmap,
 	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+	.set_suspend_disable	= s2mps14_regulator_set_suspend_disable,
 };
 
 #define regulator_desc_s2mps14_ldo1(num) {		\
diff --git a/include/linux/mfd/samsung/s2mps14.h b/include/linux/mfd/samsung/s2mps14.h
index ec1e0857ddde..4b449b8ac548 100644
--- a/include/linux/mfd/samsung/s2mps14.h
+++ b/include/linux/mfd/samsung/s2mps14.h
@@ -146,6 +146,8 @@ enum s2mps14_regulators {
 #define S2MPS14_BUCK_VSEL_MASK		0xFF
 #define S2MPS14_ENABLE_MASK		(0x03 << S2MPS14_ENABLE_SHIFT)
 #define S2MPS14_ENABLE_SHIFT		6
+/* On/Off controlled by PWREN */
+#define S2MPS14_ENABLE_SUSPEND		(0x01 << S2MPS14_ENABLE_SHIFT)
 #define S2MPS14_LDO_N_VOLTAGES		(S2MPS14_LDO_VSEL_MASK + 1)
 #define S2MPS14_BUCK_N_VOLTAGES		(S2MPS14_BUCK_VSEL_MASK + 1)
 
-- 
1.7.9.5
