From: Mark Brown <broonie@kernel.org>
Subject: Re: Ask for help on SPI slave side driver support
Date: Mon, 30 Sep 2013 10:33:17 +0100
Message-ID: <20130930093317.GX19304@sirena.org.uk>
References: <23ff6b10.bf1d.1416a88321f.Coremail.youshenghui0322@163.com>
 <4025277.bhF6fFGQqq@flatron>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yQ6PUHtvLgXN2OhJ"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:38869 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751809Ab3I3Jdm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Sep 2013 05:33:42 -0400
Content-Disposition: inline
In-Reply-To: <4025277.bhF6fFGQqq@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: YouShenghui <youshenghui0322@163.com>, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org


--yQ6PUHtvLgXN2OhJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2013 at 01:20:42AM +0200, Tomasz Figa wrote:

> Mark will probably know better, but AFAIK there is no API for slave mode=
=20
> SPI available in Linux kernel. Please correct me if I'm wrong.

That's correct.

> The code mentioned in the post from your link was some internal vendor=20
> code, which is unlikely to be available publicly. However support for=20
> slave mode from hardware side seems more or less similar to master mode,=
=20
> which means that assuming you can add some kernel API for it, the=20
> modification to the spi-s3c64xx wouldn't be too big.

There were some people working on slave mode (or at least talking about
it) but I don't think they ever sent it.  It'd probably just be the same
as master mode but with transfers triggered from /CS instead of from
driver action.  The biggest trick would be making sure the transfer is
running before the master actually starts sending data.

--yQ6PUHtvLgXN2OhJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSSUVaAAoJELSic+t+oim9uygP/Rz0qmicpf6CogtUOY6FL9gM
iJFxetg9EUyoII0fwI2yhioW5pjU1yRefr4baXq8lW3cFqKVnRmfjA7TIa1QGzRn
D2dBHRvwxvMfIpOsTmFA1hBdPcj/5GgarerHFpr+gpRbkBqliLLC1EN9WDHoMJjn
wD4q6Gwc0t87f+GhlXt+GH54MgYLno0Jm0wp93brSXtZOs08OxD0eSdsnOPfAqKu
1gmMBv2Jm9smrbGPpNGFXE2Ei7P9RSACUvS1TWNYufkLDrGO7HOJVztn7DUkXpbJ
nUdko+106EfbvopcCDsREv6MvNZBUDaJilWx0t4ZfCWabKprL5FM90g1pl8vXkeD
xku5qzfXm0a1ZFfziwYmbHFzlft8nblQ/xeNk+c+LwCNWiW8MDrAC1MBPDv+HyKS
b1t8F5BMZn+plahxVrVZG7m6pkL5DRdrnx/26rbmvFJAbjcpt/yEfRrwNYrAcvWC
mD8VyX+Vhwycv5PlJM25IsFXWUlltJDkDW0dtYYlaDvTY1EAiUJR7+oQCrLfQ+D4
ExKTY1niQxbMv02/V5QncI1fPcDDpSbpaauS6rmlj8KiyiJnjPeEPls8JX9vEx7t
dNL91Z1wwgVjYuCpK5OEz6erMm12OV9ooZYsmLMKToPACJEzkdONvFZuFOI+3J8/
KmGEBrQK4O2LHfWzsVX0
=nvC5
-----END PGP SIGNATURE-----

--yQ6PUHtvLgXN2OhJ--
