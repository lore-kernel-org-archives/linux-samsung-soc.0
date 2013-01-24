From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c-core: Add gpio based bus arbitration
 implementation
Date: Thu, 24 Jan 2013 12:39:48 +0100
Message-ID: <20130124113948.GD12933@pengutronix.de>
References: <1355464254-12768-1-git-send-email-ch.naveen@samsung.com>
 <1355464254-12768-2-git-send-email-ch.naveen@samsung.com>
 <50CB4E99.9060506@wwwdotorg.org>
 <20121215142135.GB22033@opensource.wolfsonmicro.com>
 <20130124111329.GC12933@pengutronix.de>
 <20130124111845.GO4955@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a2FkP9tdjPU2nyhF"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130124111845.GO4955-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, naveen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--a2FkP9tdjPU2nyhF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 24, 2013 at 07:18:47PM +0800, Mark Brown wrote:
> On Thu, Jan 24, 2013 at 12:13:29PM +0100, Wolfram Sang wrote:
> > On Sat, Dec 15, 2012 at 11:21:36PM +0900, Mark Brown wrote:
>=20
> > > also get things like read operations which appear as multiple
> > > transactions on the I2C bus so require something higher level than wh=
at
> > > multi-master provides.
>=20
> > I don't get what you mean here. Can you elaborate?
>=20
> A read is typically implemented as a write of the register address
> followed by a read of the value, usually with the ability to free the
> bus in between.  If two devices attempt to access the register map
> simultaneously this results in the address going wrong.

Could happen. But in what situations will one not use repeated start
here? Especially when designing a multi-master bus?

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--a2FkP9tdjPU2nyhF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEBHYQACgkQD27XaX1/VRsAdQCdHPM40PqJBYznKnHAljriBDlU
XOsAnAkqEGcQ6Y34Ge9EqF0qt6/HfHEQ
=pzuW
-----END PGP SIGNATURE-----

--a2FkP9tdjPU2nyhF--
