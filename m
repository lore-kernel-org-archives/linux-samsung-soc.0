From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v6 17/23] mfd: max77686: Add Maxim 77802 PMIC support
Date: Fri, 04 Jul 2014 13:30:34 +0200
Message-ID: <1404473434.14069.10.camel@AMDC1943>
References: <1404467722-26687-1-git-send-email-javier.martinez@collabora.co.uk>
 <1404467722-26687-18-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:10937 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751989AbaGDLag (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 07:30:36 -0400
In-reply-to: <1404467722-26687-18-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Tushar Behera <trblinux@gmail.com>, Andreas Farber <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On pi=C4=85, 2014-07-04 at 11:55 +0200, Javier Martinez Canillas wrote:
> Maxim MAX77802 is a power management chip that contains 10 high
> efficiency Buck regulators, 32 Low-dropout (LDO) regulators used
> to power up application processors and peripherals, a 2-channel
> 32kHz clock outputs, a Real-Time-Clock (RTC) and a I2C interface
> to program the individual regulators, clocks outputs and the RTC.
>=20
> This patch adds support for MAX77802 to the MAX77686 driver and is
> based on a driver added to the Chrome OS kernel 3.8 by Simon Glass.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>=20
>     NOTE: I didn't carry previous {Review,Acked,Tested}-by tags since
>     this patch extending MAX77686 is quite different than the old one
>     adding a new mfd driver. So review and test is highly appreciated=
=2E
>=20
>     Changes since v5:
>      - Extend the 77686 driver to support 77802 instead of adding a n=
ew driver.
>        Suggested by Lee Jones.
>=20
>     Changes since v4:
>      - Use consistent expressions when checking for NULL values.
>        Suggested by Krzysztof Kozlowski.
>      - Remove unused defines. Suggested by Krzysztof Kozlowski.
>      - Explain why IRQ is disabled on suspend. Suggested by Krzysztof=
 Kozlowski.
>=20
>     Changes since v3:
>      - Remove unnecessary OOM error message since the mm subsystem al=
ready logs it.
>=20
>     Changes since v2:
>      - Split the DT binding docs in a separate patch and improve the =
documentation.
>        Suggested by Mark Brown.
>      - Add all the devices in the MFD driver instead of doing in sepa=
rate patches.
>        Suggested by Mark Brown.
>=20
>     Changes since v1:
>      - Convert max77{686,802} to regmap irq API and get rid of max77{=
686,802}-irq.c
>        Suggested by Krzysztof Kozlowski.
>      - Don't protect max77802 mfd_cells using Kconfig options since m=
fd core omits
>        devices that don't match. Suggested by Lee Jones.
>      - Change mfd driver to be tristate instead of boolean. Suggested=
 by Mark Brown.
>      - Change binding "voltage-regulators" property to "regulators" t=
o be consistent
>        with other PMIC drivers. Suggested by Mark Brown.
>      - Use regulators node names instead of the deprecated "regulator=
-compatible"
>        property. Suggested by Mark Brown.
>      - Use the new descriptor-based GPIO interface instead of the dep=
recated
> ---
>  drivers/mfd/Kconfig                  |   6 +-
>  drivers/mfd/max77686.c               | 187 +++++++++++++++++++++++++=
+-----
>  include/linux/mfd/max77686-private.h | 208 +++++++++++++++++++++++++=
+++++++++-
>  include/linux/mfd/max77686.h         |  60 +++++++++-
>  4 files changed, 428 insertions(+), 33 deletions(-)
>=20

Three comments below, after fixing:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

(...)

> @@ -55,6 +123,17 @@ static struct regmap_config max77686_rtc_regmap_c=
onfig =3D {
>  	.val_bits =3D 8,
>  };
> =20
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
>  static const struct regmap_irq max77686_irqs[] =3D {
>  	/* INT1 interrupts */
>  	{ .reg_offset =3D 0, .mask =3D MAX77686_INT1_PWRONF_MSK, },
> @@ -98,9 +177,34 @@ static const struct regmap_irq_chip max77686_rtc_=
irq_chip =3D {
>  	.num_irqs		=3D ARRAY_SIZE(max77686_rtc_irqs),
>  };
> =20
> +static const struct regmap_irq_chip max77802_irq_chip =3D {
> +	.name			=3D "max77802-pmic",
> +	.status_base		=3D MAX77802_REG_INT1,
> +	.mask_base		=3D MAX77802_REG_INT1MSK,
> +	.num_regs		=3D 2,
> +	.irqs			=3D max77686_irqs, /* same masks than 77686 */

"same masks as 77686"

> +	.num_irqs		=3D ARRAY_SIZE(max77686_irqs),
> +};
> +
> +static const struct regmap_irq_chip max77802_rtc_irq_chip =3D {
> +	.name			=3D "max77802-rtc",
> +	.status_base		=3D MAX77802_RTC_INT,
> +	.mask_base		=3D MAX77802_RTC_INTM,
> +	.num_regs		=3D 1,
> +	.irqs			=3D max77686_rtc_irqs, /* same masks than 77686 */

Ditto

> +	.num_irqs		=3D ARRAY_SIZE(max77686_rtc_irqs),
> +};
> +
>  static const struct of_device_id max77686_pmic_dt_match[] =3D {
> -	{.compatible =3D "maxim,max77686", .data =3D NULL},
> -	{},
> +	{
> +		.compatible =3D "maxim,max77686",
> +		.data =3D (void *)TYPE_MAX77686,
> +	},
> +	{
> +		.compatible =3D "maxim,max77802",
> +		.data =3D (void *)TYPE_MAX77802,
> +	},
> +	{ },
>  };
> =20
>  static void max77686_dt_parse_dvs_gpio(struct device *dev)
> @@ -236,6 +340,12 @@ static int max77686_i2c_probe(struct i2c_client =
*i2c,
>  	struct max77686_platform_data *pdata =3D dev_get_platdata(&i2c->dev=
);
>  	unsigned int data;
>  	int ret =3D 0;
> +	const struct regmap_config *config;
> +	const struct regmap_irq_chip *irq_chip;
> +	const struct regmap_irq_chip *rtc_irq_chip;
> +	struct regmap **rtc_regmap;
> +	const struct mfd_cell *cells;
> +	int n_devs;
> =20
>  	if (IS_ENABLED(CONFIG_OF) && i2c->dev.of_node && !pdata)
>  		pdata =3D max77686_i2c_parse_dt_pdata(&i2c->dev);
> @@ -258,56 +368,77 @@ static int max77686_i2c_probe(struct i2c_client=
 *i2c,
>  	max77686->wakeup =3D pdata->wakeup;
>  	max77686->irq =3D i2c->irq;
> =20
> -	max77686->regmap =3D devm_regmap_init_i2c(i2c, &max77686_regmap_con=
fig);
> +	if (max77686->type =3D=3D TYPE_MAX77686) {
> +		config =3D &max77686_regmap_config;
> +		irq_chip =3D &max77686_irq_chip;
> +		rtc_irq_chip =3D &max77686_rtc_irq_chip;
> +		rtc_regmap =3D &max77686->rtc_regmap;
> +		cells =3D  max77686_devs;
> +		n_devs =3D ARRAY_SIZE(max77686_devs);
> +	} else {
> +		config =3D &max77802_regmap_config;
> +		irq_chip =3D &max77802_irq_chip;
> +		rtc_irq_chip =3D &max77802_rtc_irq_chip;
> +		rtc_regmap =3D &max77686->regmap;
> +		cells =3D  max77802_devs;
> +		n_devs =3D ARRAY_SIZE(max77802_devs);
> +	}
> +
> +	max77686->regmap =3D devm_regmap_init_i2c(i2c, config);
>  	if (IS_ERR(max77686->regmap)) {
>  		ret =3D PTR_ERR(max77686->regmap);
>  		dev_err(max77686->dev, "Failed to allocate register map: %d\n",
> -				ret);
> +			ret);
>  		return ret;
>  	}
> =20
>  	ret =3D regmap_read(max77686->regmap, MAX77686_REG_DEVICE_ID, &data=
);
>  	if (ret < 0) {
>  		dev_err(max77686->dev,
> -			"device not found on this channel (this is not an error)\n");
> -		return -ENODEV;
> -	}
> -
> -	max77686->rtc =3D i2c_new_dummy(i2c->adapter, I2C_ADDR_RTC);
> -	if (!max77686->rtc) {
> -		dev_err(max77686->dev, "Failed to allocate I2C device for RTC\n");
> +			"device not found on this channel\n");
>  		return -ENODEV;
>  	}
> -	i2c_set_clientdata(max77686->rtc, max77686);
> =20
> -	max77686->rtc_regmap =3D devm_regmap_init_i2c(max77686->rtc,
> -						    &max77686_rtc_regmap_config);
> -	if (IS_ERR(max77686->rtc_regmap)) {
> -		ret =3D PTR_ERR(max77686->rtc_regmap);
> -		dev_err(max77686->dev, "failed to allocate RTC regmap: %d\n",
> -			ret);
> -		goto err_unregister_i2c;
> +	if (max77686->type =3D=3D TYPE_MAX77686) {
> +		max77686->rtc =3D i2c_new_dummy(i2c->adapter, I2C_ADDR_RTC);
> +		if (!max77686->rtc) {
> +			dev_err(max77686->dev,
> +				"Failed to allocate I2C device for RTC\n");
> +			return -ENODEV;
> +		}
> +		i2c_set_clientdata(max77686->rtc, max77686);
> +
> +		max77686->rtc_regmap =3D
> +			devm_regmap_init_i2c(max77686->rtc,
> +					     &max77686_rtc_regmap_config);
> +		if (IS_ERR(max77686->rtc_regmap)) {
> +			ret =3D PTR_ERR(max77686->rtc_regmap);
> +			dev_err(max77686->dev,
> +				"failed to allocate RTC regmap: %d\n",
> +				ret);
> +			goto err_unregister_i2c;
> +		}
>  	}
> =20
>  	ret =3D regmap_add_irq_chip(max77686->regmap, max77686->irq,
>  				  IRQF_TRIGGER_FALLING | IRQF_ONESHOT |
> -				  IRQF_SHARED, 0, &max77686_irq_chip,
> +				  IRQF_SHARED, 0, irq_chip,
>  				  &max77686->irq_data);
>  	if (ret) {
>  		dev_err(&i2c->dev, "failed to add PMIC irq chip: %d\n", ret);
>  		goto err_unregister_i2c;
>  	}
> -	ret =3D regmap_add_irq_chip(max77686->rtc_regmap, max77686->irq,
> +
> +	ret =3D regmap_add_irq_chip(*rtc_regmap, max77686->irq,
>  				  IRQF_TRIGGER_FALLING | IRQF_ONESHOT |
> -				  IRQF_SHARED, 0, &max77686_rtc_irq_chip,
> +				  IRQF_SHARED, 0, rtc_irq_chip,
>  				  &max77686->rtc_irq_data);
>  	if (ret) {
>  		dev_err(&i2c->dev, "failed to add RTC irq chip: %d\n", ret);
>  		goto err_del_irqc;
>  	}
> =20
> -	ret =3D mfd_add_devices(max77686->dev, -1, max77686_devs,
> -			      ARRAY_SIZE(max77686_devs), NULL, 0, NULL);
> +	ret =3D mfd_add_devices(max77686->dev, -1, cells, n_devs, NULL, 0, =
NULL);
>  	if (ret < 0) {
>  		dev_err(&i2c->dev, "failed to add MFD devices: %d\n", ret);
>  		goto err_del_rtc_irqc;
> @@ -320,7 +451,8 @@ err_del_rtc_irqc:
>  err_del_irqc:
>  	regmap_del_irq_chip(max77686->irq, max77686->irq_data);
>  err_unregister_i2c:
> -	i2c_unregister_device(max77686->rtc);
> +	if (max77686->type =3D=3D TYPE_MAX77686)
> +		i2c_unregister_device(max77686->rtc);
> =20
>  	return ret;
>  }
> @@ -341,6 +473,7 @@ static int max77686_i2c_remove(struct i2c_client =
*i2c)

In remove() you should unregister dummy RTC I2C device only on MAX77686
(77802 does not add it).

Best regards,
Krzysztof
