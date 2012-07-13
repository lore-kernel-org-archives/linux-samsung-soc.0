From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] i2c-s3c2410: Convert to devm_request_and_ioremap()
Date: Fri, 13 Jul 2012 10:37:12 +0200
Message-ID: <20120713083712.GH32184@pengutronix.de>
References: <1340888138-32710-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <20120709135229.GL1296@pengutronix.de>
 <20120709135809.GG3934@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIIRZ1HQ6FgrlPgb"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:46868 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752596Ab2GMIhO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 04:37:14 -0400
Content-Disposition: inline
In-Reply-To: <20120709135809.GG3934@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org


--WIIRZ1HQ6FgrlPgb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 09, 2012 at 02:58:10PM +0100, Mark Brown wrote:
> On Mon, Jul 09, 2012 at 03:52:29PM +0200, Wolfram Sang wrote:
> > On Thu, Jun 28, 2012 at 01:55:38PM +0100, Mark Brown wrote:
> > > A small code saving and less error handling to worry about.
>=20
> > > Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
>=20
> > What about devm for the clocks, too?
>=20
> The devm_ versions of the API aren't exported there yet and there's a
> bug fix pending too but Russell and Mike have ignored the patches thus
> far.

I'd rather wait for this to be fixed and have all devm applied in one
go?

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--WIIRZ1HQ6FgrlPgb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk//3jgACgkQD27XaX1/VRsX4wCgtkW47yTZknUv79vZhkTwvYD3
zmsAn3DzOuQG67CdSZrXCZCavlKzBOmp
=4uxv
-----END PGP SIGNATURE-----

--WIIRZ1HQ6FgrlPgb--
