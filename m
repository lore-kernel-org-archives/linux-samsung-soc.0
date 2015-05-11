From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [PATCH v2] ARM: dts: Add HS400 support for exynos5422-odroidxu3
Date: Mon, 11 May 2015 15:49:16 +0200
Message-ID: <5550B35C.7040302@fivetechno.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="rm7x4OS7edDvTx1UklRmxdwV4Gtvi3Ujo"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:46125 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754457AbbEKNt3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 May 2015 09:49:29 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Anand Moon <linux.amoon@gmail.com>, Markus Reichl <m.reichl@fivetechno.de>, 'Jaehoon Chung' <jh80.chung@samsung.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rm7x4OS7edDvTx1UklRmxdwV4Gtvi3Ujo
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

HS400 timing values are added for exynos5422-odroidxu3 board.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
Acked-by: Jaehoon Chung <jh80.chung@samsung.com>
---
Changes since v1:
1. Dropped num_slots
2. Rebased onto 4.1-rc3
3. Added Acked-by tag
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/d=
ts/exynos5422-odroidxu3.dts
index edc25cf..cf86ab2 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -311,10 +311,14 @@
 	samsung,dw-mshc-ciu-div =3D <3>;
 	samsung,dw-mshc-sdr-timing =3D <0 4>;
 	samsung,dw-mshc-ddr-timing =3D <0 2>;
+	samsung,dw-mshc-hs400-timing =3D <0 2>;
+	samsung,read-strobe-delay =3D <90>;
 	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+	pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8 &sd0_rcl=
k>;
 	bus-width =3D <8>;
 	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
 };
=20
 &mmc_2 {
--=20
1.9.1



--rm7x4OS7edDvTx1UklRmxdwV4Gtvi3Ujo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlVQs2QACgkQ7DLr+WDJfp5h0wCgqnCthM23Eqs4PwvPAfd0ZPJW
+IUAn2YWUA0+JnEqlTzFLPtJjusb7RJP
=Zg/X
-----END PGP SIGNATURE-----

--rm7x4OS7edDvTx1UklRmxdwV4Gtvi3Ujo--
