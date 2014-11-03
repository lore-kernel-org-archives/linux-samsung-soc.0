From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 00/14] Add max77802 regulator operating mode support
Date: Mon, 3 Nov 2014 16:07:50 +0000
Message-ID: <20141103160750.GA5176@sirena.org.uk>
References: <1415025649-8119-1-git-send-email-javier.martinez@collabora.co.uk>
 <20141103155443.GS3815@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141103155443.GS3815@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 03, 2014 at 03:54:43PM +0000, Mark Brown wrote:
> On Mon, Nov 03, 2014 at 03:40:35PM +0100, Javier Martinez Canillas wrote:
> > Hello Mark,
> >=20
> > This is the fourth version of the series that adds operating modes
> > support for the regulators in the max77802 PMIC. This version uses

> No, it's not.  This is a a patch series doing a whole bunch of different
> things, there's at least bug fixes to existing drivers, new features and
> also this new driver in what I've glanced at so far.  These things

s/new driver/new driver support/ sorry

Point being that operating mode support in the driver is mostly
orthogonal to DT bindings is mostly orthogonal to random bug fixes.

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUV6hVAAoJECTWi3JdVIfQMxEH/1nRUoxOd10iNn0JK5sl+Qo2
nHihAI9kIL2596ARwbHkOfOjGtZR5p/hN5zNb0mAAUHA0jcnRKiK410nOFpJU9jX
ZuI8Z09386nNZyAgkJ+XDPbeg75vEPniYD2ZFIii+BaFkEL1qcDq4EUAMyb6VTVT
lvW08P9gW2+rO0erOaa5kvjanrRXxOTJydUJ97goZZvsmG+ExhcZ4iPoh4WE8LSQ
9Q5SzOGFxBvop7p52QPbjyMkjWdYgcbu8y+7tvHe+JGJ6fj0plNKRnwap+GL9srh
mky3EbTrVXgFPOwULz5qvUIslOckJL3nr2zkbXarGjsXD06zaErNftHxg5HnMhY=
=jfet
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
