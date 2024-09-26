Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A507C1AD3E0;
	Thu, 26 Sep 2024 09:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727344080; cv=none; b=T5YH9yjJO15iytOmSNSg77KO5E/v2eXn2N6g9pKsULY1ofnLL+/DSfXFL2lVZkiFUBn4bg2UmrUkzbQVzgWt3T4hV4MJoUqYoLGOHfudRHHaZrtz3u2gHzgxfPEcFsslX1yRFnzEgnZZHtIsEZl5kHFSJQr5/i20MteamdeJWEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727344080; c=relaxed/simple;
	bh=7tvyRSoiVW9Vd9Xo4AFHrbZVdsgsyPs3cLRSVav5XeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IuA0o7bdBAI0sH+rWnWCZzyk3Sn2XO3dZJHAPGMc8dVKDS4Be2wjzhHpWbDR71TZuF5aOFbXrYY2HdMdsM21lPIIFpyG1/lasnJZB7LpGUToFELninHgWC3skeXVeXUYo8jgMCQjrh82ktBbiybhrRGZDYk2h5f+iClD6ohjvi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ES+0mglE; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ES+0mglE"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f77be8ffecso8198341fa.1;
        Thu, 26 Sep 2024 02:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727344077; x=1727948877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kf8yQGwPrApDBkAfb1N9SlgkZVc57+N8INC8rjiS+dQ=;
        b=ES+0mglEVsuWwtPqWr/vwFFX16UF2oc9NNOyKkHTwaW2MZ/0dZMHv9LCDmPUlhhfXA
         sADdTXrWo5ungQAp8CjFZYCmNjIXwETQBGcfUJ4pThZO2jYH4jI1d/i4pd1jG0Eutz6j
         80O8GJjhcHuqhDI0n/S1S2IVT2GfQWElwVhNWmk1eF4NiD2CoRfXAtBzu15Zmgb5GKD1
         ZStjxod49eEkx+8aTD8MlIDsdIC6G3b7dTUABKk5dODCXzqGd+DTZ5KBdF8NI/Orud+P
         XBzH7SnDEvt2qYXfL7iRJiBAf9S9z4Q8yRiI26D3SxSOGiE3K1YMjC5RxS+HqNyu/mio
         g+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727344077; x=1727948877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kf8yQGwPrApDBkAfb1N9SlgkZVc57+N8INC8rjiS+dQ=;
        b=VppNh2doWNAcCh8jWxeuuBI9PG/ZNn7V4D586+pytIy5wo52z4N7FmRYBCzKpTzrU2
         14bB8Ju0zREYHdUOoexB8joO4pSRmF4LlL7MiMlQk1dY9R2/TpYxSs5f3mLGHqtC/XEG
         UUIuc2guBedckhTQiGjhycf6G+06WmYmoW32ExAC09+BvgIoY4pz4BXoqRdOzO/yQwcn
         b+4hQddYRTC2qWKagZz4D3M1Fqyv0kSnuoZk8rt7z5PbMCqBNCR//iMJUdraeSUUwek5
         fnvPGLDzlJPDPKKMESKJryq60Bda9lfCI9k7o9hKVuBup0lET3Lup7176DcZRpt2R/Wb
         ixLw==
X-Forwarded-Encrypted: i=1; AJvYcCUZUCY3l8ihEKyyF2z41xB7mejf59lvnaw1w8nShBdugttm64Qcjmd9540I8fPOG3Kw3mGabjl131/Z+5I6otMK8eA=@vger.kernel.org, AJvYcCWXAwnb2FKuf3KM8FGJxDT791TNvGQunTTFZZqO+NmjnFu6esFo37Z5++9HGNCwNXYNsGnLIumJe6i2@vger.kernel.org
X-Gm-Message-State: AOJu0YzAzXPbrtJzPOYpAxCnqre+asx3i4JczX4t2EOE6S++yj53pT6E
	bVajvhDLJiGXTVynll2z33G//cO5cr79PHz4tfs0hSfPYqumnJDs
