From: Jochen Sprickerhof <git@jochen.sprickerhof.de>
Subject: [PATCH] ARM: dts: exynos: Use dwc3 quirk for USB3 and LAN on Odroid
 XU4
Date: Sat, 30 Sep 2017 16:54:54 +0200
Message-ID: <20170930145454.sm2zpwonemlfsemo@vis>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dcm7oqzhrdh4s5b3"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay01.ispgateway.de ([80.67.31.24]:60770 "EHLO
        smtprelay01.ispgateway.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751048AbdI3PNm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 30 Sep 2017 11:13:42 -0400
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Vagrant Cascadian <vagrant@debian.org>


--dcm7oqzhrdh4s5b3
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Without this, the USB3 and LAN ports don't show up.

See also https://bugs.debian.org/843448

This was first proposed in https://lkml.org/lkml/2015/3/18/400 but for
exynos5420.dtsi. I only tested it on Odroid XU4, so I propose it only
for that board. Also I found the dis_u2_susphy_quirk to make no
difference, so it's not included.

A second proposal is in https://lkml.org/lkml/2017/1/24/402, but only
for USB3, not for the LAN port.

Signed-off-by: Jochen Sprickerhof <git@jochen.sprickerhof.de>
---
 arch/arm/boot/dts/exynos5422-odroidxu4.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu4.dts b/arch/arm/boot/dts=
/exynos5422-odroidxu4.dts
index 2faf88627a48..30fc4d35422e 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu4.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
@@ -43,6 +43,13 @@
 	status =3D "okay";
 };
=20
+&usbdrd_dwc3_0 {
+	/* quirk is needed to make USB3 ports work */
+	snps,dis_u3_susphy_quirk;
+};
+
 &usbdrd_dwc3_1 {
 	dr_mode =3D "host";
+	/* quirk is needed to make LAN port work */
+	snps,dis_u3_susphy_quirk;
 };
--=20
2.14.2


--dcm7oqzhrdh4s5b3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEc7KZy9TurdzAF+h6W//cwljmlDMFAlnPsDcACgkQW//cwljm
lDMFAQ//SQNezDJM3LtGNAQ5AsK1KSWqf8CLvKeRX0QgFZ25c4HWzsO6ygmjU85N
b9zyOJrAuh/lGF3JKhYXLPbtjZxdj8Wpf85yFlQcmSeb/LqXnOSXhiTKY663Z7ya
oA87MLVsbK/0vwbHygTcMNbcEXQwc57VXhg0JWmNdfxnt8KN7WBGf1N3BpquZafz
qKkjaq6Mo2LdbIhg9vCISHRiMB2lS63Xku+kuUgqY/f6aIKuud+mW6p7zuvPNcVb
pi5e52WYMbRohPqzJ3z204XMr/z+JaS1nD6us0FYVBWOfPvtf5pKzFEBh/ftYWfo
4+/8yzkNhSPq8fAugDTSak4UsY0xg3TidJo3PpkvEFEmMwdV33LP73ec7a1iik5N
QaS0WUmHHoipo0VObGkn599YTFllqbUIyTgiDJ4lv6Mvrhqa+5tPetM7qCQfGK2t
Gjs1w7ov/9JkHtEHDpF398jNRabo7QusyrQCs2Sg10weePFeZwuwDadycv8yH7MX
HibgfneLwQzAvJlJUVtCKm6ODDg5vO4HDpotpa/3XHb965hDlcIt22oLjGsEkHYl
ybAeEvo0wiVrgrdpbQcD84dvG6dTxOS2NiZXWiXSXg7syBIZZkY5WjerV4e7qy5j
VPwXCSFy6iyRx1Y06sp8zqjUrVRobj1YF0erqk9PSfsA+pDsIFo=
=Sa7N
-----END PGP SIGNATURE-----

--dcm7oqzhrdh4s5b3--
