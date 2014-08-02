From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v6 07/10] ARM: dts: Clean up exynos5250-arndale
Date: Sat,  2 Aug 2014 02:52:27 +0200
Message-ID: <1406940750-15880-8-git-send-email-afaerber@suse.de>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406940750-15880-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Use the new style of referencing inherited nodes, use symbolic names,
tidy indentation and reorder includes.

Goal is the alignment of all exynos5250 based device trees for comparis=
on.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v5 -> v6:
 * Updated for mfc node label
=20
 v5: New
 Aligns with SMDK.

 arch/arm/boot/dts/exynos5250-arndale.dts | 929 ++++++++++++++++-------=
--------
 1 file changed, 466 insertions(+), 463 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/d=
ts/exynos5250-arndale.dts
index d0de1f50d15b..aac41c394d43 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -7,12 +7,13 @@
  * This program is free software; you can redistribute it and/or modif=
y
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
-*/
+ */
=20
 /dts-v1/;
-#include "exynos5250.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/input/input.h>
+#include "exynos5250.dtsi"
=20
 / {
 	model =3D "Insignal Arndale evaluation board based on EXYNOS5250";
@@ -26,473 +27,52 @@
 		bootargs =3D "console=3DttySAC2,115200";
 	};
=20
-	rtc@101E0000 {
-		status =3D "okay";
-	};
-
-	codec@11000000 {
-		samsung,mfc-r =3D <0x43000000 0x800000>;
-		samsung,mfc-l =3D <0x51000000 0x800000>;
-	};
-
-	i2c@12C60000 {
-		samsung,i2c-sda-delay =3D <100>;
-		samsung,i2c-max-bus-freq =3D <20000>;
-		samsung,i2c-slave-addr =3D <0x66>;
-		status =3D "okay";
-
-		s5m8767_pmic@66 {
-			compatible =3D "samsung,s5m8767-pmic";
-			reg =3D <0x66>;
-			interrupt-parent =3D <&gpx3>;
-			interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
-
-			vinb1-supply =3D <&main_dc_reg>;
-			vinb2-supply =3D <&main_dc_reg>;
-			vinb3-supply =3D <&main_dc_reg>;
-			vinb4-supply =3D <&main_dc_reg>;
-			vinb5-supply =3D <&main_dc_reg>;
-			vinb6-supply =3D <&main_dc_reg>;
-			vinb7-supply =3D <&main_dc_reg>;
-			vinb8-supply =3D <&main_dc_reg>;
-			vinb9-supply =3D <&main_dc_reg>;
-
-			vinl1-supply =3D <&buck7_reg>;
-			vinl2-supply =3D <&buck7_reg>;
-			vinl3-supply =3D <&buck7_reg>;
-			vinl4-supply =3D <&main_dc_reg>;
-			vinl5-supply =3D <&main_dc_reg>;
-			vinl6-supply =3D <&main_dc_reg>;
-			vinl7-supply =3D <&main_dc_reg>;
-			vinl8-supply =3D <&buck8_reg>;
-			vinl9-supply =3D <&buck8_reg>;
-
-			s5m8767,pmic-buck2-dvs-voltage =3D <1300000>;
-			s5m8767,pmic-buck3-dvs-voltage =3D <1100000>;
-			s5m8767,pmic-buck4-dvs-voltage =3D <1200000>;
-			s5m8767,pmic-buck-dvs-gpios =3D <&gpd1 0 0>,
-							<&gpd1 1 0>,
-							<&gpd1 2 0>;
-			s5m8767,pmic-buck-ds-gpios =3D <&gpx2 3 0>,
-							<&gpx2 4 0>,
-							<&gpx2 5 0>;
-			regulators {
-				ldo1_reg: LDO1 {
-					regulator-name =3D "VDD_ALIVE_1.0V";
-					regulator-min-microvolt =3D <1100000>;
-					regulator-max-microvolt =3D <1100000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				ldo2_reg: LDO2 {
-					regulator-name =3D "VDD_28IO_DP_1.35V";
-					regulator-min-microvolt =3D <1200000>;
-					regulator-max-microvolt =3D <1200000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				ldo3_reg: LDO3 {
-					regulator-name =3D "VDD_COMMON1_1.8V";
-					regulator-min-microvolt =3D <1800000>;
-					regulator-max-microvolt =3D <1800000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				ldo4_reg: LDO4 {
-					regulator-name =3D "VDD_IOPERI_1.8V";
-					regulator-min-microvolt =3D <1800000>;
-					regulator-max-microvolt =3D <1800000>;
-					regulator-always-on;
-					op_mode =3D <1>;
-				};
-
-				ldo5_reg: LDO5 {
-					regulator-name =3D "VDD_EXT_1.8V";
-					regulator-min-microvolt =3D <1800000>;
-					regulator-max-microvolt =3D <1800000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				ldo6_reg: LDO6 {
-					regulator-name =3D "VDD_MPLL_1.1V";
-					regulator-min-microvolt =3D <1100000>;
-					regulator-max-microvolt =3D <1100000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				ldo7_reg: LDO7 {
-					regulator-name =3D "VDD_XPLL_1.1V";
-					regulator-min-microvolt =3D <1100000>;
-					regulator-max-microvolt =3D <1100000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				ldo8_reg: LDO8 {
-					regulator-name =3D "VDD_COMMON2_1.0V";
-					regulator-min-microvolt =3D <1000000>;
-					regulator-max-microvolt =3D <1000000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				ldo9_reg: LDO9 {
-					regulator-name =3D "VDD_33ON_3.0V";
-					regulator-min-microvolt =3D <3000000>;
-					regulator-max-microvolt =3D <3000000>;
-					op_mode =3D <1>;
-				};
-
-				ldo10_reg: LDO10 {
-					regulator-name =3D "VDD_COMMON3_1.8V";
-					regulator-min-microvolt =3D <1800000>;
-					regulator-max-microvolt =3D <1800000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				ldo11_reg: LDO11 {
-					regulator-name =3D "VDD_ABB2_1.8V";
-					regulator-min-microvolt =3D <1800000>;
-					regulator-max-microvolt =3D <1800000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				ldo12_reg: LDO12 {
-					regulator-name =3D "VDD_USB_3.0V";
-					regulator-min-microvolt =3D <3000000>;
-					regulator-max-microvolt =3D <3000000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				ldo13_reg: LDO13 {
-					regulator-name =3D "VDDQ_C2C_W_1.8V";
-					regulator-min-microvolt =3D <1800000>;
-					regulator-max-microvolt =3D <1800000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				ldo14_reg: LDO14 {
-					regulator-name =3D "VDD18_ABB0_3_1.8V";
-					regulator-min-microvolt =3D <1800000>;
-					regulator-max-microvolt =3D <1800000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				ldo15_reg: LDO15 {
-					regulator-name =3D "VDD10_COMMON4_1.0V";
-					regulator-min-microvolt =3D <1000000>;
-					regulator-max-microvolt =3D <1000000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				ldo16_reg: LDO16 {
-					regulator-name =3D "VDD18_HSIC_1.8V";
-					regulator-min-microvolt =3D <1800000>;
-					regulator-max-microvolt =3D <1800000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				ldo17_reg: LDO17 {
-					regulator-name =3D "VDDQ_MMC2_3_2.8V";
-					regulator-min-microvolt =3D <2800000>;
-					regulator-max-microvolt =3D <2800000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				ldo18_reg: LDO18 {
-					regulator-name =3D "VDD_33ON_2.8V";
-					regulator-min-microvolt =3D <2800000>;
-					regulator-max-microvolt =3D <2800000>;
-					op_mode =3D <1>;
-				};
-
-				ldo22_reg: LDO22 {
-					regulator-name =3D "EXT_33_OFF";
-					regulator-min-microvolt =3D <3300000>;
-					regulator-max-microvolt =3D <3300000>;
-					op_mode =3D <1>;
-				};
-
-				ldo23_reg: LDO23 {
-					regulator-name =3D "EXT_28_OFF";
-					regulator-min-microvolt =3D <2800000>;
-					regulator-max-microvolt =3D <2800000>;
-					op_mode =3D <1>;
-				};
-
-				ldo25_reg: LDO25 {
-					regulator-name =3D "PVDD_LDO25";
-					regulator-min-microvolt =3D <1200000>;
-					regulator-max-microvolt =3D <1200000>;
-					op_mode =3D <1>;
-				};
-
-				ldo26_reg: LDO26 {
-					regulator-name =3D "EXT_18_OFF";
-					regulator-min-microvolt =3D <1800000>;
-					regulator-max-microvolt =3D <1800000>;
-					op_mode =3D <1>;
-				};
-
-				buck1_reg: BUCK1 {
-					regulator-name =3D "vdd_mif";
-					regulator-min-microvolt =3D <950000>;
-					regulator-max-microvolt =3D <1200000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				buck2_reg: BUCK2 {
-					regulator-name =3D "vdd_arm";
-					regulator-min-microvolt =3D <912500>;
-					regulator-max-microvolt =3D <1300000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				buck3_reg: BUCK3 {
-					regulator-name =3D "vdd_int";
-					regulator-min-microvolt =3D <900000>;
-					regulator-max-microvolt =3D <1200000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				buck4_reg: BUCK4 {
-					regulator-name =3D "vdd_g3d";
-					regulator-min-microvolt =3D <1000000>;
-					regulator-max-microvolt =3D <1000000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				buck5_reg: BUCK5 {
-					regulator-name =3D "VDD_MEM_1.35V";
-					regulator-min-microvolt =3D <750000>;
-					regulator-max-microvolt =3D <1355000>;
-					regulator-always-on;
-					regulator-boot-on;
-					op_mode =3D <1>;
-				};
-
-				buck7_reg: BUCK7 {
-					regulator-name =3D "PVDD_BUCK7";
-					regulator-always-on;
-					op_mode =3D <1>;
-				};
-
-				buck8_reg: BUCK8 {
-					regulator-name =3D "PVDD_BUCK8";
-					regulator-always-on;
-					op_mode =3D <1>;
-				};
-
-				buck9_reg: BUCK9 {
-					regulator-name =3D "VDD_33_OFF_EXT1";
-					regulator-min-microvolt =3D <750000>;
-					regulator-max-microvolt =3D <3000000>;
-					op_mode =3D <1>;
-				};
-			};
-		};
-	};
-
-	i2c@12C80000 {
-		status =3D "okay";
-
-		samsung,i2c-sda-delay =3D <100>;
-		samsung,i2c-max-bus-freq =3D <66000>;
-		samsung,i2c-slave-addr =3D <0x50>;
-
-		hdmiddc@50 {
-			compatible =3D "samsung,exynos4210-hdmiddc";
-			reg =3D <0x50>;
-		};
-	};
-
-	i2c@12C90000 {
-		status =3D "okay";
-
-		wm1811a@1a {
-
-			compatible =3D "wlf,wm1811";
-			reg =3D <0x1a>;
-
-			AVDD2-supply =3D <&main_dc_reg>;
-			CPVDD-supply =3D <&main_dc_reg>;
-			DBVDD1-supply =3D <&main_dc_reg>;
-			DBVDD2-supply =3D <&main_dc_reg>;
-			DBVDD3-supply =3D <&main_dc_reg>;
-			LDO1VDD-supply =3D <&main_dc_reg>;
-			SPKVDD1-supply =3D <&main_dc_reg>;
-			SPKVDD2-supply =3D <&main_dc_reg>;
-
-			wlf,ldo1ena =3D <&gpb0 0 0>;
-			wlf,ldo2ena =3D <&gpb0 1 0>;
-		};
-	};
-
-	i2c@12CE0000 {
-		status =3D "okay";
-
-		samsung,i2c-sda-delay =3D <100>;
-		samsung,i2c-max-bus-freq =3D <66000>;
-		samsung,i2c-slave-addr =3D <0x38>;
-
-		hdmiphy@38 {
-			compatible =3D "samsung,exynos4212-hdmiphy";
-			reg =3D <0x38>;
-		};
-	};
-
-	i2c@121D0000 {
-		status =3D "okay";
-		samsung,i2c-sda-delay =3D <100>;
-		samsung,i2c-max-bus-freq =3D <40000>;
-		samsung,i2c-slave-addr =3D <0x38>;
-
-		sata_phy_i2c:sata-phy@38 {
-			compatible =3D "samsung,exynos-sataphy-i2c";
-			reg =3D <0x38>;
-		};
-	};
-
-	sata@122F0000 {
-		status =3D "okay";
-	};
-
-	sata-phy@12170000 {
-		status =3D "okay";
-		samsung,exynos-sataphy-i2c-phandle =3D <&sata_phy_i2c>;
-	};
-
-	mmc_0: mmc@12200000 {
-		status =3D "okay";
-		num-slots =3D <1>;
-		supports-highspeed;
-		broken-cd;
-		card-detect-delay =3D <200>;
-		samsung,dw-mshc-ciu-div =3D <3>;
-		samsung,dw-mshc-sdr-timing =3D <2 3>;
-		samsung,dw-mshc-ddr-timing =3D <1 2>;
-		vmmc-supply =3D <&mmc_reg>;
-		pinctrl-names =3D "default";
-		pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
-
-		slot@0 {
-			reg =3D <0>;
-			bus-width =3D <8>;
-		};
-	};
-
-	mmc_2: mmc@12220000 {
-		status =3D "okay";
-		num-slots =3D <1>;
-		supports-highspeed;
-		card-detect-delay =3D <200>;
-		samsung,dw-mshc-ciu-div =3D <3>;
-		samsung,dw-mshc-sdr-timing =3D <2 3>;
-		samsung,dw-mshc-ddr-timing =3D <1 2>;
-		vmmc-supply =3D <&mmc_reg>;
-		pinctrl-names =3D "default";
-		pinctrl-0 =3D <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
-
-		slot@0 {
-			reg =3D <0>;
-			bus-width =3D <4>;
-			disable-wp;
-		};
-	};
-
-	i2s0: i2s@03830000 {
-		status =3D "okay";
-	};
-
 	gpio_keys {
 		compatible =3D "gpio-keys";
=20
 		menu {
 			label =3D "SW-TACT2";
-			gpios =3D <&gpx1 4 1>;
+			gpios =3D <&gpx1 4 GPIO_ACTIVE_LOW>;
 			linux,code =3D <KEY_MENU>;
 			gpio-key,wakeup;
 		};
=20
 		home {
 			label =3D "SW-TACT3";
-			gpios =3D <&gpx1 5 1>;
+			gpios =3D <&gpx1 5 GPIO_ACTIVE_LOW>;
 			linux,code =3D <KEY_HOME>;
 			gpio-key,wakeup;
 		};
=20
 		up {
 			label =3D "SW-TACT4";
-			gpios =3D <&gpx1 6 1>;
+			gpios =3D <&gpx1 6 GPIO_ACTIVE_LOW>;
 			linux,code =3D <KEY_UP>;
 			gpio-key,wakeup;
 		};
=20
 		down {
 			label =3D "SW-TACT5";
-			gpios =3D <&gpx1 7 1>;
+			gpios =3D <&gpx1 7 GPIO_ACTIVE_LOW>;
 			linux,code =3D <KEY_DOWN>;
 			gpio-key,wakeup;
 		};
=20
 		back {
 			label =3D "SW-TACT6";
-			gpios =3D <&gpx2 0 1>;
+			gpios =3D <&gpx2 0 GPIO_ACTIVE_LOW>;
 			linux,code =3D <KEY_BACK>;
 			gpio-key,wakeup;
 		};
=20
 		wakeup {
 			label =3D "SW-TACT7";
-			gpios =3D <&gpx2 1 1>;
+			gpios =3D <&gpx2 1 GPIO_ACTIVE_LOW>;
 			linux,code =3D <KEY_WAKEUP>;
 			gpio-key,wakeup;
 		};
 	};
=20
-	hdmi {
-		hpd-gpio =3D <&gpx3 7 2>;
-		vdd_osc-supply =3D <&ldo10_reg>;
-		vdd_pll-supply =3D <&ldo8_reg>;
-		vdd-supply =3D <&ldo8_reg>;
-	};
-
 	regulators {
 		compatible =3D "simple-bus";
 		#address-cells =3D <1>;
@@ -510,7 +90,7 @@
 			regulator-name =3D "VDD_33ON_2.8V";
 			regulator-min-microvolt =3D <2800000>;
 			regulator-max-microvolt =3D <2800000>;
-			gpio =3D <&gpx1 1 1>;
+			gpio =3D <&gpx1 1 GPIO_ACTIVE_LOW>;
 			enable-active-high;
 		};
=20
@@ -528,35 +108,6 @@
 		};
 	};
=20
-	dp-controller@145B0000 {
-		samsung,color-space =3D <0>;
-		samsung,dynamic-range =3D <0>;
-		samsung,ycbcr-coeff =3D <0>;
-		samsung,color-depth =3D <1>;
-		samsung,link-rate =3D <0x0a>;
-		samsung,lane-count =3D <4>;
-		status =3D "okay";
-	};
-
-	fimd: fimd@14400000 {
-		status =3D "okay";
-		display-timings {
-			native-mode =3D <&timing0>;
-			timing0: timing@0 {
-				/* 2560x1600 DP panel */
-				clock-frequency =3D <50000>;
-				hactive =3D <2560>;
-				vactive =3D <1600>;
-				hfront-porch =3D <48>;
-				hback-porch =3D <80>;
-				hsync-len =3D <32>;
-				vback-porch =3D <16>;
-				vfront-porch =3D <8>;
-				vsync-len =3D <6>;
-			};
-		};
-	};
-
 	usb_hub_bus {
 		compatible =3D "simple-bus";
 		#address-cells =3D <1>;
@@ -566,12 +117,464 @@
 		usb_hub: usb_hub {
 			compatible =3D "smsc,usb3503a";
=20
-			reset-gpios =3D <&gpx3 5 1>;
-			connect-gpios =3D <&gpd1 7 1>;
+			reset-gpios =3D <&gpx3 5 GPIO_ACTIVE_LOW>;
+			connect-gpios =3D <&gpd1 7 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&dp {
+	status =3D "okay";
+	samsung,color-space =3D <0>;
+	samsung,dynamic-range =3D <0>;
+	samsung,ycbcr-coeff =3D <0>;
+	samsung,color-depth =3D <1>;
+	samsung,link-rate =3D <0x0a>;
+	samsung,lane-count =3D <4>;
+};
+
+&ehci {
+	usb-phy =3D <&usb2_phy>;
+};
+
+&fimd {
+	status =3D "okay";
+
+	display-timings {
+		native-mode =3D <&timing0>;
+
+		timing0: timing@0 {
+			/* 2560x1600 DP panel */
+			clock-frequency =3D <50000>;
+			hactive =3D <2560>;
+			vactive =3D <1600>;
+			hfront-porch =3D <48>;
+			hback-porch =3D <80>;
+			hsync-len =3D <32>;
+			vback-porch =3D <16>;
+			vfront-porch =3D <8>;
+			vsync-len =3D <6>;
+		};
+	};
+};
+
+&hdmi {
+	hpd-gpio =3D <&gpx3 7 2>;
+	vdd_osc-supply =3D <&ldo10_reg>;
+	vdd_pll-supply =3D <&ldo8_reg>;
+	vdd-supply =3D <&ldo8_reg>;
+};
+
+&i2c_0 {
+	status =3D "okay";
+	samsung,i2c-sda-delay =3D <100>;
+	samsung,i2c-max-bus-freq =3D <20000>;
+	samsung,i2c-slave-addr =3D <0x66>;
+
+	s5m8767_pmic@66 {
+		compatible =3D "samsung,s5m8767-pmic";
+		reg =3D <0x66>;
+		interrupt-parent =3D <&gpx3>;
+		interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
+
+		vinb1-supply =3D <&main_dc_reg>;
+		vinb2-supply =3D <&main_dc_reg>;
+		vinb3-supply =3D <&main_dc_reg>;
+		vinb4-supply =3D <&main_dc_reg>;
+		vinb5-supply =3D <&main_dc_reg>;
+		vinb6-supply =3D <&main_dc_reg>;
+		vinb7-supply =3D <&main_dc_reg>;
+		vinb8-supply =3D <&main_dc_reg>;
+		vinb9-supply =3D <&main_dc_reg>;
+
+		vinl1-supply =3D <&buck7_reg>;
+		vinl2-supply =3D <&buck7_reg>;
+		vinl3-supply =3D <&buck7_reg>;
+		vinl4-supply =3D <&main_dc_reg>;
+		vinl5-supply =3D <&main_dc_reg>;
+		vinl6-supply =3D <&main_dc_reg>;
+		vinl7-supply =3D <&main_dc_reg>;
+		vinl8-supply =3D <&buck8_reg>;
+		vinl9-supply =3D <&buck8_reg>;
+
+		s5m8767,pmic-buck2-dvs-voltage =3D <1300000>;
+		s5m8767,pmic-buck3-dvs-voltage =3D <1100000>;
+		s5m8767,pmic-buck4-dvs-voltage =3D <1200000>;
+		s5m8767,pmic-buck-dvs-gpios =3D <&gpd1 0 GPIO_ACTIVE_HIGH>,
+		                              <&gpd1 1 GPIO_ACTIVE_HIGH>,
+		                              <&gpd1 2 GPIO_ACTIVE_HIGH>;
+		s5m8767,pmic-buck-ds-gpios =3D <&gpx2 3 GPIO_ACTIVE_HIGH>,
+		                             <&gpx2 4 GPIO_ACTIVE_HIGH>,
+		                             <&gpx2 5 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			ldo1_reg: LDO1 {
+				regulator-name =3D "VDD_ALIVE_1.0V";
+				regulator-min-microvolt =3D <1100000>;
+				regulator-max-microvolt =3D <1100000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			ldo2_reg: LDO2 {
+				regulator-name =3D "VDD_28IO_DP_1.35V";
+				regulator-min-microvolt =3D <1200000>;
+				regulator-max-microvolt =3D <1200000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			ldo3_reg: LDO3 {
+				regulator-name =3D "VDD_COMMON1_1.8V";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-name =3D "VDD_IOPERI_1.8V";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-always-on;
+				op_mode =3D <1>;
+			};
+
+			ldo5_reg: LDO5 {
+				regulator-name =3D "VDD_EXT_1.8V";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			ldo6_reg: LDO6 {
+				regulator-name =3D "VDD_MPLL_1.1V";
+				regulator-min-microvolt =3D <1100000>;
+				regulator-max-microvolt =3D <1100000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			ldo7_reg: LDO7 {
+				regulator-name =3D "VDD_XPLL_1.1V";
+				regulator-min-microvolt =3D <1100000>;
+				regulator-max-microvolt =3D <1100000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			ldo8_reg: LDO8 {
+				regulator-name =3D "VDD_COMMON2_1.0V";
+				regulator-min-microvolt =3D <1000000>;
+				regulator-max-microvolt =3D <1000000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			ldo9_reg: LDO9 {
+				regulator-name =3D "VDD_33ON_3.0V";
+				regulator-min-microvolt =3D <3000000>;
+				regulator-max-microvolt =3D <3000000>;
+				op_mode =3D <1>;
+			};
+
+			ldo10_reg: LDO10 {
+				regulator-name =3D "VDD_COMMON3_1.8V";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			ldo11_reg: LDO11 {
+				regulator-name =3D "VDD_ABB2_1.8V";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			ldo12_reg: LDO12 {
+				regulator-name =3D "VDD_USB_3.0V";
+				regulator-min-microvolt =3D <3000000>;
+				regulator-max-microvolt =3D <3000000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			ldo13_reg: LDO13 {
+				regulator-name =3D "VDDQ_C2C_W_1.8V";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			ldo14_reg: LDO14 {
+				regulator-name =3D "VDD18_ABB0_3_1.8V";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			ldo15_reg: LDO15 {
+				regulator-name =3D "VDD10_COMMON4_1.0V";
+				regulator-min-microvolt =3D <1000000>;
+				regulator-max-microvolt =3D <1000000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			ldo16_reg: LDO16 {
+				regulator-name =3D "VDD18_HSIC_1.8V";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			ldo17_reg: LDO17 {
+				regulator-name =3D "VDDQ_MMC2_3_2.8V";
+				regulator-min-microvolt =3D <2800000>;
+				regulator-max-microvolt =3D <2800000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			ldo18_reg: LDO18 {
+				regulator-name =3D "VDD_33ON_2.8V";
+				regulator-min-microvolt =3D <2800000>;
+				regulator-max-microvolt =3D <2800000>;
+				op_mode =3D <1>;
+			};
+
+			ldo22_reg: LDO22 {
+				regulator-name =3D "EXT_33_OFF";
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				op_mode =3D <1>;
+			};
+
+			ldo23_reg: LDO23 {
+				regulator-name =3D "EXT_28_OFF";
+				regulator-min-microvolt =3D <2800000>;
+				regulator-max-microvolt =3D <2800000>;
+				op_mode =3D <1>;
+			};
+
+			ldo25_reg: LDO25 {
+				regulator-name =3D "PVDD_LDO25";
+				regulator-min-microvolt =3D <1200000>;
+				regulator-max-microvolt =3D <1200000>;
+				op_mode =3D <1>;
+			};
+
+			ldo26_reg: LDO26 {
+				regulator-name =3D "EXT_18_OFF";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				op_mode =3D <1>;
+			};
+
+			buck1_reg: BUCK1 {
+				regulator-name =3D "vdd_mif";
+				regulator-min-microvolt =3D <950000>;
+				regulator-max-microvolt =3D <1200000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name =3D "vdd_arm";
+				regulator-min-microvolt =3D <912500>;
+				regulator-max-microvolt =3D <1300000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			buck3_reg: BUCK3 {
+				regulator-name =3D "vdd_int";
+				regulator-min-microvolt =3D <900000>;
+				regulator-max-microvolt =3D <1200000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			buck4_reg: BUCK4 {
+				regulator-name =3D "vdd_g3d";
+				regulator-min-microvolt =3D <1000000>;
+				regulator-max-microvolt =3D <1000000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			buck5_reg: BUCK5 {
+				regulator-name =3D "VDD_MEM_1.35V";
+				regulator-min-microvolt =3D <750000>;
+				regulator-max-microvolt =3D <1355000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode =3D <1>;
+			};
+
+			buck7_reg: BUCK7 {
+				regulator-name =3D "PVDD_BUCK7";
+				regulator-always-on;
+				op_mode =3D <1>;
+			};
+
+			buck8_reg: BUCK8 {
+				regulator-name =3D "PVDD_BUCK8";
+				regulator-always-on;
+				op_mode =3D <1>;
+			};
+
+			buck9_reg: BUCK9 {
+				regulator-name =3D "VDD_33_OFF_EXT1";
+				regulator-min-microvolt =3D <750000>;
+				regulator-max-microvolt =3D <3000000>;
+				op_mode =3D <1>;
+			};
 		};
 	};
+};
+
+&i2c_2 {
+	status =3D "okay";
+
+	samsung,i2c-sda-delay =3D <100>;
+	samsung,i2c-max-bus-freq =3D <66000>;
+	samsung,i2c-slave-addr =3D <0x50>;
+
+	hdmiddc@50 {
+		compatible =3D "samsung,exynos4210-hdmiddc";
+		reg =3D <0x50>;
+	};
+};
+
+&i2c_3 {
+	status =3D "okay";
+
+	wm1811a@1a {
+		compatible =3D "wlf,wm1811";
+		reg =3D <0x1a>;
+
+		AVDD2-supply =3D <&main_dc_reg>;
+		CPVDD-supply =3D <&main_dc_reg>;
+		DBVDD1-supply =3D <&main_dc_reg>;
+		DBVDD2-supply =3D <&main_dc_reg>;
+		DBVDD3-supply =3D <&main_dc_reg>;
+		LDO1VDD-supply =3D <&main_dc_reg>;
+		SPKVDD1-supply =3D <&main_dc_reg>;
+		SPKVDD2-supply =3D <&main_dc_reg>;
+
+		wlf,ldo1ena =3D <&gpb0 0 GPIO_ACTIVE_HIGH>;
+		wlf,ldo2ena =3D <&gpb0 1 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&i2c_8 {
+	status =3D "okay";
+
+	samsung,i2c-sda-delay =3D <100>;
+	samsung,i2c-max-bus-freq =3D <66000>;
+	samsung,i2c-slave-addr =3D <0x38>;
+
+	hdmiphy@38 {
+		compatible =3D "samsung,exynos4212-hdmiphy";
+		reg =3D <0x38>;
+	};
+};
+
+&i2c_9 {
+	status =3D "okay";
+	samsung,i2c-sda-delay =3D <100>;
+	samsung,i2c-max-bus-freq =3D <40000>;
+	samsung,i2c-slave-addr =3D <0x38>;
+
+	sata_phy_i2c:sata-phy@38 {
+		compatible =3D "samsung,exynos-sataphy-i2c";
+		reg =3D <0x38>;
+	};
+};
+
+&i2s0 {
+	status =3D "okay";
+};
+
+&mfc {
+	samsung,mfc-r =3D <0x43000000 0x800000>;
+	samsung,mfc-l =3D <0x51000000 0x800000>;
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
+	vmmc-supply =3D <&mmc_reg>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
+
+	slot@0 {
+		reg =3D <0>;
+		bus-width =3D <8>;
+	};
+};
=20
-	usb@12110000 {
-		usb-phy =3D <&usb2_phy>;
+&mmc_2 {
+	status =3D "okay";
+	num-slots =3D <1>;
+	supports-highspeed;
+	card-detect-delay =3D <200>;
+	samsung,dw-mshc-ciu-div =3D <3>;
+	samsung,dw-mshc-sdr-timing =3D <2 3>;
+	samsung,dw-mshc-ddr-timing =3D <1 2>;
+	vmmc-supply =3D <&mmc_reg>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
+
+	slot@0 {
+		reg =3D <0>;
+		bus-width =3D <4>;
+		disable-wp;
 	};
 };
+
+&rtc {
+	status =3D "okay";
+};
+
+&sata {
+	status =3D "okay";
+};
+
+&sata_phy {
+	status =3D "okay";
+	samsung,exynos-sataphy-i2c-phandle =3D <&sata_phy_i2c>;
+};
--=20
1.9.3
