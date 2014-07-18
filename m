From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 3/4] ARM: dts: exynos5250: Fold common ChromeOS parts into Snow
Date: Fri, 18 Jul 2014 19:20:08 +0200
Message-ID: <1405704009-8430-4-git-send-email-afaerber@suse.de>
References: <1405704009-8430-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1405704009-8430-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/SAMSUNG ARM
	A..." <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

The remaining pieces are fairly minor.

Suggested-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v2: New (Doug Anderson)

 arch/arm/boot/dts/exynos5250-cros-common.dtsi | 164 ------------------=
-------
 arch/arm/boot/dts/exynos5250-snow.dts         | 169 ++++++++++++++++++=
++++----
 2 files changed, 148 insertions(+), 185 deletions(-)
 delete mode 100644 arch/arm/boot/dts/exynos5250-cros-common.dtsi

diff --git a/arch/arm/boot/dts/exynos5250-cros-common.dtsi b/arch/arm/b=
oot/dts/exynos5250-cros-common.dtsi
deleted file mode 100644
index e603e9c..0000000
--- a/arch/arm/boot/dts/exynos5250-cros-common.dtsi
+++ /dev/null
@@ -1,164 +0,0 @@
-/*
- * Common device tree include for all Exynos 5250 boards based off of =
Daisy.
- *
- * Copyright (c) 2012 Google, Inc
- *
- * This program is free software; you can redistribute it and/or modif=
y
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-/ {
-	aliases {
-	};
-
-	memory {
-		reg =3D <0x40000000 0x80000000>;
-	};
-
-	chosen {
-	};
-
-	pinctrl@11400000 {
-		/*
-		 * Disabled pullups since external part has its own pullups and
-		 * double-pulling gets us out of spec in some cases.
-		 */
-		i2c2_bus: i2c2-bus {
-			samsung,pin-pud =3D <0>;
-		};
-	};
-
-	i2c@12C60000 {
-		status =3D "okay";
-		samsung,i2c-sda-delay =3D <100>;
-		samsung,i2c-max-bus-freq =3D <378000>;
-	};
-
-	i2c@12C70000 {
-		status =3D "okay";
-		samsung,i2c-sda-delay =3D <100>;
-		samsung,i2c-max-bus-freq =3D <378000>;
-	};
-
-	i2c@12C80000 {
-		status =3D "okay";
-		samsung,i2c-sda-delay =3D <100>;
-		samsung,i2c-max-bus-freq =3D <66000>;
-
-		hdmiddc@50 {
-			compatible =3D "samsung,exynos4210-hdmiddc";
-			reg =3D <0x50>;
-		};
-	};
-
-	i2c@12C90000 {
-		status =3D "okay";
-		samsung,i2c-sda-delay =3D <100>;
-		samsung,i2c-max-bus-freq =3D <66000>;
-	};
-
-	i2c@12CA0000 {
-		status =3D "okay";
-		samsung,i2c-sda-delay =3D <100>;
-		samsung,i2c-max-bus-freq =3D <66000>;
-	};
-
-	i2c@12CB0000 {
-		status =3D "okay";
-		samsung,i2c-sda-delay =3D <100>;
-		samsung,i2c-max-bus-freq =3D <66000>;
-	};
-
-	i2c@12CD0000 {
-		status =3D "okay";
-		samsung,i2c-sda-delay =3D <100>;
-		samsung,i2c-max-bus-freq =3D <66000>;
-	};
-
-	i2c@12CE0000 {
-		status =3D "okay";
-		samsung,i2c-sda-delay =3D <100>;
-		samsung,i2c-max-bus-freq =3D <378000>;
-
-		hdmiphy: hdmiphy@38 {
-			compatible =3D "samsung,exynos4212-hdmiphy";
-			reg =3D <0x38>;
-		};
-	};
-
-	mmc@12200000 {
-		num-slots =3D <1>;
-		supports-highspeed;
-		broken-cd;
-		card-detect-delay =3D <200>;
-		samsung,dw-mshc-ciu-div =3D <3>;
-		samsung,dw-mshc-sdr-timing =3D <2 3>;
-		samsung,dw-mshc-ddr-timing =3D <1 2>;
-		pinctrl-names =3D "default";
-		pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_cd &sd0_bus4 &sd0_bus8>;
-
-		slot@0 {
-			reg =3D <0>;
-			bus-width =3D <8>;
-		};
-	};
-
-	mmc@12220000 {
-		num-slots =3D <1>;
-		supports-highspeed;
-		card-detect-delay =3D <200>;
-		samsung,dw-mshc-ciu-div =3D <3>;
-		samsung,dw-mshc-sdr-timing =3D <2 3>;
-		samsung,dw-mshc-ddr-timing =3D <1 2>;
-		pinctrl-names =3D "default";
-		pinctrl-0 =3D <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
-
-		slot@0 {
-			reg =3D <0>;
-			bus-width =3D <4>;
-			wp-gpios =3D <&gpc2 1 0>;
-		};
-	};
-
-	mmc@12230000 {
-		num-slots =3D <1>;
-		supports-highspeed;
-		broken-cd;
-		card-detect-delay =3D <200>;
-		samsung,dw-mshc-ciu-div =3D <3>;
-		samsung,dw-mshc-sdr-timing =3D <2 3>;
-		samsung,dw-mshc-ddr-timing =3D <1 2>;
-		/* See board-specific dts files for pin setup */
-
-		slot@0 {
-			reg =3D <0>;
-			bus-width =3D <4>;
-		};
-	};
-
-	spi_1: spi@12d30000 {
-		status =3D "okay";
-		samsung,spi-src-clk =3D <0>;
-		num-cs =3D <1>;
-	};
-
-	hdmi {
-		hpd-gpio =3D <&gpx3 7 0>;
-		pinctrl-names =3D "default";
-		pinctrl-0 =3D <&hdmi_hpd_irq>;
-		phy =3D <&hdmiphy>;
-		ddc =3D <&i2c_2>;
-	};
-
-	gpio-keys {
-		compatible =3D "gpio-keys";
-
-		power {
-			label =3D "Power";
-			gpios =3D <&gpx1 3 1>;
-			linux,code =3D <116>; /* KEY_POWER */
-			gpio-key,wakeup;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/=
exynos5250-snow.dts
index f2b8c41..cdf74c5 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -10,7 +10,6 @@
=20
 /dts-v1/;
 #include "exynos5250.dtsi"
-#include "exynos5250-cros-common.dtsi"
=20
 / {
 	model =3D "Google Snow";
@@ -20,6 +19,13 @@
 		i2c104 =3D &i2c_104;
 	};
=20
+	memory {
+		reg =3D <0x40000000 0x80000000>;
+	};
+
+	chosen {
+	};
+
 	rtc@101E0000 {
 		status =3D "okay";
 	};
@@ -93,6 +99,13 @@
 	gpio-keys {
 		compatible =3D "gpio-keys";
=20
+		power {
+			label =3D "Power";
+			gpios =3D <&gpx1 3 1>;
+			linux,code =3D <116>; /* KEY_POWER */
+			gpio-key,wakeup;
+		};
+
 		lid-switch {
 			label =3D "Lid";
 			gpios =3D <&gpx3 5 1>;
@@ -226,26 +239,6 @@
 		};
 	};
=20
-	mmc@12200000 {
-		status =3D "okay";
-	};
-
-	mmc@12220000 {
-		status =3D "okay";
-	};
-
-	/*
-	 * On Snow we've got SIP WiFi and so can keep drive strengths low to
-	 * reduce EMI.
-	 */
-	mmc@12230000 {
-		status =3D "okay";
-		slot@0 {
-			pinctrl-names =3D "default";
-			pinctrl-0 =3D <&sd3_clk &sd3_cmd &sd3_bus4>;
-		};
-	};
-
 	i2c@12CD0000 {
 		max98095: codec@11 {
 			compatible =3D "maxim,max98095";
@@ -314,6 +307,14 @@
 		samsung,invert-vclk;
 	};
=20
+	hdmi {
+		hpd-gpio =3D <&gpx3 7 0>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&hdmi_hpd_irq>;
+		phy =3D <&hdmiphy>;
+		ddc =3D <&i2c_2>;
+	};
+
 	dp-controller@145B0000 {
 		status =3D "okay";
 		pinctrl-names =3D "default";
@@ -345,6 +346,10 @@
 };
=20
 &i2c_0 {
+	status =3D "okay";
+	samsung,i2c-sda-delay =3D <100>;
+	samsung,i2c-max-bus-freq =3D <378000>;
+
 	max77686@09 {
 		compatible =3D "maxim,max77686";
 		interrupt-parent =3D <&gpx3>;
@@ -491,6 +496,10 @@
 };
=20
 &i2c_1 {
+	status =3D "okay";
+	samsung,i2c-sda-delay =3D <100>;
+	samsung,i2c-max-bus-freq =3D <378000>;
+
 	trackpad {
 		reg =3D <0x67>;
 		compatible =3D "cypress,cyapa";
@@ -500,7 +509,119 @@
 	};
 };
=20
+&i2c_2 {
+	status =3D "okay";
+	samsung,i2c-sda-delay =3D <100>;
+	samsung,i2c-max-bus-freq =3D <66000>;
+
+	hdmiddc@50 {
+		compatible =3D "samsung,exynos4210-hdmiddc";
+		reg =3D <0x50>;
+	};
+};
+
+&i2c_3 {
+	status =3D "okay";
+	samsung,i2c-sda-delay =3D <100>;
+	samsung,i2c-max-bus-freq =3D <66000>;
+};
+
+&i2c_4 {
+	status =3D "okay";
+	samsung,i2c-sda-delay =3D <100>;
+	samsung,i2c-max-bus-freq =3D <66000>;
+};
+
+&i2c_5 {
+	status =3D "okay";
+	samsung,i2c-sda-delay =3D <100>;
+	samsung,i2c-max-bus-freq =3D <66000>;
+};
+
+&i2c_7 {
+	status =3D "okay";
+	samsung,i2c-sda-delay =3D <100>;
+	samsung,i2c-max-bus-freq =3D <66000>;
+};
+
+&i2c_8 {
+	status =3D "okay";
+	samsung,i2c-sda-delay =3D <100>;
+	samsung,i2c-max-bus-freq =3D <378000>;
+
+	hdmiphy: hdmiphy@38 {
+		compatible =3D "samsung,exynos4212-hdmiphy";
+		reg =3D <0x38>;
+	};
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
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_cd &sd0_bus4 &sd0_bus8>;
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
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
+
+	slot@0 {
+		reg =3D <0>;
+		bus-width =3D <4>;
+		wp-gpios =3D <&gpc2 1 0>;
+	};
+};
+
+/*
+ * On Snow we've got SIP WiFi and so can keep drive strengths low to
+ * reduce EMI.
+ */
+&mmc_3 {
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
+		bus-width =3D <4>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&sd3_clk &sd3_cmd &sd3_bus4>;
+	};
+};
+
 &pinctrl_0 {
+	/*
+	 * Disabled pullups since external part has its own pullups and
+	 * double-pulling gets us out of spec in some cases.
+	 */
+	i2c2_bus: i2c2-bus {
+		samsung,pin-pud =3D <0>;
+	};
+
 	max77686_irq: max77686-irq {
 		samsung,pins =3D "gpx3-2";
 		samsung,pin-function =3D <0>;
@@ -509,4 +630,10 @@
 	};
 };
=20
+&spi_1 {
+	status =3D "okay";
+	samsung,spi-src-clk =3D <0>;
+	num-cs =3D <1>;
+};
+
 #include "cros-ec-keyboard.dtsi"
--=20
1.9.3
