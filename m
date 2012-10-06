From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] i2c: s3c2410: use clk_prepare_enable and
 clk_disable_unprepare
Date: Sat, 6 Oct 2012 16:00:54 +0200
Message-ID: <20121006140054.GC25123@pengutronix.de>
References: <1349220399-2318-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1349220399-2318-1-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 03, 2012 at 08:26:39AM +0900, Thomas Abraham wrote:
> Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
> calls as required by common clock framework.
>=20
> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied to -next, thanks!

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlBwOZYACgkQD27XaX1/VRv8WACfe7Rkbdk7t+woP/fnUX9jkvi+
iI4AoMyl/R9ukYbLrVqlhGXbaLjermhI
=wOkq
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--
