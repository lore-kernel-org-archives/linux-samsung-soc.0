From: =?utf-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Subject: Re: Bad MAINTAINERS pattern in section 'SAMSUNG EXYNOS TRUE RANDOM
 NUMBER GENERATOR (TRNG) DRIVER'
Date: Mon, 01 Oct 2018 10:07:37 +0200
Message-ID: <875zym5bue.fsf%l.stelmach@samsung.com>
References: <20180928220330.31325-1-joe@perches.com>
        <CGME20181001080750epcas2p21b4c3e14be32859f31bede0656ffa09d@epcas2p2.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20180928220330.31325-1-joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2018-09-29 sob 00:03>, when Joe Perches wrote:
> Please fix this defect appropriately.
>
> linux-next MAINTAINERS section:
>
> 	12851	SAMSUNG EXYNOS TRUE RANDOM NUMBER GENERATOR (TRNG) DRIVER
> 	12852	M:	=C5=81ukasz Stelmach <l.stelmach@samsung.com>
> 	12853	L:	linux-samsung-soc@vger.kernel.org
> 	12854	S:	Maintained
> 	12855	F:	drivers/char/hw_random/exynos-trng.c
> -->	12856	F:	Documentation/devicetree/bindings/rng/samsung,exynos5250-trn=
g.txt
>
> Commit that introduced this:
>
> commit 6cd225cc5d8a6526b2bea41955882be55d4f109e
>  Author: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
>  Date:   Fri Dec 22 17:48:35 2017 +0100
>=20=20
>      hwrng: exynos - add Samsung Exynos True RNG driver
>=20=20=20=20=20=20
>      Add support for True Random Number Generator found in Samsung Exynos
>      5250+ SoCs.
>=20=20=20=20=20=20
>      Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
>      Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>      Acked-by: Philippe Ombredanne <pombredanne@nexb.com>
>      Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
>=20=20
>   MAINTAINERS                          |   7 ++
>   drivers/char/hw_random/Kconfig       |  12 ++
>   drivers/char/hw_random/Makefile      |   1 +
>   drivers/char/hw_random/exynos-trng.c | 237 ++++++++++++++++++++++++++++=
+++++++
>   4 files changed, 257 insertions(+)
>
> No commit with Documentation/devicetree/bindings/rng/samsung,exynos5250-t=
rng.txt found

Please merge the version 3[1] of the patch you've acked[2].

[1] https://www.spinics.net/lists/linux-samsung-soc/msg61372.html
[2] https://www.spinics.net/lists/linux-samsung-soc/msg61272.html
=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAlux1coACgkQsK4enJil
gBCoYAf/TRdfsYupR+hSviOt6F/mHduwMboNJ4TMl/4iZcg8PMueZSDj74tNMpI3
kTNg7n5bCvNeFliYOu4RfxFUzPuwpxU2YUDgJ2AWmdB5545Ekj8Yq2va6P/sBq9L
TyYogfT5FEBeDG0E2AlsdpB3oWw3I8u/mlvgsTjeRu17ptKGP3euh9bsXDlm/rTo
sTemzSNB0QElUya1r2BO6gvZgO4F5Hvz9AyvWT6W4lM3TDwprqKR98p2IwnXUfvt
KZxOvy9S9IfTtFOOj06APjuJqE4wZ7a8U8UOdMDIKvnN3woeJsCaviWAbS19Gbpw
IObvC9+lYMY0SREXqsKfRdbG0bnOLg==
=+ZAp
-----END PGP SIGNATURE-----
--=-=-=--
