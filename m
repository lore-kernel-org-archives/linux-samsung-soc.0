Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9569E288C27
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 15:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757863544; cv=none; b=jxNlRBv+16Qz/NOaZf5EBpAmO4IPy4214gSLxhe1PFRT3CTuylVwHu6jwW9/WCyqxmxJBpZYMUTEMi0YrjECD2JVzT7lcKTaYfRzfVpD/vqoEMUAt6dVKHJRXPDzMXD3SAnn0lj311y2gDGj5I60tN6/AI3LN3B1xjr1nd+jNNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757863544; c=relaxed/simple;
	bh=0zd28JTOovx4fLSAD9mCxazQ/M6cAcI5y8nrgDO9X9k=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=LTf33FpExgNLgrVCl+883zK6u04dwZdoEdJ2mJKCHRYTS8I81SdG/RUsBNQziVfBvmhBVxRIjBZZ83QEls7L44W7CaI2F4X3TXSqIRXeMAPxqHkaMs5Umwu3efboacIBpP1NvBG7qBDHvFRZ09w6kmwYVgYb7nXErL8GNJCW7uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=YBmKBa2G; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="YBmKBa2G"
DKIM-Signature: a=rsa-sha256; b=YBmKBa2GiRqiCVwNT7VpmxoJB1SvLwOsBjsrHGOEA7OMko5u5D808u8N9NZaaPCNcxmbVaPZZRki5e/+ublLjRP52kI/uT3RMoRzjHXXpsPVAar2bPFeBIqbhbe7GBMn794KmBi5KEYmBo5yo/bpQ25+evBaNFsCX4F+XznUMQf+h8De6Gd4Lw+XMa6Q1j06aZZKDcBiABn7eGiDT1clPZw5HYt+jHIYw7nhoW2s9qMfaxveG5jOcOsHHtCh8fmoho81frzOTQReKPkaKIL0M9y63P2Dwjm7cDWXK/A6JvnhWx0+D6ioEkXAZBW7JmcnXGWGki8zi4xMc9nETIfuzw==; s=purelymail3; d=purelymail.com; v=1; bh=0zd28JTOovx4fLSAD9mCxazQ/M6cAcI5y8nrgDO9X9k=; h=Feedback-ID:Received:Date:To:Subject:From;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -917512701;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 14 Sep 2025 15:25:31 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Sep 2025 17:25:29 +0200
Message-Id: <DCSMM4ZWOFI3.1O1X64E61A7DA@mentallysanemainliners.org>
To: "Ivaylo Ivanov" <ivo.ivanov.ivanov1@gmail.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Rob Herring" <robh@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] regulator: max77838: add max77838 regulator
 driver
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250914130230.2622030-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914130230.2622030-3-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250914130230.2622030-3-ivo.ivanov.ivanov1@gmail.com>

Hi Ivaylo,

On Sun Sep 14, 2025 at 3:02 PM CEST, Ivaylo Ivanov wrote:
> The max77838 PMIC contains a BUCK regulator and 4 LDOs. It's primarily
> used in the Samsung Galaxy S7 lineup and is accessed over I2C.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  MAINTAINERS                            |   1 +
>  drivers/regulator/Kconfig              |   8 +
>  drivers/regulator/Makefile             |   1 +
>  drivers/regulator/max77838-regulator.c | 221 +++++++++++++++++++++++++
>  4 files changed, 231 insertions(+)
>  create mode 100644 drivers/regulator/max77838-regulator.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a4916a178..276374ba7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15066,6 +15066,7 @@ M:	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>  L:	linux-kernel@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/regulator/maxim,max77838.yaml
> +F:	drivers/regulator/max77838-regulator.c
> =20
>  MAXIM MAX77976 BATTERY CHARGER
>  M:	Luca Ceresoli <luca@lucaceresoli.net>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 41b56b647..18601bdc0 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -777,6 +777,14 @@ config REGULATOR_MAX77826
>  	  It includes support for control of output voltage. This
>  	  regulator is found on the Samsung Galaxy S5 (klte) smartphone.
> =20
> +config REGULATOR_MAX77838
> +	tristate "Maxim 77838 regulator"
> +	depends on REGMAP_I2C

REGMAP_I2C should be selected by the driver.
The driver should depend on I2C.

