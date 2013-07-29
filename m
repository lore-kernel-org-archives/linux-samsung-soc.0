From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 12/20] pwm: samsung: Rename to pwm-samsung-legacy
Date: Mon, 29 Jul 2013 13:44:38 +0200
Message-ID: <20130729114437.GB23152@manwe>
References: <1374278673-25615-1-git-send-email-tomasz.figa@gmail.com>
 <1374278673-25615-14-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f54.google.com ([209.85.214.54]:44108 "EHLO
	mail-bk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753238Ab3G2Lol (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jul 2013 07:44:41 -0400
Content-Disposition: inline
In-Reply-To: <1374278673-25615-14-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>


--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 20, 2013 at 02:04:25AM +0200, Tomasz Figa wrote:
> This patch renames the old pwm-samsung driver to pwm-samsung-legacy to
> create place for the new, rewritten, DT-aware pwm-samsung driver using
> Samsung PWM/timer master driver.
>=20
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  drivers/pwm/Makefile                                | 2 +-
>  drivers/pwm/{pwm-samsung.c =3D> pwm-samsung-legacy.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename drivers/pwm/{pwm-samsung.c =3D> pwm-samsung-legacy.c} (100%)

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR9lWlAAoJEN0jrNd/PrOh60gP/Ai6JOwxgCAzGMsbiMVkgx6y
YaRKqMiHTe1O2BZ/Vtkc5nvMelAjFdbBP0Xa99ZAkc4hkTNQhZ8ypTdYT0oF7alb
/np/yYvzA/VuhJc19vueNYbW63VLYQgqY/v/4q7YMFjzJi2pPuQpCKwdToz929Nc
m7653IZR+YicEo4QFMW+zieEYRj3Gd4C0kyQB1TItmRhBOtfwCxVk4SHPsPSzCAx
gaNYEtRV9X9cmNK2o7p/J6SQGNZ4ethogtSo8gt2UeizJPcgV2/myicJ30Ztapjg
3e80F6jJFmosBbWKIfnlpQR+8aPCAYxxJYIGMoiIT0YduG4u/CCsHcuVb5F3LotJ
s7VFh2vY2TyBsGBrStYH3B8g3NqE+gBU38sN0SHndoslqNNNHVJC3dMtICHvefmk
CtpdrzdrSp1SLr7RbqrpW1NkULRJPjmv52yTv6KRfYRAjo9BAfh7k5tCUWMkBw9m
paay2iNOtvDgfSW5gIWu2SQXccWQ17cJ7GC0OQxW1SQNmyRKgVgs6d14CckzI2bz
fBS8GbpFBP7mp/v+2vr3Z5ZADRAGJJYd6PLJQC7duXUnW2y06MinYAs5hVrO1bcp
7aXgkIXCSM9tKT6xa0c/LIVNAyI8Jy0zw52GTi4fa/g6XeToT62uYSiyYuuukLX1
YTc2vbwkHc+fKohp5OOw
=mPnJ
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
