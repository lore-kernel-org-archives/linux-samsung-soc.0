From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v4 4/5] ARM: dts: add pinctrl support to Exynos5410
Date: Sun, 15 Mar 2015 23:00:33 +0100
Message-ID: <1426456834-6308-5-git-send-email-afaerber@suse.de>
References: <1426456834-6308-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426456834-6308-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, =?UTF-8?q?=EA=B9=80=ED=95=99=EC=A3=BC?= <ruppi.kim@hardkernel.com>, Tomasz Figa <tomasz.figa@gmail.com>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, Ben Gamari <bgamari.foss@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
List-Id: linux-samsung-soc@vger.kernel.org

=46rom: Hakjoo Kim <ruppi.kim@hardkernel.com>

Add the required pin configuration support to Exynos5410 using pinctrl
interface.

Signed-off-by: Hakjoo Kim <ruppi.kim@hardkernel.com>
[AF: Rebased, style changes]
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v2 -> v3:
 * Added wake-up IRQ controller node (Tomasz Figa)
=20
 v1 -> v2:
 * Filled in Sob from Hakjoo Kim
=20
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi | 406 ++++++++++++++++++++++=
++++++++
 arch/arm/boot/dts/exynos5410.dtsi         |  36 +++
 2 files changed, 442 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos5410-pinctrl.dtsi

diff --git a/arch/arm/boot/dts/exynos5410-pinctrl.dtsi b/arch/arm/boot/=
dts/exynos5410-pinctrl.dtsi
new file mode 100644
index 000000000000..f9aa6bb55464
--- /dev/null
+++ b/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
@@ -0,0 +1,406 @@
+/*
+ * Exynos5410 SoC pin-mux and pin-config device tree source
+ *
+ * Copyright (c) 2013 Hardkernel Co., Ltd.
+ *              http://www.hardkernel.com
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+&pinctrl_0 {
+	gpa0: gpa0 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpa1: gpa1 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpa2: gpa2 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpb0: gpb0 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpb1: gpb1 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpb2: gpb2 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpb3: gpb3 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpc0: gpc0 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpc3: gpc3 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpc1: gpc1 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpc2: gpc2 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpm5: gpm5 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+	};
+
+	gpd1: gpd1 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpe0: gpe0 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpe1: gpe1 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpf0: gpf0 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpf1: gpf1 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpg0: gpg0 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpg1: gpg1 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpg2: gpg2 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gph0: gph0 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gph1: gph1 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpm7: gpm7 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+	};
+
+	gpy0: gpy0 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+	};
+
+	gpy1: gpy1 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+	};
+
+	gpy2: gpy2 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+	};
+
+	gpy3: gpy3 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+	};
+
+	gpy4: gpy4 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+	};
+
+	gpy5: gpy5 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+	};
+
+	gpy6: gpy6 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+	};
+
+	gpy7: gpy7 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+	};
+
+	gpx0: gpx0 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		interrupt-parent =3D <&combiner>;
+		#interrupt-cells =3D <2>;
+		interrupts =3D <23 0>,
+		             <24 0>,
+		             <25 0>,
+		             <25 1>,
+		             <26 0>,
+		             <26 1>,
+		             <27 0>,
+		             <27 1>;
+	};
+
+	gpx1: gpx1 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		interrupt-parent =3D <&combiner>;
+		#interrupt-cells =3D <2>;
+		interrupts =3D <28 0>,
+		             <28 1>,
+		             <29 0>,
+		             <29 1>,
+		             <30 0>,
+		             <30 1>,
+		             <31 0>,
+		             <31 1>;
+	};
+
+	gpx2: gpx2 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpx3: gpx3 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+};
+
+&pinctrl_1 {
+	gpj0: gpj0 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpj1: gpj1 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpj2: gpj2 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpj3: gpj3 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpj4: gpj4 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpk0: gpk0 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpk1: gpk1 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpk2: gpk2 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpk3: gpk3 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+};
+
+&pinctrl_2 {
+	gpv0: gpv0 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpv1: gpv1 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpv2: gpv2 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpv3: gpv3 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	gpv4: gpv4 {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+};
+
+&pinctrl_3 {
+	gpz: gpz {
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+};
diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exyn=
os5410.dtsi
index 731eefd23fa9..460335606466 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -21,6 +21,10 @@
 	interrupt-parent =3D <&gic>;
=20
 	aliases {
+		pinctrl0 =3D &pinctrl_0;
+		pinctrl1 =3D &pinctrl_1;
+		pinctrl2 =3D &pinctrl_2;
+		pinctrl3 =3D &pinctrl_3;
 		serial0 =3D &uart0;
 		serial1 =3D &uart1;
 		serial2 =3D &uart2;
@@ -218,4 +222,36 @@
 			status =3D "disabled";
 		};
 	};
+
+	pinctrl_0: pinctrl@13400000 {
+		compatible =3D "samsung,exynos5410-pinctrl";
+		reg =3D <0x13400000 0x1000>;
+		interrupts =3D <0 45 0>;
+
+		wakeup-interrupt-controller {
+			compatible =3D "samsung,exynos4210-wakeup-eint";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 32 0>;
+		};
+	};
+
+	pinctrl_1: pinctrl@14000000 {
+		compatible =3D "samsung,exynos5410-pinctrl";
+		reg =3D <0x14000000 0x1000>;
+		interrupts =3D <0 46 0>;
+	};
+
+	pinctrl_2: pinctrl@10d10000 {
+		compatible =3D "samsung,exynos5410-pinctrl";
+		reg =3D <0x10d10000 0x1000>;
+		interrupts =3D <0 50 0>;
+	};
+
+	pinctrl_3: pinctrl@03860000 {
+		compatible =3D "samsung,exynos5410-pinctrl";
+		reg =3D <0x03860000 0x1000>;
+		interrupts =3D <0 47 0>;
+	};
 };
+
+#include "exynos5410-pinctrl.dtsi"
--=20
2.3.1
