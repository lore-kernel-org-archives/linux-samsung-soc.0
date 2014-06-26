From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 11/14] clk: Add driver for Maxim 77802 PMIC clocks
Date: Thu, 26 Jun 2014 12:40:19 +0200
Message-ID: <1403779219.27156.20.camel@AMDC1943>
References: <1403723019-6212-1-git-send-email-javier.martinez@collabora.co.uk>
 <1403723019-6212-12-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1403723019-6212-12-git-send-email-javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Daniel Stone <daniels-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On =C5=9Bro, 2014-06-25 at 21:03 +0200, Javier Martinez Canillas wrote:
> The MAX77802 PMIC has two 32.768kHz Buffered Clock Outputs with
> Low Jitter Mode. This patch adds support for these two clocks.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8rSCDK34cm6iQ@public.gmane.org=
=2Euk>
> ---
>=20
> Changes since v3: None
>=20
> Changes since v2: None
>=20
> Changes since v1:
>  - Use module_platform_driver() instead of having init/exit functions=
=2E
>    Suggested by Mark Brown.
>  - Use the generic maxim clock driver to reduce code duplication with
>    clk-max77686.c driver.
>=20
>  drivers/clk/Kconfig                        |  7 +++
>  drivers/clk/Makefile                       |  1 +
>  drivers/clk/clk-max77802.c                 | 99 ++++++++++++++++++++=
++++++++++
>  include/dt-bindings/clock/maxim,max77802.h | 22 +++++++
>  4 files changed, 129 insertions(+)
>  create mode 100644 drivers/clk/clk-max77802.c
>  create mode 100644 include/dt-bindings/clock/maxim,max77802.h


Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Best regards,
Krzysztof


