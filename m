Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D417E1F09A8;
	Sat,  2 Aug 2025 11:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754133793; cv=none; b=DJvb2GtvRXgG0XoGa3YbGkaOZ51/Hw+n6ckrElAeHybXFjaEjTd3ZKzB0+8S2jFKSqNn3LbTfXUAZUCxlc8cX+cLl55xdTT4sxE0kNTzGTzo3PYDOcIkKifs+am54bJ8kr+eUWGmubI+ymr89ha6oM4iMFENgwROtbGNkuAkfCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754133793; c=relaxed/simple;
	bh=anHzn65RjMZ+HyLRTnpzNpXZb0erz0p33kSIJGWgp7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c2Pw5OdzUaBo5R6UDmW6hYUqRPzxI1KX/DIydo7bHQKybDNjhItxnR3MlgTGh+Zod7rQNxhLwE2FdOjeE8fhZBu1T6PYxjYYqVzCmJ/fwvM6WJqanihNZxfWI33jDKbS6/9lywqHtJc92aCukRWgrZGbcgEL9wlnHORfCXbcjHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYm5GDGT; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYm5GDGT"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-af951a71cafso52011066b.1;
        Sat, 02 Aug 2025 04:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754133789; x=1754738589; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ePCoFySFAoskxh6QFB+5mbyRmWWyITU6vIkl8qdqX6Y=;
        b=BYm5GDGTzbFBeW6e/gYd3J6caOEE6Cuwqsm0xwkL7XNBKGUpCpAl1fH4XqTZuH7whT
         rLG2hC2I5l50Pd+9F1I3Ono/HL6Q8Uvi/LehBQAJV6VLGh/YYozc9XvwZwRu4m7D1jr8
         FaA73IJosWKft2Hywm9d6TXHn1mDdMa1ZICrZjTVz1jXfEwgsMesSgmTHxdttq+z+wtk
         o7fdspy/NGj7A9F89r0aDyhOiX8H+Deu5Hqgucp+vSk22f7yPfR5ZrGhy86xrhKygygG
         kJJG8p79U6PS1FQ7dptD/8n/VsnjVySjyHWrugujhjHbKjjQxd4SN2bl8T/ZIvEbK7ca
         aa/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754133789; x=1754738589;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePCoFySFAoskxh6QFB+5mbyRmWWyITU6vIkl8qdqX6Y=;
        b=e9Y9khP6cWTYNyj71R8ZHrAF3hIGuHETXOnIy8RdEdtd6Blxa/ZHyIL8X2CoBMfq8z
         Ms7/+iS2hq32lkqQRYTqBAPbqTiDtkQAzpX/LIFuImEFyyNQQXseudbj4wdw/b+G4Srn
         SCn4x5hDzmeCPOvKzXEI3jginUhkXiDIMchUDtwnGvHJVjT1LPKiodEffp2JNxJGYSFa
         YNHXlgKIH/mLhplEEy21NNUDyPGcZD1CyAh8b0YzrXcyoNQR4/o4ltjaan2O4k/kB7sB
         tObPo00tjMsWtTyGgx6N26OAHrsXyqMNkZ+ZsTCFPiynWP5neN7e+z6ej7ZturemVouG
         BR0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8hcpIxyzozTroI61++LOCjzmMyocubaat7bc+VqS51dQK0o0HZkusgRb8g+kFT/9Q82vxMBVymwwtO/mecUGOIfQ=@vger.kernel.org, AJvYcCXxjS1NyhKFmazazSloeVyapMElVG6TQBpI4hmtpOZI3WGm/biKZjOED8MdD3MhwJy9G5npUzSnH0ZX@vger.kernel.org
X-Gm-Message-State: AOJu0YzQQe3hgu/eYon9Skd7MhKwmkzRSbzdwv6keVWBBtCPr6YkBTXJ
	K6YZ7BwiQJO3rQtVnpciLxitSyMpn39KC2G+0EwgNTL5sYyxxrtOoMeH
X-Gm-Gg: ASbGncud4Hvj2N8Z5vJ5bxNyYkmkPQx/Uz2MtmodNR0a8kCDpB1IVr5Fd7J4BGIVEeo
	yOv1jzjJQoMSfPeTPJy7NV4y6et7HjuEczeeLcbk5l+zFDBjSLc3LXmfwLj8ndvWp2tu+TKRYNl
	QLtL8JieP8Vxj7eSzPA7xqVBpuzPpPs9E8UGv2ZZ0Oz1CU5rpdUdmswe9ApGD63eCQfJd2tPeCA
	aambiG+bdEo7BzV70GNniA+r+udkc61WinqyDbtGtHQXhLxF+zEQjCGkKtzSCQbT+5Gmf8yZ/7Q
	0pAszHUiTDAAS0vRlEi8+es6fDAMyY8ZNusnAF0bXjGeThjXB3T3/4Q/RoxXDAzQ2ysBaCKFs+v
	/TtuA3ZKr5V5FfOAuXJWv
X-Google-Smtp-Source: AGHT+IFwLCMtqzeoAx9PAufnjbuXvhMedxOBv6H7ywdhbjsaH2ysShYk4GYfrSSjo/BOTIDehkI1mg==
X-Received: by 2002:a17:907:1ca2:b0:ae6:c561:764a with SMTP id a640c23a62f3a-af93ffbe4b6mr317556566b.2.1754133788803;
        Sat, 02 Aug 2025 04:23:08 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.242.22])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-af91a21c050sm419926766b.104.2025.08.02.04.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 04:23:08 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sat, 02 Aug 2025 14:22:22 +0300