X-Google-Smtp-Source: AGHT+IHLQfBYi/8zLKZo4q8n1VyHrmonJqJzPwgjkmLbWd8cy9FHV7ZE+0jodxPjvghdxLLQ6xT8uw==
X-Received: by 2002:a05:6512:3b1e:b0:52e:7f6b:5786 with SMTP id 2adb3069b0e04-538804ae40bmr3138266e87.61.1727344076252;
        Thu, 26 Sep 2024 02:47:56 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-537a8648a60sm750311e87.199.2024.09.26.02.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 02:47:55 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 26 Sep 2024 12:47:32 +0300
Subject: [PATCH v5 3/3] regulator: add s2dos05 regulator support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240617-starqltechn_integration_upstream-v5-3-ea1109029ba5@gmail.com>
References: <20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com>
In-Reply-To: <20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727344064; l=11054;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=7tvyRSoiVW9Vd9Xo4AFHrbZVdsgsyPs3cLRSVav5XeI=;
 b=ssImRc1hdDZasqH2bWuToC9BgbrTLhlTb060Lgnm4AtGck8cNWIwTHu+sNHitCWCmf3sETHoH
 7TsvjTzLuGpAlC7oYBvRx8OTLLyz3B3U+UylWob3JL0ZoYVOPyvH49g
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

S2DOS05 has 1 buck and 4 LDO regulators, used for powering
panel/touchscreen.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v4:
- remove excessive linux/module.h import
- use generic regulator helpers
- use of_match
- use devm_* for mem allocations
- use // style comment
- drop all junk Samsung code
- adjust to depend on sec-core

Changes in v5:
- fix Kconfig and module description to be the same
- make regulators const
- code refactoring
- replace s2m* pattern on s2* to include s2dos05
---
 MAINTAINERS                           |   2 +-
 drivers/regulator/Kconfig             |   8 ++++
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/s2dos05-regulator.c | 176 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/regulator/s2dos05.h     |  73 +++++++++++++++++++++++++++++++++++++
 5 files changed, 259 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6a6c769a341a..0b9fca1030a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20474,7 +20474,7 @@ F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
 F:	drivers/clk/clk-s2mps11.c
 F:	drivers/mfd/sec*.c
-F:	drivers/regulator/s2m*.c
+F:	drivers/regulator/s2*.c
 F:	drivers/regulator/s5m*.c
 F:	drivers/rtc/rtc-s5m.c
 F:	include/linux/mfd/samsung/
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 39297f7d8177..249933d6388d 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1322,6 +1322,14 @@ config REGULATOR_RTQ2208
 	  and two ldos. It features wide output voltage range from 0.4V to 2.05V
 	  and the capability to configure the corresponding power stages.
 
+config REGULATOR_S2DOS05
+	tristate "Samsung S2DOS05 voltage regulator"
+	depends on MFD_SEC_CORE || COMPILE_TEST
+	help
+	  This driver provides support for the voltage regulators of the S2DOS05.
+	  The S2DOS05 is a companion power management IC for the smart phones.
+	  The S2DOS05 has 4 LDOs and 1 BUCK outputs.
+
 config REGULATOR_S2MPA01
 	tristate "Samsung S2MPA01 voltage regulator"
 	depends on MFD_SEC_CORE || COMPILE_TEST
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 3d5a803dce8a..9b69546fb3f6 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -154,6 +154,7 @@ obj-$(CONFIG_REGULATOR_RTMV20)	+= rtmv20-regulator.o
 obj-$(CONFIG_REGULATOR_RTQ2134) += rtq2134-regulator.o
 obj-$(CONFIG_REGULATOR_RTQ6752)	+= rtq6752-regulator.o
 obj-$(CONFIG_REGULATOR_RTQ2208) += rtq2208-regulator.o
