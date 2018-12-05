From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: RE: [PATCH] regulator: Use of_node_name_eq for node name comparisons
Date: Wed, 5 Dec 2018 22:13:54 +0000
Message-ID: <HE1PR1001MB1002F9F69B07DC91E0387A4180A80@HE1PR1001MB1002.EURPRD10.PROD.OUTLOOK.COM>
References: <20181205195050.4759-21-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205195050.4759-21-robh@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Support Opensource <Support.Opensource@diasemi.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 05 December 2018 19:51, Rob Herring wrote:

> Convert string compares of DT node names to use of_node_name_eq helper
> instead. This removes direct access to the node name pointer.
>=20
> For instances using of_node_cmp, this has the side effect of now using ca=
se
> sensitive comparisons. This should not matter for any FDT based system wh=
ich all
> of these are.
>=20
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Support Opensource <support.opensource@diasemi.com>
> Cc: Sangbeom Kim <sbkim73@samsung.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

For da9052 regulator driver:

Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
>  drivers/regulator/88pm8607.c               | 2 +-
>  drivers/regulator/da9052-regulator.c       | 2 +-
>  drivers/regulator/max8997-regulator.c      | 2 +-
>  drivers/regulator/mc13xxx-regulator-core.c | 2 +-
>  drivers/regulator/qcom-rpmh-regulator.c    | 2 +-
>  drivers/regulator/s5m8767.c                | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/regulator/88pm8607.c b/drivers/regulator/88pm8607.c =
index
> fd86446e499b..28f55248eb90 100644
> --- a/drivers/regulator/88pm8607.c
> +++ b/drivers/regulator/88pm8607.c
> @@ -328,7 +328,7 @@ static int pm8607_regulator_dt_init(struct
> platform_device *pdev,
>  		return -ENODEV;
>  	}
>  	for_each_child_of_node(nproot, np) {
> -		if (!of_node_cmp(np->name, info->desc.name)) {
> +		if (of_node_name_eq(np, info->desc.name)) {
>  			config->init_data =3D
>  				of_get_regulator_init_data(&pdev->dev, np,
>  							   &info->desc);
> diff --git a/drivers/regulator/da9052-regulator.c b/drivers/regulator/da9=
052-
> regulator.c
> index 37e4025203e3..207cb3859dcc 100644
> --- a/drivers/regulator/da9052-regulator.c
> +++ b/drivers/regulator/da9052-regulator.c
> @@ -435,7 +435,7 @@ static int da9052_regulator_probe(struct platform_dev=
ice
> *pdev)
>  			return -ENODEV;
>=20
>  		for_each_child_of_node(nproot, np) {
> -			if (!of_node_cmp(np->name,
> +			if (of_node_name_eq(np,
>  					 regulator->info->reg_desc.name)) {
>  				config.init_data =3D of_get_regulator_init_data(
>  					&pdev->dev, np,
> diff --git a/drivers/regulator/max8997-regulator.c b/drivers/regulator/ma=
x8997-
> regulator.c
> index 3bf5ddfaaea8..4d2487279a0a 100644
> --- a/drivers/regulator/max8997-regulator.c
> +++ b/drivers/regulator/max8997-regulator.c
> @@ -925,7 +925,7 @@ static int max8997_pmic_dt_parse_pdata(struct
> platform_device *pdev,
>  	pdata->regulators =3D rdata;
>  	for_each_child_of_node(regulators_np, reg_np) {
>  		for (i =3D 0; i < ARRAY_SIZE(regulators); i++)
> -			if (!of_node_cmp(reg_np->name, regulators[i].name))
> +			if (of_node_name_eq(reg_np, regulators[i].name))
>  				break;
>=20
>  		if (i =3D=3D ARRAY_SIZE(regulators)) {
> diff --git a/drivers/regulator/mc13xxx-regulator-core.c
> b/drivers/regulator/mc13xxx-regulator-core.c
> index 65eb1e0350cf..2243138d8a58 100644
> --- a/drivers/regulator/mc13xxx-regulator-core.c
> +++ b/drivers/regulator/mc13xxx-regulator-core.c
> @@ -186,7 +186,7 @@ struct mc13xxx_regulator_init_data
> *mc13xxx_parse_regulators_dt(
>  		for (i =3D 0; i < num_regulators; i++) {
>  			if (!regulators[i].desc.name)
>  				continue;
> -			if (!of_node_cmp(child->name,
> +			if (of_node_name_eq(child,
>  					 regulators[i].desc.name)) {
>  				p->id =3D i;
>  				p->init_data =3D of_get_regulator_init_data( diff --
> git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rp=
mh-
> regulator.c
> index 39ccf53fdeb3..b2c2d01d1637 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -410,7 +410,7 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg
> *vreg, struct device *dev,
>  	vreg->dev =3D dev;
>=20
>  	for (rpmh_data =3D pmic_rpmh_data; rpmh_data->name; rpmh_data++)
> -		if (!strcmp(rpmh_data->name, node->name))
> +		if (of_node_name_eq(node, rpmh_data->name))
>  			break;
>=20
>  	if (!rpmh_data->name) {
> diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c in=
dex
> 219b9afda0cb..654f65abcb5a 100644
> --- a/drivers/regulator/s5m8767.c
> +++ b/drivers/regulator/s5m8767.c
> @@ -561,7 +561,7 @@ static int s5m8767_pmic_dt_parse_pdata(struct
> platform_device *pdev,
>  	pdata->opmode =3D rmode;
>  	for_each_child_of_node(regulators_np, reg_np) {
>  		for (i =3D 0; i < ARRAY_SIZE(regulators); i++)
> -			if (!of_node_cmp(reg_np->name, regulators[i].name))
> +			if (of_node_name_eq(reg_np, regulators[i].name))
>  				break;
>=20
>  		if (i =3D=3D ARRAY_SIZE(regulators)) {
> --
> 2.19.1