> +	help
> +	  This driver controls a Maxim 77838 regulator via I2C bus.
> +	  The regulator include 4 LDOs and a BUCK regulator. It's
> +	  present on the Samsung Galaxy S7 lineup of smartphones.
> +
>  config REGULATOR_MC13XXX_CORE
>  	tristate
> =20
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index be98b29d6..0622e9de6 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -92,6 +92,7 @@ obj-$(CONFIG_REGULATOR_MAX77686) +=3D max77686-regulato=
r.o
>  obj-$(CONFIG_REGULATOR_MAX77693) +=3D max77693-regulator.o
>  obj-$(CONFIG_REGULATOR_MAX77802) +=3D max77802-regulator.o
>  obj-$(CONFIG_REGULATOR_MAX77826) +=3D max77826-regulator.o
> +obj-$(CONFIG_REGULATOR_MAX77838) +=3D max77838-regulator.o
>  obj-$(CONFIG_REGULATOR_MAX77857) +=3D max77857-regulator.o
>  obj-$(CONFIG_REGULATOR_MC13783) +=3D mc13783-regulator.o
>  obj-$(CONFIG_REGULATOR_MC13892) +=3D mc13892-regulator.o
> diff --git a/drivers/regulator/max77838-regulator.c b/drivers/regulator/m=
ax77838-regulator.c
> new file mode 100644
> index 000000000..9faddbfd2
> --- /dev/null
> +++ b/drivers/regulator/max77838-regulator.c
> @@ -0,0 +1,221 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// regulator driver for Maxim MAX77838
> +//
> +// based on max77826-regulator.c
> +//
> +// Copyright (c) 2025, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/of_regulator.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +
> +enum max77838_registers {
> +	MAX77838_REG_DEVICE_ID =3D 0x00,
> +	MAX77838_REG_TOPSYS_STAT,
> +	MAX77838_REG_STAT,
> +	MAX77838_REG_EN,
> +	MAX77838_REG_GPIO_PD_CTRL,
> +	MAX77838_REG_UVLO_CFG1,
> +	/* 0x06 - 0x0B: reserved */
> +	MAX77838_REG_I2C_CFG =3D 0x0C,
> +	/* 0x0D - 0x0F: reserved */
> +	MAX77838_REG_LDO1_CFG =3D 0x10,
> +	MAX77838_REG_LDO2_CFG,
> +	MAX77838_REG_LDO3_CFG,
> +	MAX77838_REG_LDO4_CFG,
> +	/* 0x14 - 0x1F: reserved */
> +	MAX77838_REG_BUCK_CFG1 =3D 0x20,
> +	MAX77838_REG_BUCK_VOUT,
> +};
> +
> +enum max77838_regulators {
> +	MAX77838_LDO1 =3D 0,
> +	MAX77838_LDO2,
> +	MAX77838_LDO3,
> +	MAX77838_LDO4,
> +	MAX77838_BUCK,
> +	MAX77838_MAX_REGULATORS,
> +};
> +
> +#define MAX77838_MASK_LDO		0x7f
> +#define MAX77838_MASK_BUCK		0xff
> +
> +#define MAX77838_LDO1_EN		BIT(0)
> +#define MAX77838_LDO2_EN		BIT(1)
> +#define MAX77838_LDO3_EN		BIT(2)
> +#define MAX77838_LDO4_EN		BIT(3)
> +#define MAX77838_BUCK_EN		BIT(4)
> +
> +#define MAX77838_BUCK_AD		BIT(3)
> +#define MAX77838_LDO_AD			BIT(7)
> +
> +#define MAX77838_LDO_VOLT_MIN		600000
> +#define MAX77838_LDO_VOLT_MAX		3775000
> +#define MAX77838_LDO_VOLT_STEP		25000
> +
> +#define MAX77838_BUCK_VOLT_MIN		500000
> +#define MAX77838_BUCK_VOLT_MAX		2093750
> +#define MAX77838_BUCK_VOLT_STEP		6250
> +
> +#define MAX77838_VOLT_RANGE(_type)				\
> +	((MAX77838_ ## _type ## _VOLT_MAX -			\
> +	  MAX77838_ ## _type ## _VOLT_MIN) /			\
> +	  MAX77838_ ## _type ## _VOLT_STEP + 1)
> +
> +#define MAX77838_LDO(_id)							\
> +	[MAX77838_LDO ## _id] =3D {						\
> +		.id =3D MAX77838_LDO ## _id,					\
> +		.name =3D "ldo"#_id,						\
> +		.of_match =3D of_match_ptr("ldo"#_id),				\
> +		.regulators_node =3D "regulators",				\
> +		.ops =3D &max77838_regulator_ops,					\
> +		.min_uV =3D MAX77838_LDO_VOLT_MIN,				\
> +		.uV_step =3D MAX77838_LDO_VOLT_STEP,				\
> +		.n_voltages =3D MAX77838_VOLT_RANGE(LDO),				\
> +		.enable_reg =3D MAX77838_REG_EN,					\
> +		.enable_mask =3D MAX77838_LDO ## _id ## _EN,			\
> +		.vsel_reg =3D MAX77838_REG_LDO ## _id ## _CFG,			\
> +		.vsel_mask =3D MAX77838_MASK_LDO,					\
> +		.active_discharge_off =3D 0,					\
> +		.active_discharge_on =3D MAX77838_LDO_AD,				\
> +		.active_discharge_mask =3D MAX77838_LDO_AD,			\
> +		.active_discharge_reg =3D MAX77838_REG_LDO ## _id ## _CFG,	\
> +		.owner =3D THIS_MODULE,						\
> +	}
> +
> +#define MAX77838_BUCK_DESC					\
> +	[MAX77838_BUCK] =3D {					\
> +		.id =3D MAX77838_BUCK,				\
> +		.name =3D "buck",					\
> +		.of_match =3D of_match_ptr("buck"),		\
> +		.regulators_node =3D "regulators",		\
> +		.ops =3D &max77838_regulator_ops,			\
> +		.min_uV =3D MAX77838_BUCK_VOLT_MIN,		\
> +		.uV_step =3D MAX77838_BUCK_VOLT_STEP,		\
> +		.n_voltages =3D MAX77838_VOLT_RANGE(BUCK),	\
> +		.enable_reg =3D MAX77838_REG_EN,			\
> +		.enable_mask =3D MAX77838_BUCK_EN,		\
> +		.vsel_reg =3D MAX77838_REG_BUCK_VOUT,		\
> +		.vsel_mask =3D MAX77838_MASK_BUCK,		\
> +		.active_discharge_off =3D 0,			\
> +		.active_discharge_on =3D MAX77838_BUCK_AD,	\
> +		.active_discharge_mask =3D MAX77838_BUCK_AD,	\
> +		.active_discharge_reg =3D MAX77838_REG_BUCK_CFG1,	\
> +		.owner =3D THIS_MODULE,				\
> +	}
> +

nit: Could you make the indentation between VOLT_RANGE, LDO and
BUCK_DESC consistent?

> +struct max77838_regulator_info {
> +	struct regmap *regmap;
> +};
> +
> +static const struct regmap_config max77838_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.max_register =3D MAX77838_REG_BUCK_VOUT,
> +};
> +
> +static const struct regulator_ops max77838_regulator_ops =3D {
> +	.enable			=3D regulator_enable_regmap,
> +	.disable		=3D regulator_disable_regmap,
> +	.is_enabled		=3D regulator_is_enabled_regmap,
> +	.list_voltage		=3D regulator_list_voltage_linear,
> +	.map_voltage		=3D regulator_map_voltage_linear,
> +	.get_voltage_sel	=3D regulator_get_voltage_sel_regmap,
> +	.set_voltage_sel	=3D regulator_set_voltage_sel_regmap,
> +	.set_active_discharge	=3D regulator_set_active_discharge_regmap,
> +};
> +
> +static const struct regulator_desc max77838_regulators_desc[] =3D {
> +	MAX77838_LDO(1),
> +	MAX77838_LDO(2),
> +	MAX77838_LDO(3),
> +	MAX77838_LDO(4),
> +	MAX77838_BUCK_DESC,
> +};
> +
> +static int max77838_read_device_id(struct regmap *regmap, struct device =
*dev)
> +{
> +	unsigned int device_id;
> +	int ret;
> +
> +	ret =3D regmap_read(regmap, MAX77838_REG_DEVICE_ID, &device_id);
> +	if (!ret)
> +		dev_dbg(dev, "DEVICE_ID: 0x%x\n", device_id);
> +
> +	return ret;
> +}
> +
> +static int max77838_i2c_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct max77838_regulator_info *info;
> +	struct regulator_config config =3D {};
> +	struct regulator_dev *rdev;
> +	struct regmap *regmap;
> +	int i;
> +
> +	info =3D devm_kzalloc(dev, sizeof(struct max77838_regulator_info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	regmap =3D devm_regmap_init_i2c(client, &max77838_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(dev, "Failed to allocate regmap!\n");
> +		return PTR_ERR(regmap);
> +	}
> +
> +	info->regmap =3D regmap;
> +	i2c_set_clientdata(client, info);
> +
> +	config.dev =3D dev;
> +	config.regmap =3D regmap;
> +	config.driver_data =3D info;
> +
> +	for (i =3D 0; i < MAX77838_MAX_REGULATORS; i++) {
> +		rdev =3D devm_regulator_register(dev,
> +					       &max77838_regulators_desc[i],
> +					       &config);
> +		if (IS_ERR(rdev)) {
> +			dev_err(dev, "Failed to register regulator!\n");
> +			return PTR_ERR(rdev);
> +		}
> +	}
> +
> +	return max77838_read_device_id(regmap, dev);
> +}
> +
> +static const struct of_device_id __maybe_unused max77838_of_match[] =3D =
{
> +	{ .compatible =3D "maxim,max77838" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, max77838_of_match);
> +
> +static const struct i2c_device_id max77838_id[] =3D {
> +	{ "max77838-regulator" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, max77838_id);
> +
> +static struct i2c_driver max77838_regulator_driver =3D {
> +	.driver =3D {
> +		.name =3D "max77838",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +		.of_match_table =3D of_match_ptr(max77838_of_match),
> +	},
> +	.probe =3D max77838_i2c_probe,
> +	.id_table =3D max77838_id,
> +};
> +module_i2c_driver(max77838_regulator_driver);
> +
> +MODULE_AUTHOR("Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>");
> +MODULE_DESCRIPTION("MAX77838 PMIC regulator driver");
> +MODULE_LICENSE("GPL");

Kind regards,
Igor
