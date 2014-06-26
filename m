From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 05/14] clk: Add generic driver for Maxim PMIC clocks
Date: Thu, 26 Jun 2014 11:00:02 +0200
Message-ID: <1403773202.27156.0.camel@AMDC1943>
References: <1403723019-6212-1-git-send-email-javier.martinez@collabora.co.uk>
 <1403723019-6212-6-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1403723019-6212-6-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On =C5=9Bro, 2014-06-25 at 21:03 +0200, Javier Martinez Canillas wrote:
> Maxim Integrated Power Management ICs are very similar with
> regard to their clock outputs. Most of the clock drivers for
> these chips are duplicating code and are simpler enough that
> can be converted to use a generic driver to consolidate code
> and avoid duplication.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>=20
> Changes since v3:
>  - Add current copyright information. Suggested by Krzysztof Kozlowsk=
i
>  - Do a single allocation for struct max_gen_clk. Suggested by Krzysz=
tof Kozlowski=20
>=20
>  drivers/clk/Kconfig       |   3 +
>  drivers/clk/Makefile      |   1 +
>  drivers/clk/clk-max-gen.c | 195 ++++++++++++++++++++++++++++++++++++=
++++++++++
>  drivers/clk/clk-max-gen.h |  32 ++++++++
>  4 files changed, 231 insertions(+)
>  create mode 100644 drivers/clk/clk-max-gen.c
>  create mode 100644 drivers/clk/clk-max-gen.h

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof



> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 9f9c5ae..73f78e8 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -32,6 +32,9 @@ config COMMON_CLK_WM831X
> =20
>  source "drivers/clk/versatile/Kconfig"
> =20
> +config COMMON_CLK_MAX_GEN
> +        bool
> +
>  config COMMON_CLK_MAX77686
>  	tristate "Clock driver for Maxim 77686 MFD"
>  	depends on MFD_MAX77686
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 567f102..6c1aff6 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_ARCH_BCM2835)		+=3D clk-bcm2835.o
>  obj-$(CONFIG_ARCH_EFM32)		+=3D clk-efm32gg.o
>  obj-$(CONFIG_ARCH_HIGHBANK)		+=3D clk-highbank.o
>  obj-$(CONFIG_MACH_LOONGSON1)		+=3D clk-ls1x.o
> +obj-$(CONFIG_COMMON_CLK_MAX_GEN)	+=3D clk-max-gen.o
>  obj-$(CONFIG_COMMON_CLK_MAX77686)	+=3D clk-max77686.o
>  obj-$(CONFIG_ARCH_MOXART)		+=3D clk-moxart.o
>  obj-$(CONFIG_ARCH_NOMADIK)		+=3D clk-nomadik.o
> diff --git a/drivers/clk/clk-max-gen.c b/drivers/clk/clk-max-gen.c
> new file mode 100644
> index 0000000..3e9fa7e
> --- /dev/null
> +++ b/drivers/clk/clk-max-gen.c
> @@ -0,0 +1,195 @@
> +/*
> + * clk-max-gen.c - Generic clock driver for Maxim PMICs clocks
> + *
> + * Copyright (C) 2014 Google, Inc
> + *
> + * Copyright (C) 2012 Samsung Electornics
> + * Jonghwa Lee <jonghwa3.lee@samsung.com>
> + *
> + * This program is free software; you can redistribute  it and/or mo=
dify it
> + * under  the terms of  the GNU General  Public License as published=
 by the
> + * Free Software Foundation;  either version 2 of the  License, or (=
at your
> + * option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * This driver is based on clk-max77686.c
> + *
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/err.h>
> +#include <linux/regmap.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk-provider.h>
> +#include <linux/mutex.h>
> +#include <linux/clkdev.h>
> +
> +struct max_gen_clk {
> +	struct regmap *regmap;
> +	u32 mask;
> +	u32 reg;
> +	struct clk_hw hw;
> +	struct clk_lookup *lookup;
> +};
> +
> +static struct max_gen_clk *to_max_gen_clk(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct max_gen_clk, hw);
> +}
> +
> +static int max_gen_clk_prepare(struct clk_hw *hw)
> +{
> +	struct max_gen_clk *max_gen =3D to_max_gen_clk(hw);
> +
> +	return regmap_update_bits(max_gen->regmap, max_gen->reg,
> +				  max_gen->mask, max_gen->mask);
> +}
> +
> +static void max_gen_clk_unprepare(struct clk_hw *hw)
> +{
> +	struct max_gen_clk *max_gen =3D to_max_gen_clk(hw);
> +
> +	regmap_update_bits(max_gen->regmap, max_gen->reg,
> +			   max_gen->mask, ~max_gen->mask);
> +}
> +
> +static int max_gen_clk_is_prepared(struct clk_hw *hw)
> +{
> +	struct max_gen_clk *max_gen =3D to_max_gen_clk(hw);
> +	int ret;
> +	u32 val;
> +
> +	ret =3D regmap_read(max_gen->regmap, max_gen->reg, &val);
> +
> +	if (ret < 0)
> +		return -EINVAL;
> +
> +	return val & max_gen->mask;
> +}
> +
> +static unsigned long max_gen_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	return 32768;
> +}
> +
> +struct clk_ops max_gen_clk_ops =3D {
> +	.prepare	=3D max_gen_clk_prepare,
> +	.unprepare	=3D max_gen_clk_unprepare,
> +	.is_prepared	=3D max_gen_clk_is_prepared,
> +	.recalc_rate	=3D max_gen_recalc_rate,
> +};
> +EXPORT_SYMBOL_GPL(max_gen_clk_ops);
> +
> +static struct clk *max_gen_clk_register(struct device *dev,
> +					struct max_gen_clk *max_gen)
> +{
> +	struct clk *clk;
> +	struct clk_hw *hw =3D &max_gen->hw;
> +
> +	clk =3D clk_register(dev, hw);
> +	if (IS_ERR(clk))
> +		return clk;
> +
> +	max_gen->lookup =3D kzalloc(sizeof(struct clk_lookup), GFP_KERNEL);
> +	if (!max_gen->lookup)
> +		return ERR_PTR(-ENOMEM);
> +
> +	max_gen->lookup->con_id =3D hw->init->name;
> +	max_gen->lookup->clk =3D clk;
> +
> +	clkdev_add(max_gen->lookup);
> +
> +	return clk;
> +}
> +
> +int max_gen_clk_probe(struct platform_device *pdev, struct regmap *r=
egmap,
> +		      u32 reg, struct clk_init_data *clks_init, int num_init)
> +{
> +	int i, ret;
> +	struct max_gen_clk *max_gen_clks;
> +	struct clk **clocks;
> +	struct device *dev =3D &pdev->dev;
> +
> +	clocks =3D devm_kzalloc(dev, sizeof(struct clk *) * num_init, GFP_K=
ERNEL);
> +	if (!clocks)
> +		return -ENOMEM;
> +
> +	max_gen_clks =3D devm_kzalloc(dev, sizeof(struct max_gen_clk)
> +				    * num_init, GFP_KERNEL);
> +	if (!max_gen_clks)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < num_init; i++) {
> +		max_gen_clks[i].regmap =3D regmap;
> +		max_gen_clks[i].mask =3D 1 << i;
> +		max_gen_clks[i].reg =3D reg;
> +		max_gen_clks[i].hw.init =3D &clks_init[i];
> +
> +		clocks[i] =3D max_gen_clk_register(dev, &max_gen_clks[i]);
> +		if (IS_ERR(clocks[i])) {
> +			ret =3D PTR_ERR(clocks[i]);
> +			dev_err(dev, "failed to register %s\n",
> +				max_gen_clks[i].hw.init->name);
> +			goto err_clocks;
> +		}
> +	}
> +
> +	platform_set_drvdata(pdev, clocks);
> +
> +	if (dev->of_node) {
> +		struct clk_onecell_data *of_data;
> +
> +		of_data =3D devm_kzalloc(dev, sizeof(*of_data), GFP_KERNEL);
> +		if (!of_data) {
> +			ret =3D -ENOMEM;
> +			goto err_clocks;
> +		}
> +
> +		of_data->clks =3D clocks;
> +		of_data->clk_num =3D num_init;
> +		ret =3D of_clk_add_provider(dev->of_node, of_clk_src_onecell_get,
> +					  of_data);
> +
> +		if (ret) {
> +			dev_err(dev, "failed to register OF clock provider\n");
> +			goto err_clocks;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_clocks:
> +	for (--i; i >=3D 0; --i) {
> +		clkdev_drop(max_gen_clks[i].lookup);
> +		clk_unregister(max_gen_clks[i].hw.clk);
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(max_gen_clk_probe);
> +
> +int max_gen_clk_remove(struct platform_device *pdev, int num_init)
> +{
> +	struct clk **clocks =3D platform_get_drvdata(pdev);
> +	struct device *dev =3D pdev->dev.parent;
> +	int i;
> +
> +	if (dev->of_node)
> +		of_clk_del_provider(dev->of_node);
> +
> +	for (i =3D 0; i < num_init; i++) {
> +		struct clk_hw *hw =3D __clk_get_hw(clocks[i]);
> +		struct max_gen_clk *max_gen =3D to_max_gen_clk(hw);
> +
> +		clkdev_drop(max_gen->lookup);
> +		clk_unregister(clocks[i]);
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(max_gen_clk_remove);
> diff --git a/drivers/clk/clk-max-gen.h b/drivers/clk/clk-max-gen.h
> new file mode 100644
> index 0000000..997e86f
> --- /dev/null
> +++ b/drivers/clk/clk-max-gen.h
> @@ -0,0 +1,32 @@
> +/*
> + * clk-max-gen.h - Generic clock driver for Maxim PMICs clocks
> + *
> + * Copyright (C) 2014 Google, Inc
> + *
> + * This program is free software; you can redistribute  it and/or mo=
dify it
> + * under  the terms of  the GNU General  Public License as published=
 by the
> + * Free Software Foundation;  either version 2 of the  License, or (=
at your
> + * option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#ifndef __CLK_MAX_GEN_H__
> +#define __CLK_MAX_GEN_H__
> +
> +#include <linux/types.h>
> +#include <linux/device.h>
> +#include <linux/clkdev.h>
> +#include <linux/regmap.h>
> +#include <linux/platform_device.h>
> +
> +int max_gen_clk_probe(struct platform_device *pdev, struct regmap *r=
egmap,
> +		      u32 reg, struct clk_init_data *clks_init, int num_init);
> +int max_gen_clk_remove(struct platform_device *pdev, int num_init);
> +extern struct clk_ops max_gen_clk_ops;
> +
> +#endif /* __CLK_MAX_GEN_H__ */
