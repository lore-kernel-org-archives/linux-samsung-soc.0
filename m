From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH] regulator: s2m,s5m: constify regulator_ops structures
Date: Sat, 19 Dec 2015 15:58:00 +0100
Message-ID: <1450537080-17387-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:55467 "EHLO
	mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753954AbbLSPK1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Dec 2015 10:10:27 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: kernel-janitors@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

The regulator_ops structures are never modified, so declare them as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/regulator/s2mpa01.c |    4 ++--
 drivers/regulator/s2mps11.c |   16 ++++++++--------
 drivers/regulator/s5m8767.c |    4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/regulator/s2mpa01.c b/drivers/regulator/s2mpa01.c
index 92f8875..dc2105c 100644
--- a/drivers/regulator/s2mpa01.c
+++ b/drivers/regulator/s2mpa01.c
@@ -212,7 +212,7 @@ ramp_disable:
 				  1 << enable_shift, 0);
 }
 
-static struct regulator_ops s2mpa01_ldo_ops = {
+static const struct regulator_ops s2mpa01_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -223,7 +223,7 @@ static struct regulator_ops s2mpa01_ldo_ops = {
 	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
 };
 
-static struct regulator_ops s2mpa01_buck_ops = {
+static const struct regulator_ops s2mpa01_buck_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 3242ffc..e5be2ad 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -236,7 +236,7 @@ ramp_disable:
 				  1 << enable_shift, 0);
 }
 
-static struct regulator_ops s2mps11_ldo_ops = {
+static const struct regulator_ops s2mps11_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -247,7 +247,7 @@ static struct regulator_ops s2mps11_ldo_ops = {
 	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
 };
 
-static struct regulator_ops s2mps11_buck_ops = {
+static const struct regulator_ops s2mps11_buck_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -373,7 +373,7 @@ static const struct regulator_desc s2mps11_regulators[] = {
 	regulator_desc_s2mps11_buck6_10(10, MIN_750_MV, STEP_12_5_MV),
 };
 
-static struct regulator_ops s2mps14_reg_ops;
+static const struct regulator_ops s2mps14_reg_ops;
 
 #define regulator_desc_s2mps13_ldo(num, min, step, min_sel) {	\
 	.name		= "LDO"#num,				\
@@ -580,7 +580,7 @@ static int s2mps14_regulator_set_suspend_disable(struct regulator_dev *rdev)
 			rdev->desc->enable_mask, state);
 }
 
-static struct regulator_ops s2mps14_reg_ops = {
+static const struct regulator_ops s2mps14_reg_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -662,7 +662,7 @@ static const struct regulator_desc s2mps14_regulators[] = {
 				    S2MPS14_BUCK1235_START_SEL),
 };
 
-static struct regulator_ops s2mps15_reg_ldo_ops = {
+static const struct regulator_ops s2mps15_reg_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.map_voltage		= regulator_map_voltage_linear_range,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -672,7 +672,7 @@ static struct regulator_ops s2mps15_reg_ldo_ops = {
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 };
 
-static struct regulator_ops s2mps15_reg_buck_ops = {
+static const struct regulator_ops s2mps15_reg_buck_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.map_voltage		= regulator_map_voltage_linear_range,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -866,7 +866,7 @@ static int s2mpu02_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
 				  ramp_val << ramp_shift);
 }
 
-static struct regulator_ops s2mpu02_ldo_ops = {
+static const struct regulator_ops s2mpu02_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -878,7 +878,7 @@ static struct regulator_ops s2mpu02_ldo_ops = {
 	.set_suspend_disable	= s2mps14_regulator_set_suspend_disable,
 };
 
-static struct regulator_ops s2mpu02_buck_ops = {
+static const struct regulator_ops s2mpu02_buck_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index 58f5d3b..34f63f1 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -356,7 +356,7 @@ static int s5m8767_set_voltage_time_sel(struct regulator_dev *rdev,
 	return 0;
 }
 
-static struct regulator_ops s5m8767_ops = {
+static const struct regulator_ops s5m8767_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
@@ -366,7 +366,7 @@ static struct regulator_ops s5m8767_ops = {
 	.set_voltage_time_sel	= s5m8767_set_voltage_time_sel,
 };
 
-static struct regulator_ops s5m8767_buck78_ops = {
+static const struct regulator_ops s5m8767_buck78_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
