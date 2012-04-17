From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/3] i2c-s3c2410: Rework device type handling
Date: Tue, 17 Apr 2012 19:31:36 +0200
Message-ID: <20120417173136.GB22406@pengutronix.de>
References: <1332357113-2973-1-git-send-email-k.lewandowsk@samsung.com>
 <1332357113-2973-3-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6419583066895409022=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1332357113-2973-3-git-send-email-k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============6419583066895409022==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 21, 2012 at 08:11:52PM +0100, Karol Lewandowski wrote:
> Reorganize driver a bit to better handle device tree-based systems:
>=20
>  - move machine type to driver's private structure instead of
>    quering platform device variants in runtime
>=20
>  - replace s3c24xx_i2c_type enum with unsigned int that holds
>    bitmask with revision-specific quirks
>=20
> Signed-off-by: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Okay, so this driver needs to the 'data' field from either
platform_device_id or of_device_id and implements a function for that,
namely s3c24xx_get_device_quirks(). Grant, Rob: I'd think there might be
more drivers in need of that, so maybe it makes sense to have a generic
of-helper function?

> ---
>  drivers/i2c/busses/i2c-s3c2410.c |   47 ++++++++++++++++++--------------=
-----
>  1 files changed, 23 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3=
c2410.c
> index 85e3664..f7b6a14 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -44,8 +44,14 @@
>  #include <plat/regs-iic.h>
>  #include <plat/iic.h>
> =20
> -/* i2c controller state */
> +#ifdef CONFIG_OF
> +static const struct of_device_id s3c24xx_i2c_match[];
> +#endif

Uh, forward declaration with #ifdef. I'd think we should get this simply
to the front.

>  dd
> +/* Treat S3C2410 as baseline hardware, anything else is supported via qu=
irks */
> +#define QUIRK_S3C2440		(1 << 0)

Minor: Is it really a quirk being s3c2440? Maybe FLAG_*, dunno.

> +
> +/* i2c controller state */
>  enum s3c24xx_i2c_state {
>  	STATE_IDLE,
>  	STATE_START,
> @@ -54,14 +60,10 @@ enum s3c24xx_i2c_state {
>  	STATE_STOP
>  };
> =20
> -enum s3c24xx_i2c_type {
> -	TYPE_S3C2410,
> -	TYPE_S3C2440,
> -};
> -
>  struct s3c24xx_i2c {
>  	spinlock_t		lock;
>  	wait_queue_head_t	wait;
> +	unsigned int            quirks;
>  	unsigned int		suspended:1;
> =20
>  	struct i2c_msg		*msg;
> @@ -88,26 +90,22 @@ struct s3c24xx_i2c {
>  #endif
>  };
> =20
> -/* default platform data removed, dev should always carry data. */
> -
> -/* s3c24xx_i2c_is2440()
> +/* s3c24xx_get_device_quirks
>   *
> - * return true is this is an s3c2440
> + * Get controller type either from device tree or platform device varian=
t.
>  */
> =20
> -static inline int s3c24xx_i2c_is2440(struct s3c24xx_i2c *i2c)
> +static inline unsigned int s3c24xx_get_device_quirks(struct platform_dev=
ice *pdev)
>  {
> -	struct platform_device *pdev =3D to_platform_device(i2c->dev);
> -	enum s3c24xx_i2c_type type;
> -
>  #ifdef CONFIG_OF
> -	if (i2c->dev->of_node)
> -		return of_device_is_compatible(i2c->dev->of_node,
> -				"samsung,s3c2440-i2c");
> +        if (pdev->dev.of_node) {
> +		const struct of_device_id *match;
> +		match =3D of_match_node(&s3c24xx_i2c_match[0], pdev->dev.of_node);

Minor: I think it is more readable to drop the [0]

> +		return (unsigned int)match->data;
> +        }
>  #endif
> =20
> -	type =3D platform_get_device_id(pdev)->driver_data;
> -	return type =3D=3D TYPE_S3C2440;
> +	return platform_get_device_id(pdev)->driver_data;
>  }
> =20
>  /* s3c24xx_i2c_master_complete
> @@ -676,7 +674,7 @@ static int s3c24xx_i2c_clockrate(struct s3c24xx_i2c *=
i2c, unsigned int *got)
> =20
>  	writel(iiccon, i2c->regs + S3C2410_IICCON);
> =20
> -	if (s3c24xx_i2c_is2440(i2c)) {
> +	if (i2c->quirks & QUIRK_S3C2440) {
>  		unsigned long sda_delay;
> =20
>  		if (pdata->sda_delay) {
> @@ -906,6 +904,7 @@ static int s3c24xx_i2c_probe(struct platform_device *=
pdev)
>  		goto err_noclk;
>  	}
> =20
> +	i2c->quirks =3D s3c24xx_get_device_quirks(pdev);
>  	if (pdata)
>  		memcpy(i2c->pdata, pdata, sizeof(*pdata));
>  	else
> @@ -1113,18 +1112,18 @@ static const struct dev_pm_ops s3c24xx_i2c_dev_pm=
_ops =3D {
>  static struct platform_device_id s3c24xx_driver_ids[] =3D {
>  	{
>  		.name		=3D "s3c2410-i2c",
> -		.driver_data	=3D TYPE_S3C2410,
> +		.driver_data	=3D 0,
>  	}, {
>  		.name		=3D "s3c2440-i2c",
> -		.driver_data	=3D TYPE_S3C2440,
> +		.driver_data	=3D QUIRK_S3C2440,
>  	}, { },
>  };
>  MODULE_DEVICE_TABLE(platform, s3c24xx_driver_ids);
> =20
>  #ifdef CONFIG_OF
>  static const struct of_device_id s3c24xx_i2c_match[] =3D {
> -	{ .compatible =3D "samsung,s3c2410-i2c" },
> -	{ .compatible =3D "samsung,s3c2440-i2c" },
> +	{ .compatible =3D "samsung,s3c2410-i2c", .data =3D (void *)0 },
> +	{ .compatible =3D "samsung,s3c2440-i2c", .data =3D (void *)QUIRK_S3C244=
0 },

Hmm, the need to sepcify the quirks twice may lead to only one instance
being updated in future patches, but I don't see a way around that,
currently :(

>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, s3c24xx_i2c_match);
> --=20
> 1.7.9
>=20

Thanks,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk+NqPgACgkQD27XaX1/VRvuygCfYXd6SSv7KWC4jPwRgZlt9tCt
bxwAn05dB7Zk8mUKlZgfiFohLFqRXc0d
=7alQ
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--

--===============6419583066895409022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6419583066895409022==--
