From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: Samsung: Modify the I2S driver to support I2S on
 Exynos5420
Date: Thu, 11 Jul 2013 12:20:23 +0100
Message-ID: <20130711112023.GM24508@sirena.org.uk>
References: <1373526505-27115-1-git-send-email-padma.v@samsung.com>
 <29860116.IF545KsGYb@thinkpad>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JvUS8mwutKMHKosv"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:35344 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932309Ab3GKLUe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jul 2013 07:20:34 -0400
Content-Disposition: inline
In-Reply-To: <29860116.IF545KsGYb@thinkpad>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.kvr@gmail.com, sbkim73@samsung.com, kgene.kim@samsung.com, abrestic@chromium.org


--JvUS8mwutKMHKosv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2013 at 12:43:22PM +0200, Tomasz Figa wrote:
> On Thursday 11 of July 2013 12:38:24 Padmavathi Venna wrote:

> > +- samsung,supports-tdm: If the I2S controller supports TDM, then this =
flag
> > +  must be enabled.

> I think this should be rather handled by a different compatible value, no=
t a=20

This is a bit of a larger project sadly, there was resistance to doing
the DT bindings based on compatible strings using the IP version :(

--JvUS8mwutKMHKosv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR3pTzAAoJELSic+t+oim9rlIP/imV0gVhLj8RMlOQYEkOEKmb
uUAd5koaYG4fR01G27REz81d5Gw+wORrhv6jB1hAmj3v5Xkp80uTFakoDjJxTwpV
CjsINvSypyR21Olxu3E9PLqdaDqJl7lwrHc9DLypUtm/aI8T/Ek3DOAhZBEX4xzZ
jzetRxyXTR8IFZLIBFuK8Ag6spJtVuym4XvOMGuYs2/SlLCC/9YXwPAn13RrLe3Q
BXRamOIP1T1W0PByIFwFgJ6lR1AWb54+z4+oSKqhEN1yE7VXzDSlKDTVRVrA7tga
9F6qq0JNLXfHd87ovtezUXOcPtXJz6qqHx+bw0/Ac0NHitFNAhehknbTVNMjPwvX
U3ryb0k93zVVBEn1Ab0nokalwGtycc7HGtLHIRIi2DC39yB/RclNIZu4KblIdN6b
o0eMFtwDjiFo86xNSmb6Sty7Y4tcaHyj+wpubapG0mQxJZO8wd2Y0zws5nZTExmw
8FORgxM/0TaIKagXn6Bg7NmIwFGQiHayaYEqPcG4tmVpzAfuxeQxlBnIytd3w0Cc
savCuqyWQd5mzRcOwB7qH1PSvzku0ZFl7qahDfmYFyXvbtgktpoXkQhm3uEeCE5s
8X+K48HDQJI9ja8swSvo0HE/AX36Yyi9qa+M230QnoHkrRelEO3+2sMfHXMYukhh
NGRx9WP1/fyHWrc7uWlU
=kH1f
-----END PGP SIGNATURE-----

--JvUS8mwutKMHKosv--
