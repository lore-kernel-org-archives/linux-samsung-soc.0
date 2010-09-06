From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 3/4] ARM: S5PC110: add common FIMC setup code
Date: Mon, 6 Sep 2010 06:16:17 +0200
Message-ID: <201009060616.18100.marek.vasut@gmail.com>
References: <1283745044-15514-1-git-send-email-m.szyprowski@samsung.com> <1283745044-15514-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:53417 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750715Ab0IFEQ2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Sep 2010 00:16:28 -0400
Received: by bwz11 with SMTP id 11so3056238bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Sep 2010 21:16:26 -0700 (PDT)
In-Reply-To: <1283745044-15514-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Dne Po 6. z=C3=A1=C5=99=C3=AD 2010 05:50:43 Marek Szyprowski napsal(a):
> Add common clocks setup code for FIMC devices on S5PV210 SoCs.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/Kconfig             |    6 ++++
>  arch/arm/mach-s5pv210/Makefile            |    1 +
>  arch/arm/mach-s5pv210/setup-fimc.c        |   46
> +++++++++++++++++++++++++++++ arch/arm/plat-samsung/include/plat/fimc=
=2Eh |=20
>  24 +++++++++++++++
>  4 files changed, 77 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-s5pv210/setup-fimc.c
>  create mode 100644 arch/arm/plat-samsung/include/plat/fimc.h
>=20
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kc=
onfig
> index d3a3895..48489bb 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -37,6 +37,12 @@ config S5PV210_SETUP_FB_24BPP
>  	help
>            Common setup code for S5PV210 with an 24bpp RGB display he=
lper.
>=20
> +config S5PV210_SETUP_FIMC
> +	bool
> +	help
> +	  Compile common code for S5PV210 based machines to setup correct
> +	  FIMC clock parameters.
> +
>  config S5PV210_SETUP_KEYPAD
>  	bool
>  	help
> diff --git a/arch/arm/mach-s5pv210/Makefile
> b/arch/arm/mach-s5pv210/Makefile index 05048c5..c13aef1 100644
> --- a/arch/arm/mach-s5pv210/Makefile
> +++ b/arch/arm/mach-s5pv210/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_S3C64XX_DEV_SPI)	+=3D dev-spi.o
>  obj-$(CONFIG_S5PC110_DEV_ONENAND) +=3D dev-onenand.o
>=20
>  obj-$(CONFIG_S5PV210_SETUP_FB_24BPP)	+=3D setup-fb-24bpp.o
> +obj-$(CONFIG_S5PV210_SETUP_FIMC)	+=3D setup-fimc.o
>  obj-$(CONFIG_S5PV210_SETUP_I2C1) 	+=3D setup-i2c1.o
>  obj-$(CONFIG_S5PV210_SETUP_I2C2) 	+=3D setup-i2c2.o
>  obj-$(CONFIG_S5PV210_SETUP_IDE)		+=3D setup-ide.o
> diff --git a/arch/arm/mach-s5pv210/setup-fimc.c
> b/arch/arm/mach-s5pv210/setup-fimc.c new file mode 100644
> index 0000000..80c1ffe
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/setup-fimc.c
> @@ -0,0 +1,46 @@
> +/*
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * S5PV210 clock setup code for FIMC devices
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +#include <linux/device.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <plat/devs.h>
> +#include <plat/fimc.h>
> +
> +int __init s5pv210_fimc_setup_clks(void)
> +{
> +	int err =3D 0;
> +	int i;
> +	struct clk *clk_fimc, *parent;
> +
> +	struct device *fimc_devs[] =3D {
> +		&s5p_device_fimc0.dev,
> +		&s5p_device_fimc1.dev,
> +		&s5p_device_fimc2.dev
> +	};
> +
> +	parent =3D clk_get(NULL, "mout_epll");
> +	if (IS_ERR(parent))
> +		return PTR_ERR(parent);
> +
> +	for (i =3D 0; err =3D=3D 0 && i < ARRAY_SIZE(fimc_devs); i++) {
> +		if (fimc_devs[i]) {
> +			clk_fimc =3D clk_get(fimc_devs[i], "sclk_fimc");
> +			if (IS_ERR(clk_fimc)) {
> +				err =3D PTR_ERR(clk_fimc);

I believe you should clk_put() the clocks that were already clk_get()-e=
d here.

Cheers
> +				break;
> +			}
> +			clk_set_parent(clk_fimc, parent);
> +			clk_put(clk_fimc);
> +		}
> +	}
> +	clk_put(parent);
> +	return err;
> +}
> diff --git a/arch/arm/plat-samsung/include/plat/fimc.h
> b/arch/arm/plat-samsung/include/plat/fimc.h new file mode 100644
> index 0000000..2c06f37
> --- /dev/null
> +++ b/arch/arm/plat-samsung/include/plat/fimc.h
> @@ -0,0 +1,24 @@
> +/*
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * Common FIMC devices definitions and helper functions
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __PLAT_SAMSUNG_FIMC_H
> +#define __PLAT_SAMSUNG_FIMC_H __FILE__
> +
> +/**
> + * s5pv210_fimc_setup_clks() - S5PV210/S5PC110 fimc clocks setup fun=
ction
> + *
> + * Set correct parent clocks on machines which bootloaded did not
> configured + * fimc clocks correctly. FIMC devices works properly onl=
y if
> sourced from + * certain clock sources. "mout_epll" clock is the
> recommended one. + */
> +extern int s5pv210_fimc_setup_clks(void);
> +
> +#endif /* __PLAT_SAMSUNG_FIMC_H */
