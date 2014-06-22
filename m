From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH] ARM: dts: exynos5410: Fill in CPU clock-frequency
Date: Sun, 22 Jun 2014 21:49:55 +0200
Message-ID: <1403466596-3347-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Tarek Dakhran <t.dakhran-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "moderated list:ARM/SAMSUNG ARM
	A..." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

It's 1.6 GHz for the Cortex-A15.

Avoids warnings like "/cpus/cpu@0 missing clock-frequency property".

Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 arch/arm/boot/dts/exynos5410.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exyn=
os5410.dtsi
index 3839c26..9d0b8cc 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -28,24 +28,28 @@
 			device_type =3D "cpu";
 			compatible =3D "arm,cortex-a15";
 			reg =3D <0x0>;
+			clock-frequency =3D <1600000000>;
 		};
=20
 		CPU1: cpu@1 {
 			device_type =3D "cpu";
 			compatible =3D "arm,cortex-a15";
 			reg =3D <0x1>;
+			clock-frequency =3D <1600000000>;
 		};
=20
 		CPU2: cpu@2 {
 			device_type =3D "cpu";
 			compatible =3D "arm,cortex-a15";
 			reg =3D <0x2>;
+			clock-frequency =3D <1600000000>;
 		};
=20
 		CPU3: cpu@3 {
 			device_type =3D "cpu";
 			compatible =3D "arm,cortex-a15";
 			reg =3D <0x3>;
+			clock-frequency =3D <1600000000>;
 		};
 	};
=20
--=20
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