Subject: [PATCH v7] regulator: add s2dos05 regulator support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-starqltechn_integration_upstream-v7-1-98ed0e1e1185@gmail.com>
X-B4-Tracking: v=1; b=H4sIAO30jWgC/43Q32rDIBQG8FcpXs/hn6jJrvYeo5SjOUmExHRqQ
 0fJu88UtpXeLJffAX/fhzeSMHpM5O1wIxEXn/wcSjAvB+IGCD1S35ZMBBMV09zQlCF+jhndEE4
 +ZOwj5PLmdDmnHBEmal2ta8Ws6FCSwlhISG2E4IYChcs4luM5Yuev996PY8mDT3mOX/cZi9yuP
 431/42LpIyi7LTWgnED7r2fwI+vbp7Ihi/VH9hwuQOsCihagV2rnKqNeQbV48Idf7KobSFwzho
 mGgvqGdS/IGdsD6i3hbqSrAHQusVHcF3Xb3dKsijYAQAA
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754133787; l=12852;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=anHzn65RjMZ+HyLRTnpzNpXZb0erz0p33kSIJGWgp7c=;
 b=3cwMzUVkrYowhS/IULnuwdB4PcPvPGDB4IpZ7cshg0fNhDTTa2F7JsGrn0syMthUrm99FtFUj
 g+aGGIL4atBDP8+mKGf/7XyVbKAMkey/haeyT+LqdzmWnXIMVPZoIlX
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

S2DOS05 has 1 buck and 4 LDO regulators, used for powering
panel/touchscreen.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
The S2DOS05 is a companion power management IC for the panel and touchscreen
in smart phones. Provides voltage regulators and
ADC for power/current measurements.
---
Changes in v7:
- rebase on latest linux-next
- update cc list
- Link to v6: https://lore.kernel.org/r/20241007-starqltechn_integration_upstream-v6-0-264309aa66de@gmail.com

Changes in v6:
- fix uninitialized ret variable
- Link to v5: https://lore.kernel.org/r/20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com

Changes in v5:
- Split patchset per subsystem
- Rewrite cover letter
- Link to v4: https://lore.kernel.org/r/20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com

Changes in v4:
- Rewrite max77705, max77705_charger, max77705_fuel_gauge from scratch
- Reorder patches:
  - squash max77705 subdevice bindings in core file because
    no resources there
  - split device tree changes
- Use _ as space for filenames in power/supply like the majority
- Replace gcc-845 freq_tbl frequencies patch with new approach,
  based on automatic m/n/pre_div value generation
- Link to v3: https://lore.kernel.org/r/20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com

Changes in version 3:
- s2dos05 driver converted to MFD

Changes in version 2:
- s2dos05 regulator:
  - hex to decimal in regulator values
  - fix compatible value
  - remove interrupt specific code, because it's
    empty in vendor kernel, and I cannot test it on
    available hardware anyway.
---
Changes in v7:
- rebase on latest linux-next
- update cc list
- run sparse and smatch again

Changes in v6:
- run sparse and smatch
- initialize ret variable

Changes in v5:
- fix Kconfig and module description to be the same
- make regulators const
- code refactoring
- replace s2m* pattern on s2* to include s2dos05

Changes in v4:
- remove excessive linux/module.h import
- use generic regulator helpers
- use of_match
- use devm_* for mem allocations
- use // style comment
- drop all junk Samsung code
- adjust to depend on sec-core
---
 MAINTAINERS                           |   2 +-
 drivers/regulator/Kconfig             |   8 ++
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/s2dos05-regulator.c | 176 ++++++++++++++++++++++++++++++++++
 include/linux/regulator/s2dos05.h     |  73 ++++++++++++++
 5 files changed, 259 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 494b12c03de7..12dd90438bd7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22391,7 +22391,7 @@ F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
 F:	drivers/clk/clk-s2mps11.c
 F:	drivers/mfd/sec*.[ch]
-F:	drivers/regulator/s2m*.c
+F:	drivers/regulator/s2*.c
 F:	drivers/regulator/s5m*.c
 F:	drivers/rtc/rtc-s5m.c
 F:	include/linux/mfd/samsung/
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index eaa6df1c9f80..2399c8a9a1c5 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1344,6 +1344,14 @@ config REGULATOR_RTQ2208
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
index be98b29d6675..78605b0fa0b2 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -156,6 +156,7 @@ obj-$(CONFIG_REGULATOR_RTMV20)	+= rtmv20-regulator.o
 obj-$(CONFIG_REGULATOR_RTQ2134) += rtq2134-regulator.o
 obj-$(CONFIG_REGULATOR_RTQ6752)	+= rtq6752-regulator.o
 obj-$(CONFIG_REGULATOR_RTQ2208) += rtq2208-regulator.o
+obj-$(CONFIG_REGULATOR_S2DOS05) += s2dos05-regulator.o
 obj-$(CONFIG_REGULATOR_S2MPA01) += s2mpa01.o
 obj-$(CONFIG_REGULATOR_S2MPS11) += s2mps11.o
 obj-$(CONFIG_REGULATOR_S5M8767) += s5m8767.o
diff --git a/drivers/regulator/s2dos05-regulator.c b/drivers/regulator/s2dos05-regulator.c
new file mode 100644
index 000000000000..db304f2988cf
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
+	int i, ret = 0;
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

---
base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

