From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH v2.6.34-rc2] s3c: Fix GPIOs bank H and J not being preserved during suspend on S3C24XX
Date: Fri, 23 Apr 2010 09:33:08 +0300
Message-ID: <201004230933.21902.anarsoul@gmail.com>
References: <1269937386-7597-1-git-send-email-chripell@fsfe.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2112241.qRs2GelQa0";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:40250 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753629Ab0DWGe3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Apr 2010 02:34:29 -0400
Received: by wwb24 with SMTP id 24so5360779wwb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Apr 2010 23:34:28 -0700 (PDT)
In-Reply-To: <1269937386-7597-1-git-send-email-chripell@fsfe.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Christian Pellegrin <chripell@fsfe.org>, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

--nextPart2112241.qRs2GelQa0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
30 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2010 11:23:06 =D0=B0=D0=B2=D1=82=D0=BE=D1=
=80 Christian Pellegrin =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> With this patch the platform-specific define for the last defined GPIO
> on S3C machines is used instead of a hard-coded value (which is right
> only for the s3c2410). The gpio_nr being incremented by 1 too much (look
> for the gpio_nr++ in the for instruction) is fixed too although it
> doesn't make any trouble on current S3C implementations.
>=20
> Signed-off-by: Christian Pellegrin <chripell@fsfe.org>
Tested-by: Vasily Khoruzhick <anarsoul@gmail.com>

> ---
>  arch/arm/mach-s3c2410/include/mach/gpio-track.h |    2 +-
>  arch/arm/plat-samsung/pm-gpio.c                 |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/mach-s3c2410/include/mach/gpio-track.h
> b/arch/arm/mach-s3c2410/include/mach/gpio-track.h index acb2591..6371eaa
> 100644
> --- a/arch/arm/mach-s3c2410/include/mach/gpio-track.h
> +++ b/arch/arm/mach-s3c2410/include/mach/gpio-track.h
> @@ -23,7 +23,7 @@ static inline struct s3c_gpio_chip
> *s3c_gpiolib_getchip(unsigned int pin) {
>  	struct s3c_gpio_chip *chip;
>=20
> -	if (pin > S3C2410_GPG(10))
> +	if (pin > S3C_GPIO_END)
>  		return NULL;
>=20
>  	chip =3D &s3c24xx_gpios[pin/32];
> diff --git a/arch/arm/plat-samsung/pm-gpio.c
> b/arch/arm/plat-samsung/pm-gpio.c index 69a4c7f..1aac746 100644
> --- a/arch/arm/plat-samsung/pm-gpio.c
> +++ b/arch/arm/plat-samsung/pm-gpio.c
> @@ -343,7 +343,7 @@ void s3c_pm_save_gpios(void)
>  			  ourchip->pm_save[2],
>  			  ourchip->pm_save[3]);
>=20
> -		gpio_nr +=3D ourchip->chip.ngpio;
> +		gpio_nr +=3D ourchip->chip.ngpio - 1;
>  		gpio_nr +=3D CONFIG_S3C_GPIO_SPACE;
>  	}
>  }

--nextPart2112241.qRs2GelQa0
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iEYEABECAAYFAkvRPzEACgkQRM6pQpltKE5OGwCg44MRaO6Qb1i1fbu7vBoDhX/L
xewAoNEY1U4Yyk2DJ/282h7tAaBMRqGn
=NkHs
-----END PGP SIGNATURE-----

--nextPart2112241.qRs2GelQa0--
