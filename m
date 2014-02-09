From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 03/12] clk: samsung: add clock driver for external clock
 outputs
Date: Sun, 09 Feb 2014 03:25:21 +0100
Message-ID: <52F6E711.4020109@gmail.com>
References: <201312131356.40755.heiko@sntech.de> <201312131359.36576.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f170.google.com ([209.85.215.170]:48655 "EHLO
	mail-ea0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751290AbaBICZb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Feb 2014 21:25:31 -0500
Received: by mail-ea0-f170.google.com with SMTP id g15so499159eak.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 08 Feb 2014 18:25:30 -0800 (PST)
In-Reply-To: <201312131359.36576.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>
Cc: t.figa@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Heiko,

On 13.12.2013 13:59, Heiko St=FCbner wrote:
> This adds a driver for controlling the external clock outputs of
> s3c24xx architectures including the dclk muxes and dividers.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   drivers/clk/samsung/Makefile                     |    1 +
>   drivers/clk/samsung/clk-s3c2410-dclk.c           |  517 +++++++++++=
+++++++++++
>   include/dt-bindings/clock/samsung,s3c2410-dclk.h |   28 ++
>   3 files changed, 546 insertions(+)
>   create mode 100644 drivers/clk/samsung/clk-s3c2410-dclk.c
>   create mode 100644 include/dt-bindings/clock/samsung,s3c2410-dclk.h
>
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makef=
ile
> index 4c892c6..568683c 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -8,5 +8,6 @@ obj-$(CONFIG_SOC_EXYNOS5250)	+=3D clk-exynos5250.o
>   obj-$(CONFIG_SOC_EXYNOS5420)	+=3D clk-exynos5420.o
>   obj-$(CONFIG_SOC_EXYNOS5440)	+=3D clk-exynos5440.o
>   obj-$(CONFIG_ARCH_EXYNOS)	+=3D clk-exynos-audss.o
> +obj-$(CONFIG_S3C2410_COMMON_DCLK)+=3D clk-s3c2410-dclk.o
>   obj-$(CONFIG_S3C2443_COMMON_CLK)+=3D clk-s3c2443.o
>   obj-$(CONFIG_ARCH_S3C64XX)	+=3D clk-s3c64xx.o
> diff --git a/drivers/clk/samsung/clk-s3c2410-dclk.c b/drivers/clk/sam=
sung/clk-s3c2410-dclk.c
> new file mode 100644
> index 0000000..de10e5c
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-s3c2410-dclk.c
> @@ -0,0 +1,517 @@
> +/*
> + * Copyright (c) 2013 Heiko Stuebner <heiko@sntech.de>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * Common Clock Framework support for s3c24xx external clock output.
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +#include <linux/of.h>
> +#include <dt-bindings/clock/samsung,s3c2410-dclk.h>
> +#include "clk.h"
> +
> +/* legacy access to misccr, until dt conversion is finished */
> +#include <mach/hardware.h>
> +#include <mach/regs-gpio.h>
> +
> +enum supported_socs {
> +	S3C2410,
> +	S3C2412,
> +	S3C2440,
> +	S3C2443,
> +};
> +
> +struct s3c24xx_dclk_drv_data {
> +	int cpu_type;
> +};
> +
> +/*
> + * Clock for output-parent selection in misccr
> + */
> +
> +struct s3c24xx_clkout {
> +	struct clk_hw		hw;
> +	struct regmap		*misccr;
> +	u32			mask;
> +	u8			shift;
> +};
> +
> +#define to_s3c24xx_clkout(_hw) container_of(_hw, struct s3c24xx_clko=
ut, hw)
> +
> +static u8 s3c24xx_clkout_get_parent(struct clk_hw *hw)
> +{
> +	struct s3c24xx_clkout *clkout =3D to_s3c24xx_clkout(hw);
> +	int num_parents =3D __clk_get_num_parents(hw->clk);
> +	u32 val;
> +	int ret =3D 0;
> +
> +	if (clkout->misccr)
> +		ret =3D regmap_read(clkout->misccr, 0, &val);
> +	else
> +		val =3D readl_relaxed(S3C24XX_MISCCR) >> clkout->shift;

I wonder if this couldn't be simplified by always providing a regmap.

> +
> +	if (ret)
> +		return ret;
> +
> +	val >>=3D clkout->shift;
> +	val &=3D clkout->mask;
> +
> +	if (val >=3D num_parents)
> +		return -EINVAL;
> +
> +	return val;
> +}

[snip]

> +#define to_s3c24xx_dclk0(x) \
> +		container_of(x, struct s3c24xx_dclk, dclk0_div_change_nb)
> +
> +#define to_s3c24xx_dclk1(x) \
> +		container_of(x, struct s3c24xx_dclk, dclk1_div_change_nb)
> +
> +static const char dummy_nm[] __initconst =3D "dummy_name";

What's the advantage of having it defined this way instead of using=20
"dummy_name" (or probably "reserved" or "none", as in Samsung clock=20
drivers) directly in parent lists?

