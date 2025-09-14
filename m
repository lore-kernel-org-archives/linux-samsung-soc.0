Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F2522AE65
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 13:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757854982; cv=none; b=XJ4ZJtyZxCBkC9na0fm6wzCSQH9vcZChSRbFbXSsdn8aRTk2e1awKR57AxAeM9wzC6wJU1GKyXRz6OaEw90bt3XJO8uQmkpd3ARLlQk9kBRM+dfhuRlS1u8CVWyETB7V5BdUhqiusA9KScgbBoBEQLwFYFh+J16p//YyqHV4dxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757854982; c=relaxed/simple;
	bh=RV4gHyPj9bgDY4dTtUPdHvGasakWg3O5UoQJWOgpT0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQivQfBZoPqRZiAGHJa0iLXkpv2FpN8bAVD1eRNOwD3cLckE7wnhTyBltxLKMi/6iwEluZGXkTd/3ej9+B3/iD5ibNuszUMZiXg4+lgjwM44XKjoAdfgg0av6Tc4q+3vRfg+ZInw7kRa3SD2Q4gCiZhLITwXu0lJnO6IiQ0axiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiyreaYg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiyreaYg"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3e7428c4cbdso2242550f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 06:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757854979; x=1758459779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5dyEduyxS9XdKZeAJ2xwrQP8Nn0pcUWGlbwmdWDN8k=;
        b=HiyreaYgcIZiyhJ4Lhk0R64S+8TEjlGZIqKLtUt2ZM2v/jsaB+VZKP0aLgXoA9vF4l
         rJto/gN33jpf8ymNFn4+YCSMkqIuEosi/m81bSFu6BWu3L22Uj90e9P3y6kFRYBzgDW4
         gJH1U6+LMwBfr6UJTLq6eI7x+u+D8hjB1d4jDFg2OqVDQQ5DcbFpKk+urIU2UgSBsCw7
         pkzUas8n3Xy/E0C9m/fHV7lYd7pX1+aRAktDJwqMB+10OiktpAstWHYrQOCZdCSMRoJC
         TzhGLi3tezj/Ywuy9Dekp/2LcpD6ReKpSY1g0lMw0PQH+LOzfonvMGlF8/WYZ1D8jHDI
         g9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757854979; x=1758459779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5dyEduyxS9XdKZeAJ2xwrQP8Nn0pcUWGlbwmdWDN8k=;
        b=j7PF09A+yYoH0t4ir7iOQaVCfsYGUEVi3HVYzpkn/IgLfRr6t7Q0jgjuuuCc1lDG7a
         JDfRIyyflSwIA+AxxzaDh2MPJLmmLj6DpoZPxZPNz3pBsPDX9jrNQ9Y0/eQO3VcrVaA/
         NJIDLRMdv9mhLHmi3Ylwj4p2iDejT7opMr/C4ktVe5zAi6EVaAGF7hcgS+WeS6zNsSHu
         eyVdOZCO9y4BkSZ6AUrfvCtfJJZkQhYUkmd47ae7y1DXSDDCPZIMO93ODPulrLdgnO4u
         zE8I2HdN9yfbpRkJFMSHGOuL4FJnivIzSCI8e7/rihgecQZzhvRLDbKtj8mdYaoAHEoP
         3lRQ==
X-Gm-Message-State: AOJu0YxX9N5MjEdE8iIC/VZ4M+h6JaB/5br+CK4q2UwIkoUfX+xwvrQR
	hs8SHstvrkpG0pki9Gg5JFE0lxN5DxHLqeMCWUAH/epZIcSVmM1HLbUr
