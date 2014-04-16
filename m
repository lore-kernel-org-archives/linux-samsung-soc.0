From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 5/6] ARM: EXYNOS: Enable multi-platform build support
Date: Wed, 16 Apr 2014 21:50:01 +0100
Message-ID: <20140416205001.GY12304@sirena.org.uk>
References: <1397554134-11827-1-git-send-email-sachin.kamat@linaro.org>
 <CAJuA9ajXa+mejdUvWATHjmmin8hoRhX0wueg5g8rDbJR4AWZ7A@mail.gmail.com>
 <534E9AA3.10409@samsung.com> <5094962.iM2Kd6gfjd@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3660089221173819745=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5094962.iM2Kd6gfjd@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <ta.omasab@gmail.com>, Padmavathi Venna <padma.v@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Abraham <thomas.ab@samsung.com>, Sangsu Park <sangsu4u.park@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org


--===============3660089221173819745==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="We3kTPdwkBGsLLkt"
Content-Disposition: inline


--We3kTPdwkBGsLLkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 16, 2014 at 08:14:27PM +0200, Arnd Bergmann wrote:

> This patch does a partial revert of 313367e7bfa by allowing these
> drivers on all samsung platforms except EXYNOS, so we can proceed
> with the multiplatform patches.

> If support for these drivers is actually needed on EXYNOS machines,
> the drivers should first be moved over to use the dmaengine code.

I would be surprised if neither IP is present on any Exynos SoC, they
were added in the s5p range.  Is Sachin's fix for building these
(present in -rc1) not doing the job?

--We3kTPdwkBGsLLkt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTTuz2AAoJELSic+t+oim9SPIP/1BhuK45RgpvnDyykgMDYkyz
PAOPizj0c+kCEHAT+hQiUsRSmPIYXp9rmIZ1TQW/sfZwNOe+VvM0K9uASCZ4TWWU
miyP6cbVsrOe8nCBx7bECy2B9QnYnhxnqbU+aoJwVSF/mUiwuPZ2S1iZdAZZnApy
XmIJd36rrzhjA24AEK0eEx66qFmwxXsUVgKDo3z0f7jFh/n85JZ1siSaAOJDxHSK
dSGOgw8J2oBW7NbcG+0xKSbyDJ/LDE6+Bct+t4kGqJ2VlR4+o+7hn0EfdFMP6bzk
1oBucgEvZ5LW9AK2xGNN5cukJ19Jotzyqew6ZcagkLWOrP1MkJVMbVGYulPPRvzH
uAljaihCsBJexOYYXTvsumXEwaRgeyUXrNdv0JDh3wcLHoo5G7vWd5juWSlEw9Cd
BbRYkTLAm7MRLGB57YaWZA59mGCGqJsM1imm0b8qTjq06TXilizcpf/R7SIHX3NL
GdQ1oupcMROV5i/2N3NoD0WJnmPGWV6xzbszEi0y1zDEskZPngxtmOHpvZ3FVqig
hsLfeudPPED+1kEwTEob/9VUHuVFlzCk0nuB+pk4h92r5YOZec5M8MAojH3IGran
JmVgFwCw3rNisThuG2tl9xRtIPHempP5RL5IYjMjuNsqIxnaPRz5ISOI1tle9nPa
K9/DIXgwlyP68I5i/8m2
=xY0P
-----END PGP SIGNATURE-----

--We3kTPdwkBGsLLkt--


--===============3660089221173819745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3660089221173819745==--