+obj-$(CONFIG_REGULATOR_S2DOS05) += s2dos05-regulator.o
 obj-$(CONFIG_REGULATOR_S2MPA01) += s2mpa01.o
 obj-$(CONFIG_REGULATOR_S2MPS11) += s2mps11.o
 obj-$(CONFIG_REGULATOR_S5M8767) += s5m8767.o
diff --git a/drivers/regulator/s2dos05-regulator.c b/drivers/regulator/s2dos05-regulator.c
new file mode 100644
index 000000000000..258cabf104ce
--- /dev/null
+++ b/drivers/regulator/s2dos05-regulator.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// s2dos05.c - Regulator driver for the Samsung s2dos05
+//
+// Copyright (C) 2024 Dzmitry Sankouski <dsankouski@gmail.com>
+
+#include <linux/bug.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/mfd/samsung/core.h>
+#include <linux/regulator/s2dos05.h>
+#include <linux/i2c.h>
+
+struct s2dos05_data {
+	struct regmap *regmap;
+	struct device *dev;
+};
+
+#define _BUCK(macro)	S2DOS05_BUCK##macro
+#define _buck_ops(num)	s2dos05_ops##num
+#define _LDO(macro)	S2DOS05_LDO##macro
+#define _REG(ctrl)	S2DOS05_REG##ctrl
+#define _ldo_ops(num)	s2dos05_ops##num
+#define _MASK(macro)	S2DOS05_ENABLE_MASK##macro
+#define _TIME(macro)	S2DOS05_ENABLE_TIME##macro
+
+#define BUCK_DESC(_name, _id, _ops, m, s, v, e, em, t, a) {	\
+	.name		= _name,				\
+	.id		= _id,					\
+	.ops		= _ops,					\
+	.of_match = of_match_ptr(_name),			\
+	.of_match_full_name = true,				\
+	.regulators_node = of_match_ptr("regulators"),		\
+	.type		= REGULATOR_VOLTAGE,			\
+	.owner		= THIS_MODULE,				\
+	.min_uV		= m,					\
+	.uV_step	= s,					\
+	.n_voltages	= S2DOS05_BUCK_N_VOLTAGES,		\
+	.vsel_reg	= v,					\
+	.vsel_mask	= S2DOS05_BUCK_VSEL_MASK,		\
+	.enable_reg	= e,					\
+	.enable_mask	= em,					\
+	.enable_time	= t,					\
+	.active_discharge_off = 0,				\
+	.active_discharge_on = S2DOS05_BUCK_FD_MASK,		\
+	.active_discharge_reg	= a,				\
+	.active_discharge_mask	= S2DOS05_BUCK_FD_MASK		\
+}
+
+#define LDO_DESC(_name, _id, _ops, m, s, v, e, em, t, a) {	\
+	.name		= _name,				\
+	.id		= _id,					\
+	.ops		= _ops,					\
+	.of_match = of_match_ptr(_name),			\
+	.of_match_full_name = true,				\
+	.regulators_node = of_match_ptr("regulators"),		\
+	.type		= REGULATOR_VOLTAGE,			\
+	.owner		= THIS_MODULE,				\
+	.min_uV		= m,					\
+	.uV_step	= s,					\
+	.n_voltages	= S2DOS05_LDO_N_VOLTAGES,		\
+	.vsel_reg	= v,					\
+	.vsel_mask	= S2DOS05_LDO_VSEL_MASK,		\
+	.enable_reg	= e,					\
+	.enable_mask	= em,					\
+	.enable_time	= t,					\
+	.active_discharge_off = 0,				\
+	.active_discharge_on = S2DOS05_LDO_FD_MASK,		\
+	.active_discharge_reg	= a,				\
+	.active_discharge_mask	= S2DOS05_LDO_FD_MASK		\
+}
+
+static const struct regulator_ops s2dos05_ops = {
+	.list_voltage		= regulator_list_voltage_linear,
+	.map_voltage		= regulator_map_voltage_linear,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+	.set_active_discharge	= regulator_set_active_discharge_regmap,
+};
+
+static const struct regulator_desc regulators[S2DOS05_REGULATOR_MAX] = {
+		// name, id, ops, min_uv, uV_step, vsel_reg, enable_reg
+		LDO_DESC("ldo1", _LDO(1), &_ldo_ops(), _LDO(_MIN1),
+			_LDO(_STEP1), _REG(_LDO1_CFG),
+			_REG(_EN), _MASK(_L1), _TIME(_LDO), _REG(_LDO1_CFG)),
+		LDO_DESC("ldo2", _LDO(2), &_ldo_ops(), _LDO(_MIN1),
+			_LDO(_STEP1), _REG(_LDO2_CFG),
+			_REG(_EN), _MASK(_L2), _TIME(_LDO), _REG(_LDO2_CFG)),
+		LDO_DESC("ldo3", _LDO(3), &_ldo_ops(), _LDO(_MIN2),
+			_LDO(_STEP1), _REG(_LDO3_CFG),
+			_REG(_EN), _MASK(_L3), _TIME(_LDO), _REG(_LDO3_CFG)),
+		LDO_DESC("ldo4", _LDO(4), &_ldo_ops(), _LDO(_MIN2),
+			_LDO(_STEP1), _REG(_LDO4_CFG),
+			_REG(_EN), _MASK(_L4), _TIME(_LDO), _REG(_LDO4_CFG)),
+		BUCK_DESC("buck", _BUCK(1), &_buck_ops(), _BUCK(_MIN1),
+			_BUCK(_STEP1), _REG(_BUCK_VOUT),
+			_REG(_EN), _MASK(_B1), _TIME(_BUCK), _REG(_BUCK_CFG)),
+};
+
+static int s2dos05_pmic_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
+	struct of_regulator_match *rdata = NULL;
+	struct s2dos05_data *s2dos05;
+	struct regulator_config config = { };
+	unsigned int rdev_num = ARRAY_SIZE(regulators);
+	int i, ret;
+
+	s2dos05 = devm_kzalloc(dev, sizeof(*s2dos05), GFP_KERNEL);
+	if (!s2dos05)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, s2dos05);
+
+	rdata = devm_kcalloc(dev, rdev_num, sizeof(*rdata), GFP_KERNEL);
+	if (!rdata)
+		return -ENOMEM;
+
+	for (i = 0; i < rdev_num; i++)
+		rdata[i].name = regulators[i].name;
+
+	s2dos05->regmap = iodev->regmap_pmic;
+	s2dos05->dev = dev;
+	if (!dev->of_node)
+		dev->of_node = dev->parent->of_node;
+
+	for (i = 0; i < rdev_num; i++) {
+		struct regulator_dev *regulator;
+
+		config.init_data = rdata[i].init_data;
+		config.of_node = rdata[i].of_node;
+		config.dev = dev;
+		config.driver_data = s2dos05;
+		regulator = devm_regulator_register(&pdev->dev,
+						&regulators[i], &config);
+		if (IS_ERR(regulator)) {
+			ret = PTR_ERR(regulator);
+			dev_err(&pdev->dev, "regulator init failed for %d\n",
+				i);
+		}
+	}
+
+	return ret;
+}
+
+static const struct platform_device_id s2dos05_pmic_id[] = {
+	{ "s2dos05-regulator" },
+	{ },
+};
+MODULE_DEVICE_TABLE(platform, s2dos05_pmic_id);
+
+static struct platform_driver s2dos05_platform_driver = {
+	.driver = {
+		.name = "s2dos05",
+	},
+	.probe = s2dos05_pmic_probe,
+	.id_table = s2dos05_pmic_id,
+};
+module_platform_driver(s2dos05_platform_driver);
+
+MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
+MODULE_DESCRIPTION("Samsung S2DOS05 Regulator Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/regulator/s2dos05.h b/include/linux/regulator/s2dos05.h
new file mode 100644
index 000000000000..2e89fcbce769
--- /dev/null
+++ b/include/linux/regulator/s2dos05.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+// s2dos05.h
+//
+// Copyright (c) 2016 Samsung Electronics Co., Ltd
+//              http://www.samsung.com
+// Copyright (C) 2024 Dzmitry Sankouski <dsankouski@gmail.com>
+
+#ifndef __LINUX_S2DOS05_H
+#define __LINUX_S2DOS05_H
+
+// S2DOS05 registers
+// Slave Addr : 0xC0
+enum S2DOS05_reg {
+	S2DOS05_REG_DEV_ID,
+	S2DOS05_REG_TOPSYS_STAT,
+	S2DOS05_REG_STAT,
+	S2DOS05_REG_EN,
+	S2DOS05_REG_LDO1_CFG,
+	S2DOS05_REG_LDO2_CFG,
+	S2DOS05_REG_LDO3_CFG,
+	S2DOS05_REG_LDO4_CFG,
+	S2DOS05_REG_BUCK_CFG,
+	S2DOS05_REG_BUCK_VOUT,
+	S2DOS05_REG_IRQ_MASK = 0x0D,
+	S2DOS05_REG_SSD_TSD = 0x0E,
+	S2DOS05_REG_OCL = 0x10,
+	S2DOS05_REG_IRQ = 0x11
+};
+
+// S2DOS05 regulator ids
+enum S2DOS05_regulators {
+	S2DOS05_LDO1,
+	S2DOS05_LDO2,
+	S2DOS05_LDO3,
+	S2DOS05_LDO4,
+	S2DOS05_BUCK1,
+	S2DOS05_REG_MAX,
+};
+
+#define S2DOS05_IRQ_PWRMT_MASK	BIT(5)
+#define S2DOS05_IRQ_TSD_MASK	BIT(4)
+#define S2DOS05_IRQ_SSD_MASK	BIT(3)
+#define S2DOS05_IRQ_SCP_MASK	BIT(2)
+#define S2DOS05_IRQ_UVLO_MASK	BIT(1)
+#define S2DOS05_IRQ_OCD_MASK	BIT(0)
+
+#define S2DOS05_BUCK_MIN1	506250
+#define S2DOS05_LDO_MIN1	1500000
+#define S2DOS05_LDO_MIN2	2700000
+#define S2DOS05_BUCK_STEP1	6250
+#define S2DOS05_LDO_STEP1	25000
+#define S2DOS05_LDO_VSEL_MASK	0x7F
+#define S2DOS05_LDO_FD_MASK	0x80
+#define S2DOS05_BUCK_VSEL_MASK	0xFF
+#define S2DOS05_BUCK_FD_MASK	0x08
+
+#define S2DOS05_ENABLE_MASK_L1	BIT(0)
+#define S2DOS05_ENABLE_MASK_L2	BIT(1)
+#define S2DOS05_ENABLE_MASK_L3	BIT(2)
+#define S2DOS05_ENABLE_MASK_L4	BIT(3)
+#define S2DOS05_ENABLE_MASK_B1	BIT(4)
+
+#define S2DOS05_RAMP_DELAY	12000
+
+#define S2DOS05_ENABLE_TIME_LDO		50
+#define S2DOS05_ENABLE_TIME_BUCK	350
+
+#define S2DOS05_LDO_N_VOLTAGES	(S2DOS05_LDO_VSEL_MASK + 1)
+#define S2DOS05_BUCK_N_VOLTAGES (S2DOS05_BUCK_VSEL_MASK + 1)
+
+#define S2DOS05_REGULATOR_MAX	(S2DOS05_REG_MAX)
+
+#endif // __LINUX_S2DOS05_H

-- 
2.39.2

