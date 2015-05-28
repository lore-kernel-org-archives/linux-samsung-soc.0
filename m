From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: s2mps11: Fix GPIO suspend enable shift
 wrapping bug
Date: Thu, 28 May 2015 15:44:49 +0100
Message-ID: <20150528144449.GZ21577@sirena.org.uk>
References: <1432696928-4690-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nC6wP9HKIdltaSGT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432696928-4690-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--nC6wP9HKIdltaSGT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2015 at 12:22:08PM +0900, Krzysztof Kozlowski wrote:
> Status of enabling suspend mode for regulator was stored in bitmap-like
> long integer.

Applied, thanks.

--nC6wP9HKIdltaSGT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVZyngAAoJECTWi3JdVIfQw9EH+wYd9W9pMB1MhgskeHWQaO6X
BakY6m/2EKOL6tbDX9EMielOXAqjQ/lau/ygoPiEPWgSdEHJufpUpyv9ygz+/tlc
4eyuKoStFESFhLN1JG6Hifr7gHCqpXs6/vQOVif6Nk6kPZr/xH4jwYEAUYB//Wol
iQEynYgR8z1TaU8nszq5Kr7TPU2FM/ddIDUu50onTvpEPmLGgcxL6vgi96XsVQio
b1ly7P1ICLI5IRmE/J6Azgcyxy5sFCrbmJvPc/jnhlS43DWNANhvI/UOCGw2/e/7
hlVUh1tk4xC6/lFHqIinV1iOpFmCGXgCqu0Nnl1mxsEVi4yHcmgbU0UKT+mG9Qg=
=+x4Z
-----END PGP SIGNATURE-----

--nC6wP9HKIdltaSGT--
