From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [RESEND][PATCH] ARM: dts: exynos4412-odroid: add 'rtc_src' clock
 to rtc node
Date: Fri, 08 May 2015 11:34:17 +0200
Message-ID: <554C8319.70203@fivetechno.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="tBsKNrqL53QKW45V4XHUNlVuDOAic1cvb"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:35459 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750968AbbEHJeW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 May 2015 05:34:22 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: m.reichl@fivetechno.de, javier.martinez@collabora.co.uk, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tBsKNrqL53QKW45V4XHUNlVuDOAic1cvb
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Exynos4412 SoC has a s3c6410 RTC where the source clock
is now a mandatory property.

This patch fixes probe failure of s3c-rtc on Odroid-X2/U2/U3 boards.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/b=
oot/dts/exynos4412-odroid-common.dtsi
index 1ff4c88..0a8e6aa4 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -9,6 +9,7 @@
=20
 #include <dt-bindings/sound/samsung-i2s.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/clock/maxim,max77686.h>
 #include "exynos4412.dtsi"
=20
 / {
@@ -143,6 +144,8 @@
=20
 	rtc@10070000 {
 		status =3D "okay";
+		clocks =3D <&clock CLK_RTC>, <&max77686 MAX77686_CLK_AP>;
+		clock-names =3D "rtc", "rtc_src";
 	};
=20
 	g2d@10800000 {
--=20
2.0.5





--tBsKNrqL53QKW45V4XHUNlVuDOAic1cvb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlVMgxkACgkQ7DLr+WDJfp61MACdGkO0FN/BSJosHrl9vXe9IV2C
1GYAoKJKBxN8YP4g+VWJ5HsobiWqRzPf
=mozO
-----END PGP SIGNATURE-----

--tBsKNrqL53QKW45V4XHUNlVuDOAic1cvb--
