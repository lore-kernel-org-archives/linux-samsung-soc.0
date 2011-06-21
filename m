From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [RFC][PATCH 4/5] ARM: S5P64x0: Adding OTG PHY control code
Date: Tue, 21 Jun 2011 12:31:50 +0300
Message-ID: <20110621093149.GL28225@legolas.emea.dhcp.ti.com>
References: <1308639827-2121-1-git-send-email-p.paneri@samsung.com>
 <1308639827-2121-5-git-send-email-p.paneri@samsung.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2O+9B+xSKalj/wdD"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1308639827-2121-5-git-send-email-p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, tmarri-qTEPVZfXA3Y@public.gmane.org, naushad-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--2O+9B+xSKalj/wdD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 21, 2011 at 12:33:46PM +0530, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org wrote:
> From: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>=20
> A generic method to initialize and exit OTG PHY which can be
> used for all the samsung SoCs.
> OTG platdata structure added in platform to pass required
> platform specific functions and data to the driver.
>=20
> Signed-off-by: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/mach-s5p64x0/Makefile           |    1 +
>  arch/arm/mach-s5p64x0/include/mach/map.h |    4 +
>  arch/arm/mach-s5p64x0/setup-otg-phy.c    |   89 ++++++++++++++++++++++++=
++++++
>  arch/arm/plat-s5p/include/plat/otg.h     |   29 ++++++++++
>  4 files changed, 123 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-s5p64x0/setup-otg-phy.c
>  create mode 100644 arch/arm/plat-s5p/include/plat/otg.h
>=20
> diff --git a/arch/arm/mach-s5p64x0/Makefile b/arch/arm/mach-s5p64x0/Makef=
ile
> index ae6bf6f..611fb3a 100644
> --- a/arch/arm/mach-s5p64x0/Makefile
> +++ b/arch/arm/mach-s5p64x0/Makefile
> @@ -28,3 +28,4 @@ obj-y				+=3D dev-audio.o
>  obj-$(CONFIG_S3C64XX_DEV_SPI)	+=3D dev-spi.o
> =20
>  obj-$(CONFIG_S5P64X0_SETUP_I2C1)	+=3D setup-i2c1.o
> +obj-$(CONFIG_S3C_DEV_DWC_OTG)	+=3D setup-otg-phy.o
> diff --git a/arch/arm/mach-s5p64x0/include/mach/map.h b/arch/arm/mach-s5p=
64x0/include/mach/map.h
> index 95c9125..717c279 100644
> --- a/arch/arm/mach-s5p64x0/include/mach/map.h
> +++ b/arch/arm/mach-s5p64x0/include/mach/map.h
> @@ -44,6 +44,8 @@
>  #define S5P64X0_PA_SPI1		0xEC500000
> =20
>  #define S5P64X0_PA_HSOTG	0xED100000
> +#define S5P64X0_PA_USB_HSPHY	0xED200000
> +#define S5P64X0_VA_USB_HSPHY	S3C_ADDR_CPU(0x00100000)
> =20
>  #define S5P64X0_PA_HSMMC(x)	(0xED800000 + ((x) * 0x100000))
> =20
> @@ -71,6 +73,8 @@
>  #define S5P_PA_TIMER		S5P64X0_PA_TIMER
> =20
>  #define SAMSUNG_PA_ADC		S5P64X0_PA_ADC
> +#define S3C_PA_USB_HSOTG	S5P64X0_PA_HSOTG
> +#define S3C_VA_USB_HSPHY        S5P64X0_VA_USB_HSPHY
> =20
>  /* UART */
> =20
> diff --git a/arch/arm/mach-s5p64x0/setup-otg-phy.c b/arch/arm/mach-s5p64x=
0/setup-otg-phy.c

