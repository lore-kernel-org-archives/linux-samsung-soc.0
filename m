From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] i2c: i2c-s3c2410: Add support for pinctrl
Date: Fri, 16 Nov 2012 12:54:25 +0100
Message-ID: <20121116115425.GF19028@pengutronix.de>
References: <14549510.veZygXpPkq@amdc1227>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GLp9dJVi+aaipsRk"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:51017 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751297Ab2KPLy2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Nov 2012 06:54:28 -0500
Content-Disposition: inline
In-Reply-To: <14549510.veZygXpPkq@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>


--GLp9dJVi+aaipsRk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 11:33:40AM +0100, Tomasz Figa wrote:
> This patch adds support for pin configuration using pinctrl subsystem
> to the i2c-s3c2410 driver.
>=20
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Applied to for-next, thanks!

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--GLp9dJVi+aaipsRk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlCmKXEACgkQD27XaX1/VRv4kQCeNNpgJNK0pMkeQtxLxMcX5GyQ
9UUAoLsVxIRHzb+eVLKWzdmwCTV7XKFY
=2Y2k
-----END PGP SIGNATURE-----

--GLp9dJVi+aaipsRk--
