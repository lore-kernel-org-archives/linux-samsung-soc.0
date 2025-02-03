Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA7420FAA2;
	Mon,  3 Feb 2025 20:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615101; cv=none; b=AmilYipAKU3e1NfeR0fzdrtyk0PILISWAG1ByS34rFHnxUmOL9+/XZwLcH1rAPvw9uoeM/b4HXtSc1m18JbFKN9j+iDxykUCyYTRQXFhairEpNsAV6JmwtzIPUvGDVhYIu0PPIVzITU0bqd+7G33MjENX9QRj6FowNiFnJqqIKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615101; c=relaxed/simple;
	bh=63YXWZBkuXKdRFjxbVSxp1izmPM0LMQEuDrqMDmf5z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W9rRkM4bUaTNLOxFB62ss+iD4WkkxPvm+tvoGVYOZ/ziWKaYK0q13tj0dMkpu+GXHr1cSqVf1uMePj/d4DAKQDE5vtkUUAHpjqYj9tjEDrp3ZTVGX+10A90XDO0axqX2LCxE+vJT3Hjkhc1cxlehhF+RBEek7a40QpGu8nEl3QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=gNAX3Boz; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="gNAX3Boz"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EAB82252CB;
	Mon,  3 Feb 2025 21:38:17 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3AMHMFaBVCI; Mon,  3 Feb 2025 21:38:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615039; bh=63YXWZBkuXKdRFjxbVSxp1izmPM0LMQEuDrqMDmf5z0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gNAX3BozRsz5LsEwAvGwySPhsmxKJiV/gsa12jojUpYDZApg6buKX5orDwhJVdPBj
	 VJNeXtYIB9TVPkZ1iZ1ktVjO15Nm+6RUdP8QPwSt2/nIDQ1hxJQVQ8e8Y+CBQR4kmO
	 2hJntA8CY3YzhAh1feg41WJBTYkJ3+rc0kBNNZ2RVQ3FLnL1Zf6nRMkOabmhZqEy5c
	 7eYlFnH3W4NE5LxAZa4CdnXviPNb90HJMd9MEoXJmzcSV9lezp9W/ePbwKlGTp7Fxt
	 gh9ddmO9Xx8ZEskRM38m7aDrGHanbNZrISJcvkkItFW3h/2O3xSvpJoaOcuNAxp4JI
	 /TpD8y0qpmRIg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:06:29 +0530
Subject: [PATCH 4/4] regulator: s2mps11: Add support for S2MPU05 regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-pmic-regulators-v1-4-05adad38102c@disroot.org>
References: <20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org>
In-Reply-To: <20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614996; l=6437;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=5veW78R5bcgmPHLWUutBj0HeF5ve3MlOtkO3lsftvkQ=;
 b=TIy0vflj3VjmDBCFrzwTUzZSAOziRRqvc0pLtt7HADWTGntZdGSy1O/zcs8yEaJ23C9xvP/nm
 X66Pgyc5oBuD1kXfM2ND06Gs41uBu/RnLJ7zpB+UdwKw0J3UWH7BYLa
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

From: Sergey Lisov <sleirsgoevy@gmail.com>

S2MPU05 is a PMIC by manufactured by Samsung, particularly used in
Exynos7870 based devices. Add driver support for controlling its 21 LDO
and 5 BUCK regulators.

Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/regulator/Kconfig   |  4 +-
 drivers/regulator/s2mps11.c | 92 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 93 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 39297f7d8177193e51c99bc2b360c6d9936e62fe..e47ef257696e2ff3745affa1a403a29f086a2833 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1330,10 +1330,10 @@ config REGULATOR_S2MPA01
 	 via I2C bus. S2MPA01 has 10 Bucks and 26 LDO outputs.
 
 config REGULATOR_S2MPS11
