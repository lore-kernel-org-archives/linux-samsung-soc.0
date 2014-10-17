From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/7] regulator: max77802: Add header for operating
 modes
Date: Fri, 17 Oct 2014 10:04:38 +0200
Message-ID: <20141017080438.GE22725@lee--X1>
References: <1413478133-2577-1-git-send-email-javier.martinez@collabora.co.uk>
 <1413478133-2577-5-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1413478133-2577-5-git-send-email-javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 16 Oct 2014, Javier Martinez Canillas wrote:

> Add a header file for the max77802 constants that could be shared bet=
ween
> the regulator driver and Device Tree source files. Also, remove stand=
by
> and off opmodes since only normal and low power are valid operating m=
odes.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8rSCDK34cm6iQ@public.gmane.org=
=2Euk>
> ---
>=20
> Changes since v1: None
>=20
>  drivers/regulator/max77802.c                   |  1 +
>  include/dt-bindings/regulator/maxim,max77802.h | 18 ++++++++++++++++=
++
>  include/linux/mfd/max77686.h                   |  7 -------

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

>  3 files changed, 19 insertions(+), 7 deletions(-)
>  create mode 100644 include/dt-bindings/regulator/maxim,max77802.h
>=20
> diff --git a/drivers/regulator/max77802.c b/drivers/regulator/max7780=
2.c
> index 3abf99d..5839c45 100644
> --- a/drivers/regulator/max77802.c
> +++ b/drivers/regulator/max77802.c
> @@ -33,6 +33,7 @@
>  #include <linux/regulator/of_regulator.h>
>  #include <linux/mfd/max77686.h>
>  #include <linux/mfd/max77686-private.h>
> +#include <dt-bindings/regulator/maxim,max77802.h>
> =20
>  /* Default ramp delay in case it is not manually set */
>  #define MAX77802_RAMP_DELAY		100000		/* uV/us */
> diff --git a/include/dt-bindings/regulator/maxim,max77802.h b/include=
/dt-bindings/regulator/maxim,max77802.h
> new file mode 100644
> index 0000000..cf28631
> --- /dev/null
> +++ b/include/dt-bindings/regulator/maxim,max77802.h
> @@ -0,0 +1,18 @@
> +/*
> + * Copyright (C) 2014 Google, Inc
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * Device Tree binding constants for the Maxim 77802 PMIC regulators
> + */
> +
> +#ifndef _DT_BINDINGS_REGULATOR_MAXIM_MAX77802_H
> +#define _DT_BINDINGS_REGULATOR_MAXIM_MAX77802_H
> +
> +/* Regulator operating modes */
> +#define MAX77802_OPMODE_LP	1
> +#define MAX77802_OPMODE_NORMAL	3
> +
> +#endif /* _DT_BINDINGS_REGULATOR_MAXIM_MAX77802_H */
> diff --git a/include/linux/mfd/max77686.h b/include/linux/mfd/max7768=
6.h
> index 7e6dc4b..553f7d0 100644
> --- a/include/linux/mfd/max77686.h
> +++ b/include/linux/mfd/max77686.h
> @@ -131,13 +131,6 @@ enum max77686_opmode {
>  	MAX77686_OPMODE_STANDBY,
>  };
> =20
> -enum max77802_opmode {
> -	MAX77802_OPMODE_OFF,
> -	MAX77802_OPMODE_STANDBY,
> -	MAX77802_OPMODE_LP,
> -	MAX77802_OPMODE_NORMAL,
> -};
> -
>  struct max77686_opmode_data {
>  	int id;
>  	int mode;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
