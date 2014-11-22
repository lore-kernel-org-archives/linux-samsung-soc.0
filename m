From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 5/5] ARM: dts: exynos5410: Add ODROID-XU LEDs
Date: Sat, 22 Nov 2014 21:26:24 +0100
Message-ID: <1416687984-3546-6-git-send-email-afaerber@suse.de>
References: <1416687984-3546-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416687984-3546-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, =?UTF-8?q?=EA=B9=80=ED=95=99=EC=A3=BC?= <ruppi.kim@hardkernel.com>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Hakjoo Kim <ruppi.kim@hardkernel.com>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
v1 -> v2:
* Filled in Sob from Hakjoo Kim

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
2.1.2
