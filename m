From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c-core: Add gpio based bus arbitration
 implementation
Date: Thu, 24 Jan 2013 12:13:29 +0100
Message-ID: <20130124111329.GC12933@pengutronix.de>
References: <1355464254-12768-1-git-send-email-ch.naveen@samsung.com>
 <1355464254-12768-2-git-send-email-ch.naveen@samsung.com>
 <50CB4E99.9060506@wwwdotorg.org>
 <20121215142135.GB22033@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6zdv2QT/q3FMhpsV"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121215142135.GB22033-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, naveen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--6zdv2QT/q3FMhpsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Dec 15, 2012 at 11:21:36PM +0900, Mark Brown wrote:
> On Fri, Dec 14, 2012 at 09:06:49AM -0700, Stephen Warren wrote:
> > On 12/13/2012 10:50 PM, Naveen Krishna Chatradhi wrote:
>=20
> > > +The first should be an output, and is used to claim the I2C bus,
> > > +the second should be an input, and signals that the other side (Clie=
nt)
> > > +wants to claim the bus. This allows two masters to share the same I2=
C bus.
>=20
> > I'm confused why this is even needed; the I2C protocol itself defines
> > how multi-master is supposed to work, just using the regular SCL/SDA li=
nes.
>=20
> Practically speaking essentially no systems actually do that - mostly
> Linux will treat failure to get the bus as an error for example.

It is true that Linux currently does not have proper multi-master
support. It is worth a look what is missing and how far we can get with
the I2C specified arbitration IMO.

> also get things like read operations which appear as multiple
> transactions on the I2C bus so require something higher level than what
> multi-master provides.

I don't get what you mean here. Can you elaborate?

That being said. Grant's design was the most promising one.

Thanks,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--6zdv2QT/q3FMhpsV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEBF1kACgkQD27XaX1/VRullQCePgYzSfFOMBAK94oXjHZnLFtt
TYIAoMQogd0XfDbXQpVnMGySY0AW5KEI
=Zzsm
-----END PGP SIGNATURE-----

--6zdv2QT/q3FMhpsV--
