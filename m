From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 2/5] ARM: dts: exynos5410: Prepare ODROID-XU device tree
Date: Mon, 28 Jul 2014 14:18:09 +0200
Message-ID: <1406549892-5558-3-git-send-email-afaerber@suse.de>
References: <1406549892-5558-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406549892-5558-1-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hakjoo Kim <ruppi.kim-vC+yAUbXFBlQ0OI7PeSoCw@public.gmane.org>
Cc: Tarek Dakhran <t.dakhran-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Derived from exynos5410-smdk5410.dts.

Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                |  1 +
 arch/arm/boot/dts/exynos5410-odroidxu.dts | 86 +++++++++++++++++++++++=
++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos5410-odroidxu.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 80a781f76e88..13fb64eeee10 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -77,6 +77,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) +=3D exynos4210-origen.dtb =
\
 	exynos5250-smdk5250.dtb \
 	exynos5250-snow.dtb \
 	exynos5260-xyref5260.dtb \
+	exynos5410-odroidxu.dtb \
 	exynos5410-smdk5410.dtb \
 	exynos5420-arndale-octa.dtb \
 	exynos5420-peach-pit.dtb \
diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/=
dts/exynos5410-odroidxu.dts
new file mode 100644
index 000000000000..b67112bf062a
--- /dev/null
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -0,0 +1,86 @@
+/*
+ * Hardkernel ODROID-XU device tree source
+ *
+ * Copyright (c) 2014 SUSE LINUX Products GmbH
+ *
+ * Based on exynos5410-smdk5410.dts:
+ *
+ * Copyright (c) 2013 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+/dts-v1/;
+#include "exynos5410.dtsi"
+/ {
+	model =3D "ODROID-XU based on EXYNOS5410";
+	compatible =3D "hardkernel,odroid-xu", "samsung,exynos5410", "samsung=
,exynos5";
+
+	memory {
+		reg =3D <0x40000000 0x80000000>;
+	};
+
+	chosen {
+		bootargs =3D "console=3DttySAC2,115200";
+	};
+
+	fin_pll: xxti {
+		compatible =3D "fixed-clock";
+		clock-frequency =3D <24000000>;
+		clock-output-names =3D "fin_pll";
+		#clock-cells =3D <0>;
+	};
+
+	firmware@02037000 {
+		compatible =3D "samsung,secure-firmware";
+		reg =3D <0x02037000 0x1000>;
+	};
+
+};
+
+&mmc_0 {
+	status =3D "okay";
+	num-slots =3D <1>;
+	supports-highspeed;
+	broken-cd;
+	card-detect-delay =3D <200>;
+	samsung,dw-mshc-ciu-div =3D <3>;
+	samsung,dw-mshc-sdr-timing =3D <2 3>;
+	samsung,dw-mshc-ddr-timing =3D <1 2>;
+
+	slot@0 {
+		reg =3D <0>;
+		bus-width =3D <8>;
+	};
+};
+
+&mmc_2 {
+	status =3D "okay";
+	num-slots =3D <1>;
+	supports-highspeed;
+	card-detect-delay =3D <200>;
+	samsung,dw-mshc-ciu-div =3D <3>;
+	samsung,dw-mshc-sdr-timing =3D <2 3>;
+	samsung,dw-mshc-ddr-timing =3D <1 2>;
+
+	slot@0 {
+		reg =3D <0>;
+		bus-width =3D <4>;
+		disable-wp;
+	};
+};
+
+&uart0 {
+	status =3D "okay";
+};
+
+&uart1 {
+	status =3D "okay";
+};
+
+&uart2 {
+	status =3D "okay";
+};
--=20
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