X-Gm-Gg: ASbGncsnTWyBQfsT2cJ01200GJAdbIMoTv96lR5AaiPJHL7QlRnyh8wq4dfB++uqDaS
	W1LPkyZusc/gN5boyzW9h1f0h1RDB80BOtCe0hxsXjQhgo3bzWWJg8TkLHsDo+t78wlo0ejNZlF
	B+GjXOikcDsKf+XVX2c9Gf1it0qsyCXFoV8SHpHt1uJZyML91Z950T2B/H3zlPotyy7lnKl/BPh
	bJwwm59TkhGxPYoMO2Y3qqCt0cH57hPXPOAotRWAFDE5GY12wQq+UOQErZBXyHBy8xEEumS1Pt9
	K34pWyKbb5Ea1arQd4u4k/EyLy5x7ZofFG8d99na6YkvPhqL2LnhRX6JZdX5eM8mQHpA+niQymE
	oYngRSlvJe2jrWO7evs9XxriSd9+q5PIYEln503YqpofLq04NuUECUcBbG+hGa/t5flIfF7gfbS
	r8jCcQbGcp
X-Google-Smtp-Source: AGHT+IHJyDhkoHW4iYNq7XQq97f1wBTNF3aFX/4tav7CB6jFkeCvKhX1pP6gSIF9wyriFXOQxFf/FQ==
X-Received: by 2002:a05:6000:4009:b0:3e7:68dc:d855 with SMTP id ffacd0b85a97d-3e768dcd9c7mr6891979f8f.18.1757854978398;
        Sun, 14 Sep 2025 06:02:58 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0187f0a7sm77060965e9.3.2025.09.14.06.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:02:57 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] regulator: max77838: add max77838 regulator driver
Date: Sun, 14 Sep 2025 16:02:30 +0300
Message-ID: <20250914130230.2622030-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914130230.2622030-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914130230.2622030-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The max77838 PMIC contains a BUCK regulator and 4 LDOs. It's primarily
used in the Samsung Galaxy S7 lineup and is accessed over I2C.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 MAINTAINERS                            |   1 +
 drivers/regulator/Kconfig              |   8 +
 drivers/regulator/Makefile             |   1 +
 drivers/regulator/max77838-regulator.c | 221 +++++++++++++++++++++++++
 4 files changed, 231 insertions(+)
 create mode 100644 drivers/regulator/max77838-regulator.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a4916a178..276374ba7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15066,6 +15066,7 @@ M:	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/regulator/maxim,max77838.yaml
+F:	drivers/regulator/max77838-regulator.c
 
 MAXIM MAX77976 BATTERY CHARGER
 M:	Luca Ceresoli <luca@lucaceresoli.net>
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 41b56b647..18601bdc0 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -777,6 +777,14 @@ config REGULATOR_MAX77826
 	  It includes support for control of output voltage. This
 	  regulator is found on the Samsung Galaxy S5 (klte) smartphone.
 
+config REGULATOR_MAX77838
+	tristate "Maxim 77838 regulator"
+	depends on REGMAP_I2C
+	help
+	  This driver controls a Maxim 77838 regulator via I2C bus.
+	  The regulator include 4 LDOs and a BUCK regulator. It's
+	  present on the Samsung Galaxy S7 lineup of smartphones.
+
 config REGULATOR_MC13XXX_CORE
 	tristate
 
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index be98b29d6..0622e9de6 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -92,6 +92,7 @@ obj-$(CONFIG_REGULATOR_MAX77686) += max77686-regulator.o
 obj-$(CONFIG_REGULATOR_MAX77693) += max77693-regulator.o
 obj-$(CONFIG_REGULATOR_MAX77802) += max77802-regulator.o
 obj-$(CONFIG_REGULATOR_MAX77826) += max77826-regulator.o
+obj-$(CONFIG_REGULATOR_MAX77838) += max77838-regulator.o
 obj-$(CONFIG_REGULATOR_MAX77857) += max77857-regulator.o
 obj-$(CONFIG_REGULATOR_MC13783) += mc13783-regulator.o
 obj-$(CONFIG_REGULATOR_MC13892) += mc13892-regulator.o
