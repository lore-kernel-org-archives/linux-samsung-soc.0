From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: s2m,s5m: constify regulator_ops structures
Date: Wed, 23 Dec 2015 00:00:43 +0000
Message-ID: <20151223000043.GE16023@sirena.org.uk>
References: <1450537080-17387-1-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450537080-17387-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Sangbeom Kim <sbkim73@samsung.com>, kernel-janitors@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 19, 2015 at 03:58:00PM +0100, Julia Lawall wrote:
> The regulator_ops structures are never modified, so declare them as const.
>=20
> Done with the help of Coccinelle.

This doesn't apply against current code, please check and resend.

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWeeQqAAoJECTWi3JdVIfQlaEH+gMpgsH67+k34t0HVqThNqnD
HZA86mufJsVXTlBs0XcquEWFnZrhueOgbqrmGmS2FYMK8bOVe4P1Rt+P1MUZqqbf
0UGzJSbhZYBxFOLANU9As+EXiVnfybfhh2dxnbzgVOWNtB2VEI13krVW3E+wjDdM
Jhwh4z/ElXw5vSkTA6Q7emXjszQdHREGAZzhmL0OaI+hpmTEGyx/s2vOtM7iNcnh
h5uvzMrLAQgL/OLYgUSD0JjnxMTlTM5aRuJL5ALggAXkXnZ+tq8WTBRJgoV3Wsr9
wZwX5s15L5mytwYMUI47hpzk4kPEXFVxVeFet9EFO0Z/pIE8g5ShQv7ufqelGpg=
=4YiW
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--
