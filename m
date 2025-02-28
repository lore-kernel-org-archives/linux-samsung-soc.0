Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142D11F874A;
	Fri, 28 Feb 2025 19:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740771467; cv=none; b=kU+P0k0c2RWPW/x02dd99kAT03Oc0/CSAp2KF/5RHAenfbnhBxzTY15OqyCM0TCBrwfBbRHIy94A9eGA9iv4+WxW16VW/EdOgOnf8TYRGuoDvmSQUg1i2gVvHwtXr2fBhTJGGx1R15aIoMHaZcJmSBpkOd9gJXecWVi4tN2Ewd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740771467; c=relaxed/simple;
	bh=eB1gsZD2DSN4Ff4YspewxYxKM5mr6nebt/VLFpodtwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XKJZvNoK9UXjFuFA2cyQdgYQlnZJ5cUHTerh//lLzImrOSNGu5NMPG85BNQ0FaqgswTo3Top9x9YW5JfT8xOfqH/HlNvh9ardo8Rx+DcxSm6yg01oPnOSiD8aJ0OEswMS3WGTOmpA/bzJCWZ9K7214rshkm7DUwNUstfU7SC0ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=I0tyKKy4; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="I0tyKKy4"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D2BC725C64;
	Fri, 28 Feb 2025 20:37:44 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIDkS_j8q-2d; Fri, 28 Feb 2025 20:37:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740771464; bh=eB1gsZD2DSN4Ff4YspewxYxKM5mr6nebt/VLFpodtwU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=I0tyKKy4UXMMV/vYcruenf5B3W6zcr6G40+ckiSV+NFQ7ekJAm4DtBbhiWjKH70Gw
	 nggwP5W1oswH0frJJ8eDx7+fU1O7eJg7/UIYG7JZTFHr2eXumeLDyN1gDDsDcDiupY
	 5ANclSWLB7qXXaGe0V32x/9WCe14o8YuKAVtS1au1uF86eiOONfAacyhU5rlFwyzkf
	 VEDRyLbR4MCwGX7fL1w2r/JspXsxLuUKm6eMaNfzqukOXShBRbWPweggbm2eCSVVrl
	 pUZfGNjp6NZr4ZyuEWKZec4PuTxcwTKR0FWQnVkxhzMGBOqNfv2qCBqIzkhCOHye/+
	 NwKSJ784cCXUQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 01 Mar 2025 01:07:14 +0530
Subject: [PATCH v3 3/3] regulator: s2mps11: Add support for S2MPU05
 regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-exynos7870-pmic-regulators-v3-3-808d0b47a564@disroot.org>
References: <20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org>
In-Reply-To: <20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740771440; l=6589;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=eB1gsZD2DSN4Ff4YspewxYxKM5mr6nebt/VLFpodtwU=;
 b=qPbNuu+PKm/kZ8lIRg0PQvZuqWoKgfU//lmX7XOH1Kjc46Z5HGK/Gl7uGLGQRVeC1xZ0HwyOi
 +QZuJZVoUAvBN/MZNjsffKFunlvFJM4IEPiYPhybdJwQjhSk/LClOBi
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

S2MPU05 is a PMIC by manufactured by Samsung, particularly used in
Exynos7870 based devices. Add driver support for controlling its 21 LDO
and 5 BUCK regulators.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Acked-by: Mark Brown <broonie@kernel.org>
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
index 7dcf92af8f15e63fb634d978fba41df0ca09fd65..04ae9c6150bd5ae9dba47b9b3cfcfb62e4698b6d 100644
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
+	.name		= "ldo"#num,				\
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
+#define regulator_desc_s2mpu05_ldo(num, reg, min, step) \
+	regulator_desc_s2mpu05_ldo_reg(num, min, step, S2MPU05_REG_L##num##reg)
+
+#define regulator_desc_s2mpu05_ldo1(num, reg) \
+	regulator_desc_s2mpu05_ldo(num, reg, S2MPU05_LDO_MIN1, S2MPU05_LDO_STEP1)
+
+#define regulator_desc_s2mpu05_ldo2(num, reg) \
+	regulator_desc_s2mpu05_ldo(num, reg, S2MPU05_LDO_MIN1, S2MPU05_LDO_STEP2)
+
+#define regulator_desc_s2mpu05_ldo3(num, reg) \
+	regulator_desc_s2mpu05_ldo(num, reg, S2MPU05_LDO_MIN2, S2MPU05_LDO_STEP2)
+
+#define regulator_desc_s2mpu05_ldo4(num, reg) \
+	regulator_desc_s2mpu05_ldo(num, reg, S2MPU05_LDO_MIN3, S2MPU05_LDO_STEP2)
+
+#define regulator_desc_s2mpu05_buck(num, which) {	\
+	.name		= "buck"#num,			\
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
+	regulator_desc_s2mpu05_ldo4(1, CTRL),
+	regulator_desc_s2mpu05_ldo3(2, CTRL),
+	regulator_desc_s2mpu05_ldo2(3, CTRL),
+	regulator_desc_s2mpu05_ldo1(4, CTRL),
+	regulator_desc_s2mpu05_ldo1(5, CTRL),
+	regulator_desc_s2mpu05_ldo1(6, CTRL),
+	regulator_desc_s2mpu05_ldo2(7, CTRL),
+	regulator_desc_s2mpu05_ldo3(8, CTRL),
+	regulator_desc_s2mpu05_ldo4(9, CTRL1),
+	regulator_desc_s2mpu05_ldo4(10, CTRL),
+	/* LDOs 11-24 are used for CP. They aren't documented. */
+	regulator_desc_s2mpu05_ldo2(25, CTRL),
+	regulator_desc_s2mpu05_ldo3(26, CTRL),
+	regulator_desc_s2mpu05_ldo2(27, CTRL),
+	regulator_desc_s2mpu05_ldo3(28, CTRL),
+	regulator_desc_s2mpu05_ldo3(29, CTRL),
+	regulator_desc_s2mpu05_ldo2(30, CTRL),
+	regulator_desc_s2mpu05_ldo3(31, CTRL),
+	regulator_desc_s2mpu05_ldo3(32, CTRL),
+	regulator_desc_s2mpu05_ldo3(33, CTRL),
+	regulator_desc_s2mpu05_ldo3(34, CTRL),
+	regulator_desc_s2mpu05_ldo3(35, CTRL),
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