-	tristate "Samsung S2MPS11/13/14/15/S2MPU02 voltage regulator"
+	tristate "Samsung S2MPS11/13/14/15/S2MPU02/05 voltage regulator"
 	depends on MFD_SEC_CORE || COMPILE_TEST
 	help
-	 This driver supports a Samsung S2MPS11/13/14/15/S2MPU02 voltage
+	 This driver supports a Samsung S2MPS11/13/14/15/S2MPU02/05 voltage
 	 output regulator via I2C bus. The chip is comprised of high efficient
 	 Buck converters including Dual-Phase Buck converter, Buck-Boost
 	 converter, various LDOs.
diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 7dcf92af8f15e63fb634d978fba41df0ca09fd65..4146c15317f0a87b16026a942a72a7e1b9fbca4c 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -21,6 +21,7 @@
 #include <linux/mfd/samsung/s2mps14.h>
 #include <linux/mfd/samsung/s2mps15.h>
 #include <linux/mfd/samsung/s2mpu02.h>
+#include <linux/mfd/samsung/s2mpu05.h>
 
 /* The highest number of possible regulators for supported devices. */
 #define S2MPS_REGULATOR_MAX		S2MPS13_REGULATOR_MAX
@@ -254,6 +255,9 @@ static int s2mps11_regulator_enable(struct regulator_dev *rdev)
 		else
 			val = rdev->desc->enable_mask;
 		break;
+	case S2MPU05:
+		val = rdev->desc->enable_mask;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1118,6 +1122,86 @@ static const struct regulator_desc s2mpu02_regulators[] = {
 	regulator_desc_s2mpu02_buck7(7),
 };
 
