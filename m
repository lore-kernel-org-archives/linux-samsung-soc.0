From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] i2c: s3c2410: do not put a default class for the adapter
Date: Wed, 12 Mar 2014 20:23:04 +0100
Message-ID: <20140312192304.GD28891@katana>
References: <1391761795-28384-1-git-send-email-ch.naveen@samsung.com>
 <20140215151039.GE2579@katana>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6WlEvdN9Dv0WHSBl"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140215151039.GE2579@katana>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 15, 2014 at 04:10:39PM +0100, Wolfram Sang wrote:
> On Fri, Feb 07, 2014 at 01:59:55PM +0530, Naveen Krishna Chatradhi wrote:
> > From: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >=20
> > Avoid adding I2C_CLASS_HWMON and I2C_CLASS_SPD class flags to all
> > Samsung I2C adapters when the I2C mappings are defined in a device tree.
> > So the drivers doing an auto-detection by probing busses won't mess-up
> > sensitive I2C devices or trigger long timeouts on non-functional busses.
> >=20
> > Signed-off-by: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Reviewed-by: Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Tested-by: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Your Signed-off was missing BTW.

>=20
> I'd prefer to drop it in favour of this series:
>=20
> http://lkml.org/lkml/2014/2/10/836
>=20

I'll go ahead and apply my patch.


--6WlEvdN9Dv0WHSBl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJTILQXAAoJEBQN5MwUoCm2GuIQALXx6XypBve6h1SUM8QhgZHc
RoJ91edCUF2fC4KNfesKL8tvT/9NA2VYgMFwPBrfl7sl1RA4nmHwgDdhAz9dnTKH
SJmezMPJxznH8mlTR48gSYl1HsvyBPH0D4o/lNAnfSySOuiqpwRxqsHwfpYkwmSe
0xQntw0y3iHGH/TOtA6I7OkFW/006SjE9j6+1Ykxq0AJA8QdTt12Fg6Okj2Jn0fR
gZSYL4/KXEkWfQ4MMVVeE+JhqIEShpoNtcBGTL4Fyydiw2Oh+ce23IqCCYM6XXNf
XyYGHshYRR9GaU8+I+RVQfh8eeN5wFOW8IplJkWJPnwmJHT52Ntn9wZW5hGFll/h
kxyLQvf1RQDYJfpnb7fJ9gyo8FCCpwHvVzSClY/i9Xu9vhJy5MUYB+j3QYOM6ffm
w2wIuQ9pIzt/beA+EUUbD8GuYqXsWtkx5zOfGBa/q5TbMRszYpjw2bTyf/fskRUF
Y3Kslt1O1ukDGQztILSXSqpNXRE59ikOJoXRkdn1Quu5IgkXzTChKwVGVPR4cdYG
jsnKKNJKL8cL8oorKVSHwakw/UtPwzHXQaNVcTICwtgfydJOU5chTlwIaBUfEEhZ
jA9IrAyPHWGVZcfG3ToJfbF5CaZIQbOaKScbswy0SNWnFuOz8GXoTa/OsFfTSA3S
HBWkQ8RCX23vnB3Kqm5d
=e6rm
-----END PGP SIGNATURE-----

--6WlEvdN9Dv0WHSBl--
