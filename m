From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 06/14] regulator: max77686: zero-initialize regulator
 match table
Date: Mon, 3 Nov 2014 15:55:11 +0000
Message-ID: <20141103155511.GT3815@sirena.org.uk>
References: <1415025649-8119-1-git-send-email-javier.martinez@collabora.co.uk>
 <1415025649-8119-7-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JHjDRUnf1JOMxzko"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1415025649-8119-7-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--JHjDRUnf1JOMxzko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 03, 2014 at 03:40:41PM +0100, Javier Martinez Canillas wrote:
> The struct of_regulator_match is declared as a non-static local variable
> so the structure members are not auto-initialized.

Applied, thanks.

--JHjDRUnf1JOMxzko
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUV6VeAAoJECTWi3JdVIfQwgkH/R1YKzdpdreMts6uRLlJEcuq
tYE1M14nSHoIkp0ujx/98lGC9B3dqda9lr9C+Bjanjb6TBaVwuVDU+1teqagqucU
rQ7v1+/CyDA9GMETL//KxTMcuVC6MlMwkLzBoJ0kgm2OLr/7SzZ9T0iHPPwi+Csa
QuQzA2W9F4mSZy2vXZHGNSbjTLlde1HCqygcBkGY/6yEdpi6u4jLi6QzvlYfn1gP
PhhLM2mFZ4yk9COGmpO7MpCm7T/VV3DWRc3EjuVbof4Ie+SIbMWS5HfeSd9H8GFa
2NXMRG2RcmetKWUE34tDhFXahpzC1Yyg/zyPTiOmkc6WE1FlkIWvbVcmq+AfBkY=
=nt98
-----END PGP SIGNATURE-----

--JHjDRUnf1JOMxzko--
