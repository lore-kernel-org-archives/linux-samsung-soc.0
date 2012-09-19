From: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH] video: drm: Add match table for drm platform device
Date: Wed, 19 Sep 2012 10:18:23 +0200
Message-ID: <1348042703.4196.7.camel@mattotaupa>
References: <1347993341-11340-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-TRpuXbRcK3y8yKnwJHni"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.gw90.de ([188.40.100.199]:46800 "EHLO mail.gw90.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751908Ab2ISISj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Sep 2012 04:18:39 -0400
In-Reply-To: <1347993341-11340-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, jg1.han@samsung.com, linux-samsung-soc@vger.kernel.org


--=-TRpuXbRcK3y8yKnwJHni
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Leela,


thank you for your patch.


Am Mittwoch, den 19.09.2012, 00:05 +0530 schrieb Leela Krishna Amudala:
> This patch adds match table for drm platform device.

Please drop that line as it is the same as in the subject line.

It would be better,

1. if you explain for what this will be used,
2. if this can be tested somehow,
3. if this fixes a bug,
4. why CONFIG_OF is needed.

> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.c
> index d070719..18abdcc 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -294,12 +294,21 @@ static int exynos_drm_platform_remove(struct platfo=
rm_device *pdev)
>  	return 0;
>  }
> =20
> +#ifdef CONFIG_OF
> +static const struct of_device_id drm_device_dt_match[] =3D {
> +	{ .compatible =3D "samsung,exynos-drm-device"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, drm_device_dt_match);
> +#endif
> +
>  static struct platform_driver exynos_drm_platform_driver =3D {
>  	.probe		=3D exynos_drm_platform_probe,
>  	.remove		=3D __devexit_p(exynos_drm_platform_remove),
>  	.driver		=3D {
>  		.owner	=3D THIS_MODULE,
>  		.name	=3D "exynos-drm",
> +		.of_match_table =3D of_match_ptr(drm_device_dt_match),
>  	},
>  };


Thanks,

Paul

--=-TRpuXbRcK3y8yKnwJHni
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAlBZf88ACgkQPX1aK2wOHVgFNQCfZx21K5beWct6Dn4oVRcXd9E0
nOkAoIzFJjcqQx3fjlOohs5VpUVuJNd1
=Vnan
-----END PGP SIGNATURE-----

--=-TRpuXbRcK3y8yKnwJHni--
