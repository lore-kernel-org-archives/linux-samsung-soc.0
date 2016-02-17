From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RFT] regulator: s2mps11: Simplify expression used in BUILD_BUG_ON for
 some of preprocessors
Date: Wed, 17 Feb 2016 17:10:53 +0900
Message-ID: <1455696653-27023-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41379 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932574AbcBQILS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Feb 2016 03:11:18 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>

Apparently some preprocessors have problems with interpreting
BUILD_BUG_ON such as:
	var = ARRAY_SIZE(s2mps15_regulators);
	BUILD_BUG_ON(S2MPS_REGULATOR_MAX < var);
so let make it more obvious for them.

Additionally add missing BUILD_BUG_ON check for S2MPS15 device (the
check ensures that internal arrays are big enough to hold data for all
of regulators on all devices).

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

See results when UBSAN is enabled:
http://arm-soc.lixom.net/buildlogs/arm-soc/v4.5-rc4-39-g0d7baf0/buildall.arm.exynos_defconfig.log.failed
---
 drivers/regulator/s2mps11.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 3242ffc0cb25..df553fb40d82 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1090,26 +1090,27 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	case S2MPS11X:
 		s2mps11->rdev_num = ARRAY_SIZE(s2mps11_regulators);
 		regulators = s2mps11_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < s2mps11->rdev_num);
+		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps11_regulators));
 		break;
 	case S2MPS13X:
 		s2mps11->rdev_num = ARRAY_SIZE(s2mps13_regulators);
 		regulators = s2mps13_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < s2mps11->rdev_num);
+		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps13_regulators));
 		break;
 	case S2MPS14X:
 		s2mps11->rdev_num = ARRAY_SIZE(s2mps14_regulators);
 		regulators = s2mps14_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < s2mps11->rdev_num);
+		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps14_regulators));
 		break;
 	case S2MPS15X:
 		s2mps11->rdev_num = ARRAY_SIZE(s2mps15_regulators);
 		regulators = s2mps15_regulators;
+		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps15_regulators));
 		break;
 	case S2MPU02:
 		s2mps11->rdev_num = ARRAY_SIZE(s2mpu02_regulators);
 		regulators = s2mpu02_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < s2mps11->rdev_num);
+		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mpu02_regulators));
 		break;
 	default:
 		dev_err(&pdev->dev, "Invalid device type: %u\n",
-- 
2.5.0
