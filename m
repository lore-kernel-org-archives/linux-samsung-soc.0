From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RESEND] regulator: s2mps11: Fix GPIO suspend enable shift
 wrapping bug
Date: Wed, 24 Jun 2015 12:25:18 +0100
Message-ID: <20150624112518.GI14071@sirena.org.uk>
References: <1435142923-31815-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KGc1k+SqnCbNkj2i"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53651 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752060AbbFXLZX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jun 2015 07:25:23 -0400
Content-Disposition: inline
In-Reply-To: <1435142923-31815-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org


--KGc1k+SqnCbNkj2i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2015 at 07:48:43PM +0900, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
> Status of enabling suspend mode for regulator was stored in bitmap-like
> long integer.

Applied, thanks.

--KGc1k+SqnCbNkj2i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVipOdAAoJECTWi3JdVIfQE0cH/A8SF4TjeHWmYgjX0nAcZtvf
VvQ5hEP3dVXAEsTaFT+zTjbY24w3+pYT+csD2VORvyo6kgIsYT70pj4Qvl81eVbU
LRD3qzyTylkTz3aZA2v2FC8q6rgt7s1BHcqVBlvo6AK8j95I2iMj4sEPj0euaKIu
CylttOjcQcP9uGGRS7uNlMn1JR7kwTINWilzjEtgjPBcAOPvRWNufcfOnWeT/BN6
3SY8IGkWiRmC/lpZPngaffHclBdmVl8KmrpYsy1q9HYDDNipHhYYeBdTrOI8C9wn
BYhEbA0hYAB9NO2Gi+2Kr57hqEuZFE0PpJ1AjhPBWiZLIZqwENYbVMhzA6EHUkc=
=3VnE
-----END PGP SIGNATURE-----

--KGc1k+SqnCbNkj2i--
