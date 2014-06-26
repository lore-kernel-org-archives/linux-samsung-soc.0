From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 07/14] mfd: Add driver for Maxim 77802 Power Management
 IC
Date: Thu, 26 Jun 2014 11:31:33 +0200
Message-ID: <1403775093.27156.13.camel@AMDC1943>
References: <1403723019-6212-1-git-send-email-javier.martinez@collabora.co.uk>
 <1403723019-6212-8-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:31137 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754612AbaFZJbg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 05:31:36 -0400
In-reply-to: <1403723019-6212-8-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

Just a few nit-picks below but overall everything looks fine:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>


On =C5=9Bro, 2014-06-25 at 21:03 +0200, Javier Martinez Canillas wrote:
> Maxim MAX77802 is a power management chip that contains 10 high
> efficiency Buck regulators, 32 Low-dropout (LDO) regulators used
> to power up application processors and peripherals, a 2-channel
> 32kHz clock outputs, a Real-Time-Clock (RTC) and a I2C interface
> to program the individual regulators, clocks outputs and the RTC.
>=20
> This patch adds the core support for MAX77802 PMIC and is based
> on a driver added by Simon Glass to the Chrome OS kernel 3.8 tree.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>

(...)

> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index f001487..e795bfe 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -117,6 +117,7 @@ obj-$(CONFIG_MFD_DA9063)	+=3D da9063.o
>  obj-$(CONFIG_MFD_MAX14577)	+=3D max14577.o
>  obj-$(CONFIG_MFD_MAX77686)	+=3D max77686.o
>  obj-$(CONFIG_MFD_MAX77693)	+=3D max77693.o
> +obj-$(CONFIG_MFD_MAX77802)      +=3D max77802.o
>  obj-$(CONFIG_MFD_MAX8907)	+=3D max8907.o
>  max8925-objs			:=3D max8925-core.o max8925-i2c.o
>  obj-$(CONFIG_MFD_MAX8925)	+=3D max8925.o
> diff --git a/drivers/mfd/max77802.c b/drivers/mfd/max77802.c
> new file mode 100644
> index 0000000..3d477fb
> --- /dev/null
> +++ b/drivers/mfd/max77802.c
> @@ -0,0 +1,366 @@
> +/*
> + * max77802.c - mfd core driver for the Maxim 77802
> + *
> + * Copyright (C) 2013-2014 Google, Inc
> + * Simon Glass <sjg@chromium.org>
> + *
> + * Copyright (C) 2012 Samsung Electronics
> + * Chiwoong Byun <woong.byun@smasung.com>
> + * Jonghwa Lee <jonghwa3.lee@samsung.com>
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
> + * This driver is based on max8997.c
> + */
> +
> +#include <linux/export.h>
> +#include <linux/slab.h>
> +#include <linux/i2c.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/module.h>
> +#include <linux/mfd/core.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mfd/max77802.h>
> +#include <linux/mfd/max77802-private.h>
> +#include <linux/of.h>
> +#include <linux/of_gpio.h>
> +#include <linux/err.h>
> +
> +static const struct mfd_cell max77802_devs[] =3D {
> +	{ .name =3D "max77802-pmic", },
> +	{ .name =3D "max77802-clk", },
> +	{ .name =3D "max77802-rtc", },
> +};
> +
> +static bool max77802_pmic_is_accessible_reg(struct device *dev,
> +					    unsigned int reg)
> +{
> +	return (reg >=3D MAX77802_REG_DEVICE_ID && reg < MAX77802_REG_PMIC_=
END);
> +}
> +
> +static bool max77802_rtc_is_accessible_reg(struct device *dev,
> +					   unsigned int reg)
> +{
> +	return (reg >=3D MAX77802_RTC_INT && reg < MAX77802_RTC_END);
> +}
> +
> +static bool max77802_is_accessible_reg(struct device *dev, unsigned =
int reg)
> +{
> +	return (max77802_pmic_is_accessible_reg(dev, reg) ||
> +		max77802_rtc_is_accessible_reg(dev, reg));
> +}
> +
> +static bool max77802_pmic_is_precious_reg(struct device *dev, unsign=
ed int reg)
> +{
> +	return (reg =3D=3D MAX77802_REG_INTSRC || reg =3D=3D MAX77802_REG_I=
NT1 ||
> +		reg =3D=3D MAX77802_REG_INT2);
> +}
> +
> +static bool max77802_rtc_is_precious_reg(struct device *dev, unsigne=
d int reg)
> +{
> +	return (reg =3D=3D MAX77802_RTC_INT ||
> +		reg =3D=3D MAX77802_RTC_UPDATE0 ||
> +		reg =3D=3D MAX77802_RTC_UPDATE1);
> +}
> +
> +static bool max77802_is_precious_reg(struct device *dev, unsigned in=
t reg)
> +{
> +	return (max77802_pmic_is_precious_reg(dev, reg) ||
> +		max77802_rtc_is_precious_reg(dev, reg));
> +}
> +
> +static bool max77802_pmic_is_volatile_reg(struct device *dev, unsign=
ed int reg)
> +{
> +	return (max77802_is_precious_reg(dev, reg) ||
> +		reg =3D=3D MAX77802_REG_STATUS1 || reg =3D=3D MAX77802_REG_STATUS2=
 ||
> +		reg =3D=3D MAX77802_REG_PWRON);
> +}
> +
> +static bool max77802_rtc_is_volatile_reg(struct device *dev, unsigne=
d int reg)
> +{
> +	return (max77802_rtc_is_precious_reg(dev, reg) ||
> +		reg =3D=3D MAX77802_RTC_SEC ||
> +		reg =3D=3D MAX77802_RTC_MIN ||
> +		reg =3D=3D MAX77802_RTC_HOUR ||
> +		reg =3D=3D MAX77802_RTC_WEEKDAY ||
> +		reg =3D=3D MAX77802_RTC_MONTH ||
> +		reg =3D=3D MAX77802_RTC_YEAR ||
> +		reg =3D=3D MAX77802_RTC_DATE);
> +}
> +
> +static bool max77802_is_volatile_reg(struct device *dev, unsigned in=
t reg)
> +{
> +	return (max77802_pmic_is_volatile_reg(dev, reg) ||
> +		max77802_rtc_is_volatile_reg(dev, reg));
> +}
> +
> +static struct regmap_config max77802_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.writeable_reg =3D max77802_is_accessible_reg,
> +	.readable_reg =3D max77802_is_accessible_reg,
> +	.precious_reg =3D max77802_is_precious_reg,
> +	.volatile_reg =3D max77802_is_volatile_reg,
> +	.name =3D "max77802-pmic",
> +	.cache_type =3D REGCACHE_RBTREE,
> +};
> +
> +static const struct regmap_irq max77802_irqs[] =3D {
> +	/* INT1 interrupts */
> +	{ .reg_offset =3D 0, .mask =3D MAX77802_INT1_PWRONF_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77802_INT1_PWRONR_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77802_INT1_JIGONBF_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77802_INT1_JIGONBR_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77802_INT1_ACOKBF_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77802_INT1_ACOKBR_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77802_INT1_ONKEY1S_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77802_INT1_MRSTB_MSK, },
> +	/* INT2 interrupts */
> +	{ .reg_offset =3D 1, .mask =3D MAX77802_INT2_140C_MSK, },
> +	{ .reg_offset =3D 1, .mask =3D MAX77802_INT2_120C_MSK, },
> +};
> +
> +static const struct regmap_irq_chip max77802_irq_chip =3D {
> +	.name			=3D "max77802-pmic",
> +	.status_base		=3D MAX77802_REG_INT1,
> +	.mask_base		=3D MAX77802_REG_INT1MSK,
> +	.num_regs		=3D 2,
> +	.irqs			=3D max77802_irqs,
> +	.num_irqs		=3D ARRAY_SIZE(max77802_irqs),
> +};
> +
> +static const struct regmap_irq max77802_rtc_irqs[] =3D {
> +	/* RTC interrupts */
> +	{ .reg_offset =3D 0, .mask =3D MAX77802_RTCINT_RTC60S_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77802_RTCINT_RTCA1_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77802_RTCINT_RTCA2_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77802_RTCINT_SMPL_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77802_RTCINT_RTC1S_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77802_RTCINT_WTSR_MSK, },
> +};
> +
> +static const struct regmap_irq_chip max77802_rtc_irq_chip =3D {
> +	.name			=3D "max77802-rtc",
> +	.status_base		=3D MAX77802_RTC_INT,
> +	.mask_base		=3D MAX77802_RTC_INTM,
> +	.num_regs		=3D 1,
> +	.irqs			=3D max77802_rtc_irqs,
> +	.num_irqs		=3D ARRAY_SIZE(max77802_rtc_irqs),
> +};
> +
> +#ifdef CONFIG_OF
> +static struct of_device_id max77802_pmic_dt_match[] =3D {
> +	{.compatible =3D "maxim,max77802", .data =3D NULL},
> +	{},
> +};
> +
> +static void max77802_dt_parse_dvs_gpio(struct device *dev,
> +				       struct max77802_platform_data *pd,
> +				       struct device_node *np)
> +{
> +	int i;
> +
> +	/*
> +	 * NOTE: we don't consider GPIO errors fatal; board may have some l=
ines
> +	 * directly pulled high or low and thus doesn't specify them.
> +	 */
> +	for (i =3D 0; i < ARRAY_SIZE(pd->buck_gpio_dvs); i++)
> +		pd->buck_gpio_dvs[i] =3D
> +			devm_gpiod_get_index(dev, "max77802,pmic-buck-dvs", i);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(pd->buck_gpio_selb); i++)
> +		pd->buck_gpio_selb[i] =3D
> +			devm_gpiod_get_index(dev, "max77802,pmic-buck-selb", i);
> +}
> +
> +static struct max77802_platform_data *max77802_i2c_parse_dt_pdata(st=
ruct device
> +								  *dev)
> +{
> +	struct device_node *np =3D dev->of_node;
> +	struct max77802_platform_data *pd;
> +
> +	pd =3D devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
> +	if (!pd)
> +		return NULL;
> +
> +	/* Read default index and ignore errors, since default is 0 */
> +	of_property_read_u32(np, "max77802,pmic-buck-default-dvs-idx",
> +			     &pd->buck_default_idx);
> +
> +	max77802_dt_parse_dvs_gpio(dev, pd, np);
> +
> +	dev->platform_data =3D pd;
> +	return pd;
> +}
> +#else
> +static struct max77802_platform_data *max77802_i2c_parse_dt_pdata(st=
ruct device
> +								  *dev)
> +{
> +	return 0;
> +}
> +#endif
> +
> +static int max77802_i2c_probe(struct i2c_client *i2c,
> +			      const struct i2c_device_id *id)
> +{
> +	struct max77802_dev *max77802 =3D NULL;
> +	struct max77802_platform_data *pdata =3D dev_get_platdata(&i2c->dev=
);
> +	unsigned int data;
> +	int ret =3D 0;
> +
> +	if (i2c->dev.of_node)
> +		pdata =3D max77802_i2c_parse_dt_pdata(&i2c->dev);
> +
> +	if (!pdata) {
> +		dev_err(&i2c->dev, "No platform data found.\n");
> +		return -EIO;
> +	}
> +
> +	max77802 =3D devm_kzalloc(&i2c->dev, sizeof(struct max77802_dev),
> +				GFP_KERNEL);
> +	if (max77802 =3D=3D NULL)

It is inconsistent. Before you used "(!pd)" and "(!pdata)" so maybe
stick to one format?

> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(i2c, max77802);
> +
> +	max77802->dev =3D &i2c->dev;
> +	max77802->i2c =3D i2c;
> +	max77802->type =3D id->driver_data;
> +
> +	max77802->wakeup =3D pdata->wakeup;
> +	max77802->irq =3D i2c->irq;
> +
> +	max77802->regmap =3D devm_regmap_init_i2c(i2c, &max77802_regmap_con=
fig);
> +	if (IS_ERR(max77802->regmap)) {
> +		ret =3D PTR_ERR(max77802->regmap);
> +		dev_err(max77802->dev, "Failed to allocate register map: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	if (regmap_read(max77802->regmap,
> +			 MAX77802_REG_DEVICE_ID, &data) < 0) {
> +		dev_err(max77802->dev,
> +			"device not found on this channel\n");
> +		return -ENODEV;
> +	}
> +
> +	ret =3D regmap_add_irq_chip(max77802->regmap, max77802->irq,
> +				  IRQF_TRIGGER_FALLING | IRQF_ONESHOT |
> +				  IRQF_SHARED, 0, &max77802_irq_chip,
> +				  &max77802->irq_data);
> +	if (ret !=3D 0) {
> +		dev_err(&i2c->dev, "failed to add PMIC irq chip: %d\n", ret);
> +		return ret;
> +	}
> +	ret =3D regmap_add_irq_chip(max77802->regmap, max77802->irq,
> +				  IRQF_TRIGGER_FALLING | IRQF_ONESHOT |
> +				  IRQF_SHARED, 0, &max77802_rtc_irq_chip,
> +				  &max77802->rtc_irq_data);
> +	if (ret !=3D 0) {
> +		dev_err(&i2c->dev, "failed to add RTC irq chip: %d\n", ret);
> +		goto err_del_irqc;
> +	}
> +
> +	ret =3D mfd_add_devices(max77802->dev, -1, max77802_devs,
> +			      ARRAY_SIZE(max77802_devs), NULL, 0, NULL);
> +	if (ret < 0) {
> +		dev_err(&i2c->dev, "failed to add MFD devices: %d\n", ret);
> +		goto err_del_rtc_irqc;
> +	}
> +
> +	return 0;
> +
> +err_del_rtc_irqc:
> +	regmap_del_irq_chip(max77802->irq, max77802->rtc_irq_data);
> +err_del_irqc:
> +	regmap_del_irq_chip(max77802->irq, max77802->irq_data);
> +	return ret;
> +}
> +
> +static int max77802_i2c_remove(struct i2c_client *i2c)
> +{
> +	struct max77802_dev *max77802 =3D i2c_get_clientdata(i2c);
> +
> +	mfd_remove_devices(max77802->dev);
> +
> +	regmap_del_irq_chip(max77802->irq, max77802->rtc_irq_data);
> +	regmap_del_irq_chip(max77802->irq, max77802->irq_data);
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id max77802_i2c_id[] =3D {
> +	{ "max77802", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, max77802_i2c_id);
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int max77802_suspend(struct device *dev)
> +{
> +	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct max77802_dev *max77802 =3D i2c_get_clientdata(i2c);
> +
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(max77802->irq);
> +
> +	disable_irq(max77802->irq);

Can you add short comment why this is needed? I know why but just for
future generations which will wonder: "why do we need to disable the IR=
Q
while suspending?" :). Especially that this is rather a workaround for
issue in other driver (I2C bus).

> +
> +	return 0;
> +}
> +
> +static int max77802_resume(struct device *dev)
> +{
> +	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct max77802_dev *max77802 =3D i2c_get_clientdata(i2c);
> +
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(max77802->irq);
> +
> +	enable_irq(max77802->irq);
> +
> +	return 0;
> +}
> +#endif /* CONFIG_PM_SLEEP */
> +
> +static SIMPLE_DEV_PM_OPS(max77802_pm, max77802_suspend, max77802_res=
ume);
> +
> +static struct i2c_driver max77802_i2c_driver =3D {
> +	.driver =3D {
> +		   .name =3D "max77802",
> +		   .owner =3D THIS_MODULE,
> +		   .pm =3D &max77802_pm,
> +		   .of_match_table =3D of_match_ptr(max77802_pmic_dt_match),
> +	},
> +	.probe =3D max77802_i2c_probe,
> +	.remove =3D max77802_i2c_remove,
> +	.id_table =3D max77802_i2c_id,
> +};
> +
> +static int __init max77802_i2c_init(void)
> +{
> +	return i2c_add_driver(&max77802_i2c_driver);
> +}
> +/* init early so consumer devices can complete system boot */
> +subsys_initcall(max77802_i2c_init);
> +
> +static void __exit max77802_i2c_exit(void)
> +{
> +	i2c_del_driver(&max77802_i2c_driver);
> +}
> +module_exit(max77802_i2c_exit);
> +
> +MODULE_DESCRIPTION("MAXIM 77802 multi-function core driver");
> +MODULE_AUTHOR("Simon Glass <sjg@chromium.org>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/max77802-private.h b/include/linux/mfd=
/max77802-private.h
> new file mode 100644
> index 0000000..7539ab4
> --- /dev/null
> +++ b/include/linux/mfd/max77802-private.h
> @@ -0,0 +1,307 @@
> +/*
> + * max77802-private.h - Voltage regulator driver for the Maxim 77802
> + *
> + *  Copyright (C) 2012 Samsung Electrnoics
> + *  Chiwoong Byun <woong.byun@samsung.com>
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
> + */
> +
> +#ifndef __LINUX_MFD_MAX77802_PRIV_H
> +#define __LINUX_MFD_MAX77802_PRIV_H
> +
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include <linux/module.h>
> +
> +#define MAX77802_REG_INVALID		(0xff)
> +
> +enum max77802_pmic_reg {
> +	MAX77802_REG_DEVICE_ID		=3D 0x00,
> +	MAX77802_REG_INTSRC		=3D 0x01,
> +	MAX77802_REG_INT1		=3D 0x02,
> +	MAX77802_REG_INT2		=3D 0x03,
> +
> +	MAX77802_REG_INT1MSK		=3D 0x04,
> +	MAX77802_REG_INT2MSK		=3D 0x05,
> +
> +	MAX77802_REG_STATUS1		=3D 0x06,
> +	MAX77802_REG_STATUS2		=3D 0x07,
> +
> +	MAX77802_REG_PWRON		=3D 0x08,
> +	/* Reserved: 0x09 */
> +	MAX77802_REG_MRSTB		=3D 0x0A,
> +	MAX77802_REG_EPWRHOLD		=3D 0x0B,
> +	/* Reserved: 0x0C-0x0D */
> +	MAX77802_REG_BOOSTCTRL		=3D 0x0E,
> +	MAX77802_REG_BOOSTOUT		=3D 0x0F,
> +
> +	MAX77802_REG_BUCK1CTRL		=3D 0x10,
> +	MAX77802_REG_BUCK1DVS1		=3D 0x11,
> +	MAX77802_REG_BUCK1DVS2		=3D 0x12,
> +	MAX77802_REG_BUCK1DVS3		=3D 0x13,
> +	MAX77802_REG_BUCK1DVS4		=3D 0x14,
> +	MAX77802_REG_BUCK1DVS5		=3D 0x15,
> +	MAX77802_REG_BUCK1DVS6		=3D 0x16,
> +	MAX77802_REG_BUCK1DVS7		=3D 0x17,
> +	MAX77802_REG_BUCK1DVS8		=3D 0x18,
> +	/* Reserved: 0x19 */
> +	MAX77802_REG_BUCK2CTRL1		=3D 0x1A,
> +	MAX77802_REG_BUCK2CTRL2		=3D 0x1B,
> +	MAX77802_REG_BUCK2PHTRAN	=3D 0x1C,
> +	MAX77802_REG_BUCK2DVS1		=3D 0x1D,
> +	MAX77802_REG_BUCK2DVS2		=3D 0x1E,
> +	MAX77802_REG_BUCK2DVS3		=3D 0x1F,
> +	MAX77802_REG_BUCK2DVS4		=3D 0x20,
> +	MAX77802_REG_BUCK2DVS5		=3D 0x21,
> +	MAX77802_REG_BUCK2DVS6		=3D 0x22,
> +	MAX77802_REG_BUCK2DVS7		=3D 0x23,
> +	MAX77802_REG_BUCK2DVS8		=3D 0x24,
> +	/* Reserved: 0x25-0x26 */
> +	MAX77802_REG_BUCK3CTRL1		=3D 0x27,
> +	MAX77802_REG_BUCK3DVS1		=3D 0x28,
> +	MAX77802_REG_BUCK3DVS2		=3D 0x29,
> +	MAX77802_REG_BUCK3DVS3		=3D 0x2A,
> +	MAX77802_REG_BUCK3DVS4		=3D 0x2B,
> +	MAX77802_REG_BUCK3DVS5		=3D 0x2C,
> +	MAX77802_REG_BUCK3DVS6		=3D 0x2D,
> +	MAX77802_REG_BUCK3DVS7		=3D 0x2E,
> +	MAX77802_REG_BUCK3DVS8		=3D 0x2F,
> +	/* Reserved: 0x30-0x36 */
> +	MAX77802_REG_BUCK4CTRL1		=3D 0x37,
> +	MAX77802_REG_BUCK4DVS1		=3D 0x38,
> +	MAX77802_REG_BUCK4DVS2		=3D 0x39,
> +	MAX77802_REG_BUCK4DVS3		=3D 0x3A,
> +	MAX77802_REG_BUCK4DVS4		=3D 0x3B,
> +	MAX77802_REG_BUCK4DVS5		=3D 0x3C,
> +	MAX77802_REG_BUCK4DVS6		=3D 0x3D,
> +	MAX77802_REG_BUCK4DVS7		=3D 0x3E,
> +	MAX77802_REG_BUCK4DVS8		=3D 0x3F,
> +	/* Reserved: 0x40 */
> +	MAX77802_REG_BUCK5CTRL		=3D 0x41,
> +	MAX77802_REG_BUCK5OUT		=3D 0x42,
> +	/* Reserved: 0x43 */
> +	MAX77802_REG_BUCK6CTRL		=3D 0x44,
> +	MAX77802_REG_BUCK6DVS1		=3D 0x45,
> +	MAX77802_REG_BUCK6DVS2		=3D 0x46,
> +	MAX77802_REG_BUCK6DVS3		=3D 0x47,
> +	MAX77802_REG_BUCK6DVS4		=3D 0x48,
> +	MAX77802_REG_BUCK6DVS5		=3D 0x49,
> +	MAX77802_REG_BUCK6DVS6		=3D 0x4A,
> +	MAX77802_REG_BUCK6DVS7		=3D 0x4B,
> +	MAX77802_REG_BUCK6DVS8		=3D 0x4C,
> +	/* Reserved: 0x4D */
> +	MAX77802_REG_BUCK7CTRL		=3D 0x4E,
> +	MAX77802_REG_BUCK7OUT		=3D 0x4F,
> +	/* Reserved: 0x50 */
> +	MAX77802_REG_BUCK8CTRL		=3D 0x51,
> +	MAX77802_REG_BUCK8OUT		=3D 0x52,
> +	/* Reserved: 0x53 */
> +	MAX77802_REG_BUCK9CTRL		=3D 0x54,
> +	MAX77802_REG_BUCK9OUT		=3D 0x55,
> +	/* Reserved: 0x56 */
> +	MAX77802_REG_BUCK10CTRL		=3D 0x57,
> +	MAX77802_REG_BUCK10OUT		=3D 0x58,
> +
> +	/* Reserved: 0x59-0x5F */
> +
> +	MAX77802_REG_LDO1CTRL1		=3D 0x60,
> +	MAX77802_REG_LDO2CTRL1		=3D 0x61,
> +	MAX77802_REG_LDO3CTRL1		=3D 0x62,
> +	MAX77802_REG_LDO4CTRL1		=3D 0x63,
> +	MAX77802_REG_LDO5CTRL1		=3D 0x64,
> +	MAX77802_REG_LDO6CTRL1		=3D 0x65,
> +	MAX77802_REG_LDO7CTRL1		=3D 0x66,
> +	MAX77802_REG_LDO8CTRL1		=3D 0x67,
> +	MAX77802_REG_LDO9CTRL1		=3D 0x68,
> +	MAX77802_REG_LDO10CTRL1		=3D 0x69,
> +	MAX77802_REG_LDO11CTRL1		=3D 0x6A,
> +	MAX77802_REG_LDO12CTRL1		=3D 0x6B,
> +	MAX77802_REG_LDO13CTRL1		=3D 0x6C,
> +	MAX77802_REG_LDO14CTRL1		=3D 0x6D,
> +	MAX77802_REG_LDO15CTRL1		=3D 0x6E,
> +	/* Reserved: 0x6F */
> +	MAX77802_REG_LDO17CTRL1		=3D 0x70,
> +	MAX77802_REG_LDO18CTRL1		=3D 0x71,
> +	MAX77802_REG_LDO19CTRL1		=3D 0x72,
> +	MAX77802_REG_LDO20CTRL1		=3D 0x73,
> +	MAX77802_REG_LDO21CTRL1		=3D 0x74,
> +	MAX77802_REG_LDO22CTRL1		=3D 0x75,
> +	MAX77802_REG_LDO23CTRL1		=3D 0x76,
> +	MAX77802_REG_LDO24CTRL1		=3D 0x77,
> +	MAX77802_REG_LDO25CTRL1		=3D 0x78,
> +	MAX77802_REG_LDO26CTRL1		=3D 0x79,
> +	MAX77802_REG_LDO27CTRL1		=3D 0x7A,
> +	MAX77802_REG_LDO28CTRL1		=3D 0x7B,
> +	MAX77802_REG_LDO29CTRL1		=3D 0x7C,
> +	MAX77802_REG_LDO30CTRL1		=3D 0x7D,
> +	/* Reserved: 0x7E */
> +	MAX77802_REG_LDO32CTRL1		=3D 0x7F,
> +	MAX77802_REG_LDO33CTRL1		=3D 0x80,
> +	MAX77802_REG_LDO34CTRL1		=3D 0x81,
> +	MAX77802_REG_LDO35CTRL1		=3D 0x82,
> +	/* Reserved: 0x83-0x8F */
> +	MAX77802_REG_LDO1CTRL2		=3D 0x90,
> +	MAX77802_REG_LDO2CTRL2		=3D 0x91,
> +	MAX77802_REG_LDO3CTRL2		=3D 0x92,
> +	MAX77802_REG_LDO4CTRL2		=3D 0x93,
> +	MAX77802_REG_LDO5CTRL2		=3D 0x94,
> +	MAX77802_REG_LDO6CTRL2		=3D 0x95,
> +	MAX77802_REG_LDO7CTRL2		=3D 0x96,
> +	MAX77802_REG_LDO8CTRL2		=3D 0x97,
> +	MAX77802_REG_LDO9CTRL2		=3D 0x98,
> +	MAX77802_REG_LDO10CTRL2		=3D 0x99,
> +	MAX77802_REG_LDO11CTRL2		=3D 0x9A,
> +	MAX77802_REG_LDO12CTRL2		=3D 0x9B,
> +	MAX77802_REG_LDO13CTRL2		=3D 0x9C,
> +	MAX77802_REG_LDO14CTRL2		=3D 0x9D,
> +	MAX77802_REG_LDO15CTRL2		=3D 0x9E,
> +	/* Reserved: 0x9F */
> +	MAX77802_REG_LDO17CTRL2		=3D 0xA0,
> +	MAX77802_REG_LDO18CTRL2		=3D 0xA1,
> +	MAX77802_REG_LDO19CTRL2		=3D 0xA2,
> +	MAX77802_REG_LDO20CTRL2		=3D 0xA3,
> +	MAX77802_REG_LDO21CTRL2		=3D 0xA4,
> +	MAX77802_REG_LDO22CTRL2		=3D 0xA5,
> +	MAX77802_REG_LDO23CTRL2		=3D 0xA6,
> +	MAX77802_REG_LDO24CTRL2		=3D 0xA7,
> +	MAX77802_REG_LDO25CTRL2		=3D 0xA8,
> +	MAX77802_REG_LDO26CTRL2		=3D 0xA9,
> +	MAX77802_REG_LDO27CTRL2		=3D 0xAA,
> +	MAX77802_REG_LDO28CTRL2		=3D 0xAB,
> +	MAX77802_REG_LDO29CTRL2		=3D 0xAC,
> +	MAX77802_REG_LDO30CTRL2		=3D 0xAD,
> +	/* Reserved: 0xAE */
> +	MAX77802_REG_LDO32CTRL2		=3D 0xAF,
> +	MAX77802_REG_LDO33CTRL2		=3D 0xB0,
> +	MAX77802_REG_LDO34CTRL2		=3D 0xB1,
> +	MAX77802_REG_LDO35CTRL2		=3D 0xB2,
> +	/* Reserved: 0xB3 */
> +
> +	MAX77802_REG_BBAT_CHG		=3D 0xB4,
> +	MAX77802_REG_32KHZ		=3D 0xB5,
> +
> +	MAX77802_REG_PMIC_END		=3D 0xB6,
> +};
> +
> +enum max77802_rtc_reg {
> +	MAX77802_RTC_INT		=3D 0xC0,
> +	MAX77802_RTC_INTM		=3D 0xC1,
> +	MAX77802_RTC_CONTROLM		=3D 0xC2,
> +	MAX77802_RTC_CONTROL		=3D 0xC3,
> +	MAX77802_RTC_UPDATE0		=3D 0xC4,
> +	MAX77802_RTC_UPDATE1		=3D 0xC5,
> +	MAX77802_WTSR_SMPL_CNTL		=3D 0xC6,
> +	MAX77802_RTC_SEC		=3D 0xC7,
> +	MAX77802_RTC_MIN		=3D 0xC8,
> +	MAX77802_RTC_HOUR		=3D 0xC9,
> +	MAX77802_RTC_WEEKDAY		=3D 0xCA,
> +	MAX77802_RTC_MONTH		=3D 0xCB,
> +	MAX77802_RTC_YEAR		=3D 0xCC,
> +	MAX77802_RTC_DATE		=3D 0xCD,
> +	MAX77802_RTC_AE1		=3D 0xCE,
> +	MAX77802_ALARM1_SEC		=3D 0xCF,
> +	MAX77802_ALARM1_MIN		=3D 0xD0,
> +	MAX77802_ALARM1_HOUR		=3D 0xD1,
> +	MAX77802_ALARM1_WEEKDAY		=3D 0xD2,
> +	MAX77802_ALARM1_MONTH		=3D 0xD3,
> +	MAX77802_ALARM1_YEAR		=3D 0xD4,
> +	MAX77802_ALARM1_DATE		=3D 0xD5,
> +	MAX77802_RTC_AE2		=3D 0xD6,
> +	MAX77802_ALARM2_SEC		=3D 0xD7,
> +	MAX77802_ALARM2_MIN		=3D 0xD8,
> +	MAX77802_ALARM2_HOUR		=3D 0xD9,
> +	MAX77802_ALARM2_WEEKDAY		=3D 0xDA,
> +	MAX77802_ALARM2_MONTH		=3D 0xDB,
> +	MAX77802_ALARM2_YEAR		=3D 0xDC,
> +	MAX77802_ALARM2_DATE		=3D 0xDD,
> +
> +	MAX77802_RTC_END		=3D 0xDF,
> +};
> +
> +#define MAX77802_IRQSRC_PMIC            (0)

Shouldn't it be BIT(0) or BIT(1)? It looks odd.

> +#define MAX77802_IRQSRC_RTC	        BIT(0)

Anyway, are these defines used anywhere? Seems not.=20

Best regards,
Krzysztof
