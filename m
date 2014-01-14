From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/1] drivers: i2c: silence a compile warning in
 i2c-s3c2410.c
Date: Tue, 14 Jan 2014 20:09:10 +0100
Message-ID: <20140114190910.GE10340@katana>
References: <1389323025-4478-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="19uQFt6ulqmgNgg1"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:59981 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752066AbaANTJP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jan 2014 14:09:15 -0500
Content-Disposition: inline
In-Reply-To: <1389323025-4478-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, linux-i2c@vger.kernel.org


--19uQFt6ulqmgNgg1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2014 at 12:03:45PM +0900, Pankaj Dubey wrote:
> If used 64 bit compiler GCC warns that:
>=20
> drivers/i2c/busses/i2c-s3c2410.c: In function =E2=80=98s3c24xx_get_device=
_quirks=E2=80=99:
> drivers/i2c/busses/i2c-s3c2410.c:168:10: warning: cast from pointer to in=
teger
> of different size [-Wpointer-to-int-cast]
>=20
> This patch fixes this by converting "unsigned int" to "unsigned long".

Maybe switch to kernel_ulong_t? Since this is used in mod_devicetable.h
all over.

>=20
> CC: Kukjin Kim <kgene.kim@samsung.com>
> CC: Wolfram Sang <wsa@the-dreams.de>
> CC: linux-i2c@vger.kernel.org
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3=
c2410.c
> index bf8fb94..447dd98 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -101,7 +101,7 @@ enum s3c24xx_i2c_state {
> =20
>  struct s3c24xx_i2c {
>  	wait_queue_head_t	wait;
> -	unsigned int            quirks;
> +	unsigned long            quirks;

The indentation is corrupted.

>  	unsigned int		suspended:1;
> =20
>  	struct i2c_msg		*msg;
> @@ -160,12 +160,13 @@ MODULE_DEVICE_TABLE(of, s3c24xx_i2c_match);
>   * Get controller type either from device tree or platform device varian=
t.
>  */
> =20
> -static inline unsigned int s3c24xx_get_device_quirks(struct platform_dev=
ice *pdev)
> +static inline unsigned long
> +	s3c24xx_get_device_quirks(struct platform_device *pdev)

Keep it one line please, ignoring the 80 char thing.

>  {
>  	if (pdev->dev.of_node) {
>  		const struct of_device_id *match;
>  		match =3D of_match_node(s3c24xx_i2c_match, pdev->dev.of_node);
> -		return (unsigned int)match->data;
> +		return (unsigned long)match->data;
>  	}
> =20
>  	return platform_get_device_id(pdev)->driver_data;

The last line also returns kernel_ulong_t. No real difference, but using
it is a little more consistent.


--19uQFt6ulqmgNgg1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJS1YtWAAoJEBQN5MwUoCm2/YYP/R+AVyRHMb9QK4dzzMQuz9uB
G4i6aSRmlGs27BBZsGXdOBRiY1M8/5GjCq6lwKRkvFuwktovjt2fNrLNdb9zv72b
YhO2X62qhDygNv3nYcSimB+4UAh1qckBNoM5FcigpoM3KVOpYsSwGL/GqMM5ArjT
2gGhGBNQPIw1JldJIhgIi0B2Pp+p1zNB1mcTdIduQxnDUsgIJkz0o1IzsGmxF8TK
t13GuUlr4e/ADVcnp7lAXJEpzz6HUBbYdOHyHAZxdz5vKkuiwoz8FSI5zMggSP7N
vx3VjVpvHzKlKQ/8HrgMU3ol/if7rir0C6DqpwVU9XSKz4BP9+2853WAqfF35Me+
QL2MsEDeDPQTcxCRy5NL2aW52TWLvLusBOKCzdisJ65aDh5yJkzhk1FN8iVCdfSr
QXSducMvIdrUaKF1jyT0dDOt1ZqbeZnb1KqgeY80hGCGEv88vaD33Ve5cfNh78vI
rVswZfY8kJOMVxtx4tTrvk1i3VMqdhNxPdCFEc6M+EOItFIsd6XH5BmTihlU4Zss
NnkwWNaRxbJYeuZl7wOWC7x/9TPOiQPehCzPAEJytqlF66wZ6TXEmIqs32W8DMqN
QiqJgADGmNXbdL2y20ne6O1mFg+ML6HopHYm/pNmqq/S7dMKxisqaYGg3sywRKLx
yZJiTAleTNImyJWh2329
=X3TG
-----END PGP SIGNATURE-----

--19uQFt6ulqmgNgg1--