>=20
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 3fd4270..221260b 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -42,6 +42,13 @@ config COMMON_CLK_MAX77686
>  	---help---
>  	  This driver supports Maxim 77686 crystal oscillator clock.=20
> =20
> +config COMMON_CLK_MAX77802
> +	tristate "Clock driver for Maxim 77802 MFD"
> +	depends on MFD_MAX77802
> +	select COMMON_CLK_MAX_GEN
> +	---help---
> +	  This driver supports Maxim 77802 crystal oscillator clock.
> +
>  config COMMON_CLK_SI5351
>  	tristate "Clock driver for SiLabs 5351A/B/C"
>  	depends on I2C
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 6c1aff6..520ff76 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_ARCH_HIGHBANK)		+=3D clk-highbank.o
>  obj-$(CONFIG_MACH_LOONGSON1)		+=3D clk-ls1x.o
>  obj-$(CONFIG_COMMON_CLK_MAX_GEN)	+=3D clk-max-gen.o
>  obj-$(CONFIG_COMMON_CLK_MAX77686)	+=3D clk-max77686.o
> +obj-$(CONFIG_COMMON_CLK_MAX77802)	+=3D clk-max77802.o
>  obj-$(CONFIG_ARCH_MOXART)		+=3D clk-moxart.o
>  obj-$(CONFIG_ARCH_NOMADIK)		+=3D clk-nomadik.o
>  obj-$(CONFIG_ARCH_NSPIRE)		+=3D clk-nspire.o
> diff --git a/drivers/clk/clk-max77802.c b/drivers/clk/clk-max77802.c
> new file mode 100644
> index 0000000..4253b44
> --- /dev/null
> +++ b/drivers/clk/clk-max77802.c
> @@ -0,0 +1,99 @@
> +/*
> + * clk-max77802.c - Clock driver for Maxim 77802
> + *
> + * Copyright (C) 2014 Google, Inc
> + *
> + * Copyright (C) 2012 Samsung Electornics
> + * Jonghwa Lee <jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/max77802.h>
> +#include <linux/mfd/max77802-private.h>
> +#include <linux/clk-provider.h>
> +#include <linux/mutex.h>
> +#include <linux/clkdev.h>
> +
> +#include <dt-bindings/clock/maxim,max77802.h>
> +#include "clk-max-gen.h"
> +
> +#define MAX77802_CLOCK_OPMODE_MASK	0x1
> +#define MAX77802_CLOCK_LOW_JITTER_SHIFT 0x3
> +
> +static struct clk_init_data max77802_clks_init[MAX77802_CLKS_NUM] =3D=
 {
> +	[MAX77802_CLK_32K_AP] =3D {
> +		.name =3D "32khz_ap",
> +		.ops =3D &max_gen_clk_ops,
> +		.flags =3D CLK_IS_ROOT,
> +	},
> +	[MAX77802_CLK_32K_CP] =3D {
> +		.name =3D "32khz_cp",
> +		.ops =3D &max_gen_clk_ops,
> +		.flags =3D CLK_IS_ROOT,
> +	},
> +};
> +
> +static int max77802_clk_probe(struct platform_device *pdev)
> +{
> +	struct max77802_dev *iodev =3D dev_get_drvdata(pdev->dev.parent);
> +	int ret;
> +
> +	ret =3D max_gen_clk_probe(pdev, iodev->regmap, MAX77802_REG_32KHZ,
> +				max77802_clks_init, MAX77802_CLKS_NUM);
> +
> +	if (ret) {
> +		dev_err(&pdev->dev, "generic probe failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Enable low-jitter mode on the 32khz clocks. */
> +	ret =3D regmap_update_bits(iodev->regmap, MAX77802_REG_32KHZ,
> +				 1 << MAX77802_CLOCK_LOW_JITTER_SHIFT,
> +				 1 << MAX77802_CLOCK_LOW_JITTER_SHIFT);
> +	if (ret < 0)
> +		dev_err(&pdev->dev, "failed to enable low-jitter mode\n");
> +
> +	return ret;
> +}
> +
> +static int max77802_clk_remove(struct platform_device *pdev)
> +{
> +	return max_gen_clk_remove(pdev, MAX77802_CLKS_NUM);
> +}
> +
> +static const struct platform_device_id max77802_clk_id[] =3D {
> +	{ "max77802-clk", 0},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(platform, max77802_clk_id);
> +
> +static struct platform_driver max77802_clk_driver =3D {
> +	.driver =3D {
> +		.name  =3D "max77802-clk",
> +		.owner =3D THIS_MODULE,
> +	},
> +	.probe =3D max77802_clk_probe,
> +	.remove =3D max77802_clk_remove,
> +	.id_table =3D max77802_clk_id,
> +};
> +
> +module_platform_driver(max77802_clk_driver);
> +
> +MODULE_DESCRIPTION("MAXIM 77802 Clock Driver");
> +MODULE_AUTHOR("Javier Martinez Canillas <javier.martinez@collabora.c=
o.uk>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/dt-bindings/clock/maxim,max77802.h b/include/dt-=
bindings/clock/maxim,max77802.h
> new file mode 100644
> index 0000000..997312e
> --- /dev/null
> +++ b/include/dt-bindings/clock/maxim,max77802.h
> @@ -0,0 +1,22 @@
> +/*
> + * Copyright (C) 2014 Google, Inc
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * Device Tree binding constants clocks for the Maxim 77802 PMIC.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_MAXIM_MAX77802_CLOCK_H
> +#define _DT_BINDINGS_CLOCK_MAXIM_MAX77802_CLOCK_H
> +
> +/* Fixed rate clocks. */
> +
> +#define MAX77802_CLK_32K_AP		0
> +#define MAX77802_CLK_32K_CP		1
> +
> +/* Total number of clocks. */
> +#define MAX77802_CLKS_NUM		(MAX77802_CLK_32K_CP + 1)
> +
> +#endif /* _DT_BINDINGS_CLOCK_MAXIM_MAX77802_CLOCK_H */

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
