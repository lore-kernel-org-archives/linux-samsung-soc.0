From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH v5 1/5] usb: phy: samsung: Introducing usb phy driver
 for hsotg
Date: Wed, 12 Sep 2012 13:08:26 +0200
Message-ID: <50506D2A.7040908@pengutronix.de>
References: <1347446757-20519-1-git-send-email-p.paneri@samsung.com> <1347446757-20519-2-git-send-email-p.paneri@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigF4C4669993125BAF0AF86CFB"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:54390 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757808Ab2ILLKG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Sep 2012 07:10:06 -0400
In-Reply-To: <1347446757-20519-2-git-send-email-p.paneri@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Praveen Paneri <p.paneri@samsung.com>
Cc: linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, balbi@ti.com, gregkh@linuxfoundation.org, thomas.abraham@linaro.org, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, l.majewski@samsung.com, kyungmin.park@samsung.com, grant.likely@secretlab.ca, heiko@sntech.de

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigF4C4669993125BAF0AF86CFB
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 09/12/2012 12:45 PM, Praveen Paneri wrote:
> This driver uses usb_phy interface to interact with s3c-hsotg. Supports=

> phy_init and phy_shutdown functions to enable/disable phy. Tested with
> smdk6410 and smdkv310. More SoCs can be brought under later.
>=20
> Signed-off-by: Praveen Paneri <p.paneri@samsung.com>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../devicetree/bindings/usb/samsung-usbphy.txt     |    9 +
>  drivers/usb/phy/Kconfig                            |    8 +
>  drivers/usb/phy/Makefile                           |    1 +
>  drivers/usb/phy/samsung-usbphy.c                   |  371 ++++++++++++=
++++++++
>  include/linux/platform_data/samsung-usbphy.h       |   27 ++
>  5 files changed, 416 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/samsung-usbph=
y.txt
>  create mode 100644 drivers/usb/phy/samsung-usbphy.c
>  create mode 100644 include/linux/platform_data/samsung-usbphy.h
>=20
> diff --git a/Documentation/devicetree/bindings/usb/samsung-usbphy.txt b=
/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
> new file mode 100644
> index 0000000..fefd9c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
> @@ -0,0 +1,9 @@
> +* Samsung's usb phy transceiver
> +
> +The Samsung's phy transceiver is used for controlling usb otg phy for
> +s3c-hsotg usb device controller.
> +
> +Required properties:
> +- compatible : should be "samsung,exynos4210-usbphy"
> +- reg : base physical address of the phy registers and length of memor=
y mapped
> +	region.
> diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
> index 63c339b..313685f 100644
> --- a/drivers/usb/phy/Kconfig
> +++ b/drivers/usb/phy/Kconfig
> @@ -32,3 +32,11 @@ config MV_U3D_PHY
>  	help
>  	  Enable this to support Marvell USB 3.0 phy controller for Marvell
>  	  SoC.
> +
> +config SAMSUNG_USBPHY
> +	bool "Samsung USB PHY controller Driver"
> +	depends on USB_S3C_HSOTG
> +	select USB_OTG_UTILS
> +	help
> +	  Enable this to support Samsung USB phy controller for samsung
> +	  SoCs.
> diff --git a/drivers/usb/phy/Makefile b/drivers/usb/phy/Makefile
> index b069f29..55dcfc1 100644
> --- a/drivers/usb/phy/Makefile
> +++ b/drivers/usb/phy/Makefile
> @@ -8,3 +8,4 @@ obj-$(CONFIG_OMAP_USB2)			+=3D omap-usb2.o
>  obj-$(CONFIG_USB_ISP1301)		+=3D isp1301.o
>  obj-$(CONFIG_MV_U3D_PHY)		+=3D mv_u3d_phy.o
>  obj-$(CONFIG_USB_EHCI_TEGRA)	+=3D tegra_usb_phy.o
> +obj-$(CONFIG_SAMSUNG_USBPHY)		+=3D samsung-usbphy.o
> diff --git a/drivers/usb/phy/samsung-usbphy.c b/drivers/usb/phy/samsung=
-usbphy.c
> new file mode 100644
> index 0000000..b00d01b
> --- /dev/null
> +++ b/drivers/usb/phy/samsung-usbphy.c
> @@ -0,0 +1,371 @@
> +/* linux/drivers/usb/phy/samsung-usbphy.c
> + *
> + * Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + *              http://www.samsung.com
> + *
> + * Author: Praveen Paneri <p.paneri@samsung.com>
> + *
> + * Samsung USB2.0 High-speed OTG transceiver, talks to S3C HS OTG cont=
roller
> + *
> + * This program is free software; you can redistribute it and/or modif=
y
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/usb/otg.h>
> +#include <linux/platform_data/samsung-usbphy.h>
> +
> +/* Register definitions */
> +
> +#define S3C_PHYPWR				(0x00)
> +
> +#define S3C_PHYPWR_NORMAL_MASK			(0x19 << 0)
> +#define S3C_PHYPWR_OTG_DISABLE			(1 << 4)
> +#define S3C_PHYPWR_ANALOG_POWERDOWN		(1 << 3)
> +#define S3C_PHYPWR_FORCE_SUSPEND		(1 << 1)
> +/* For Exynos4 */
> +#define EXYNOS4_PHYPWR_NORMAL_MASK		(0x39 << 0)
> +#define EXYNOS4_PHYPWR_SLEEP			(1 << 5)
> +
> +#define S3C_PHYCLK				(0x04)
> +
> +#define S3C_PHYCLK_MODE_SERIAL			(1 << 6)
> +#define S3C_PHYCLK_EXT_OSC			(1 << 5)
> +#define S3C_PHYCLK_COMMON_ON_N			(1 << 4)
> +#define S3C_PHYCLK_ID_PULL			(1 << 2)
> +#define S3C_PHYCLK_CLKSEL_MASK			(0x3 << 0)
> +#define S3C_PHYCLK_CLKSEL_SHIFT			(0)
> +#define S3C_PHYCLK_CLKSEL_48M			(0x0 << 0)
> +#define S3C_PHYCLK_CLKSEL_12M			(0x2 << 0)
> +#define S3C_PHYCLK_CLKSEL_24M			(0x3 << 0)
> +
> +#define S3C_RSTCON				(0x08)
> +
> +#define S3C_RSTCON_PHYCLK			(1 << 2)
> +#define S3C_RSTCON_HCLK				(1 << 1)
> +#define S3C_RSTCON_PHY				(1 << 0)
> +
> +#ifndef MHZ
> +#define MHZ (1000*1000)
> +#endif
> +
> +enum samsung_cpu_type {
> +	TYPE_S3C64XX,
> +	TYPE_EXYNOS4210,
> +};
> +
> +/*
> + * struct samsung_usbphy - transceiver driver state
> + * @phy: transceiver structure
> + * @plat: platform data
> + * @dev: The parent device supplied to the probe function
> + * @clk: usb phy clock
> + * @regs: usb phy register memory base
> + * @cpu_type: machine identifier
> + */
> +struct samsung_usbphy {
> +	struct usb_phy	phy;
> +	struct samsung_usbphy_data *plat;
> +	struct device	*dev;
> +	struct clk	*clk;
> +	void __iomem	*regs;
> +	int		cpu_type;
> +};
> +
> +#define phy_to_sphy(x)		container_of((x), struct samsung_usbphy, phy)
> +
> +/*
> + * Enables or disables the phy clock
> + * returns 0 on success else the error
> + */
> +static int samsung_usbphy_clk_control(struct samsung_usbphy *sphy, boo=
l on)
> +{
> +	if (on) {
> +		if (!sphy->clk) {
> +			sphy->clk =3D clk_get(sphy->dev, "otg");

Why don't you get the clock in the probe function?

> +			if (IS_ERR(sphy->clk)) {
> +				dev_err(sphy->dev, "Failed to get otg clock\n");
> +				return PTR_ERR(sphy->clk);
> +			}
> +		}
> +		clk_enable(sphy->clk);

I think you have to prepare the clock, too. Thus better use:
clk_prepare_enable();

> +	} else {
> +		clk_disable(sphy->clk);

clk_disable_unprepare()

> +		clk_put(sphy->clk);

Move this to you remove function.

> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Returns reference clock frequency
> + */
> +static int samsung_usbphy_get_refclk_freq(struct samsung_usbphy *sphy)=

> +{
> +	struct clk *ref_clk;
> +	int refclk_freq =3D 0;
> +
> +	ref_clk =3D clk_get(sphy->dev, "xusbxti");

Can you move the samsung_usbphy_get_refclk_freq to your probe function
and save refclock in your private data?

> +	if (IS_ERR(ref_clk)) {
> +		dev_err(sphy->dev, "Failed to get reference clock\n");
> +		return PTR_ERR(ref_clk);
> +	}
> +
> +	switch (clk_get_rate(ref_clk)) {
> +	case 12 * MHZ:
> +		refclk_freq |=3D S3C_PHYCLK_CLKSEL_12M;
> +		break;
> +	case 24 * MHZ:
> +		refclk_freq |=3D S3C_PHYCLK_CLKSEL_24M;
> +		break;
> +	default:
> +	case 48 * MHZ:
> +		/* default reference clock */
> +		refclk_freq |=3D S3C_PHYCLK_CLKSEL_48M;
> +		break;
> +	}
> +	clk_put(ref_clk);
> +
> +	return refclk_freq;
> +}
> +
> +static void samsung_usbphy_enable(struct samsung_usbphy *sphy)
> +{
> +	void __iomem *regs =3D sphy->regs;
> +	u32 phypwr;
> +	u32 phyclk;
> +	u32 rstcon;
> +
> +	/* set clock frequency for PLL */
> +	phyclk =3D samsung_usbphy_get_refclk_freq(sphy);
> +	phypwr =3D readl(regs + S3C_PHYPWR);
> +	rstcon =3D readl(regs + S3C_RSTCON);
> +
> +	switch (sphy->cpu_type) {
> +	case TYPE_S3C64XX:
> +		phyclk &=3D ~(S3C_PHYCLK_COMMON_ON_N);
> +		phypwr &=3D ~S3C_PHYPWR_NORMAL_MASK;
> +		rstcon |=3D S3C_RSTCON_PHY;
> +		break;
> +	case TYPE_EXYNOS4210:
> +		phypwr &=3D ~EXYNOS4_PHYPWR_NORMAL_MASK;
> +		rstcon |=3D S3C_RSTCON_PHY;
> +	default:
> +		break;
> +	}
> +
> +	writel(phyclk, regs + S3C_PHYCLK);
> +	/* set to normal of PHY0 */
> +	writel(phypwr, regs + S3C_PHYPWR);
> +	/* reset all ports of PHY and Link */
> +	writel(rstcon, regs + S3C_RSTCON);
> +	udelay(10);
> +	rstcon &=3D ~S3C_RSTCON_PHY;
> +	writel(rstcon, regs + S3C_RSTCON);
> +}
> +
> +static void samsung_usbphy_disable(struct samsung_usbphy *sphy)
> +{
> +	void __iomem *regs =3D sphy->regs;
> +	u32 phypwr;
> +
> +	phypwr =3D readl(regs + S3C_PHYPWR);
> +
> +	switch (sphy->cpu_type) {
> +	case TYPE_S3C64XX:
> +		phypwr |=3D S3C_PHYPWR_NORMAL_MASK;
> +		break;
> +	case TYPE_EXYNOS4210:
> +		phypwr |=3D EXYNOS4_PHYPWR_NORMAL_MASK;
> +	default:
> +		break;
> +	}
> +
> +	/* unset to normal of PHY0 */
> +	writel(phypwr, regs + S3C_PHYPWR);
> +}
> +
> +/*
> + * The function passed to the usb driver for phy initialization
> + */
> +static int samsung_usbphy_init(struct usb_phy *phy)
> +{
> +	struct samsung_usbphy *sphy;
> +	int ret =3D 0;
> +
> +	sphy =3D phy_to_sphy(phy);
> +
> +	/* Enable the phy clock */
> +	ret =3D samsung_usbphy_clk_control(sphy, true);
> +	if (ret) {
> +		dev_err(sphy->dev, "phy clock enable failed\n");
> +		return ret;
> +	}
> +
> +	/* Disable phy isolation */
> +	if (sphy->plat && sphy->plat->pmu_isolation)
> +		sphy->plat->pmu_isolation(false);
> +
> +	/* Initialize usb phy registers */
> +	samsung_usbphy_enable(sphy);
> +	return ret;
> +}
> +
> +/*
> + * The function passed to the usb driver for phy shutdown
> + */
> +static void samsung_usbphy_shutdown(struct usb_phy *phy)
> +{
> +	struct samsung_usbphy *sphy;
> +
> +	sphy =3D phy_to_sphy(phy);
> +
> +	/* De-initialize usb phy registers */
> +	samsung_usbphy_disable(sphy);
> +
> +	/* Enable phy isolation */
> +	if (sphy->plat && sphy->plat->pmu_isolation)
> +		sphy->plat->pmu_isolation(true);
> +
> +	/* Disable the phy clock */
> +	samsung_usbphy_clk_control(sphy, false);
> +}
> +
> +static const struct of_device_id samsung_usbphy_dt_match[];
> +
> +static inline int samsung_usbphy_get_driver_data(struct platform_devic=
e *pdev)
> +{
> +#ifdef CONFIG_OF

if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node)

> +	int data;
> +	if (pdev->dev.of_node) {
> +		const struct of_device_id *match;
> +		match =3D of_match_node(samsung_usbphy_dt_match,
> +							pdev->dev.of_node);
> +		data =3D (int) match->data;
> +		return data;
> +	}
> +#endif
> +	return platform_get_device_id(pdev)->driver_data;
> +}
> +
> +static int __devinit samsung_usbphy_probe(struct platform_device *pdev=
)
> +{
> +	struct samsung_usbphy *sphy;
> +	struct samsung_usbphy_data *pdata;
> +	struct device *dev =3D &pdev->dev;
> +	struct resource *phy_mem;
> +	void __iomem	*phy_base;
> +	int	ret;
> +
> +	pdata =3D pdev->dev.platform_data;
> +	if (!pdata) {

Do you need platform data when probed via DT, too?

> +		dev_err(&pdev->dev, "%s: no platform data defined\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	phy_mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!phy_mem) {
> +		dev_err(dev, "%s: missing mem resource\n", __func__);
> +		return -ENODEV;
> +	}
> +
> +	phy_base =3D devm_request_and_ioremap(dev, phy_mem);
> +	if (!phy_base) {
> +		dev_err(dev, "%s: register mapping failed\n", __func__);
> +		return -ENXIO;
> +	}
> +
> +	sphy =3D devm_kzalloc(dev, sizeof(*sphy), GFP_KERNEL);
> +	if (!sphy)
> +		return -ENOMEM;
> +
> +	sphy->dev		=3D &pdev->dev;
> +	sphy->plat		=3D pdata;
> +	sphy->regs		=3D phy_base;
> +	sphy->phy.dev		=3D sphy->dev;
> +	sphy->phy.label		=3D "samsung-usbphy";
> +	sphy->phy.init		=3D samsung_usbphy_init;
> +	sphy->phy.shutdown	=3D samsung_usbphy_shutdown;
> +	sphy->cpu_type		=3D samsung_usbphy_get_driver_data(pdev);
> +
> +	ret =3D usb_add_phy(&sphy->phy, USB_PHY_TYPE_USB2);
> +	if (ret)
> +		goto err;
> +
> +	platform_set_drvdata(pdev, sphy);
> +err:
> +	return ret;
> +}
> +
> +static int __exit samsung_usbphy_remove(struct platform_device *pdev)
> +{
> +	struct samsung_usbphy *sphy =3D platform_get_drvdata(pdev);
> +
> +	usb_remove_phy(&sphy->phy);
> +
> +	if (sphy->clk) {
> +		clk_put(sphy->clk);

Are you sure that your clk_put is balanced?

> +		sphy->clk =3D NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id samsung_usbphy_dt_match[] =3D {
> +	{
> +		.compatible =3D "samsung,s3c64xx-usbphy",
> +		.data =3D (void *)TYPE_S3C64XX,
> +	}, {
> +		.compatible =3D "samsung,exynos4210-usbphy",
> +		.data =3D (void *)TYPE_EXYNOS4210,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, samsung_usbphy_dt_match);
> +#else
> +#define samsung_usbphy_dt_match NULL
> +#endif
> +
> +static struct platform_device_id samsung_usbphy_driver_ids[] =3D {
> +	{
> +		.name		=3D "s3c64xx-usbphy",
> +		.driver_data	=3D TYPE_S3C64XX,
> +	}, {
> +		.name		=3D "exynos4210-usbphy",
> +		.driver_data	=3D TYPE_EXYNOS4210,
> +	},
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(platform, samsung_usbphy_driver_ids);
> +
> +static struct platform_driver samsung_usbphy_driver =3D {
> +	.probe		=3D samsung_usbphy_probe,
> +	.remove		=3D __devexit_p(samsung_usbphy_remove),
> +	.id_table	=3D samsung_usbphy_driver_ids,
> +	.driver		=3D {
> +		.name	=3D "samsung-usbphy",
> +		.owner	=3D THIS_MODULE,
> +		.of_match_table =3D samsung_usbphy_dt_match,
> +	},
> +};
> +
> +module_platform_driver(samsung_usbphy_driver);
> +
> +MODULE_DESCRIPTION("Samsung USB phy controller");
> +MODULE_AUTHOR("Praveen Paneri <p.paneri@samsung.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:samsung-usbphy");
> diff --git a/include/linux/platform_data/samsung-usbphy.h b/include/lin=
ux/platform_data/samsung-usbphy.h
> new file mode 100644
> index 0000000..1bd24cb
> --- /dev/null
> +++ b/include/linux/platform_data/samsung-usbphy.h
> @@ -0,0 +1,27 @@
> +/*
> + * Copyright (C) 2012 Samsung Electronics Co.Ltd
> + *		http://www.samsung.com/
> + * Author: Praveen Paneri <p.paneri@samsung.com>
> + *
> + * Defines platform data for samsung usb phy driver.
> + *
> + * This program is free software; you can redistribute  it and/or modi=
fy it
> + * under  the terms of  the GNU General  Public License as published b=
y the
> + * Free Software Foundation;  either version 2 of the  License, or (at=
 your
> + * option) any later version.
> + */
> +
> +#ifndef __SAMSUNG_USBPHY_PLATFORM_H
> +#define __SAMSUNG_USBPHY_PLATFORM_H
> +
> +/**
> + * samsung_usbphy_data - Platform data for USB PHY driver.
> + * @pmu_isolation: Function to control usb phy isolation in PMU.
> + */
> +struct samsung_usbphy_data {
> +	void (*pmu_isolation)(int on);
> +};
> +
> +extern void samsung_usbphy_set_pdata(struct samsung_usbphy_data *pd);
> +
> +#endif /* __SAMSUNG_USBPHY_PLATFORM_H */
>=20
Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enigF4C4669993125BAF0AF86CFB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iEYEARECAAYFAlBQbS4ACgkQjTAFq1RaXHPqgACghon+p85D0/VpvFZcTEpvKRl5
eNkAnjh6JfGR68tMAxEsw3JIuqU2HmBJ
=g/2R
-----END PGP SIGNATURE-----

--------------enigF4C4669993125BAF0AF86CFB--