drivers should not live in arch/arm/*, why don't you move this to
drivers/usb/otg where the PHYs are staying right now ?

> new file mode 100644
> index 0000000..c351554
> --- /dev/null
> +++ b/arch/arm/mach-s5p64x0/setup-otg-phy.c
> @@ -0,0 +1,89 @@
> +/*
> + * Copyright (C) 2011 Samsung Electronics Co.Ltd
> + * Author: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> + * based on arch/arm/mach-exynos4/setup-usb-phy.c
> + * written by Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> + *
> + *  This program is free software; you can redistribute  it and/or modif=
y it
> + *  under  the terms of  the GNU General  Public License as published by=
 the
> + *  Free Software Foundation;  either version 2 of the  License, or (at =
your
> + *  option) any later version.
> + *
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <mach/regs-clock.h>
> +#include <mach/gpio.h>
> +#include <plat/regs-usb-hsotg-phy.h>
> +#include <plat/usb-phy.h>
> +
> +struct clk *otg_clk;
> +static int s5p64x0_otg_phy_init(struct platform_device *pdev)
> +{
> +	int err;
> +
> +	otg_clk =3D clk_get(&pdev->dev, "otg");
> +	if (IS_ERR(otg_clk)) {
> +		dev_err(&pdev->dev, "Failed to get otg clock\n");
> +		return PTR_ERR(otg_clk);
> +	}
> +
> +	err =3D clk_enable(otg_clk);
> +	if (err) {
> +		clk_put(otg_clk);
> +		return err;
> +	}
> +
> +	if (gpio_is_valid(S5P6440_GPN(1))) {
> +		err =3D gpio_request(S5P6440_GPN(1), "GPN");
> +		if (err)
> +			printk(KERN_ERR "failed to request GPN1\n");
> +		gpio_direction_output(S5P6440_GPN(1), 1);
> +	}
> +
> +	writel(readl(S5P64X0_OTHERS)&~S5P64X0_OTHERS_USB_SIG_MASK,
> +							S5P64X0_OTHERS);
> +	writel(0x0, S3C_PHYPWR);         /* Power up */
> +	writel(S3C_PHYCLK_CLKSEL_12M, S3C_PHYCLK);
> +	writel(S3C_RSTCON_PHY, S3C_RSTCON);
> +
> +	udelay(50);
> +	writel(0x0, S3C_RSTCON);
> +	udelay(50);
> +
> +	return 0;
> +}
> +
> +static int s5p64x0_otg_phy_exit(struct platform_device *pdev)
> +{
> +	writel(readl(S3C_PHYPWR)|(0x1F<<1), S3C_PHYPWR);
> +	writel(readl(S5P64X0_OTHERS)&~S5P64X0_OTHERS_USB_SIG_MASK,
> +							S5P64X0_OTHERS);
> +
> +	gpio_free(S5P6440_GPN(1));
> +
> +	clk_disable(otg_clk);
> +	clk_put(otg_clk);
> +
> +	return 0;
> +}
> +
> +int s5p_usb_phy_init(struct platform_device *pdev, int type)
> +{
> +	if (type =3D=3D S5P_USB_PHY_DEVICE)
> +		return s5p64x0_otg_phy_init(pdev);
> +
> +	return -EINVAL;
> +}
> +
> +int s5p_usb_phy_exit(struct platform_device *pdev, int type)
> +{
> +	if (type =3D=3D S5P_USB_PHY_DEVICE)
> +		return s5p64x0_otg_phy_exit(pdev);
> +
> +	return -EINVAL;
> +}

no way to make this a real driver instead of set a exported functions ??

--=20
balbi

--2O+9B+xSKalj/wdD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOAGUFAAoJEAv8Txj19kN1KAIH/A5hRvThwqV95G4IIsqLi5se
lB0RreZ48gwNn9Ej/qEe+6GNGb7idoG4AzqFkjPZuZbex/GmiMgmJqE/8KY9maFw
h9bvMfW00xBZR+HLudVIigEnd06E1QaoCtCyw83u7wWG1/TbQA11txUi9iycRE8w
8AqrHfP+SnslJWh1/aJ/kmIXtDCPMJTwFmA2tjhyBAu2NtD5cw8C5yitr+WPqgN2
+VoVzK3Bz8lceRZyRr8T4YmZaFkrRQ0oKydoH9UZ2JdG3uF+XJxPwfLnxv9Szw55
tIvfN8jLNg80fZL+ShYR1ruisj8JO9SG8xYVu6M1ySIzv+tvqVgGaCWQqSHtGD8=
=dILI
-----END PGP SIGNATURE-----

--2O+9B+xSKalj/wdD--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
