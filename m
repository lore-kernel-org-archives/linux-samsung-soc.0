From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [RESEND] [PATCH 1/1] ARM: dts: Add LEDs on odroid XU3 board
Date: Fri, 08 May 2015 09:34:12 +0200
Message-ID: <554C66F4.4070005@fivetechno.de>
Reply-To: m.reichl@fivetechno.de
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="wghd0a3xKfaa2wLO7fonCLKXckBjKL0Jd"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:41418 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750725AbbEHHeW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 May 2015 03:34:22 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Anand Moon <linux.amoon@gmail.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wghd0a3xKfaa2wLO7fonCLKXckBjKL0Jd
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch adds the RGB-LED on XU3 as 3 gpio-leds.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
---
It is derived from hardkernel's 3.10 tree.
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 24 ++++++++++++++++++++++++=

 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/d=
ts/exynos5422-odroidxu3.dts
index a519c86..0a32302 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -278,6 +278,30 @@
 	rtc@101E0000 {
 		status =3D "okay";
 	};
+
+	leds {
+		compatible =3D "gpio-leds";
+		heartbeat {
+			label =3D "blue:heartbeart";
+			gpios =3D <&gpb2 2 0>;
+			default-state =3D "off";
+			linux,default-trigger =3D "heartbeat";
+		};
+
+		eMMC {
+			label =3D "green:eMMC";
+			gpios =3D <&gpb2 1 0>;
+			default-state =3D "off";
+			linux,default-trigger =3D "mmc0";
+		};
+
+		microSD {
+			label =3D "red:microSD";
+			gpios =3D <&gpx2 3 0>;
+			default-state =3D "off";
+			linux,default-trigger =3D "mmc1";
+		};
+	};
 };
=20
 &hdmi {
--=20
1.9.1




--wghd0a3xKfaa2wLO7fonCLKXckBjKL0Jd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlVMZvoACgkQ7DLr+WDJfp5B4ACgr1PUnXf1wCQJgRxf2BblW1yS
O18AmwdXwd6jrFZoAifPWoeEr9ECI3kI
=sgBs
-----END PGP SIGNATURE-----

--wghd0a3xKfaa2wLO7fonCLKXckBjKL0Jd--