diff --git a/drivers/regulator/max77838-regulator.c b/drivers/regulator/max77838-regulator.c
new file mode 100644
index 000000000..9faddbfd2
--- /dev/null
+++ b/drivers/regulator/max77838-regulator.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+//
+// regulator driver for Maxim MAX77838
+//
+// based on max77826-regulator.c
+//
+// Copyright (c) 2025, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+
+enum max77838_registers {
+	MAX77838_REG_DEVICE_ID = 0x00,
+	MAX77838_REG_TOPSYS_STAT,
+	MAX77838_REG_STAT,
+	MAX77838_REG_EN,
+	MAX77838_REG_GPIO_PD_CTRL,
+	MAX77838_REG_UVLO_CFG1,
+	/* 0x06 - 0x0B: reserved */
+	MAX77838_REG_I2C_CFG = 0x0C,
+	/* 0x0D - 0x0F: reserved */
+	MAX77838_REG_LDO1_CFG = 0x10,
+	MAX77838_REG_LDO2_CFG,
+	MAX77838_REG_LDO3_CFG,
+	MAX77838_REG_LDO4_CFG,
+	/* 0x14 - 0x1F: reserved */
+	MAX77838_REG_BUCK_CFG1 = 0x20,
+	MAX77838_REG_BUCK_VOUT,
+};
+
+enum max77838_regulators {
+	MAX77838_LDO1 = 0,
+	MAX77838_LDO2,
+	MAX77838_LDO3,
+	MAX77838_LDO4,
+	MAX77838_BUCK,
+	MAX77838_MAX_REGULATORS,
+};
+
+#define MAX77838_MASK_LDO		0x7f
+#define MAX77838_MASK_BUCK		0xff
+
+#define MAX77838_LDO1_EN		BIT(0)
+#define MAX77838_LDO2_EN		BIT(1)
+#define MAX77838_LDO3_EN		BIT(2)
+#define MAX77838_LDO4_EN		BIT(3)
+#define MAX77838_BUCK_EN		BIT(4)
+
+#define MAX77838_BUCK_AD		BIT(3)
+#define MAX77838_LDO_AD			BIT(7)
+
+#define MAX77838_LDO_VOLT_MIN		600000
+#define MAX77838_LDO_VOLT_MAX		3775000
+#define MAX77838_LDO_VOLT_STEP		25000
+
+#define MAX77838_BUCK_VOLT_MIN		500000
+#define MAX77838_BUCK_VOLT_MAX		2093750
+#define MAX77838_BUCK_VOLT_STEP		6250
+
+#define MAX77838_VOLT_RANGE(_type)				\
+	((MAX77838_ ## _type ## _VOLT_MAX -			\
+	  MAX77838_ ## _type ## _VOLT_MIN) /			\
+	  MAX77838_ ## _type ## _VOLT_STEP + 1)
+
+#define MAX77838_LDO(_id)							\
+	[MAX77838_LDO ## _id] = {						\
+		.id = MAX77838_LDO ## _id,					\
+		.name = "ldo"#_id,						\
+		.of_match = of_match_ptr("ldo"#_id),				\
+		.regulators_node = "regulators",				\
+		.ops = &max77838_regulator_ops,					\
+		.min_uV = MAX77838_LDO_VOLT_MIN,				\
+		.uV_step = MAX77838_LDO_VOLT_STEP,				\
+		.n_voltages = MAX77838_VOLT_RANGE(LDO),				\
+		.enable_reg = MAX77838_REG_EN,					\
+		.enable_mask = MAX77838_LDO ## _id ## _EN,			\
+		.vsel_reg = MAX77838_REG_LDO ## _id ## _CFG,			\
+		.vsel_mask = MAX77838_MASK_LDO,					\
+		.active_discharge_off = 0,					\
+		.active_discharge_on = MAX77838_LDO_AD,				\
+		.active_discharge_mask = MAX77838_LDO_AD,			\
+		.active_discharge_reg = MAX77838_REG_LDO ## _id ## _CFG,	\
+		.owner = THIS_MODULE,						\
+	}
+
+#define MAX77838_BUCK_DESC					\
+	[MAX77838_BUCK] = {					\
+		.id = MAX77838_BUCK,				\
+		.name = "buck",					\
+		.of_match = of_match_ptr("buck"),		\
+		.regulators_node = "regulators",		\
+		.ops = &max77838_regulator_ops,			\
+		.min_uV = MAX77838_BUCK_VOLT_MIN,		\
+		.uV_step = MAX77838_BUCK_VOLT_STEP,		\
+		.n_voltages = MAX77838_VOLT_RANGE(BUCK),	\
+		.enable_reg = MAX77838_REG_EN,			\
+		.enable_mask = MAX77838_BUCK_EN,		\
+		.vsel_reg = MAX77838_REG_BUCK_VOUT,		\
+		.vsel_mask = MAX77838_MASK_BUCK,		\
+		.active_discharge_off = 0,			\
+		.active_discharge_on = MAX77838_BUCK_AD,	\
+		.active_discharge_mask = MAX77838_BUCK_AD,	\
+		.active_discharge_reg = MAX77838_REG_BUCK_CFG1,	\
+		.owner = THIS_MODULE,				\
+	}
+
+struct max77838_regulator_info {
+	struct regmap *regmap;
+};
+
+static const struct regmap_config max77838_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = MAX77838_REG_BUCK_VOUT,
+};
+
+static const struct regulator_ops max77838_regulator_ops = {
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.list_voltage		= regulator_list_voltage_linear,
+	.map_voltage		= regulator_map_voltage_linear,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.set_active_discharge	= regulator_set_active_discharge_regmap,
+};
+
+static const struct regulator_desc max77838_regulators_desc[] = {
+	MAX77838_LDO(1),
+	MAX77838_LDO(2),
+	MAX77838_LDO(3),
+	MAX77838_LDO(4),
+	MAX77838_BUCK_DESC,
+};
+
+static int max77838_read_device_id(struct regmap *regmap, struct device *dev)
+{
+	unsigned int device_id;
+	int ret;
+
+	ret = regmap_read(regmap, MAX77838_REG_DEVICE_ID, &device_id);
+	if (!ret)
+		dev_dbg(dev, "DEVICE_ID: 0x%x\n", device_id);
+
+	return ret;
+}
+
+static int max77838_i2c_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct max77838_regulator_info *info;
+	struct regulator_config config = {};
+	struct regulator_dev *rdev;
+	struct regmap *regmap;
+	int i;
+
+	info = devm_kzalloc(dev, sizeof(struct max77838_regulator_info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	regmap = devm_regmap_init_i2c(client, &max77838_regmap_config);
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "Failed to allocate regmap!\n");
+		return PTR_ERR(regmap);
+	}
+
+	info->regmap = regmap;
+	i2c_set_clientdata(client, info);
+
+	config.dev = dev;
+	config.regmap = regmap;
+	config.driver_data = info;
+
+	for (i = 0; i < MAX77838_MAX_REGULATORS; i++) {
+		rdev = devm_regulator_register(dev,
+					       &max77838_regulators_desc[i],
+					       &config);
+		if (IS_ERR(rdev)) {
+			dev_err(dev, "Failed to register regulator!\n");
+			return PTR_ERR(rdev);
+		}
+	}
+
+	return max77838_read_device_id(regmap, dev);
+}
+
+static const struct of_device_id __maybe_unused max77838_of_match[] = {
+	{ .compatible = "maxim,max77838" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, max77838_of_match);
+
+static const struct i2c_device_id max77838_id[] = {
+	{ "max77838-regulator" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, max77838_id);
+
+static struct i2c_driver max77838_regulator_driver = {
+	.driver = {
+		.name = "max77838",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = of_match_ptr(max77838_of_match),
+	},
+	.probe = max77838_i2c_probe,
+	.id_table = max77838_id,
+};
+module_i2c_driver(max77838_regulator_driver);
+
+MODULE_AUTHOR("Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>");
+MODULE_DESCRIPTION("MAX77838 PMIC regulator driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

