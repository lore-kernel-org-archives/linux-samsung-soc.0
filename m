From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: S3C24XX: Fix configuration of gpio port sizes on S3C24XX.
Date: Wed, 11 Sep 2013 18:27:39 +0200
Message-ID: <201309111827.39981.heiko@sntech.de>
References: <1378889173-7437-1-git-send-email-jose.goncalves@inov.pt>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:39310 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755109Ab3IKQ1Z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Sep 2013 12:27:25 -0400
In-Reply-To: <1378889173-7437-1-git-send-email-jose.goncalves@inov.pt>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?q?Jos=C3=A9_Miguel_Gon=C3=A7alves?= <jose.goncalves@inov.pt>
Cc: linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Am Mittwoch, 11. September 2013, 10:46:13 schrieb Jos=C3=A9 Miguel Gon=C3=
=A7alves:
> Some GPIO line limits are incorrectly set which, for instance,
> does not allow nRTS1 (GPH11) configuration on a S3C2416 chip.
>=20
> Signed-off-by: Jos=C3=A9 Miguel Gon=C3=A7alves <jose.goncalves@inov.p=
t>

I thumbed thru the SoC manuals of s3c2410, s3c2416, s3c2440 and s3c2443=
 and=20
these number look correct.

It would be interesting to know where the old number 16 for GPIOB did c=
ome=20
from, as _all_ S3C SoCs only have the 11 pins in this bank.


Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> ---
>  arch/arm/mach-s3c24xx/include/mach/gpio.h |   10 +++++-----
>  drivers/gpio/gpio-samsung.c               |    6 +++---
>  2 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/arm/mach-s3c24xx/include/mach/gpio.h
> b/arch/arm/mach-s3c24xx/include/mach/gpio.h index 1459156..a1435bc 10=
0644
> --- a/arch/arm/mach-s3c24xx/include/mach/gpio.h
> +++ b/arch/arm/mach-s3c24xx/include/mach/gpio.h
> @@ -31,17 +31,17 @@
>   *   2410 2412 2440 2443 2416
>   *             2442
>   *   ---- ---- ---- ---- ----
> - * A  23   22   25   16   25
> - * B  11   11   11   11   9
> - * C  16   15   16   16   16
> + * A  23   22   25   16   27
> + * B  11   11   11   11   11
> + * C  16   16   16   16   16
>   * D  16   16   16   16   16
>   * E  16   16   16   16   16
>   * F  8    8    8    8    8
>   * G  16   16   16   16   8
> - * H  11   11   9    15   15
> + * H  11   11   11   15   15
>   * J  --   --   13   16   --
>   * K  --   --   --   --   16
> - * L  --   --   --   15   7
> + * L  --   --   --   15   14
>   * M  --   --   --   2    2
>   */
>=20
> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.=
c
> index 358a21c..29c428b 100644
> --- a/drivers/gpio/gpio-samsung.c
> +++ b/drivers/gpio/gpio-samsung.c
> @@ -1053,7 +1053,7 @@ struct samsung_gpio_chip s3c24xx_gpios[] =3D {
>  			.base			=3D S3C2410_GPA(0),
>  			.owner			=3D THIS_MODULE,
>  			.label			=3D "GPIOA",
> -			.ngpio			=3D 24,
> +			.ngpio			=3D 27,
>  			.direction_input	=3D s3c24xx_gpiolib_banka_input,
>  			.direction_output	=3D s3c24xx_gpiolib_banka_output,
>  		},
> @@ -1062,7 +1062,7 @@ struct samsung_gpio_chip s3c24xx_gpios[] =3D {
>  			.base	=3D S3C2410_GPB(0),
>  			.owner	=3D THIS_MODULE,
>  			.label	=3D "GPIOB",
> -			.ngpio	=3D 16,
> +			.ngpio	=3D 11,
>  		},
>  	}, {
>  		.chip	=3D {
> @@ -1107,7 +1107,7 @@ struct samsung_gpio_chip s3c24xx_gpios[] =3D {
>  			.base	=3D S3C2410_GPH(0),
>  			.owner	=3D THIS_MODULE,
>  			.label	=3D "GPIOH",
> -			.ngpio	=3D 11,
> +			.ngpio	=3D 15,
>  		},
>  	},
>  		/* GPIOS for the S3C2443 and later devices. */