+#define regulator_desc_s2mpu05_ldo_reg(num, min, step, reg) {	\
+	.name		= "LDO"#num,				\
+	.id		= S2MPU05_LDO##num,			\
+	.ops		= &s2mpu02_ldo_ops,			\
+	.type		= REGULATOR_VOLTAGE,			\
+	.owner		= THIS_MODULE,				\
+	.min_uV		= min,					\
+	.uV_step	= step,					\
+	.n_voltages	= S2MPU05_LDO_N_VOLTAGES,		\
+	.vsel_reg	= reg,					\
+	.vsel_mask	= S2MPU05_LDO_VSEL_MASK,		\
+	.enable_reg	= reg,					\
+	.enable_mask	= S2MPU05_ENABLE_MASK,			\
+	.enable_time	= S2MPU05_ENABLE_TIME_LDO		\
+}
+
+#define regulator_desc_s2mpu05_ldo(num, min, step) \
+	regulator_desc_s2mpu05_ldo_reg(num, min, step, S2MPU05_REG_L##num##CTRL)
+
+#define regulator_desc_s2mpu05_ldo1(num) \
+	regulator_desc_s2mpu05_ldo(num, S2MPU05_LDO_MIN1, S2MPU05_LDO_STEP1)
+
+#define regulator_desc_s2mpu05_ldo2(num) \
+	regulator_desc_s2mpu05_ldo(num, S2MPU05_LDO_MIN1, S2MPU05_LDO_STEP2)
+
+#define regulator_desc_s2mpu05_ldo3(num) \
+	regulator_desc_s2mpu05_ldo(num, S2MPU05_LDO_MIN2, S2MPU05_LDO_STEP2)
+
+#define regulator_desc_s2mpu05_ldo4(num) \
+	regulator_desc_s2mpu05_ldo(num, S2MPU05_LDO_MIN3, S2MPU05_LDO_STEP2)
+
+#define regulator_desc_s2mpu05_buck(num, which) {	\
+	.name		= "BUCK"#num,			\
+	.id		= S2MPU05_BUCK##num,		\
+	.ops		= &s2mpu02_buck_ops,		\
+	.type		= REGULATOR_VOLTAGE,		\
+	.owner		= THIS_MODULE,			\
+	.min_uV		= S2MPU05_BUCK_MIN##which,	\
+	.uV_step	= S2MPU05_BUCK_STEP##which,	\
+	.n_voltages	= S2MPU05_BUCK_N_VOLTAGES,	\
+	.vsel_reg	= S2MPU05_REG_B##num##CTRL2,	\
+	.vsel_mask	= S2MPU05_BUCK_VSEL_MASK,	\
+	.enable_reg	= S2MPU05_REG_B##num##CTRL1,	\
+	.enable_mask	= S2MPU05_ENABLE_MASK,		\
+	.enable_time	= S2MPU05_ENABLE_TIME_BUCK##num	\
+}
+
+#define regulator_desc_s2mpu05_buck123(num) regulator_desc_s2mpu05_buck(num, 1)
+#define regulator_desc_s2mpu05_buck45(num) regulator_desc_s2mpu05_buck(num, 2)
+
+static const struct regulator_desc s2mpu05_regulators[] = {
+	regulator_desc_s2mpu05_ldo4(1),
+	regulator_desc_s2mpu05_ldo3(2),
+	regulator_desc_s2mpu05_ldo2(3),
+	regulator_desc_s2mpu05_ldo1(4),
+	regulator_desc_s2mpu05_ldo1(5),
+	regulator_desc_s2mpu05_ldo1(6),
+	regulator_desc_s2mpu05_ldo2(7),
+	regulator_desc_s2mpu05_ldo3(8),
+	regulator_desc_s2mpu05_ldo_reg(9, S2MPU05_LDO_MIN3, S2MPU05_LDO_STEP2,
+					  S2MPU05_REG_L9CTRL1),
+	regulator_desc_s2mpu05_ldo4(10),
+	regulator_desc_s2mpu05_ldo2(25),
+	regulator_desc_s2mpu05_ldo3(26),
+	regulator_desc_s2mpu05_ldo2(27),
+	regulator_desc_s2mpu05_ldo3(28),
+	regulator_desc_s2mpu05_ldo3(29),
+	regulator_desc_s2mpu05_ldo2(30),
+	regulator_desc_s2mpu05_ldo3(31),
+	regulator_desc_s2mpu05_ldo3(32),
+	regulator_desc_s2mpu05_ldo3(33),
+	regulator_desc_s2mpu05_ldo3(34),
+	regulator_desc_s2mpu05_ldo3(35),
+	regulator_desc_s2mpu05_buck123(1),
+	regulator_desc_s2mpu05_buck123(2),
+	regulator_desc_s2mpu05_buck123(3),
+	regulator_desc_s2mpu05_buck45(4),
+	regulator_desc_s2mpu05_buck45(5),
+};
+
 static int s2mps11_pmic_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
@@ -1159,6 +1243,11 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 		regulators = s2mpu02_regulators;
 		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mpu02_regulators));
 		break;
+	case S2MPU05:
+		rdev_num = ARRAY_SIZE(s2mpu05_regulators);
+		regulators = s2mpu05_regulators;
+		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mpu05_regulators));
+		break;
 	default:
 		dev_err(&pdev->dev, "Invalid device type: %u\n",
 				    s2mps11->dev_type);
@@ -1228,6 +1317,7 @@ static const struct platform_device_id s2mps11_pmic_id[] = {
 	{ "s2mps14-regulator", S2MPS14X},
 	{ "s2mps15-regulator", S2MPS15X},
 	{ "s2mpu02-regulator", S2MPU02},
+	{ "s2mpu05-regulator", S2MPU05},
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, s2mps11_pmic_id);
@@ -1245,5 +1335,5 @@ module_platform_driver(s2mps11_pmic_driver);
 
 /* Module information */
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
-MODULE_DESCRIPTION("Samsung S2MPS11/S2MPS14/S2MPS15/S2MPU02 Regulator Driver");
+MODULE_DESCRIPTION("Samsung S2MPS11/14/15/S2MPU02/05 Regulator Driver");
 MODULE_LICENSE("GPL");

-- 
2.48.1

