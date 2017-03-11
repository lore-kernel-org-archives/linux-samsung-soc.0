From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 5/7] regulator: s2mps11: Constify regulator_ops
Date: Sat, 11 Mar 2017 21:01:22 +0200
Message-ID: <20170311190124.11512-5-krzk@kernel.org>
References: <20170311190124.11512-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170311190124.11512-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Static struct regulator_ops is not modified so can be made const for
code safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/regulator/s2mps11.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index d838e77dd947..7726b874e539 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -238,7 +238,7 @@ static int s2mps11_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
 				  1 << enable_shift, 0);
 }
 
-static struct regulator_ops s2mps11_ldo_ops = {
+static const struct regulator_ops s2mps11_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -249,7 +249,7 @@ static struct regulator_ops s2mps11_ldo_ops = {
 	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
 };
 
-static struct regulator_ops s2mps11_buck_ops = {
+static const struct regulator_ops s2mps11_buck_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -392,7 +392,7 @@ static const struct regulator_desc s2mps11_regulators[] = {
 	regulator_desc_s2mps11_buck67810(10, MIN_750_MV, STEP_12_5_MV),
 };
 
-static struct regulator_ops s2mps14_reg_ops;
+static const struct regulator_ops s2mps14_reg_ops;
 
 #define regulator_desc_s2mps13_ldo(num, min, step, min_sel) {	\
 	.name		= "LDO"#num,				\
@@ -599,7 +599,7 @@ static int s2mps14_regulator_set_suspend_disable(struct regulator_dev *rdev)
 			rdev->desc->enable_mask, state);
 }
 
-static struct regulator_ops s2mps14_reg_ops = {
+static const struct regulator_ops s2mps14_reg_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -681,7 +681,7 @@ static const struct regulator_desc s2mps14_regulators[] = {
 				    S2MPS14_BUCK1235_START_SEL),
 };
 
-static struct regulator_ops s2mps15_reg_ldo_ops = {
+static const struct regulator_ops s2mps15_reg_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.map_voltage		= regulator_map_voltage_linear_range,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -691,7 +691,7 @@ static struct regulator_ops s2mps15_reg_ldo_ops = {
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 };
 
-static struct regulator_ops s2mps15_reg_buck_ops = {
+static const struct regulator_ops s2mps15_reg_buck_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.map_voltage		= regulator_map_voltage_linear_range,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -886,7 +886,7 @@ static int s2mpu02_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
 				  ramp_val << ramp_shift);
 }
 
-static struct regulator_ops s2mpu02_ldo_ops = {
+static const struct regulator_ops s2mpu02_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -898,7 +898,7 @@ static struct regulator_ops s2mpu02_ldo_ops = {
 	.set_suspend_disable	= s2mps14_regulator_set_suspend_disable,
 };
 
-static struct regulator_ops s2mpu02_buck_ops = {
+static const struct regulator_ops s2mpu02_buck_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
-- 
2.9.3
