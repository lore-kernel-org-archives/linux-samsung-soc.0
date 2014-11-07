From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v5 3/5] regulator: of: Add regulator desc param to
 of_get_regulator_init_data()
Date: Fri, 07 Nov 2014 16:23:12 +0100
Message-ID: <1415373792.31102.27.camel@AMDC1943>
References: <1415365205-27630-1-git-send-email-javier.martinez@collabora.co.uk>
 <1415365205-27630-4-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:21287 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751714AbaKGPXR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Nov 2014 10:23:17 -0500
In-reply-to: <1415365205-27630-4-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On pi=C4=85, 2014-11-07 at 14:00 +0100, Javier Martinez Canillas wrote:
> The of_get_regulator_init_data() function is used to extract the regu=
lator
> init_data but information on how to extract certain data is defined i=
n the
> static regulator descriptor (e.g: how to map the hardware operating m=
odes).
>=20
> Add a const struct regulator_desc * parameter to the function signatu=
re so
> the parsing logic could use the information in the struct regulator_d=
esc.
>=20
> of_get_regulator_init_data() relies on of_get_regulation_constraints(=
) to
> actually extract the init_data so it has to pass the struct regulator=
_desc
> but that is modified on a later patch.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>

(this looks fine)
(...)

> diff --git a/drivers/regulator/fan53555.c b/drivers/regulator/fan5355=
5.c
> index f8e4257..37b671c 100644
> --- a/drivers/regulator/fan53555.c
> +++ b/drivers/regulator/fan53555.c
> @@ -302,7 +302,8 @@ static struct regmap_config fan53555_regmap_confi=
g =3D {
>  };
> =20
>  static struct fan53555_platform_data *fan53555_parse_dt(struct devic=
e *dev,
> -							struct device_node *np)
> +						struct device_node *np,
> +						struct regulator_desc *desc)

Not a const? Why not?

