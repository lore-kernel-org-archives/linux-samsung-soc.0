From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v4 5/5] ARM: dts: Add LEDs to exynos5410-odroidxu
Date: Sun, 15 Mar 2015 23:00:34 +0100
Message-ID: <1426456834-6308-6-git-send-email-afaerber@suse.de>
References: <1426456834-6308-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53532 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752043AbbCOWAs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 15 Mar 2015 18:00:48 -0400
In-Reply-To: <1426456834-6308-1-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, =?UTF-8?q?=EA=B9=80=ED=95=99=EC=A3=BC?= <ruppi.kim@hardkernel.com>, Tomasz Figa <tomasz.figa@gmail.com>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, Ben Gamari <bgamari.foss@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>

Signed-off-by: Hakjoo Kim <ruppi.kim@hardkernel.com>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v2 -> v3: Unchanged
=20
 v1 -> v2:
 * Filled in Sob from Hakjoo Kim
=20
 arch/arm/boot/dts/exynos5410-odroidxu.dts | 25 +++++++++++++++++++++++=
++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/=
dts/exynos5410-odroidxu.dts
index 97310bb727e2..b02cd3ab7b38 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -15,6 +15,7 @@
=20
 /dts-v1/;
 #include "exynos5410.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 / {
 	model =3D "ODROID-XU based on EXYNOS5410";
 	compatible =3D "hardkernel,odroid-xu", "samsung,exynos5410", "samsung=
,exynos5";
@@ -39,6 +40,30 @@
 		reg =3D <0x02037000 0x1000>;
 	};
=20
+	leds {
+		compatible =3D "gpio-leds";
+
+		blue {
+			label =3D "blue:heartbeat";
+			gpios =3D <&gpb2 2 GPIO_ACTIVE_HIGH>;
+			default-state =3D "off";
+			linux,default-trigger =3D "heartbeat";
+		};
+
+		green {
+			label =3D "green:activity";
+			gpios =3D <&gpb2 1 GPIO_ACTIVE_HIGH>;
+			default-state =3D "off";
+			linux,default-trigger =3D "mmc0";
+		};
+
+		red {
+			label =3D "red:activity";
+			gpios =3D <&gpx2 3 GPIO_ACTIVE_HIGH>;
+			default-state =3D "off";
+			linux,default-trigger =3D "mmc1";
+		};
+	};
 };
=20
 &mmc_0 {
--=20
2.3.1
