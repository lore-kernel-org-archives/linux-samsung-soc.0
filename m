From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] spi: s3c64xx: fix casting warning
Date: Tue, 23 Jul 2013 14:27:53 +0100
Message-ID: <20130723132753.GE9858@sirena.org.uk>
References: <008101ce82cb$34f0eea0$9ed2cbe0$@samsung.com>
 <20130717100816.GK22506@sirena.org.uk>
 <10928386.fNethLYWc8@amdc1227>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6IGTAXksYJqONypD"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:43764 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932346Ab3GWN16 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 09:27:58 -0400
Content-Disposition: inline
In-Reply-To: <10928386.fNethLYWc8@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Jingoo Han <jg1.han@samsung.com>, linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Joe Perches' <joe@perches.com>


--6IGTAXksYJqONypD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2013 at 07:09:27PM +0200, Tomasz Figa wrote:
> On Wednesday 17 of July 2013 11:08:16 Mark Brown wrote:

> > Applied, though only the cast to unsigned long should actually be needed
> > - casting to void * should be good for any pointer so changing to the
> > specific struct shouldn't be essential (might catch issues due to
> > future API changes though).

> Well, hopefully the old S3C DMA API with all its brokenness will get=20
> removed soon and we switch to generic DMA engine API. (I already have=20
> patches to migrate Samsung ASoC and SPI is being worked on.)

If you've done patches for ASoC note that there is generic dmaengine
helper code which should be used.

--6IGTAXksYJqONypD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR7oTWAAoJELSic+t+oim9D08P/1RsOx11cTxwhztCTUYLhFgl
NXqP75JlRGwtpub674NvG9q1K/rLn+NGDL9Lc1nJoVcxp01Ls0ygFsg53g2a1fKI
G1ne+XtZId8to4Ak7dq/PNWzMEduqPYUdHARzFni3scL0LsBa1I9xzuMLlYITAwN
v3PvUjlMYZVl1TYbwXnBRdwuLdpCUBjvFJtPwDGLyT4izkCkvXjnnCt1NByOVtqZ
zW354GIGHv2xsE5MCfCCBJm9Jt+Ugzb3Bafb0H/K01a6wVH1YAyAVVVzv1g6KVJj
SqztmPQpQEAcFgLauObMmfRXZW9HPMZgk77yy0+9e3EvFlxnTZ//c3e6jx1JxE/z
saAbzT7VnjJxR5B3WW31MvxtRcP14ArAjn7gls8uX5bwDjz5jzAUB/7ObkkZ9xkr
wQnshP3kqBaeyE3+zbybun8Bg8m/bpPHk57SaqDnmJMtouWm4uye22h1xJTsSlct
LD0rC36vn6DzsoveLTf4+MvmCT0c6oRo3FbrvukBSfsTp+pNO3SPbSsuZxuvxJOK
0eOp0xvDYupnrZneRIZ4IdTXPv8NV+8/EBsgyjQA777EkT8zzJvRantLYojB/rh3
KXQMRgY7kBnEnSVeZOd/gG4W97EyYdZTdAQOXmnHZWNYcnObSieXbcdX6m+SUkJ4
w8VzYyE2TUGHrcRuP6ec
=1+Eo
-----END PGP SIGNATURE-----

--6IGTAXksYJqONypD--
