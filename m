From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] video: exynos: Add a dependency to the menu
Date: Thu, 8 May 2014 13:41:45 +0300
Message-ID: <536B5F69.9000707@ti.com>
References: <20140408120056.57556a00@endymion.delvare>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="awshFA4KpAKSGuwpgXg39APmAVsLsuoqf"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:33888 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752673AbaEHKmS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 06:42:18 -0400
In-Reply-To: <20140408120056.57556a00@endymion.delvare>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>, linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Kukjin Kim <kgene.kim@samsung.com>

--awshFA4KpAKSGuwpgXg39APmAVsLsuoqf
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 08/04/14 13:00, Jean Delvare wrote:
> All drivers under menu EXYNOS_VIDEO depend on either ARCH_S5PV210 or
> ARCH_EXYNOS, so add these as dependencies to the menu itself. This
> avoids presenting an empty and useless menu on other architectures.
>=20
> Then drivers under the menu only need a dependency if they depend on
> one of the supported architectures specifically.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  drivers/video/exynos/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> --- linux-3.15-rc0.orig/drivers/video/exynos/Kconfig	2014-04-07 10:23:0=
7.316226676 +0200
> +++ linux-3.15-rc0/drivers/video/exynos/Kconfig	2014-04-08 11:50:17.406=
723187 +0200
> @@ -4,6 +4,7 @@
> =20
>  menuconfig EXYNOS_VIDEO
>  	bool "Exynos Video driver support"
> +	depends on ARCH_S5PV210 || ARCH_EXYNOS
>  	help
>  	  This enables support for EXYNOS Video device.
> =20
> @@ -15,7 +16,6 @@ if EXYNOS_VIDEO
> =20
>  config EXYNOS_MIPI_DSI
>  	bool "EXYNOS MIPI DSI driver support."
> -	depends on ARCH_S5PV210 || ARCH_EXYNOS
>  	select GENERIC_PHY
>  	help
>  	  This enables support for MIPI-DSI device.
>=20
>=20

I've applied this for 3.16.

 Tomi



--awshFA4KpAKSGuwpgXg39APmAVsLsuoqf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTa19pAAoJEPo9qoy8lh713hUP/j6Hk+KNCrL+kHgi8TbCBTIG
WXAR02qNOltZZsBZmQfyATxcot8OaVqMuS16Kkf3zSDk/u2KA67JX9HPtg/mSe7l
iLDuT9/uRB5L4HWBHKjsTb8Kkja+Cl8+Gkg0F5sgSStkovEeMiZaJh7hl3xFXgHz
qWvML01FgAHwwsczhlIT3g8E/HQhqCg90mo1zAp9zam8noqpYDIzLzUnAMWOqmyA
yzWNmAUaNkYEpP4x8XgSPN0wTOcSAE+eDSOol2YcvwE5S1fpcoeiKpDzlT9uS/k2
geq7/+hxeCYnsTWSqDYTG36bC4vEoKsooL1u4vnnYVlEajfoK6RZVblKyj6rmMZH
hPm603K3xA79p68ZD1xdGwCNKYJREaicIwVEVCvXOqPi2WbTOEBdRcKQsk25S0/v
9BKyeMH24Tpp/MT6jz5gSlHOkxrKGH5VL4ct6ea8IY40nTJJjxcMQQB3RXCdDD4h
UXM3AwpKqZtFiS3WcrsurgrXyL1wGw43JZS+p36bEBe/akCi6NdnwiFYfn5jCWF9
DK3UxC5GFDYpTmns0dSfHIYvPT5OojiLSx4a8DLH+lcOQ4FJ//C/5r0MvWRg9uk0
RK02BC/JojKI+6MC1Ib/8bgF63b/rnyD9FkA02kk/qGV0YlyAGTx9uM0r0aPY770
IHgLx63RSEEBGGuJCvlS
=vC2s
-----END PGP SIGNATURE-----

--awshFA4KpAKSGuwpgXg39APmAVsLsuoqf--