>  {
>  	struct fan53555_platform_data *pdata;
>  	int ret;
> @@ -312,7 +313,7 @@ static struct fan53555_platform_data *fan53555_pa=
rse_dt(struct device *dev,
>  	if (!pdata)
>  		return NULL;
> =20
> -	pdata->regulator =3D of_get_regulator_init_data(dev, np);
> +	pdata->regulator =3D of_get_regulator_init_data(dev, np, desc);

Desc would be always NULL here which is safe (check in patch 5/5) but i=
f
someone puts "regulator-initial-mode" in DTS then this will always prin=
t
warning. Just wonder - is it actually what you wanted?

This applies also for tps51632 and tps62360.

> =20
>  	ret =3D of_property_read_u32(np, "fcs,suspend-voltage-selector",
>  				   &tmp);
> @@ -347,20 +348,20 @@ static int fan53555_regulator_probe(struct i2c_=
client *client,
>  	unsigned int val;
>  	int ret;
> =20
> +	di =3D devm_kzalloc(&client->dev, sizeof(struct fan53555_device_inf=
o),
> +					GFP_KERNEL);
> +	if (!di)
> +		return -ENOMEM;
> +
>  	pdata =3D dev_get_platdata(&client->dev);
>  	if (!pdata)
> -		pdata =3D fan53555_parse_dt(&client->dev, np);
> +		pdata =3D fan53555_parse_dt(&client->dev, np, &di->desc);
> =20
>  	if (!pdata || !pdata->regulator) {
>  		dev_err(&client->dev, "Platform data not found!\n");
>  		return -ENODEV;
>  	}
> =20
> -	di =3D devm_kzalloc(&client->dev, sizeof(struct fan53555_device_inf=
o),
> -					GFP_KERNEL);
> -	if (!di)
> -		return -ENOMEM;
> -
>  	di->regulator =3D pdata->regulator;
>  	if (client->dev.of_node) {
>  		const struct of_device_id *match;
> diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
> index 354105e..649fece 100644
> --- a/drivers/regulator/fixed.c
> +++ b/drivers/regulator/fixed.c
> @@ -40,13 +40,14 @@ struct fixed_voltage_data {
>  /**
>   * of_get_fixed_voltage_config - extract fixed_voltage_config struct=
ure info
>   * @dev: device requesting for fixed_voltage_config
> + * @desc: regulator description
>   *
>   * Populates fixed_voltage_config structure by extracting data from =
device
>   * tree node, returns a pointer to the populated structure of NULL i=
f memory
>   * alloc fails.
>   */
>  static struct fixed_voltage_config *
> -of_get_fixed_voltage_config(struct device *dev)
> +of_get_fixed_voltage_config(struct device *dev, struct regulator_des=
c *desc)

Not const?

>  {
>  	struct fixed_voltage_config *config;
>  	struct device_node *np =3D dev->of_node;
> @@ -57,7 +58,7 @@ of_get_fixed_voltage_config(struct device *dev)
>  	if (!config)
>  		return ERR_PTR(-ENOMEM);
> =20
> -	config->init_data =3D of_get_regulator_init_data(dev, dev->of_node)=
;
> +	config->init_data =3D of_get_regulator_init_data(dev, dev->of_node,=
 desc);
>  	if (!config->init_data)
>  		return ERR_PTR(-EINVAL);
> =20
> @@ -112,8 +113,14 @@ static int reg_fixed_voltage_probe(struct platfo=
rm_device *pdev)
>  	struct regulator_config cfg =3D { };
>  	int ret;
> =20
> +	drvdata =3D devm_kzalloc(&pdev->dev, sizeof(struct fixed_voltage_da=
ta),
> +			       GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
>  	if (pdev->dev.of_node) {
> -		config =3D of_get_fixed_voltage_config(&pdev->dev);
> +		config =3D of_get_fixed_voltage_config(&pdev->dev,
> +						     &drvdata->desc);
>  		if (IS_ERR(config))
>  			return PTR_ERR(config);
>  	} else {
> @@ -123,11 +130,6 @@ static int reg_fixed_voltage_probe(struct platfo=
rm_device *pdev)
>  	if (!config)
>  		return -ENOMEM;
> =20
> -	drvdata =3D devm_kzalloc(&pdev->dev, sizeof(struct fixed_voltage_da=
ta),
> -			       GFP_KERNEL);
> -	if (!drvdata)
> -		return -ENOMEM;
> -
>  	drvdata->desc.name =3D devm_kstrdup(&pdev->dev,
>  					  config->supply_name,
>  					  GFP_KERNEL);
> diff --git a/drivers/regulator/gpio-regulator.c b/drivers/regulator/g=
pio-regulator.c
> index 989b23b..be0d08e 100644
> --- a/drivers/regulator/gpio-regulator.c
> +++ b/drivers/regulator/gpio-regulator.c
> @@ -133,7 +133,8 @@ static struct regulator_ops gpio_regulator_voltag=
e_ops =3D {
>  };
> =20
>  static struct gpio_regulator_config *
> -of_get_gpio_regulator_config(struct device *dev, struct device_node =
*np)
> +of_get_gpio_regulator_config(struct device *dev, struct device_node =
*np,
> +			     struct regulator_desc *desc)

Not const?

>  {
>  	struct gpio_regulator_config *config;
>  	const char *regtype;
> @@ -146,7 +147,7 @@ of_get_gpio_regulator_config(struct device *dev, =
struct device_node *np)
>  	if (!config)
>  		return ERR_PTR(-ENOMEM);
> =20
> -	config->init_data =3D of_get_regulator_init_data(dev, np);
> +	config->init_data =3D of_get_regulator_init_data(dev, np, desc);
>  	if (!config->init_data)
>  		return ERR_PTR(-EINVAL);
> =20
> @@ -243,17 +244,18 @@ static int gpio_regulator_probe(struct platform=
_device *pdev)
>  	struct regulator_config cfg =3D { };
>  	int ptr, ret, state;
> =20
> -	if (np) {
> -		config =3D of_get_gpio_regulator_config(&pdev->dev, np);
> -		if (IS_ERR(config))
> -			return PTR_ERR(config);
> -	}
> -
>  	drvdata =3D devm_kzalloc(&pdev->dev, sizeof(struct gpio_regulator_d=
ata),
>  			       GFP_KERNEL);
>  	if (drvdata =3D=3D NULL)
>  		return -ENOMEM;
> =20
> +	if (np) {
> +		config =3D of_get_gpio_regulator_config(&pdev->dev, np,
> +						      &drvdata->desc);
> +		if (IS_ERR(config))
> +			return PTR_ERR(config);
> +	}
> +
>  	drvdata->desc.name =3D kstrdup(config->supply_name, GFP_KERNEL);
>  	if (drvdata->desc.name =3D=3D NULL) {
>  		dev_err(&pdev->dev, "Failed to allocate supply name\n");
> diff --git a/drivers/regulator/max8952.c b/drivers/regulator/max8952.=
c
> index f7f9efc..6e54d78 100644
> --- a/drivers/regulator/max8952.c
> +++ b/drivers/regulator/max8952.c
> @@ -174,7 +174,7 @@ static struct max8952_platform_data *max8952_pars=
e_dt(struct device *dev)
>  	if (of_property_read_u32(np, "max8952,ramp-speed", &pd->ramp_speed)=
)
>  		dev_warn(dev, "max8952,ramp-speed property not specified, defaulti=
ng to 32mV/us\n");
> =20
> -	pd->reg_data =3D of_get_regulator_init_data(dev, np);
> +	pd->reg_data =3D of_get_regulator_init_data(dev, np, &regulator);
>  	if (!pd->reg_data) {
>  		dev_err(dev, "Failed to parse regulator init data\n");
>  		return NULL;
> diff --git a/drivers/regulator/max8973-regulator.c b/drivers/regulato=
r/max8973-regulator.c
> index dbedf17..c3d55c2 100644
> --- a/drivers/regulator/max8973-regulator.c
> +++ b/drivers/regulator/max8973-regulator.c
> @@ -458,7 +458,8 @@ static int max8973_probe(struct i2c_client *clien=
t,
> =20
>  	config.dev =3D &client->dev;
>  	config.init_data =3D pdata ? pdata->reg_init_data :
> -		of_get_regulator_init_data(&client->dev, client->dev.of_node);
> +		of_get_regulator_init_data(&client->dev, client->dev.of_node,
> +					   &max->desc);
>  	config.driver_data =3D max;
>  	config.of_node =3D client->dev.of_node;
>  	config.regmap =3D max->regmap;
> diff --git a/drivers/regulator/max8997.c b/drivers/regulator/max8997.=
c
> index 9c31e21..726fde1 100644
> --- a/drivers/regulator/max8997.c
> +++ b/drivers/regulator/max8997.c
> @@ -953,7 +953,8 @@ static int max8997_pmic_dt_parse_pdata(struct pla=
tform_device *pdev,
> =20
>  		rdata->id =3D i;
>  		rdata->initdata =3D of_get_regulator_init_data(&pdev->dev,
> -							     reg_np);
> +							     reg_np,
> +							     &regulators[i]);
>  		rdata->reg_node =3D reg_np;
>  		rdata++;
>  	}
> diff --git a/drivers/regulator/max8998.c b/drivers/regulator/max8998.=
c
> index 961091b..59e34a0 100644
> --- a/drivers/regulator/max8998.c
> +++ b/drivers/regulator/max8998.c
> @@ -686,8 +686,9 @@ static int max8998_pmic_dt_parse_pdata(struct max=
8998_dev *iodev,
>  			continue;
> =20
>  		rdata->id =3D regulators[i].id;
> -		rdata->initdata =3D of_get_regulator_init_data(
> -							iodev->dev, reg_np);
> +		rdata->initdata =3D of_get_regulator_init_data(iodev->dev,
> +							     reg_np,
> +							     &regulators[i]);
>  		rdata->reg_node =3D reg_np;
>  		++rdata;
>  	}
> diff --git a/drivers/regulator/mc13xxx-regulator-core.c b/drivers/reg=
ulator/mc13xxx-regulator-core.c
> index afba024..0281c31 100644
> --- a/drivers/regulator/mc13xxx-regulator-core.c
> +++ b/drivers/regulator/mc13xxx-regulator-core.c
> @@ -194,7 +194,8 @@ struct mc13xxx_regulator_init_data *mc13xxx_parse=
_regulators_dt(
>  					 regulators[i].desc.name)) {
>  				p->id =3D i;
>  				p->init_data =3D of_get_regulator_init_data(
> -							&pdev->dev, child);
> +							&pdev->dev, child,
> +							&regulators[i].desc);
>  				p->node =3D child;
>  				p++;
> =20
> diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_=
regulator.c
> index 03edb17..945486f 100644
> --- a/drivers/regulator/of_regulator.c
> +++ b/drivers/regulator/of_regulator.c
> @@ -120,13 +120,16 @@ static void of_get_regulation_constraints(struc=
t device_node *np,
>  /**
>   * of_get_regulator_init_data - extract regulator_init_data structur=
e info
>   * @dev: device requesting for regulator_init_data
> + * @node: regulator device node
> + * @desc: regulator description
>   *
>   * Populates regulator_init_data structure by extracting data from d=
evice
>   * tree node, returns a pointer to the populated struture or NULL if=
 memory
>   * alloc fails.
>   */
>  struct regulator_init_data *of_get_regulator_init_data(struct device=
 *dev,
> -						struct device_node *node)
> +					  struct device_node *node,
> +					  const struct regulator_desc *desc)
>  {
>  	struct regulator_init_data *init_data;
> =20
> @@ -218,7 +221,7 @@ int of_regulator_match(struct device *dev, struct=
 device_node *node,
>  				continue;
> =20
>  			match->init_data =3D
> -				of_get_regulator_init_data(dev, child);
> +				of_get_regulator_init_data(dev, child, NULL);
>  			if (!match->init_data) {
>  				dev_err(dev,
>  					"failed to parse DT for regulator %s\n",
> @@ -266,7 +269,7 @@ struct regulator_init_data *regulator_of_get_init=
_data(struct device *dev,
>  		if (strcmp(desc->of_match, name))
>  			continue;
> =20
> -		init_data =3D of_get_regulator_init_data(dev, child);
> +		init_data =3D of_get_regulator_init_data(dev, child, desc);
>  		if (!init_data) {
>  			dev_err(dev,
>  				"failed to parse DT for regulator %s\n",
> diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pw=
m-regulator.c
> index d3f55ea..91f34ca 100644
> --- a/drivers/regulator/pwm-regulator.c
> +++ b/drivers/regulator/pwm-regulator.c
> @@ -149,7 +149,8 @@ static int pwm_regulator_probe(struct platform_de=
vice *pdev)
>  		return ret;
>  	}
> =20
> -	config.init_data =3D of_get_regulator_init_data(&pdev->dev, np);
> +	config.init_data =3D of_get_regulator_init_data(&pdev->dev, np,
> +						      &drvdata->desc);
>  	if (!config.init_data)
>  		return -ENOMEM;
> =20
> diff --git a/drivers/regulator/qcom_rpm-regulator.c b/drivers/regulat=
or/qcom_rpm-regulator.c
> index b55cd5b..dabd28a 100644
> --- a/drivers/regulator/qcom_rpm-regulator.c
> +++ b/drivers/regulator/qcom_rpm-regulator.c
> @@ -643,10 +643,6 @@ static int rpm_reg_probe(struct platform_device =
*pdev)
>  	match =3D of_match_device(rpm_of_match, &pdev->dev);
>  	template =3D match->data;
> =20
> -	initdata =3D of_get_regulator_init_data(&pdev->dev, pdev->dev.of_no=
de);
> -	if (!initdata)
> -		return -EINVAL;
> -
>  	vreg =3D devm_kmalloc(&pdev->dev, sizeof(*vreg), GFP_KERNEL);
>  	if (!vreg) {
>  		dev_err(&pdev->dev, "failed to allocate vreg\n");
> @@ -666,6 +662,11 @@ static int rpm_reg_probe(struct platform_device =
*pdev)
>  		return -ENODEV;
>  	}
> =20
> +	initdata =3D of_get_regulator_init_data(&pdev->dev, pdev->dev.of_no=
de,
> +					      &vreg->desc);
> +	if (!initdata)
> +		return -EINVAL;
> +
>  	key =3D "reg";
>  	ret =3D of_property_read_u32(pdev->dev.of_node, key, &val);
>  	if (ret) {
> diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.=
c
> index 0ab5cbe..26932fe 100644
> --- a/drivers/regulator/s5m8767.c
> +++ b/drivers/regulator/s5m8767.c
> @@ -581,7 +581,8 @@ static int s5m8767_pmic_dt_parse_pdata(struct pla=
tform_device *pdev,
> =20
>  		rdata->id =3D i;
>  		rdata->initdata =3D of_get_regulator_init_data(
> -						&pdev->dev, reg_np);
> +						&pdev->dev, reg_np,
> +						&regulators[i]);
>  		rdata->reg_node =3D reg_np;
>  		rdata++;
>  		rmode->id =3D i;
> diff --git a/drivers/regulator/sky81452-regulator.c b/drivers/regulat=
or/sky81452-regulator.c
> index 476b80a..e68e13f 100644
> --- a/drivers/regulator/sky81452-regulator.c
> +++ b/drivers/regulator/sky81452-regulator.c
> @@ -76,7 +76,7 @@ static struct regulator_init_data *sky81452_reg_par=
se_dt(struct device *dev)
>  		return NULL;
>  	}
> =20
> -	init_data =3D of_get_regulator_init_data(dev, np);
> +	init_data =3D of_get_regulator_init_data(dev, np, &sky81452_reg);
> =20
>  	of_node_put(np);
>  	return init_data;
> diff --git a/drivers/regulator/stw481x-vmmc.c b/drivers/regulator/stw=
481x-vmmc.c
> index a7e1526..b4f1696 100644
> --- a/drivers/regulator/stw481x-vmmc.c
> +++ b/drivers/regulator/stw481x-vmmc.c
> @@ -72,7 +72,8 @@ static int stw481x_vmmc_regulator_probe(struct plat=
form_device *pdev)
>  	config.regmap =3D stw481x->map;
>  	config.of_node =3D pdev->dev.of_node;
>  	config.init_data =3D of_get_regulator_init_data(&pdev->dev,
> -						      pdev->dev.of_node);
> +						      pdev->dev.of_node,
> +						      &vmmc_regulator);
> =20
>  	stw481x->vmmc_regulator =3D devm_regulator_register(&pdev->dev,
>  						&vmmc_regulator, &config);
> diff --git a/drivers/regulator/ti-abb-regulator.c b/drivers/regulator=
/ti-abb-regulator.c
> index a2dabb5..1ef5aba 100644
> --- a/drivers/regulator/ti-abb-regulator.c
> +++ b/drivers/regulator/ti-abb-regulator.c
> @@ -837,7 +837,8 @@ skip_opt:
>  		return -EINVAL;
>  	}
> =20
> -	initdata =3D of_get_regulator_init_data(dev, pdev->dev.of_node);
> +	initdata =3D of_get_regulator_init_data(dev, pdev->dev.of_node,
> +					      &abb->rdesc);
>  	if (!initdata) {
>  		dev_err(dev, "%s: Unable to alloc regulator init data\n",
>  			__func__);
> diff --git a/drivers/regulator/tps51632-regulator.c b/drivers/regulat=
or/tps51632-regulator.c
> index f31f22e..c917b54 100644
> --- a/drivers/regulator/tps51632-regulator.c
> +++ b/drivers/regulator/tps51632-regulator.c
> @@ -221,7 +221,8 @@ static const struct of_device_id tps51632_of_matc=
h[] =3D {
>  MODULE_DEVICE_TABLE(of, tps51632_of_match);
> =20
>  static struct tps51632_regulator_platform_data *
> -	of_get_tps51632_platform_data(struct device *dev)
> +	of_get_tps51632_platform_data(struct device *dev,
> +				      struct regulator_desc *desc)

Not const?

>  {
>  	struct tps51632_regulator_platform_data *pdata;
>  	struct device_node *np =3D dev->of_node;
> @@ -230,7 +231,8 @@ static struct tps51632_regulator_platform_data *
>  	if (!pdata)
>  		return NULL;
> =20
> -	pdata->reg_init_data =3D of_get_regulator_init_data(dev, dev->of_no=
de);
> +	pdata->reg_init_data =3D of_get_regulator_init_data(dev, dev->of_no=
de,
> +							  desc);
>  	if (!pdata->reg_init_data) {
>  		dev_err(dev, "Not able to get OF regulator init data\n");
>  		return NULL;
> @@ -273,9 +275,13 @@ static int tps51632_probe(struct i2c_client *cli=
ent,
>  		}
>  	}
> =20
> +	tps =3D devm_kzalloc(&client->dev, sizeof(*tps), GFP_KERNEL);
> +	if (!tps)
> +		return -ENOMEM;
> +
>  	pdata =3D dev_get_platdata(&client->dev);
>  	if (!pdata && client->dev.of_node)
> -		pdata =3D of_get_tps51632_platform_data(&client->dev);
> +		pdata =3D of_get_tps51632_platform_data(&client->dev, &tps->desc);
>  	if (!pdata) {
>  		dev_err(&client->dev, "No Platform data\n");
>  		return -EINVAL;
> @@ -296,10 +302,6 @@ static int tps51632_probe(struct i2c_client *cli=
ent,
>  		}
>  	}
> =20
> -	tps =3D devm_kzalloc(&client->dev, sizeof(*tps), GFP_KERNEL);
> -	if (!tps)
> -		return -ENOMEM;
> -
>  	tps->dev =3D &client->dev;
>  	tps->desc.name =3D client->name;
>  	tps->desc.id =3D 0;
> diff --git a/drivers/regulator/tps62360-regulator.c b/drivers/regulat=
or/tps62360-regulator.c
> index a167204..be1f401 100644
> --- a/drivers/regulator/tps62360-regulator.c
> +++ b/drivers/regulator/tps62360-regulator.c
> @@ -293,7 +293,8 @@ static const struct regmap_config tps62360_regmap=
_config =3D {
>  };
> =20
>  static struct tps62360_regulator_platform_data *
> -	of_get_tps62360_platform_data(struct device *dev)
> +	of_get_tps62360_platform_data(struct device *dev,
> +				      struct regulator_desc *desc)

Not const?


(...)

Rest looks fine.

Krzysztof
