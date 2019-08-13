From: =?utf-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Subject: Re: Bad file pattern in MAINTAINERS section 'SAMSUNG EXYNOS TRUE
 RANDOM NUMBER GENERATOR (TRNG) DRIVER'
Date: Tue, 13 Aug 2019 11:22:42 +0200
Message-ID: <87blwtctct.fsf%l.stelmach@samsung.com>
References: <f4e91a72-2d0d-b02e-706e-e53f6f9a2368@linux.com>
        <CGME20190813092250eucas1p268947b3a9e15c2d2721e6311db8c3965@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f4e91a72-2d0d-b02e-706e-e53f6f9a2368@linux.com> (Denis
        Efremov's message of "Tue, 13 Aug 2019 10:09:26 +0300")
Sender: linux-kernel-owner@vger.kernel.org
To: Denis Efremov <efremov@linux.com>
Cc: robh@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2019-08-13 wto 09:09>, when Denis Efremov wrote:
> Hi All,
>
> Initially, I've prepared a patch and only after found this
> discussion. So, please, look at this patch no more than just a simple
> reminder that get_maintainers.pl still emits this warning.

NAK

The patch adding exynos525-trng.txt file exists[1], has been reviewed
and accepted and should be applied.

[1] https://patchwork.kernel.org/patch/10758009/

> ------------------------ >8 ------------------------
> Subject: [PATCH] MAINTAINERS: exynos trng: Remove samsung,exynos5250-trng=
.txt record
>
> Update MAINTAINERS to reflect that samsung,exynos5250-trng.txt
> file never existed.
>
> Cc: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2ea3f82e256b..7d213e192626 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14033,7 +14033,6 @@ M:	=C5=81ukasz Stelmach <l.stelmach@samsung.com>
>  L:	linux-samsung-soc@vger.kernel.org
>  S:	Maintained
>  F:	drivers/char/hw_random/exynos-trng.c
> -F:	Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
>=20=20
>  SAMSUNG FRAMEBUFFER DRIVER
>  M:	Jingoo Han <jingoohan1@gmail.com>

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAl1SgWIACgkQsK4enJil
gBBtlAf9EhXavcWIa+xtfXObxm8sV4RPr+5mSsaKjsXY02hkcwtDYSsgDawLXsJW
OchLzH8P0qNg6CVS6tKkOI2yNRwveQFbNJySG7NXmcDmtzU7Ybp6+1DSlwcyvngB
79Az9DxIe+49S4aAsShIPtWra1BtMLH0KKYH2c9nY1Fg/rlf4i9uYWJYe+T1XTAb
fEfctVqZMjgohWVT82YKxjpx4tTUTXdUbbX9Kh1R65GluSJytmBVG3aVNctKeC0S
Q1bfMhMATBiL89NtnNZnxFOzvmkRDWmFzP1wmYmdMLnJiMLG0fL9tWltDIu2aQFd
Tp1l1gjEU5CoIPLRQVvkbZrRPY3+YQ==
=m7iZ
-----END PGP SIGNATURE-----
--=-=-=--
