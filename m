From: =?utf-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Subject: Re: [PATCH] hwrng: Use device-managed registration API
Date: Thu, 25 Jul 2019 10:25:53 +0200
Message-ID: <87wog6frla.fsf%l.stelmach@samsung.com>
References: <20190725080155.19875-1-hslester96@gmail.com>
        <CGME20190725082603eucas1p205a74e93ec8ce40a1decf9cefcaa970c@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725080155.19875-1-hslester96@gmail.com> (Chuhong Yuan's
        message of "Thu, 25 Jul 2019 16:01:55 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Chuhong Yuan <hslester96@gmail.com>
Cc: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Deepak Saxena <dsaxena@plexity.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Patrice Chotard <patrice.chotard@st.com>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2019-07-25 czw 10:01>, when Chuhong Yuan wrote:
> Use devm_hwrng_register to simplify the implementation.
> Manual unregistration and some remove functions can be
> removed now.
>
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/char/hw_random/atmel-rng.c     |  3 +--
>  drivers/char/hw_random/cavium-rng-vf.c | 11 +----------
>  drivers/char/hw_random/exynos-trng.c   |  3 +--
>  drivers/char/hw_random/n2-drv.c        |  4 +---
>  drivers/char/hw_random/nomadik-rng.c   |  3 +--
>  drivers/char/hw_random/omap-rng.c      |  3 +--
>  drivers/char/hw_random/powernv-rng.c   | 10 +---------
>  drivers/char/hw_random/st-rng.c        |  4 +---
>  drivers/char/hw_random/xgene-rng.c     |  4 +---
>  9 files changed, 9 insertions(+), 36 deletions(-)
>

Acked-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>

> diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/=
atmel-rng.c
> index 433426242b87..e55705745d5e 100644
> --- a/drivers/char/hw_random/atmel-rng.c
> +++ b/drivers/char/hw_random/atmel-rng.c
> @@ -86,7 +86,7 @@ static int atmel_trng_probe(struct platform_device *pde=
v)
>  	trng->rng.name =3D pdev->name;
>  	trng->rng.read =3D atmel_trng_read;
>=20=20
> -	ret =3D hwrng_register(&trng->rng);
> +	ret =3D devm_hwrng_register(&pdev->dev, &trng->rng);
>  	if (ret)
>  		goto err_register;
>=20=20
> @@ -103,7 +103,6 @@ static int atmel_trng_remove(struct platform_device *=
pdev)
>  {
>  	struct atmel_trng *trng =3D platform_get_drvdata(pdev);
>=20=20
> -	hwrng_unregister(&trng->rng);
>=20=20
>  	atmel_trng_disable(trng);
>  	clk_disable_unprepare(trng->clk);
> diff --git a/drivers/char/hw_random/cavium-rng-vf.c b/drivers/char/hw_ran=
dom/cavium-rng-vf.c
> index 2d1352b67168..3de4a6a443ef 100644
> --- a/drivers/char/hw_random/cavium-rng-vf.c
> +++ b/drivers/char/hw_random/cavium-rng-vf.c
> @@ -67,7 +67,7 @@ static int cavium_rng_probe_vf(struct	pci_dev		*pdev,
>=20=20
>  	pci_set_drvdata(pdev, rng);
>=20=20
> -	ret =3D hwrng_register(&rng->ops);
> +	ret =3D devm_hwrng_register(&pdev->dev, &rng->ops);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Error registering device as HWRNG.\n");
>  		return ret;
> @@ -76,14 +76,6 @@ static int cavium_rng_probe_vf(struct	pci_dev		*pdev,
>  	return 0;
>  }
>=20=20
> -/* Remove the VF */
> -static void  cavium_rng_remove_vf(struct pci_dev *pdev)
> -{
> -	struct cavium_rng *rng;
> -
> -	rng =3D pci_get_drvdata(pdev);
> -	hwrng_unregister(&rng->ops);
> -}
>=20=20
>  static const struct pci_device_id cavium_rng_vf_id_table[] =3D {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_CAVIUM, 0xa033), 0, 0, 0},
> @@ -95,7 +87,6 @@ static struct pci_driver cavium_rng_vf_driver =3D {
>  	.name		=3D "cavium_rng_vf",
>  	.id_table	=3D cavium_rng_vf_id_table,
>  	.probe		=3D cavium_rng_probe_vf,
> -	.remove		=3D cavium_rng_remove_vf,
>  };
>  module_pci_driver(cavium_rng_vf_driver);
>=20=20
> diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_rando=
m/exynos-trng.c
> index 94235761955c..b4b52ab23b6b 100644
> --- a/drivers/char/hw_random/exynos-trng.c
> +++ b/drivers/char/hw_random/exynos-trng.c
> @@ -153,7 +153,7 @@ static int exynos_trng_probe(struct platform_device *=
pdev)
>  		goto err_clock;
>  	}
>=20=20
> -	ret =3D hwrng_register(&trng->rng);
> +	ret =3D devm_hwrng_register(&pdev->dev, &trng->rng);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Could not register hwrng device.\n");
>  		goto err_register;
> @@ -179,7 +179,6 @@ static int exynos_trng_remove(struct platform_device =
*pdev)
>  {
>  	struct exynos_trng_dev *trng =3D  platform_get_drvdata(pdev);
>=20=20
> -	hwrng_unregister(&trng->rng);
>  	clk_disable_unprepare(trng->clk);
>=20=20
>  	pm_runtime_put_sync(&pdev->dev);
> diff --git a/drivers/char/hw_random/n2-drv.c b/drivers/char/hw_random/n2-=
drv.c
> index d4cab105796f..2d256b3470db 100644
> --- a/drivers/char/hw_random/n2-drv.c
> +++ b/drivers/char/hw_random/n2-drv.c
> @@ -768,7 +768,7 @@ static int n2rng_probe(struct platform_device *op)
>  	np->hwrng.data_read =3D n2rng_data_read;
>  	np->hwrng.priv =3D (unsigned long) np;
>=20=20
> -	err =3D hwrng_register(&np->hwrng);
> +	err =3D devm_hwrng_register(&pdev->dev, &np->hwrng);
>  	if (err)
>  		goto out_hvapi_unregister;
>=20=20
> @@ -793,8 +793,6 @@ static int n2rng_remove(struct platform_device *op)
>=20=20
>  	cancel_delayed_work_sync(&np->work);
>=20=20
> -	hwrng_unregister(&np->hwrng);
> -
>  	sun4v_hvapi_unregister(HV_GRP_RNG);
>=20=20
>  	return 0;
> diff --git a/drivers/char/hw_random/nomadik-rng.c b/drivers/char/hw_rando=
m/nomadik-rng.c
> index fc0f6b0cb80d..74ed29f42e4f 100644
> --- a/drivers/char/hw_random/nomadik-rng.c
> +++ b/drivers/char/hw_random/nomadik-rng.c
> @@ -57,7 +57,7 @@ static int nmk_rng_probe(struct amba_device *dev, const=
 struct amba_id *id)
>  	if (!base)
>  		goto out_release;
>  	nmk_rng.priv =3D (unsigned long)base;
> -	ret =3D hwrng_register(&nmk_rng);
> +	ret =3D devm_hwrng_register(&dev->dev, &nmk_rng);
>  	if (ret)
>  		goto out_release;
>  	return 0;
> @@ -71,7 +71,6 @@ static int nmk_rng_probe(struct amba_device *dev, const=
 struct amba_id *id)
>=20=20
>  static int nmk_rng_remove(struct amba_device *dev)
>  {
> -	hwrng_unregister(&nmk_rng);
>  	amba_release_regions(dev);
>  	clk_disable(rng_clk);
>  	return 0;
> diff --git a/drivers/char/hw_random/omap-rng.c b/drivers/char/hw_random/o=
map-rng.c
> index e9b6ac61fb7f..b27f39688b5e 100644
> --- a/drivers/char/hw_random/omap-rng.c
> +++ b/drivers/char/hw_random/omap-rng.c
> @@ -500,7 +500,7 @@ static int omap_rng_probe(struct platform_device *pde=
v)
>  	if (ret)
>  		goto err_register;
>=20=20
> -	ret =3D hwrng_register(&priv->rng);
> +	ret =3D devm_hwrng_register(&pdev->dev, &priv->rng);
>  	if (ret)
>  		goto err_register;
>=20=20
> @@ -525,7 +525,6 @@ static int omap_rng_remove(struct platform_device *pd=
ev)
>  {
>  	struct omap_rng_dev *priv =3D platform_get_drvdata(pdev);
>=20=20
> -	hwrng_unregister(&priv->rng);
>=20=20
>  	priv->pdata->cleanup(priv);
>=20=20
> diff --git a/drivers/char/hw_random/powernv-rng.c b/drivers/char/hw_rando=
m/powernv-rng.c
> index f2e8272e276a..8da1d7917bdc 100644
> --- a/drivers/char/hw_random/powernv-rng.c
> +++ b/drivers/char/hw_random/powernv-rng.c
> @@ -33,18 +33,11 @@ static struct hwrng powernv_hwrng =3D {
>  	.read =3D powernv_rng_read,
>  };
>=20=20
> -static int powernv_rng_remove(struct platform_device *pdev)
> -{
> -	hwrng_unregister(&powernv_hwrng);
> -
> -	return 0;
> -}
> -
>  static int powernv_rng_probe(struct platform_device *pdev)
>  {
>  	int rc;
>=20=20
> -	rc =3D hwrng_register(&powernv_hwrng);
> +	rc =3D devm_hwrng_register(&pdev->dev, &powernv_hwrng);
>  	if (rc) {
>  		/* We only register one device, ignore any others */
>  		if (rc =3D=3D -EEXIST)
> @@ -70,7 +63,6 @@ static struct platform_driver powernv_rng_driver =3D {
>  		.of_match_table =3D powernv_rng_match,
>  	},
>  	.probe	=3D powernv_rng_probe,
> -	.remove =3D powernv_rng_remove,
>  };
>  module_platform_driver(powernv_rng_driver);
>=20=20
> diff --git a/drivers/char/hw_random/st-rng.c b/drivers/char/hw_random/st-=
rng.c
> index bd6a98b3479b..863448360a7d 100644
> --- a/drivers/char/hw_random/st-rng.c
> +++ b/drivers/char/hw_random/st-rng.c
> @@ -102,7 +102,7 @@ static int st_rng_probe(struct platform_device *pdev)
>=20=20
>  	dev_set_drvdata(&pdev->dev, ddata);
>=20=20
> -	ret =3D hwrng_register(&ddata->ops);
> +	ret =3D devm_hwrng_register(&pdev->dev, &ddata->ops);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to register HW RNG\n");
>  		clk_disable_unprepare(clk);
> @@ -118,8 +118,6 @@ static int st_rng_remove(struct platform_device *pdev)
>  {
>  	struct st_rng_data *ddata =3D dev_get_drvdata(&pdev->dev);
>=20=20
> -	hwrng_unregister(&ddata->ops);
> -
>  	clk_disable_unprepare(ddata->clk);
>=20=20
>  	return 0;
> diff --git a/drivers/char/hw_random/xgene-rng.c b/drivers/char/hw_random/=
xgene-rng.c
> index 8c6f9f63da5e..7e568db87ae2 100644
> --- a/drivers/char/hw_random/xgene-rng.c
> +++ b/drivers/char/hw_random/xgene-rng.c
> @@ -361,7 +361,7 @@ static int xgene_rng_probe(struct platform_device *pd=
ev)
>=20=20
>  	xgene_rng_func.priv =3D (unsigned long) ctx;
>=20=20
> -	rc =3D hwrng_register(&xgene_rng_func);
> +	rc =3D devm_hwrng_register(&pdev->dev, &xgene_rng_func);
>  	if (rc) {
>  		dev_err(&pdev->dev, "RNG registering failed error %d\n", rc);
>  		if (!IS_ERR(ctx->clk))
> @@ -375,7 +375,6 @@ static int xgene_rng_probe(struct platform_device *pd=
ev)
>  			rc);
>  		if (!IS_ERR(ctx->clk))
>  			clk_disable_unprepare(ctx->clk);
> -		hwrng_unregister(&xgene_rng_func);
>  		return rc;
>  	}
>=20=20
> @@ -392,7 +391,6 @@ static int xgene_rng_remove(struct platform_device *p=
dev)
>  		dev_err(&pdev->dev, "RNG init wakeup failed error %d\n", rc);
>  	if (!IS_ERR(ctx->clk))
>  		clk_disable_unprepare(ctx->clk);
> -	hwrng_unregister(&xgene_rng_func);
>=20=20
>  	return rc;
>  }

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAl05Z5EACgkQsK4enJil
gBDC6wf/RWrFrZa1K0vXQRunm4a/T6+9qOAeK+CilFvhwUfFtc1mhpquqEVSbQYG
Y+r7c5pxZd+JvU5rxPTBelL60GQ1AJd5XKgvKblDiEjXonol8s9Snf2vc6vL0CFp
FCuSxpnvQ3HTKJ16s71HURJxxqdAM3BVFZxod5XPVctNSqVAMM1QhIy29D2ivg/n
UP4pBt5nCY0mzfNJ3OHz1ui6q99ZXMcUT6yzXKhUP/UpHXRjS/XUeXMMub8x6Wpl
SieqaH2+KmufGidxswOQh/aZ3YszzBqsfTOeJTFYQgQbsckAkVVtafoxNk0upNeT
Qqad3s8ystS/i+gUDKSb9C13UDEgRA==
=+zqR
-----END PGP SIGNATURE-----
--=-=-=--