> +
> +PNAME(dclk_s3c2410_p) =3D { "pclk", "uclk" };
> +PNAME(clkout0_s3c2410_p) =3D { "mpll", "upll", "fclk", "hclk", "pclk=
",
> +			     "gate_dclk0" };
> +PNAME(clkout1_s3c2410_p) =3D { "mpll", "upll", "fclk", "hclk", "pclk=
",
> +			     "gate_dclk1" };
> +
> +PNAME(clkout0_s3c2412_p) =3D { "mpll", "upll", dummy_nm /* rtc clock=
 output */,
> +			     "hclk", "pclk", "gate_dclk0" };

Hmm, this would suggest that instead of dummy_nm, a real name should be=
=20
used here, even if such clock doesn't exist yet. CCF will handle this f=
ine.

> +PNAME(clkout1_s3c2412_p) =3D { "xti", "upll", "fclk", "hclk", "pclk"=
,
> +			     "gate_dclk1" };
> +
> +PNAME(clkout0_s3c2440_p) =3D { "xti", "upll", "fclk", "hclk", "pclk"=
,
> +			     "gate_dclk0" };
> +PNAME(clkout1_s3c2440_p) =3D { "mpll", "upll", dummy_nm /* rtc clock=
 output */,
> +			     "hclk", "pclk", "gate_dclk1" };

[snip]

