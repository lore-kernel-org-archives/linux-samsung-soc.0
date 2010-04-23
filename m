From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH v2.6.34-rc2] s3c: Adds support for banks H and J on S3C244X CPUs
Date: Fri, 23 Apr 2010 09:34:08 +0300
Message-ID: <201004230934.14960.anarsoul@gmail.com>
References: <1269937367-7571-1-git-send-email-chripell@fsfe.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1688819.tOz3ZMA0JK";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:57890 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755412Ab0DWGfV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Apr 2010 02:35:21 -0400
Received: by wyb39 with SMTP id 39so5342405wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Apr 2010 23:35:20 -0700 (PDT)
In-Reply-To: <1269937367-7571-1-git-send-email-chripell@fsfe.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Christian Pellegrin <chripell@fsfe.org>, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

--nextPart1688819.tOz3ZMA0JK
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
30 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2010 11:22:47 =D0=B0=D0=B2=D1=82=D0=BE=D1=
=80 Christian Pellegrin =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> This patch adds support to gpiolib for GPIO bank J present on S3C244X
> CPUs.
>=20
> Signed-off-by: Christian Pellegrin <chripell@fsfe.org>
Tested-by: Vasily Khoruzhick <anarsoul@gmail.com>

> ---
>  arch/arm/mach-s3c2410/include/mach/gpio-nrs.h |    4 ++++
>  arch/arm/mach-s3c2410/include/mach/gpio.h     |    8 ++++++++
>  arch/arm/plat-s3c24xx/gpiolib.c               |   16 +++++++++++++++-
>  3 files changed, 27 insertions(+), 1 deletions(-)
>=20
> diff --git a/arch/arm/mach-s3c2410/include/mach/gpio-nrs.h
> b/arch/arm/mach-s3c2410/include/mach/gpio-nrs.h index 2edbb9c..f1f32e2
> 100644
> --- a/arch/arm/mach-s3c2410/include/mach/gpio-nrs.h
> +++ b/arch/arm/mach-s3c2410/include/mach/gpio-nrs.h
> @@ -24,6 +24,7 @@
>  #define S3C2410_GPIO_BANKF   (32*5)
>  #define S3C2410_GPIO_BANKG   (32*6)
>  #define S3C2410_GPIO_BANKH   (32*7)
> +#define S3C2410_GPIO_BANKJ   (32*8)
>=20
>  /* GPIO bank sizes */
>  #define S3C2410_GPIO_A_NR	(32)
> @@ -34,6 +35,7 @@
>  #define S3C2410_GPIO_F_NR	(32)
>  #define S3C2410_GPIO_G_NR	(32)
>  #define S3C2410_GPIO_H_NR	(32)
> +#define S3C2410_GPIO_J_NR	(32)
>=20
>  #if CONFIG_S3C_GPIO_SPACE !=3D 0
>  #error CONFIG_S3C_GPIO_SPACE cannot be zero at the moment
> @@ -53,6 +55,7 @@ enum s3c_gpio_number {
>  	S3C2410_GPIO_F_START =3D S3C2410_GPIO_NEXT(S3C2410_GPIO_E),
>  	S3C2410_GPIO_G_START =3D S3C2410_GPIO_NEXT(S3C2410_GPIO_F),
>  	S3C2410_GPIO_H_START =3D S3C2410_GPIO_NEXT(S3C2410_GPIO_G),
> +	S3C2410_GPIO_J_START =3D S3C2410_GPIO_NEXT(S3C2410_GPIO_H),
>  };
>=20
>  #endif /* __ASSEMBLY__ */
> @@ -67,6 +70,7 @@ enum s3c_gpio_number {
>  #define S3C2410_GPF(_nr)	(S3C2410_GPIO_F_START + (_nr))
>  #define S3C2410_GPG(_nr)	(S3C2410_GPIO_G_START + (_nr))
>  #define S3C2410_GPH(_nr)	(S3C2410_GPIO_H_START + (_nr))
> +#define S3C2410_GPJ(_nr)	(S3C2410_GPIO_J_START + (_nr))
>=20
>  /* compatibility until drivers can be modified */
>=20
> diff --git a/arch/arm/mach-s3c2410/include/mach/gpio.h
> b/arch/arm/mach-s3c2410/include/mach/gpio.h index 15f0b3e..1528fc7 100644
> --- a/arch/arm/mach-s3c2410/include/mach/gpio.h
> +++ b/arch/arm/mach-s3c2410/include/mach/gpio.h
> @@ -20,10 +20,18 @@
>   * devices that need GPIO.
>   */
>=20
> +#ifdef CONFIG_CPU_S3C244X
> +#define ARCH_NR_GPIOS	(32 * 9 + CONFIG_S3C24XX_GPIO_EXTRA)
> +#else
>  #define ARCH_NR_GPIOS	(256 + CONFIG_S3C24XX_GPIO_EXTRA)
> +#endif
>=20
>  #include <asm-generic/gpio.h>
>  #include <mach/gpio-nrs.h>
>  #include <mach/gpio-fns.h>
>=20
> +#ifdef CONFIG_CPU_S3C244X
> +#define S3C_GPIO_END	(S3C2410_GPIO_BANKJ + 32)
> +#else
>  #define S3C_GPIO_END	(S3C2410_GPIO_BANKH + 32)
> +#endif
> diff --git a/arch/arm/plat-s3c24xx/gpiolib.c
> b/arch/arm/plat-s3c24xx/gpiolib.c index 4f0f11a..0818a6e 100644
> --- a/arch/arm/plat-s3c24xx/gpiolib.c
> +++ b/arch/arm/plat-s3c24xx/gpiolib.c
> @@ -26,6 +26,7 @@
>  #include <plat/pm.h>
>=20
>  #include <mach/regs-gpio.h>
> +#include <mach/regs-gpioj.h>
>=20
>  static int s3c24xx_gpiolib_banka_input(struct gpio_chip *chip, unsigned
> offset) {
> @@ -151,7 +152,8 @@ struct s3c_gpio_chip s3c24xx_gpios[] =3D {
>  			.ngpio			=3D 16,
>  			.to_irq			=3D s3c24xx_gpiolib_bankg_toirq,
>  		},
> -	}, {
> +	},
> +	[7] =3D {
>  		.base	=3D S3C2410_GPHCON,
>  		.pm	=3D __gpio_pm(&s3c_gpio_pm_2bit),
>  		.chip	=3D {
> @@ -161,6 +163,18 @@ struct s3c_gpio_chip s3c24xx_gpios[] =3D {
>  			.ngpio			=3D 11,
>  		},
>  	},
> +#ifdef CONFIG_CPU_S3C244X
> +	[8] =3D {
> +		.base	=3D S3C2440_GPJCON,
> +		.pm	=3D __gpio_pm(&s3c_gpio_pm_2bit),
> +		.chip	=3D {
> +			.base			=3D S3C2410_GPJ(0),
> +			.owner			=3D THIS_MODULE,
> +			.label			=3D "GPIOJ",
> +			.ngpio			=3D 13,
> +		},
> +	},
> +#endif
>  };
>=20
>  static __init int s3c24xx_gpiolib_init(void)

--nextPart1688819.tOz3ZMA0JK
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iEYEABECAAYFAkvRP2YACgkQRM6pQpltKE5szwCgo5abJoV7fPav2PeucIs11HOh
55QAnjqPlbM56fdsz7V5SOMHlrmo+7Gq
=DZ4v
-----END PGP SIGNATURE-----

--nextPart1688819.tOz3ZMA0JK--
