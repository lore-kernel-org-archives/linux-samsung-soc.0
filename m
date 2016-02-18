From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] regulator: s2mps11: Use local variable for number of regulators
Date: Thu, 18 Feb 2016 14:57:03 +0900
Message-ID: <1455775023-16396-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:32907 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753765AbcBRF5S (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Feb 2016 00:57:18 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Andi Shyti <andi.shyti@samsung.com>

Remove the s2mps11_info.rdev_num because it is not used outside of
probe.

Suggested-by: Andi Shyti <andi.shyti@samsung.com>
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

Rebased on my previous patch:
[PATCH v2] regulator: s2mps11: Simplify expression used in BUILD_BUG_ON
---
 drivers/regulator/s2mps11.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index df553fb40d82..d24e2c783dc5 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -38,7 +38,6 @@
 /* The highest number of possible regulators for supported devices. */
 #define S2MPS_REGULATOR_MAX		S2MPS13_REGULATOR_MAX
 struct s2mps11_info {
-	unsigned int rdev_num;
 	int ramp_delay2;
 	int ramp_delay34;
 	int ramp_delay5;
@@ -54,7 +53,10 @@ struct s2mps11_info {
 	 */
 	DECLARE_BITMAP(suspend_state, S2MPS_REGULATOR_MAX);
 
-	/* Array of size rdev_num with GPIO-s for external sleep control */
+	/*
+	 * Array (size: number of regulators) with GPIO-s for external
+	 * sleep control.
+	 */
 	int *ext_control_gpio;
 };
 
@@ -819,7 +821,8 @@ static void s2mps14_pmic_dt_parse_ext_control_gpio(struct platform_device *pdev,
 }
 
 static int s2mps11_pmic_dt_parse(struct platform_device *pdev,
-		struct of_regulator_match *rdata, struct s2mps11_info *s2mps11)
+		struct of_regulator_match *rdata, struct s2mps11_info *s2mps11,
+		unsigned int rdev_num)
 {
 	struct device_node *reg_np;
 
@@ -829,7 +832,7 @@ static int s2mps11_pmic_dt_parse(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
-	of_regulator_match(&pdev->dev, reg_np, rdata, s2mps11->rdev_num);
+	of_regulator_match(&pdev->dev, reg_np, rdata, rdev_num);
 	if (s2mps11->dev_type == S2MPS14X)
 		s2mps14_pmic_dt_parse_ext_control_gpio(pdev, rdata, s2mps11);
 
@@ -1077,6 +1080,7 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	struct of_regulator_match *rdata = NULL;
 	struct regulator_config config = { };
 	struct s2mps11_info *s2mps11;
+	unsigned int rdev_num = 0;
 	int i, ret = 0;
 	const struct regulator_desc *regulators;
 
@@ -1088,27 +1092,27 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	s2mps11->dev_type = platform_get_device_id(pdev)->driver_data;
 	switch (s2mps11->dev_type) {
 	case S2MPS11X:
-		s2mps11->rdev_num = ARRAY_SIZE(s2mps11_regulators);
+		rdev_num = ARRAY_SIZE(s2mps11_regulators);
 		regulators = s2mps11_regulators;
 		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps11_regulators));
 		break;
 	case S2MPS13X:
-		s2mps11->rdev_num = ARRAY_SIZE(s2mps13_regulators);
+		rdev_num = ARRAY_SIZE(s2mps13_regulators);
 		regulators = s2mps13_regulators;
 		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps13_regulators));
 		break;
 	case S2MPS14X:
-		s2mps11->rdev_num = ARRAY_SIZE(s2mps14_regulators);
+		rdev_num = ARRAY_SIZE(s2mps14_regulators);
 		regulators = s2mps14_regulators;
 		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps14_regulators));
 		break;
 	case S2MPS15X:
-		s2mps11->rdev_num = ARRAY_SIZE(s2mps15_regulators);
+		rdev_num = ARRAY_SIZE(s2mps15_regulators);
 		regulators = s2mps15_regulators;
 		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps15_regulators));
 		break;
 	case S2MPU02:
-		s2mps11->rdev_num = ARRAY_SIZE(s2mpu02_regulators);
+		rdev_num = ARRAY_SIZE(s2mpu02_regulators);
 		regulators = s2mpu02_regulators;
 		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mpu02_regulators));
 		break;
@@ -1119,7 +1123,7 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	}
 
 	s2mps11->ext_control_gpio = devm_kmalloc(&pdev->dev,
-			sizeof(*s2mps11->ext_control_gpio) * s2mps11->rdev_num,
+			sizeof(*s2mps11->ext_control_gpio) * rdev_num,
 			GFP_KERNEL);
 	if (!s2mps11->ext_control_gpio)
 		return -ENOMEM;
@@ -1127,7 +1131,7 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	 * 0 is a valid GPIO so initialize all GPIO-s to negative value
 	 * to indicate that external control won't be used for this regulator.
 	 */
-	for (i = 0; i < s2mps11->rdev_num; i++)
+	for (i = 0; i < rdev_num; i++)
 		s2mps11->ext_control_gpio[i] = -EINVAL;
 
 	if (!iodev->dev->of_node) {
@@ -1141,14 +1145,14 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 		}
 	}
 
-	rdata = kzalloc(sizeof(*rdata) * s2mps11->rdev_num, GFP_KERNEL);
+	rdata = kzalloc(sizeof(*rdata) * rdev_num, GFP_KERNEL);
 	if (!rdata)
 		return -ENOMEM;
 
-	for (i = 0; i < s2mps11->rdev_num; i++)
+	for (i = 0; i < rdev_num; i++)
 		rdata[i].name = regulators[i].name;
 
-	ret = s2mps11_pmic_dt_parse(pdev, rdata, s2mps11);
+	ret = s2mps11_pmic_dt_parse(pdev, rdata, s2mps11, rdev_num);
 	if (ret)
 		goto out;
 
@@ -1160,7 +1164,7 @@ common_reg:
 	config.driver_data = s2mps11;
 	config.ena_gpio_flags = GPIOF_OUT_INIT_HIGH;
 	config.ena_gpio_initialized = true;
-	for (i = 0; i < s2mps11->rdev_num; i++) {
+	for (i = 0; i < rdev_num; i++) {
 		struct regulator_dev *regulator;
 
 		if (pdata) {
-- 
2.5.0