> +static int s3c24xx_dclk_probe(struct platform_device *pdev)
> +{
> +	struct s3c24xx_dclk *s3c24xx_dclk;
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct regmap *misccr =3D NULL;
> +	struct resource *mem;
> +	struct clk **clk_table;
> +	const char **clkout0_parent_names, **clkout1_parent_names;
> +	u8 clkout0_num_parents, clkout1_num_parents;
> +	int current_soc, ret, i;
> +
> +	s3c24xx_dclk =3D devm_kzalloc(&pdev->dev, sizeof(*s3c24xx_dclk),
> +				    GFP_KERNEL);
> +	if (!s3c24xx_dclk)
> +		return -ENOMEM;
> +
> +	s3c24xx_dclk->dev =3D &pdev->dev;
> +	platform_set_drvdata(pdev, s3c24xx_dclk);
> +	spin_lock_init(&s3c24xx_dclk->dclk_lock);
> +
> +	clk_table =3D devm_kzalloc(&pdev->dev,
> +				 sizeof(struct clk *) * DCLK_MAX_CLKS,
> +				 GFP_KERNEL);
> +	if (!clk_table)
> +		return -ENOMEM;
> +
> +	s3c24xx_dclk->clk_data.clks =3D clk_table;
> +	s3c24xx_dclk->clk_data.clk_num =3D DCLK_MAX_CLKS;
> +
> +	mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	s3c24xx_dclk->base =3D devm_ioremap_resource(&pdev->dev, mem);
> +	if (IS_ERR(s3c24xx_dclk->base))
> +		return PTR_ERR(s3c24xx_dclk->base);
> +
> +	/* when run from devicetree, get the misccr through a syscon-regmap=
 */
> +	if (np) {
> +		misccr =3D syscon_regmap_lookup_by_phandle(np, "samsung,misccr");
> +		if (IS_ERR(misccr)) {
> +			dev_err(&pdev->dev, "could not get misccr syscon, %ld\n",
> +				PTR_ERR(misccr));
> +			return PTR_ERR(misccr);
> +		}
> +	}
> +
> +	current_soc =3D s3c24xx_dclk_get_driver_data(pdev);
> +
> +	if (current_soc =3D=3D S3C2443) {
> +		clk_table[MUX_DCLK0] =3D clk_register_mux(&pdev->dev,
> +					"mux_dclk0", dclk_s3c2443_p,
> +					ARRAY_SIZE(dclk_s3c2443_p), 0,
> +					s3c24xx_dclk->base, 1, 1, 0,
> +					&s3c24xx_dclk->dclk_lock);
> +		clk_table[MUX_DCLK1] =3D clk_register_mux(&pdev->dev,
> +					"mux_dclk1", dclk_s3c2443_p,
> +					ARRAY_SIZE(dclk_s3c2443_p), 0,
> +					s3c24xx_dclk->base, 17, 1, 0,
> +					&s3c24xx_dclk->dclk_lock);
> +	} else {
> +		clk_table[MUX_DCLK0] =3D clk_register_mux(&pdev->dev,
> +					"mux_dclk0", dclk_s3c2410_p,
> +					ARRAY_SIZE(dclk_s3c2410_p), 0,
> +					s3c24xx_dclk->base, 1, 1, 0,
> +					&s3c24xx_dclk->dclk_lock);
> +		clk_table[MUX_DCLK1] =3D clk_register_mux(&pdev->dev,
> +					"mux_dclk1", dclk_s3c2410_p,
> +					ARRAY_SIZE(dclk_s3c2410_p), 0,
> +					s3c24xx_dclk->base, 17, 1, 0,
> +					&s3c24xx_dclk->dclk_lock);
> +	}

What about using a variant struct instead? Match tables would simply=20
contain pointers to respective structs and here the code would refer to=
=20
appropriate fields in a struct returned by s3c24xx_dclk_get_driver_data=
().

> +
> +	clk_table[DIV_DCLK0] =3D clk_register_divider(&pdev->dev, "div_dclk=
0",
> +					"mux_dclk0", 0, s3c24xx_dclk->base,
> +					4, 4, 0, &s3c24xx_dclk->dclk_lock);
> +	clk_table[DIV_DCLK1] =3D clk_register_divider(&pdev->dev, "div_dclk=
1",
> +					"mux_dclk1", 0, s3c24xx_dclk->base,
> +					20, 4, 0, &s3c24xx_dclk->dclk_lock);
> +
> +	clk_table[GATE_DCLK0] =3D clk_register_gate(&pdev->dev, "gate_dclk0=
",
> +					"div_dclk0", CLK_SET_RATE_PARENT,
> +					s3c24xx_dclk->base, 0, 0,
> +					&s3c24xx_dclk->dclk_lock);
> +	clk_table[GATE_DCLK1] =3D clk_register_gate(&pdev->dev, "gate_dclk1=
",
> +					"div_dclk1", CLK_SET_RATE_PARENT,
> +					s3c24xx_dclk->base, 16, 0,
> +					&s3c24xx_dclk->dclk_lock);
> +
> +	switch (current_soc) {
> +	case S3C2410:
> +		clkout0_parent_names =3D clkout0_s3c2410_p;
> +		clkout0_num_parents =3D ARRAY_SIZE(clkout0_s3c2410_p);
> +		clkout1_parent_names =3D clkout1_s3c2410_p;
> +		clkout1_num_parents =3D ARRAY_SIZE(clkout1_s3c2410_p);
> +		break;
> +	case S3C2412:
> +		clkout0_parent_names =3D clkout0_s3c2412_p;
> +		clkout0_num_parents =3D ARRAY_SIZE(clkout0_s3c2412_p);
> +		clkout1_parent_names =3D clkout1_s3c2412_p;
> +		clkout1_num_parents =3D ARRAY_SIZE(clkout1_s3c2412_p);
> +		break;
> +	case S3C2440:
> +		clkout0_parent_names =3D clkout0_s3c2440_p;
> +		clkout0_num_parents =3D ARRAY_SIZE(clkout0_s3c2440_p);
> +		clkout1_parent_names =3D clkout1_s3c2440_p;
> +		clkout1_num_parents =3D ARRAY_SIZE(clkout1_s3c2440_p);
> +		break;
> +	case S3C2443:
> +		clkout0_parent_names =3D clkout0_s3c2443_p;
> +		clkout0_num_parents =3D ARRAY_SIZE(clkout0_s3c2443_p);
> +		clkout1_parent_names =3D clkout1_s3c2443_p;
> +		clkout1_num_parents =3D ARRAY_SIZE(clkout1_s3c2443_p);
> +		break;
> +	default:
> +		dev_err(&pdev->dev, "unsupported soc %d\n", current_soc);
> +		ret =3D -EINVAL;
> +		goto err_clk_register;
> +	}

Ditto.

> +
> +	clk_table[MUX_CLKOUT0] =3D s3c24xx_register_clkout(&pdev->dev,
> +				"clkout0", clkout0_parent_names,
> +				clkout0_num_parents, misccr, 4, 7);
> +	clk_table[MUX_CLKOUT1] =3D s3c24xx_register_clkout(&pdev->dev, "clk=
out1",
> +				clkout1_parent_names,
> +				clkout1_num_parents, misccr, 8, 7);
> +
> +	for (i =3D 0; i < DCLK_MAX_CLKS; i++)
> +		if (IS_ERR(clk_table[i])) {
> +			dev_err(&pdev->dev, "clock %d failed to register\n", i);
> +			ret =3D PTR_ERR(clk_table[i]);
> +			goto err_clk_register;
> +		}
> +
> +	ret =3D clk_register_clkdev(clk_table[MUX_DCLK0], "dclk0", NULL);
> +	ret |=3D clk_register_clkdev(clk_table[MUX_DCLK1], "dclk1", NULL);
> +	ret |=3D clk_register_clkdev(clk_table[MUX_CLKOUT0], "clkout0", NUL=
L);
> +	ret |=3D clk_register_clkdev(clk_table[MUX_CLKOUT1], "clkout1", NUL=
L);

Hmm, won't it break the error value if two calls return different error=
=20
codes?

I guess that

if (!ret)
	ret =3D ...
if (!ret)
	ret =3D ...

construct would be more appropriate here, if you don't want error=20
message per call.


> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register aliases\n");
> +		goto err_clk_register;
> +	}
> +
> +	s3c24xx_dclk->dclk0_div_change_nb.notifier_call =3D
> +						s3c24xx_dclk0_div_notify;
> +	s3c24xx_dclk->dclk0_div_change_nb.next =3D NULL;

Do you need to set this field to NULL explicitly?

Best regards,
Tomasz
