From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 1/2] spi: s3c64xx: fix printk warnings
Date: Mon, 15 Jul 2013 12:59:58 +0100
Message-ID: <20130715115958.GG11538@sirena.org.uk>
References: <000001ce8122$1ab3df70$501b9e50$@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L1c6L/cjZjI9d0Eq"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:37733 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755900Ab3GOMAC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jul 2013 08:00:02 -0400
Content-Disposition: inline
In-Reply-To: <000001ce8122$1ab3df70$501b9e50$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Joe Perches' <joe@perches.com>


--L1c6L/cjZjI9d0Eq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2013 at 03:11:11PM +0900, Jingoo Han wrote:
> Fix the following build warnings when LPAE is enabled:
>=20
> drivers/spi/spi-s3c64xx.c:1466:2: warning: format '%x' expects argument o=
f type 'unsigned int', but argument 4 has type
> 'resource_size_t' [-Wformat]
> drivers/spi/spi-s3c64xx.c:1466:2: warning: format '%x' expects argument o=
f type 'unsigned int', but argument 5 has type
> 'resource_size_t' [-Wformat]

Applied, thanks.

--L1c6L/cjZjI9d0Eq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR4+Q7AAoJELSic+t+oim9/jgP/AhepEGAkW3xlVRb6WDDAA+8
fwFFPikESXXb8Cnx0GVLKulMDltr0coIvWbLDBaeqA5W79DUasrYkGnzXXMFrY6H
fIdZOtUQTP8/fmVepaYNTl3ssgBVRqWEqzkYbdNfT2vNCevReqmtPmoLd/Q2kzYH
oJBANLMjCVMAWYHx3eDoXqMalZdgFNVTsOeEcPxzOgARDTE9+J1hyl+idOrw1VV0
d9dfbshPd4i77MgAfS7OTw569tdKDEgGMEvLbroy0dzXuXFwVoxvV93k6FrQto/1
pWyKqjVMCvlrQnkOnNc6kODhz0lcD/ZLuE7V0xWAjPgiFkfEZ/hi+RhOGZAXVdEe
mdjffoTEgmLYdNE7KtB1j7Q+/Nw+yAtVk8z85zXYsvU9QEKbW7csOs6Xt5Uj4E+W
2g2kdOBj6ieZHshR7Wsj24/XbC7EutvhMK65cLpOsvNFmdkBvl2B6ARv7QqQ2LMo
UK+H0gqpfGyLBCqnJLvC6Xu+UWFy/M+9ze9b+jZ+FqOle16MLfLvze4tHEx5Sbaq
PScK9yIJ+NJ0YEjM4d9u8J9X94CzKYYpUjw0ecZKYW350KQb+7QRSJy1SN+haGGT
ma9oIGQaOdeBVPbyrEfLR1LxmeCS7RXozWiHaAO0ttlQZ/YzFLAQCKIixAET9919
XH94OJ/X7beLq+jnjhNu
=L593
-----END PGP SIGNATURE-----

--L1c6L/cjZjI9d0Eq--
