From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [RESEND][PATCH 1/1] ARM: dts: Add HS400 support for exynos5422-odroidxu3
Date: Fri, 08 May 2015 09:40:19 +0200
Message-ID: <554C6863.5060706@fivetechno.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="nxVIkclFtoaVDAvKp2KBoVGBIa49phStp"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:46317 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751319AbbEHHkV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 May 2015 03:40:21 -0400
Received: from [192.168.34.101] (reichl-x64.fritz.box [192.168.34.101])
	(authenticated bits=0)
	by linuxbbg.five-lan.de (8.14.9/8.14.5/SuSE Linux 0.8) with ESMTP id t487eJl4026392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 8 May 2015 09:40:19 +0200
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nxVIkclFtoaVDAvKp2KBoVGBIa49phStp
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

HS400 timing values are added for exynos5422-odroidxu3 board.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
Tested-by: Anand Moon <linux.amoon@gmail.com>
---
This patch is analog to [0], which is applied already.
This patch needs [0] for the pin-ctrl definition of sd0_rclk.

[0]: https://www.mail-archive.com/linux-samsung-soc%40vger.kernel.org/msg=
42902.html
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/d=
ts/exynos5422-odroidxu3.dts
index a519c86..0408ec0 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -298,15 +298,20 @@
=20
 &mmc_0 {
 	status =3D "okay";
+	num-slots =3D <1>;
 	broken-cd;
 	card-detect-delay =3D <200>;
 	samsung,dw-mshc-ciu-div =3D <3>;
 	samsung,dw-mshc-sdr-timing =3D <0 4>;
 	samsung,dw-mshc-ddr-timing =3D <0 2>;
+	samsung,dw-mshc-hs400-timing =3D <0 2>;
+	samsung,read-strobe-delay =3D <90>;
 	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
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



--nxVIkclFtoaVDAvKp2KBoVGBIa49phStp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlVMaGMACgkQ7DLr+WDJfp66pwCglECXb8317T34J400AvA+B9uw
5kQAn3UjwPnQALJQhxhYkbzPS/NXnPEW
=ToJc
-----END PGP SIGNATURE-----

--nxVIkclFtoaVDAvKp2KBoVGBIa49phStp--
