From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH RESEND] regulator: s2mps11: Fix GPIO suspend enable shift wrapping bug
Date: Wed, 24 Jun 2015 19:48:43 +0900
Message-ID: <1435142923-31815-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Status of enabling suspend mode for regulator was stored in bitmap-like
long integer.

However since adding support for S2MPU02 the number of regulators
exceeded 32 so on devices with more than 32 regulators (S2MPU02 and
S2MPS13) overflow happens when shifting the bit. This could lead to
enabling suspend mode for completely different regulator than intended
or to switching different regulator to other mode (e.g. from always
enabled to controlled by PWRHOLD pin). Both cases could result in larger
energy usage and issues when suspending to RAM.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: <stable@vger.kernel.org>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: 00e2573d2c10 ("regulator: s2mps11: Add support S2MPU02 regulator device")
---
 drivers/regulator/s2mps11.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 326ffb553371..72fc3c32db49 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -34,6 +34,8 @@
 #include <linux/mfd/samsung/s2mps14.h>
 #include <linux/mfd/samsung/s2mpu02.h>
 
+/* The highest number of possible regulators for supported devices. */
+#define S2MPS_REGULATOR_MAX		S2MPS13_REGULATOR_MAX
 struct s2mps11_info {
 	unsigned int rdev_num;
 	int ramp_delay2;
@@ -49,7 +51,7 @@ struct s2mps11_info {
 	 * One bit for each S2MPS13/S2MPS14/S2MPU02 regulator whether
 	 * the suspend mode was enabled.
 	 */
-	unsigned long long s2mps14_suspend_state:50;
+	DECLARE_BITMAP(suspend_state, S2MPS_REGULATOR_MAX);
 
 	/* Array of size rdev_num with GPIO-s for external sleep control */
 	int *ext_control_gpio;
@@ -500,7 +502,7 @@ static int s2mps14_regulator_enable(struct regulator_dev *rdev)
 	switch (s2mps11->dev_type) {
 	case S2MPS13X:
 	case S2MPS14X:
-		if (s2mps11->s2mps14_suspend_state & (1 << rdev_get_id(rdev)))
+		if (test_bit(rdev_get_id(rdev), s2mps11->suspend_state))
 			val = S2MPS14_ENABLE_SUSPEND;
 		else if (gpio_is_valid(s2mps11->ext_control_gpio[rdev_get_id(rdev)]))
 			val = S2MPS14_ENABLE_EXT_CONTROL;
@@ -508,7 +510,7 @@ static int s2mps14_regulator_enable(struct regulator_dev *rdev)
 			val = rdev->desc->enable_mask;
 		break;
 	case S2MPU02:
-		if (s2mps11->s2mps14_suspend_state & (1 << rdev_get_id(rdev)))
+		if (test_bit(rdev_get_id(rdev), s2mps11->suspend_state))
 			val = S2MPU02_ENABLE_SUSPEND;
 		else
 			val = rdev->desc->enable_mask;
@@ -562,7 +564,7 @@ static int s2mps14_regulator_set_suspend_disable(struct regulator_dev *rdev)
 	if (ret < 0)
 		return ret;
 
-	s2mps11->s2mps14_suspend_state |= (1 << rdev_get_id(rdev));
+	set_bit(rdev_get_id(rdev), s2mps11->suspend_state);
 	/*
 	 * Don't enable suspend mode if regulator is already disabled because
 	 * this would effectively for a short time turn on the regulator after
@@ -960,18 +962,22 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	case S2MPS11X:
 		s2mps11->rdev_num = ARRAY_SIZE(s2mps11_regulators);
 		regulators = s2mps11_regulators;
+		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < s2mps11->rdev_num);
 		break;
 	case S2MPS13X:
 		s2mps11->rdev_num = ARRAY_SIZE(s2mps13_regulators);
 		regulators = s2mps13_regulators;
+		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < s2mps11->rdev_num);
 		break;
 	case S2MPS14X:
 		s2mps11->rdev_num = ARRAY_SIZE(s2mps14_regulators);
 		regulators = s2mps14_regulators;
+		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < s2mps11->rdev_num);
 		break;
 	case S2MPU02:
 		s2mps11->rdev_num = ARRAY_SIZE(s2mpu02_regulators);
 		regulators = s2mpu02_regulators;
+		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < s2mps11->rdev_num);
 		break;
 	default:
 		dev_err(&pdev->dev, "Invalid device type: %u\n",
-- 
2.1.4
