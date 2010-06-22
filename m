From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 1/4] ARM: S3C24XX: Fix gpiolib support for ports K..M
Date: Tue, 22 Jun 2010 16:40:13 +0300
Message-ID: <201006221640.26196.anarsoul@gmail.com>
References: <1277212585-25605-1-git-send-email-jekhor@gmail.com> <1277212585-25605-2-git-send-email-jekhor@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart20942788.RbR9fFmOtr";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:36576 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754805Ab0FVNkd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jun 2010 09:40:33 -0400
Received: by fxm10 with SMTP id 10so2423607fxm.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jun 2010 06:40:31 -0700 (PDT)
In-Reply-To: <1277212585-25605-2-git-send-email-jekhor@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Darius Augulis <augulis.darius@gmail.com>

--nextPart20942788.RbR9fFmOtr
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
22 =D0=B8=D1=8E=D0=BD=D1=8F 2010 16:16:22 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Ya=
uhen Kharuzhy =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> S3C2443 and S3C2416 has 12 GPIO banks (from A to M), increase
> ARCH_NR_GPIOS for this architectures.
>=20
> Also typo from previous commit has been fixed: CONFIG_CPU_S3C24XX
> instead CONFIG_CPU_244X.
>=20
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>

Tested-by: Vasily Khoruzhick <anarsoul@gmail.com>

> ---
>  arch/arm/mach-s3c2410/include/mach/gpio.h |   10 +++++++---
>  1 files changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/mach-s3c2410/include/mach/gpio.h
> b/arch/arm/mach-s3c2410/include/mach/gpio.h index b649bf2..f7f6b07 100644
> --- a/arch/arm/mach-s3c2410/include/mach/gpio.h
> +++ b/arch/arm/mach-s3c2410/include/mach/gpio.h
> @@ -22,6 +22,8 @@
>=20
>  #ifdef CONFIG_CPU_S3C244X
>  #define ARCH_NR_GPIOS	(32 * 9 + CONFIG_S3C24XX_GPIO_EXTRA)
> +#elif defined(CONFIG_CPU_S3C2443) || defined(CONFIG_CPU_S3C2416)
> +#define ARCH_NR_GPIOS	(32 * 12 + CONFIG_S3C24XX_GPIO_EXTRA)
>  #else
>  #define ARCH_NR_GPIOS	(256 + CONFIG_S3C24XX_GPIO_EXTRA)
>  #endif
> @@ -30,8 +32,10 @@
>  #include <mach/gpio-nrs.h>
>  #include <mach/gpio-fns.h>
>=20
> -#ifdef CONFIG_CPU_S3C24XX
> -#define S3C_GPIO_END	(S3C2410_GPIO_BANKJ + 32)
> +#ifdef CONFIG_CPU_S3C244X
> +#define S3C_GPIO_END	(S3C2410_GPJ(0) + 32)
> +#elif defined(CONFIG_CPU_S3C2443) || defined(CONFIG_CPU_S3C2416)
> +#define S3C_GPIO_END	(S3C2410_GPM(0) + 32)
>  #else
> -#define S3C_GPIO_END	(S3C2410_GPIO_BANKH + 32)
> +#define S3C_GPIO_END	(S3C2410_GPH(0) + 32)
>  #endif

--nextPart20942788.RbR9fFmOtr
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iEYEABECAAYFAkwgvUoACgkQRM6pQpltKE7fFgCaAtRPcxEV3l6rzeNYQXi3UsX/
L5YAnjlZYrbFmsx8d5nsIWIMhEv9bH+h
=bCNw
-----END PGP SIGNATURE-----

--nextPart20942788.RbR9fFmOtr--
