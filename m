From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: Put Arndale fixed voltage regulators on a
 simple-bus
Date: Sat, 6 Jul 2013 10:19:25 +0100
Message-ID: <20130706091925.GL27646@sirena.org.uk>
References: <1372714599-17588-1-git-send-email-broonie@kernel.org>
 <2269980.iUpB0kJaI3@flatron>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="27xafAmIQ8huzseZ"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:50011 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752827Ab3GFJT4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 6 Jul 2013 05:19:56 -0400
Content-Disposition: inline
In-Reply-To: <2269980.iUpB0kJaI3@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--27xafAmIQ8huzseZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 06, 2013 at 01:36:57AM +0200, Tomasz Figa wrote:
> On Monday 01 of July 2013 22:36:37 Mark Brown wrote:

> > +	regulators {
> > +		compatible =3D "simple-bus";
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;

> Are the two #properties above really necessary? The regulators that will=
=20
> be placed here probably don't need any kind of addressing, so it should b=
e=20
> possible to omit them.

I believe they're required boilerplate for a correct DT bus.

> > +
> > +		mmc_reg: voltage-regulator {

> I'd suggest suffixing name of this node with an index, like voltage-
> regulator-0 to be more future proof, in case of further fixed regulators=
=20
> being added.

If you want to rename things that's a separate thing so should be a
separate patch - this patch is just about moving the existing devices
onto a bus.

--27xafAmIQ8huzseZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR1+EaAAoJELSic+t+oim9WUIP/0RWTqFItd7VcPCKZlzimbtS
J0rRX/YaMfOEEuoY0aB4j8VFXwhJHjoa2ZJ1TIsOKbP2F3f7osLexThEc7TUhUDz
kduJuR3G6aYYh3UaTxKzPflV/bS4YOcSnf6hWkm3NXJ8RqPVCPPB09nLq0sgs8Rf
0XysSaKsqY+a/e5nX//2cXK+S5TUtw0YUuOkmGm6YOH0Q9ZcpuII2ufTFgdwJ02r
S7iEx8hCZ7uoVeEC8AH0VA35plxwG3MG5+kAHE3H6x9FRTQ2Rk6WpWo/xei7/TSH
7ervkgH656b3DAOv5bPXITwyYe0Z5VsZAgBEtH3dwnKsmSMoqcWrjsLoXKmPboW4
pNBvzioeDXaiPtn4ia8o2GZiQ6GCuQhW6ahWNSJV5NJpSURbHy+GRZ1oAka0s3L6
Z2d57gxBjHNZ7ImdcApwvnLqM0WfEzCHLxXNuScVMpyu0MDRankqQGBu5xqfNWOC
dj0x5qh+RGBI4mRZV+5W4xaJUQpId32ZA00T0YhZ6TIV6oyOglsA4FkCaN/5Z5dw
3IZmrjCHJJmEc71fBq+Y7/r1KGUR1G7tdZrFzi9udgnjXI6AUnQeWPxPriheiQbf
JuVwcukgBeVMQoC7O7hj5iyrtk6/WAsQrLzc51jNlS8eJ/aNDZmoXfi6+oKKYo4o
TUS19jYZ7Kn6eyQECcDF
=i0cQ
-----END PGP SIGNATURE-----

--27xafAmIQ8huzseZ--
