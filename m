From: jonghwa3.lee@samsung.com
Subject: Re: [PATCH v3 2/2] regulator: Add support for MAX77686.
Date: Wed, 23 May 2012 10:40:00 +0900
Message-ID: <4FBC3FF0.5080408@samsung.com>
References: <y@samsung.com> <4fbb2ada.63de440a.589d.78e2@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <4fbb2ada.63de440a.589d.78e2@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yadi.brar01@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi, Yadwinder,
As you know, both of us, recently, had competition for one driver
whether you intend or not. And now, i think it is time to stop this and
to find appropriate goal. From now on, i won't update this driver no
more. I recommend you to review my patch and apply feature that you can
apply. And also check comments that i wrote below.

On 2012=EB=85=84 05=EC=9B=94 22=EC=9D=BC 14:57, yadi.brar01@gmail.com w=
rote:

> From: Yadwinder Singh Brar <yadi.brar@samsung.com>
>=20
> Add support for PMIC/regulator portion of MAX77686 multifunction devi=
ce.
> MAX77686 provides LDOs[1-26] and BUCKs[1-9]. This is initial release =
of driv
> which supports setting and getting the voltage of a regulator with I2=
C
> interface.
>=20
> Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> ---
>  drivers/regulator/Kconfig    |    9 +
>  drivers/regulator/Makefile   |    1 +
>  drivers/regulator/max77686.c |  387 ++++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 397 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/regulator/max77686.c
>=20
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index c86b886..e8f9417 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -195,6 +195,15 @@ config REGULATOR_MAX8998
>  	  via I2C bus. The provided regulator is suitable for S3C6410
>  	  and S5PC1XX chips to control VCC_CORE and VCC_USIM voltages.
> =20
> +config REGULATOR_MAX77686
> +	tristate "Maxim 77686 regulator"
> +	depends on MFD_MAX77686
> +	help
> +	  This driver controls a Maxim 77686 voltage regulator via I2C
> +	  bus. The provided regulator is suitable for Exynos5 chips to
> +	  control VDD_ARM and VDD_INT voltages.It supports LDOs[1-26]
> +	  and BUCKs[1-9].
> +
>  config REGULATOR_PCAP
>  	tristate "Motorola PCAP2 regulator driver"
>  	depends on EZX_PCAP
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 977fd46..d854453 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_REGULATOR_MAX8925) +=3D max8925-regula=
tor.o
>  obj-$(CONFIG_REGULATOR_MAX8952) +=3D max8952.o
>  obj-$(CONFIG_REGULATOR_MAX8997) +=3D max8997.o
>  obj-$(CONFIG_REGULATOR_MAX8998) +=3D max8998.o
> +obj-$(CONFIG_REGULATOR_MAX77686) +=3D max77686.o
>  obj-$(CONFIG_REGULATOR_MC13783) +=3D mc13783-regulator.o
>  obj-$(CONFIG_REGULATOR_MC13892) +=3D mc13892-regulator.o
>  obj-$(CONFIG_REGULATOR_MC13XXX_CORE) +=3D  mc13xxx-regulator-core.o
> diff --git a/drivers/regulator/max77686.c b/drivers/regulator/max7768=
6.c
> new file mode 100644
> index 0000000..98dbd50
> --- /dev/null
> +++ b/drivers/regulator/max77686.c
> @@ -0,0 +1,387 @@
> +/*
> + * max77686.c - Regulator driver for the Maxim 77686
> + *
> + * Copyright (C) 2012 Samsung Electronics Co. Ltd.
> + * Chiwoong Byun <woong.byun@samsung.com>
> + * Yadwinder Singh Brar <yadi.brar@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1=
307  USA
> + *
> + * This driver is based on max8997.c
> + */
> +
> +#include <linux/module.h>
> +#include <linux/bug.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/gpio.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/regulator/of_regulator.h>
> +#include <linux/mfd/max77686.h>
> +#include <linux/mfd/max77686-private.h>
> +
> +struct max77686_data {
> +	struct device *dev;
> +	struct max77686_dev *iodev;
> +	int num_regulators;
> +	struct regulator_dev **rdev;
> +	int ramp_delay;		/* index of ramp_delay */
> +
> +	/*GPIO-DVS feature is not enabled with the
> +	 *current version of MAX77686 driver.*/
> +};
> +
> +static int max77686_voltage_dvs_buck_time_sel(struct regulator_dev *=
rdev,
> +					unsigned int old_sel,
> +					unsigned int new_sel)
> +{
> +	struct max77686_data *max77686 =3D rdev_get_drvdata(rdev);
> +	int ramp[] =3D {13, 27, 55, 100};	/* ramp_rate in mV/uS */
> +
> +	return DIV_ROUND_UP(rdev->desc->uV_step *
> +			    abs(new_sel - old_sel),
> +			    ramp[max77686->ramp_delay]);
> +}
> +
> +static int max77686_voltage_time_sel(struct regulator_dev *rdev,
> +					unsigned int old_sel,
> +					unsigned int new_sel)
> +{
> +	return DIV_ROUND_UP(rdev->desc->uV_step *
> +			    abs(new_sel - old_sel),
> +			    100);
> +}
> +


