From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCH 0/9] ARM: SAMSUNG: add Exynos chipid driver
Date: Fri, 16 Nov 2018 09:58:28 +0100
Message-ID: <60d56be0-5333-2bff-3576-ff1fcd74d40a@fivetechno.de>
References: <CGME20181115151207epcas1p45adfa96d5b52e10fbb5ace76ebae5e3e@epcas1p4.samsung.com>
 <1542294698-17470-1-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6389884607715144508=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1542294698-17470-1-git-send-email-b.zolnierkie@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Chanwoo Choi <cw00.choi@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6389884607715144508==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="l19oF13fUYOUnpd0s3oMYCCIQkdnZmEt0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--l19oF13fUYOUnpd0s3oMYCCIQkdnZmEt0
Content-Type: multipart/mixed; boundary="6JzAUwaucyoq4BHtIlbwhJhC2LHTC3NNa";
 protected-headers="v1"
From: Markus Reichl <m.reichl@fivetechno.de>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <60d56be0-5333-2bff-3576-ff1fcd74d40a@fivetechno.de>
Subject: Re: [PATCH 0/9] ARM: SAMSUNG: add Exynos chipid driver
References: <CGME20181115151207epcas1p45adfa96d5b52e10fbb5ace76ebae5e3e@epcas1p4.samsung.com>
 <1542294698-17470-1-git-send-email-b.zolnierkie@samsung.com>
In-Reply-To: <1542294698-17470-1-git-send-email-b.zolnierkie@samsung.com>

--6JzAUwaucyoq4BHtIlbwhJhC2LHTC3NNa
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Hi Bartlomiej,


Am 15.11.18 um 16:11 schrieb Bartlomiej Zolnierkiewicz:
> Hi,
>=20
> This patchset adds Exynos chipid driver and converts Exynos platform
> code to use it. It is heavily based on "[PATCH v9 00/12] Introducing
> Exynos ChipId driver" patchset [1] so most credits go to Pankaj Dubey.
> The main difference in the current patchset is in taking simpler
> approach to converting existing Exynos platform code to use the new
> chipid driver. This results in much less code duplication.
>=20
> The diffstat for "[PATCH v9 00/12] Introducing Exynos ChipId driver":
>=20
>  14 files changed, 587 insertions(+), 255 deletions(-)
>=20
> for the current patchset it is:
>=20
>  14 files changed, 193 insertions(+), 195 deletions(-)
>=20
> This patchset has been tested on Exynos4210 (including rev0),
> Exynos3250, Exynos4412 & Exynos5422 SoCs.
>=20
> [1] https://marc.info/?l=3Dlinux-arm-kernel&m=3D149087972213359&w=3D2
>=20
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
>=20

tested on Odroid-XU4:
[    0.022888] soc soc0: Exynos: CPU[EXYNOS5800] PRO_ID[0xe5422001] REV[0=
x1] Detected

Tested-by: Markus Reichl <m.reichl@fivetechno.de>

Gru=C3=9F,
--=20
Markus Reichl
>=20
> Bartlomiej Zolnierkiewicz (5):
>   ARM: EXYNOS: use chipid driver
>   ARM: EXYNOS: remove soc_is_exynos*() macros
>   ARM: SAMSUNG: remove samsung_rev()
>   ARM: SAMSUNG: remove s5p_init_cpu()
>   ARM: EXYNOS: remove <mach/map.h> include
>=20
> Pankaj Dubey (4):
>   ARM: EXYNOS: remove secondary startup initialization from
>     smp_prepare_cpus
>   soc: samsung: add exynos chipid driver support
>   ARM: EXYNOS: enable exynos_chipid for ARCH_EXYNOS
>   ARM64: EXYNOS: enable exynos_chipid for ARCH_EXYNOS
>=20
>  arch/arm/mach-exynos/Kconfig                 |   1 +
>  arch/arm/mach-exynos/common.h                |  81 ++-----------------=

>  arch/arm/mach-exynos/exynos.c                |  75 ++++++++++--------
>  arch/arm/mach-exynos/firmware.c              |   8 +-
>  arch/arm/mach-exynos/include/mach/map.h      |  18 -----
>  arch/arm/mach-exynos/platsmp.c               |  40 ++--------
>  arch/arm/mach-exynos/pm.c                    |  25 +++---
>  arch/arm/plat-samsung/cpu.c                  |  17 ----
>  arch/arm/plat-samsung/include/plat/cpu.h     |   3 -
>  arch/arm/plat-samsung/include/plat/map-s5p.h |   2 -
>  arch/arm64/Kconfig.platforms                 |   1 +
>  drivers/soc/samsung/Kconfig                  |   5 ++
>  drivers/soc/samsung/Makefile                 |   1 +
>  drivers/soc/samsung/exynos-chipid.c          | 111 +++++++++++++++++++=
++++++++
>  14 files changed, 193 insertions(+), 195 deletions(-)
>  delete mode 100644 arch/arm/mach-exynos/include/mach/map.h
>  create mode 100644 drivers/soc/samsung/exynos-chipid.c
>=20


--6JzAUwaucyoq4BHtIlbwhJhC2LHTC3NNa--

--l19oF13fUYOUnpd0s3oMYCCIQkdnZmEt0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCAAdFiEEVKeIeBh0ZWJOldzLOiXeDmsa/bIFAlvuhrQACgkQOiXeDmsa
/bLsGwv/WpJlAbPX/uARV0BbXmy55U1CDSOjOxZlfF3PedRpq6TwkARYWj5+wlW1
q0t/JRnbrLlzg8zKrNxlJSD3bY0qfXY5f0K890HCTNehekqZdCHi550XauAL0zSG
u0tlw1gVdxEotrpwhwq8SX7TNrXvC71H0iywDve3Np66X7rDbUNLD5x8BU/PGOZY
pm3AIcXpSiWaTYBBrWeaFV04SaZAZ/wYDIqCrOZy/KAc1ESZ1zXaZv70IF39/pmy
ZhA3zwlsOnr1HwgWJO2H53x2NITN9hCR6X401iwBIG9rNmMDenk9LHvki+lxEltz
fNHqlZYqP+2D+d0uFVPvTf+ywZb6EMFy9cgxxvaXmBIB5xNL78XphqSVoccq/0BW
uSblVYtQ8ysyhN0EzqbpsLUf5d+SkS49rQTRNs0N4DcIfQ2ASzeA084TRYm1H4Ef
GFzWcSsZBwt9wnGzOCJn6KKjKtZB0SCU+uHYomUCW4E2Yp8SrrGAxh55ahpHTuIh
upQWXNhu
=/OUC
-----END PGP SIGNATURE-----

--l19oF13fUYOUnpd0s3oMYCCIQkdnZmEt0--


--===============6389884607715144508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6389884607715144508==--