Does LDO also need waiting for voltage change? I afraid it's not.

> +static struct regulator_ops max77686_ops =3D {
> +	.map_voltage		=3D regulator_map_voltage_linear,
> +	.list_voltage		=3D regulator_list_voltage_linear,
> +	.is_enabled		=3D regulator_is_enabled_regmap,
> +	.enable			=3D regulator_enable_regmap,
> +	.disable		=3D regulator_disable_regmap,
> +	.get_voltage_sel	=3D regulator_get_voltage_sel_regmap,
> +	.set_voltage_sel	=3D regulator_set_voltage_sel_regmap,
> +	.set_voltage_time_sel	=3D max77686_voltage_time_sel,
> +};
> +
> +static struct regulator_ops max77686_buck_ops =3D {
> +	.map_voltage		=3D regulator_map_voltage_linear,
> +	.list_voltage		=3D regulator_list_voltage_linear,
> +	.is_enabled		=3D regulator_is_enabled_regmap,
> +	.enable			=3D regulator_enable_regmap,
> +	.disable		=3D regulator_disable_regmap,
> +	.get_voltage_sel	=3D regulator_get_voltage_sel_regmap,
> +	.set_voltage_sel	=3D regulator_set_voltage_sel_regmap,
> +	.set_voltage_time_sel	=3D max77686_voltage_dvs_buck_time_sel,
> +};
> +
> +#define regulator_desc_ldo(num)		{				\
> +	.name		=3D "LDO"#num,					\
> +	.id		=3D MAX77686_LDO##num,				\
> +	.ops		=3D &max77686_ops,				\
> +	.type		=3D REGULATOR_VOLTAGE,				\
> +	.owner		=3D THIS_MODULE,					\
> +	.min_uV		=3D 800000,					\
> +	.uV_step	=3D 50000,					\
> +	.n_voltages	=3D 64,						\
> +	.vsel_reg	=3D MAX77686_REG_LDO1CTRL1 + num - 1,		\
> +	.vsel_mask	=3D 0x3f,						\
> +	.enable_reg	=3D MAX77686_REG_LDO1CTRL1 + num - 1,		\
> +	.enable_mask	=3D 0x0c,						\
> +}
> +#define regulator_desc_ldo_low_vol(num)	{				\
> +	.name		=3D "LDO"#num,					\
> +	.id		=3D MAX77686_LDO##num,				\
> +	.ops		=3D &max77686_ops,				\
> +	.type		=3D REGULATOR_VOLTAGE,				\
> +	.owner		=3D THIS_MODULE,					\
> +	.min_uV		=3D 800000,					\
> +	.uV_step	=3D 25000,					\
> +	.n_voltages	=3D 64,						\
> +	.vsel_reg	=3D MAX77686_REG_LDO1CTRL1 + num - 1,		\
> +	.vsel_mask	=3D 0x3f,						\
> +	.enable_reg	=3D MAX77686_REG_LDO1CTRL1 + num - 1,		\
> +	.enable_mask	=3D 0x0c,						\
> +}
> +#define regulator_desc_buck(num)	{				\
> +	.name		=3D "BUCK"#num,					\
> +	.id		=3D MAX77686_BUCK##num,				\
> +	.ops		=3D &max77686_ops,				\
> +	.type		=3D REGULATOR_VOLTAGE,				\
> +	.owner		=3D THIS_MODULE,					\
> +	.min_uV		=3D 750000,					\
> +	.uV_step	=3D 50000,					\
> +	.n_voltages	=3D 64,						\
> +	.vsel_reg	=3D MAX77686_REG_BUCK5OUT + (num - 5) * 2,	\
> +	.vsel_mask	=3D 0x3f,						\
> +	.enable_reg	=3D MAX77686_REG_BUCK5CTRL + (num - 5) * 2,	\
> +	.enable_mask	=3D 0x03,						\
> +}
> +#define regulator_desc_buck1(num)	{				\
> +	.name		=3D "BUCK"#num,					\
> +	.id		=3D MAX77686_BUCK##num,				\
> +	.ops		=3D &max77686_ops,				\
> +	.type		=3D REGULATOR_VOLTAGE,				\
> +	.owner		=3D THIS_MODULE,					\
> +	.min_uV		=3D 750000,					\
> +	.uV_step	=3D 50000,					\
> +	.n_voltages	=3D 64,						\
> +	.vsel_reg	=3D MAX77686_REG_BUCK1OUT,			\
> +	.vsel_mask	=3D 0x3f,						\
> +	.enable_reg	=3D MAX77686_REG_BUCK1CTRL,			\
> +	.enable_mask	=3D 0x03,						\
> +}
> +#define regulator_desc_buck_dvs(num)	{				\
> +	.name		=3D "BUCK"#num,					\
> +	.id		=3D MAX77686_BUCK##num,				\
> +	.ops		=3D &max77686_buck_ops,				\
> +	.type		=3D REGULATOR_VOLTAGE,				\
> +	.owner		=3D THIS_MODULE,					\
> +	.min_uV		=3D 600000,					\
> +	.uV_step	=3D 12500,					\
> +	.n_voltages	=3D 256,						\
> +	.vsel_reg	=3D MAX77686_REG_BUCK2DVS1 + (num - 2) * 10,	\
> +	.vsel_mask	=3D 0xff,						\
> +	.enable_reg	=3D MAX77686_REG_BUCK2CTRL1 + (num - 2) * 10,	\
> +	.enable_mask	=3D 0x30,						\
> +}
> +
> +static struct regulator_desc regulators[] =3D {
> +	regulator_desc_ldo_low_vol(1),
> +	regulator_desc_ldo_low_vol(2),
> +	regulator_desc_ldo(3),
> +	regulator_desc_ldo(4),
> +	regulator_desc_ldo(5),
> +	regulator_desc_ldo_low_vol(6),
> +	regulator_desc_ldo_low_vol(7),
> +	regulator_desc_ldo_low_vol(8),
> +	regulator_desc_ldo(9),
> +	regulator_desc_ldo(10),
> +	regulator_desc_ldo(11),
> +	regulator_desc_ldo(12),
> +	regulator_desc_ldo(13),
> +	regulator_desc_ldo(14),
> +	regulator_desc_ldo(15),
> +	regulator_desc_ldo(16),
> +	regulator_desc_ldo(17),
> +	regulator_desc_ldo(18),
> +	regulator_desc_ldo(19),
> +	regulator_desc_ldo(20),
> +	regulator_desc_ldo(21),
> +	regulator_desc_ldo(22),
> +	regulator_desc_ldo(23),
> +	regulator_desc_ldo(24),
> +	regulator_desc_ldo(25),
> +	regulator_desc_ldo(26),
> +	regulator_desc_buck1(1),
> +	regulator_desc_buck_dvs(2),
> +	regulator_desc_buck_dvs(3),
> +	regulator_desc_buck_dvs(4),
> +	regulator_desc_buck(5),
> +	regulator_desc_buck(6),
> +	regulator_desc_buck(7),
> +	regulator_desc_buck(8),
> +	regulator_desc_buck(9),
> +};
> +
> +#ifdef CONFIG_OF
> +static int max77686_pmic_dt_parse_pdata(struct max77686_dev *iodev,
> +					struct max77686_platform_data *pdata)
> +{
> +	struct device_node *pmic_np, *regulators_np;
> +	struct of_regulator_match *rdata;
> +	unsigned int i, ret;
> +
> +	pmic_np =3D iodev->dev->of_node;
> +	if (!pmic_np) {
> +		dev_err(iodev->dev, "could not find pmic sub-node\n");
> +		return -ENODEV;
> +	}
> +
> +	regulators_np =3D of_find_node_by_name(pmic_np, "voltage-regulators=
");
> +	if (!regulators_np) {
> +		dev_err(iodev->dev, "could not find regulators sub-node\n");
> +		return -EINVAL;
> +	}
> +
> +	/* count the number of regulators to be supported in pmic */
> +	pdata->num_regulators =3D ARRAY_SIZE(regulators);
> +
> +	rdata =3D devm_kzalloc(iodev->dev, sizeof(*rdata) *
> +				(pdata->num_regulators), GFP_KERNEL);
> +	if (!rdata) {
> +		dev_err(iodev->dev,
> +			"could not allocate memory for regulator data\n");
> +		return -ENOMEM;
> +	}
> +
> +	for (i =3D 0; i < pdata->num_regulators; i++)
> +		rdata[i].name =3D regulators[i].name;
> +
> +	ret =3D of_regulator_match(iodev->dev, regulators_np, rdata,
> +				pdata->num_regulators);
> +
> +	if (ret < 0)
> +		dev_err(iodev->dev, "Parsing DT for regulators failed\n");
> +	else
> +		dev_info(iodev->dev, "regulators found in device tree : %d\n"
> +			, ret);
> +
> +	pdata->regulators =3D rdata;
> +
> +	if (of_property_read_u32(pmic_np, "max77686,buck_ramp_delay", &i))
> +		pdata->ramp_delay =3D i & 0xff;
> +
> +	return 0;
> +}
> +#else
> +static int max77686_pmic_dt_parse_pdata(struct max77686_dev *iodev,
> +					struct max77686_platform_data *pdata)
> +{
> +	return 0;
> +}
> +#endif	/* CONFIG_OF */
> +
> +static __devinit int max77686_pmic_probe(struct platform_device *pde=
v)
> +{
> +	struct max77686_dev *iodev =3D dev_get_drvdata(pdev->dev.parent);
> +	struct max77686_platform_data *pdata =3D iodev->pdata;
> +	struct regulator_dev **rdev;
> +	struct max77686_data *max77686;
> +	struct i2c_client *i2c =3D iodev->i2c;
> +	struct regulator_config config =3D { };
> +	int i, ret, size;
> +
> +	if (iodev->dev->of_node) {
> +		ret =3D max77686_pmic_dt_parse_pdata(iodev, pdata);
> +		if (ret)
> +			return ret;
> +	} else {			/* pdata from machine-setup file */
> +		if (!pdata) {
> +			dev_err(&pdev->dev, "platform data not found\n");
> +			return -ENODEV;
> +		} else {
> +			if (pdata->num_regulators !=3D ARRAY_SIZE(regulators)) {
> +				dev_err(&pdev->dev,
> +					"incomplete regulator list\n");
> +				return -ENODEV;
> +			}
> +		}
> +	}
> +
> +	max77686 =3D devm_kzalloc(&pdev->dev, sizeof(struct max77686_data),
> +				GFP_KERNEL);
> +	if (!max77686)
> +		return -ENOMEM;
> +
> +	size =3D sizeof(struct regulator_dev *) * pdata->num_regulators;
> +	max77686->rdev =3D devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
> +	if (!max77686->rdev) {
> +		kfree(max77686);
> +		return -ENOMEM;
> +	}
> +
> +	rdev =3D max77686->rdev;
> +
> +	max77686->dev =3D &pdev->dev;
> +	max77686->iodev =3D iodev;
> +	max77686->num_regulators =3D pdata->num_regulators;
> +
> +	if (pdata->ramp_delay < MAX77686_RAMP_RATE_13MV ||
> +		pdata->ramp_delay > MAX77686_RAMP_RATE_100MV)
> +		pdata->ramp_delay =3D MAX77686_RAMP_RATE_27MV;	/* default */
> +
> +	max77686->ramp_delay =3D pdata->ramp_delay - 1;


I think it is better to check pdata->ramp_delay is available.
If pdata doesn't have ramp_delay member it might be error.

> +	max77686_update_reg(i2c, MAX77686_REG_BUCK2CTRL1,
> +		max77686->ramp_delay << 6, RAMP_MASK);
> +	max77686_update_reg(i2c, MAX77686_REG_BUCK3CTRL1,
> +		max77686->ramp_delay << 6, RAMP_MASK);
> +	max77686_update_reg(i2c, MAX77686_REG_BUCK4CTRL1,
> +		max77686->ramp_delay << 6, RAMP_MASK);
> +


Why do you use i2c client still? If you registered regmap you can use
its API. I recommend you to use regmap_update_bits() directly.


> +	platform_set_drvdata(pdev, max77686);
> +
> +	for (i =3D 0; i < pdata->num_regulators; i++) {
> +		config.dev =3D max77686->dev;
> +		config.init_data =3D pdata->regulators[i].init_data;
> +		config.driver_data =3D max77686;
> +		config.regmap =3D iodev->regmap;
> +
> +		rdev[i] =3D regulator_register(&regulators[i], &config);
> +		if (IS_ERR(rdev[i])) {
> +			ret =3D PTR_ERR(rdev[i]);
> +			dev_err(max77686->dev,
> +				"regulator init failed for id : %d\n", i);
> +			rdev[i] =3D NULL;
> +			goto err;
> +		}
> +	}
> +
> +	return 0;
> + err:
> +	for (i =3D 0; i < max77686->num_regulators; i++)
> +		if (rdev[i])
> +			regulator_unregister(rdev[i]);
> +
> +	return ret;
> +}
> +
> +static int __devexit max77686_pmic_remove(struct platform_device *pd=
ev)
> +{
> +	struct max77686_data *max77686 =3D platform_get_drvdata(pdev);
> +	struct regulator_dev **rdev =3D max77686->rdev;
> +	int i;
> +
> +	for (i =3D 0; i < max77686->num_regulators; i++)
> +		if (rdev[i])
> +			regulator_unregister(rdev[i]);
> +
> +	return 0;
> +}
> +
> +static const struct platform_device_id max77686_pmic_id[] =3D {
> +	{"max77686-pmic", 0},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(platform, max77686_pmic_id);
> +
> +static struct platform_driver max77686_pmic_driver =3D {
> +	.driver =3D {
> +		   .name =3D "max77686-pmic",
> +		   .owner =3D THIS_MODULE,
> +		   },
> +	.probe =3D max77686_pmic_probe,
> +	.remove =3D __devexit_p(max77686_pmic_remove),
> +	.id_table =3D max77686_pmic_id,
> +};
> +
> +static int __init max77686_pmic_init(void)
> +{
> +	return platform_driver_register(&max77686_pmic_driver);
> +}
> +subsys_initcall(max77686_pmic_init);
> +
> +static void __exit max77686_pmic_cleanup(void)
> +{
> +	platform_driver_unregister(&max77686_pmic_driver);
> +}
> +module_exit(max77686_pmic_cleanup);
> +
> +MODULE_DESCRIPTION("MAXIM 77686 Regulator Driver");
> +MODULE_AUTHOR("Chiwoong Byun <woong.byun@samsung.com>");
> +MODULE_AUTHOR("Yadwinder Singh Brar <yadi.brar@samsung.com>");
> +MODULE_LICENSE("GPL");


MAX77686 has crystal oscillator in it. And original version of this
driver which was written by Chiwoon Byun, registers it as a regulator.
As Mark says, we have to change it to use generic clock API. Where do
you think should we put them into? In my opinion, it is proper that jus=
t
leave them in regulator driver because this driver is almost core of
PMIC. I already applied generic API in my local repository but i
couldn't test yet. Because it crashed with SOC's private clock API.
Anyway if you register 32khz clock with generic API ,DEFINE_CLK_GATE()
will help you out which defined in linux/clk-private.h.

Thanks.
