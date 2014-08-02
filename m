From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v6 06/10] ARM: dts: Clean up exynos5250-smdk5250
Date: Sat,  2 Aug 2014 02:52:26 +0200
Message-ID: <1406940750-15880-7-git-send-email-afaerber@suse.de>
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

Use the new style for referencing inherited nodes and use symbolic name=
s.

Goal is the alignment of all exynos5250 based device trees for comparis=
on.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v5 -> v6:
 * Renamed node label codec -> mfc for alignment with "add System MMU n=
odes"
 * Rebased for leaving dp_hpd in .dtsi
=20
 v5: New
 Follow-up after adding dp_hpd pinctrl node new-style.

 arch/arm/boot/dts/exynos5250-smdk5250.dts | 632 +++++++++++++++-------=
--------
 1 file changed, 318 insertions(+), 314 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/=
dts/exynos5250-smdk5250.dts
index aaa055ac0fe3..6bcd64ff2ded 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -7,9 +7,11 @@
  * This program is free software; you can redistribute it and/or modif=
y
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
-*/
+ */
=20
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include "exynos5250.dtsi"
=20
 / {
@@ -27,165 +29,6 @@
 		bootargs =3D "root=3D/dev/ram0 rw ramdisk=3D8192 initrd=3D0x41000000=
,8M console=3DttySAC2,115200 init=3D/linuxrc";
 	};
=20
-	rtc@101E0000 {
-		status =3D "okay";
-	};
-
-	i2c@12C60000 {
-		samsung,i2c-sda-delay =3D <100>;
-		samsung,i2c-max-bus-freq =3D <20000>;
-		status =3D "okay";
-
-		eeprom@50 {
-			compatible =3D "samsung,s524ad0xd1";
-			reg =3D <0x50>;
-		};
-
-		max77686@09 {
-			compatible =3D "maxim,max77686";
-			reg =3D <0x09>;
-			interrupt-parent =3D <&gpx3>;
-			interrupts =3D <2 0>;
-
-			voltage-regulators {
-				ldo1_reg: LDO1 {
-					regulator-name =3D "P1.0V_LDO_OUT1";
-					regulator-min-microvolt =3D <1000000>;
-					regulator-max-microvolt =3D <1000000>;
-					regulator-always-on;
-				};
-
-				ldo2_reg: LDO2 {
-					regulator-name =3D "P1.2V_LDO_OUT2";
-					regulator-min-microvolt =3D <1200000>;
-					regulator-max-microvolt =3D <1200000>;
-					regulator-always-on;
-				};
-
-				ldo3_reg: LDO3 {
-					regulator-name =3D "P1.8V_LDO_OUT3";
-					regulator-min-microvolt =3D <1800000>;
-					regulator-max-microvolt =3D <1800000>;
-					regulator-always-on;
-				};
-
-				ldo4_reg: LDO4 {
-					regulator-name =3D "P2.8V_LDO_OUT4";
-					regulator-min-microvolt =3D <2800000>;
-					regulator-max-microvolt =3D <2800000>;
-				};
-
-				ldo5_reg: LDO5 {
-					regulator-name =3D "P1.8V_LDO_OUT5";
-					regulator-min-microvolt =3D <1800000>;
-					regulator-max-microvolt =3D <1800000>;
-				};
-
-				ldo6_reg: LDO6 {
-					regulator-name =3D "P1.1V_LDO_OUT6";
-					regulator-min-microvolt =3D <1100000>;
-					regulator-max-microvolt =3D <1100000>;
-					regulator-always-on;
-				};
-
-				ldo7_reg: LDO7 {
-					regulator-name =3D "P1.1V_LDO_OUT7";
-					regulator-min-microvolt =3D <1100000>;
-					regulator-max-microvolt =3D <1100000>;
-					regulator-always-on;
-				};
-
-				ldo8_reg: LDO8 {
-					regulator-name =3D "P1.0V_LDO_OUT8";
-					regulator-min-microvolt =3D <1000000>;
-					regulator-max-microvolt =3D <1000000>;
-				};
-
-				ldo10_reg: LDO10 {
-					regulator-name =3D "P1.8V_LDO_OUT10";
-					regulator-min-microvolt =3D <1800000>;
-					regulator-max-microvolt =3D <1800000>;
-				};
-
-				ldo11_reg: LDO11 {
-					regulator-name =3D "P1.8V_LDO_OUT11";
-					regulator-min-microvolt =3D <1800000>;
-					regulator-max-microvolt =3D <1800000>;
-				};
-
-				ldo12_reg: LDO12 {
-					regulator-name =3D "P3.0V_LDO_OUT12";
-					regulator-min-microvolt =3D <3000000>;
-					regulator-max-microvolt =3D <3000000>;
-				};
-
-				ldo13_reg: LDO13 {
-					regulator-name =3D "P1.8V_LDO_OUT13";
-					regulator-min-microvolt =3D <1800000>;
-					regulator-max-microvolt =3D <1800000>;
-				};
-
-				ldo14_reg: LDO14 {
-					regulator-name =3D "P1.8V_LDO_OUT14";
-					regulator-min-microvolt =3D <1800000>;
-					regulator-max-microvolt =3D <1800000>;
-				};
-
-				ldo15_reg: LDO15 {
-					regulator-name =3D "P1.0V_LDO_OUT15";
-					regulator-min-microvolt =3D <1000000>;
-					regulator-max-microvolt =3D <1000000>;
-				};
-
-				ldo16_reg: LDO16 {
-					regulator-name =3D "P1.8V_LDO_OUT16";
-					regulator-min-microvolt =3D <1800000>;
-					regulator-max-microvolt =3D <1800000>;
-				};
-
-				buck1_reg: BUCK1 {
-					regulator-name =3D "vdd_mif";
-					regulator-min-microvolt =3D <950000>;
-					regulator-max-microvolt =3D <1300000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				buck2_reg: BUCK2 {
-					regulator-name =3D "vdd_arm";
-					regulator-min-microvolt =3D <850000>;
-					regulator-max-microvolt =3D <1350000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				buck3_reg: BUCK3 {
-					regulator-name =3D "vdd_int";
-					regulator-min-microvolt =3D <900000>;
-					regulator-max-microvolt =3D <1200000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				buck4_reg: BUCK4 {
-					regulator-name =3D "vdd_g3d";
-					regulator-min-microvolt =3D <850000>;
-					regulator-max-microvolt =3D <1300000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				buck5_reg: BUCK5 {
-					regulator-name =3D "P1.8V_BUCK_OUT5";
-					regulator-min-microvolt =3D <1800000>;
-					regulator-max-microvolt =3D <1800000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-			};
-		};
-	};
-
 	vdd: fixed-regulator@0 {
 		compatible =3D "regulator-fixed";
 		regulator-name =3D "vdd-supply";
@@ -210,207 +53,368 @@
 		regulator-always-on;
 	};
=20
-	i2c@12C70000 {
-		samsung,i2c-sda-delay =3D <100>;
-		samsung,i2c-max-bus-freq =3D <20000>;
-		status =3D "okay";
+	sound {
+		compatible =3D "samsung,smdk-wm8994";
=20
-		eeprom@51 {
-			compatible =3D "samsung,s524ad0xd1";
-			reg =3D <0x51>;
+		samsung,i2s-controller =3D <&i2s0>;
+		samsung,audio-codec =3D <&wm8994>;
+	};
+
+	fixed-rate-clocks {
+		xxti {
+			compatible =3D "samsung,clock-xxti";
+			clock-frequency =3D <24000000>;
 		};
=20
-		wm8994: wm8994@1a {
-			compatible =3D "wlf,wm8994";
-			reg =3D <0x1a>;
+		codec_mclk: codec-mclk {
+			compatible =3D "fixed-clock";
+			#clock-cells =3D <0>;
+			clock-frequency =3D <16934000>;
+		};
+	};
+};
=20
-			gpio-controller;
-			#gpio-cells =3D <2>;
+&dp {
+	samsung,color-space =3D <0>;
+	samsung,dynamic-range =3D <0>;
+	samsung,ycbcr-coeff =3D <0>;
+	samsung,color-depth =3D <1>;
+	samsung,link-rate =3D <0x0a>;
+	samsung,lane-count =3D <4>;
+
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&dp_hpd>;
+	status =3D "okay";
+};
=20
-			clocks =3D <&codec_mclk>;
-			clock-names =3D "MCLK1";
+&ehci {
+	samsung,vbus-gpio =3D <&gpx2 6 GPIO_ACTIVE_HIGH>;
+};
=20
-			AVDD2-supply =3D <&vdd>;
-			CPVDD-supply =3D <&vdd>;
-			DBVDD-supply =3D <&dbvdd>;
-			SPKVDD1-supply =3D <&spkvdd>;
-			SPKVDD2-supply =3D <&spkvdd>;
+&fimd {
+	status =3D "okay";
+
+	display-timings {
+		native-mode =3D <&timing0>;
+
+		timing0: timing@0 {
+			/* 1280x800 */
+			clock-frequency =3D <50000>;
+			hactive =3D <1280>;
+			vactive =3D <800>;
+			hfront-porch =3D <4>;
+			hback-porch =3D <4>;
+			hsync-len =3D <4>;
+			vback-porch =3D <4>;
+			vfront-porch =3D <4>;
+			vsync-len =3D <4>;
 		};
 	};
+};
=20
-	i2c@121D0000 {
-		samsung,i2c-sda-delay =3D <100>;
-		samsung,i2c-max-bus-freq =3D <40000>;
-		samsung,i2c-slave-addr =3D <0x38>;
-		status =3D "okay";
+&hdmi {
+	hpd-gpio =3D <&gpx3 7 GPIO_ACTIVE_HIGH>;
+};
=20
-		sata_phy_i2c:sata-phy@38 {
-			compatible =3D "samsung,exynos-sataphy-i2c";
-			reg =3D <0x38>;
-		};
+&i2c_0 {
+	status =3D "okay";
+	samsung,i2c-sda-delay =3D <100>;
+	samsung,i2c-max-bus-freq =3D <20000>;
+
+	eeprom@50 {
+		compatible =3D "samsung,s524ad0xd1";
+		reg =3D <0x50>;
 	};
=20
-	i2c@12C80000 {
-		samsung,i2c-sda-delay =3D <100>;
-		samsung,i2c-max-bus-freq =3D <66000>;
-		status =3D "okay";
+	max77686@09 {
+		compatible =3D "maxim,max77686";
+		reg =3D <0x09>;
+		interrupt-parent =3D <&gpx3>;
+		interrupts =3D <2 IRQ_TYPE_NONE>;
+
+		voltage-regulators {
+			ldo1_reg: LDO1 {
+				regulator-name =3D "P1.0V_LDO_OUT1";
+				regulator-min-microvolt =3D <1000000>;
+				regulator-max-microvolt =3D <1000000>;
+				regulator-always-on;
+			};
=20
-		hdmiddc@50 {
-			compatible =3D "samsung,exynos4210-hdmiddc";
-			reg =3D <0x50>;
-		};
-	};
+			ldo2_reg: LDO2 {
+				regulator-name =3D "P1.2V_LDO_OUT2";
+				regulator-min-microvolt =3D <1200000>;
+				regulator-max-microvolt =3D <1200000>;
+				regulator-always-on;
+			};
=20
-	i2c@12CE0000 {
-		samsung,i2c-sda-delay =3D <100>;
-		samsung,i2c-max-bus-freq =3D <66000>;
-		status =3D "okay";
+			ldo3_reg: LDO3 {
+				regulator-name =3D "P1.8V_LDO_OUT3";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-always-on;
+			};
=20
-		hdmiphy@38 {
-			compatible =3D "samsung,exynos4212-hdmiphy";
-			reg =3D <0x38>;
-		};
-	};
+			ldo4_reg: LDO4 {
+				regulator-name =3D "P2.8V_LDO_OUT4";
+				regulator-min-microvolt =3D <2800000>;
+				regulator-max-microvolt =3D <2800000>;
+			};
=20
-	sata@122F0000 {
-		status =3D "okay";
-	};
+			ldo5_reg: LDO5 {
+				regulator-name =3D "P1.8V_LDO_OUT5";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+			};
=20
-	sata-phy@12170000 {
-		status =3D "okay";
-		samsung,exynos-sataphy-i2c-phandle =3D <&sata_phy_i2c>;
-	};
+			ldo6_reg: LDO6 {
+				regulator-name =3D "P1.1V_LDO_OUT6";
+				regulator-min-microvolt =3D <1100000>;
+				regulator-max-microvolt =3D <1100000>;
+				regulator-always-on;
+			};
=20
-	mmc@12200000 {
-		status =3D "okay";
-		num-slots =3D <1>;
-		supports-highspeed;
-		broken-cd;
-		card-detect-delay =3D <200>;
-		samsung,dw-mshc-ciu-div =3D <3>;
-		samsung,dw-mshc-sdr-timing =3D <2 3>;
-		samsung,dw-mshc-ddr-timing =3D <1 2>;
-		pinctrl-names =3D "default";
-		pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
-
-		slot@0 {
-			reg =3D <0>;
-			bus-width =3D <8>;
-		};
-	};
+			ldo7_reg: LDO7 {
+				regulator-name =3D "P1.1V_LDO_OUT7";
+				regulator-min-microvolt =3D <1100000>;
+				regulator-max-microvolt =3D <1100000>;
+				regulator-always-on;
+			};
=20
-	mmc@12220000 {
-		status =3D "okay";
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
-			disable-wp;
-		};
-	};
+			ldo8_reg: LDO8 {
+				regulator-name =3D "P1.0V_LDO_OUT8";
+				regulator-min-microvolt =3D <1000000>;
+				regulator-max-microvolt =3D <1000000>;
+			};
+
+			ldo10_reg: LDO10 {
+				regulator-name =3D "P1.8V_LDO_OUT10";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+			};
=20
-	spi_1: spi@12d30000 {
-		status =3D "okay";
+			ldo11_reg: LDO11 {
+				regulator-name =3D "P1.8V_LDO_OUT11";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+			};
=20
-		w25q80bw@0 {
-			#address-cells =3D <1>;
-			#size-cells =3D <1>;
-			compatible =3D "w25x80";
-			reg =3D <0>;
-			spi-max-frequency =3D <1000000>;
+			ldo12_reg: LDO12 {
+				regulator-name =3D "P3.0V_LDO_OUT12";
+				regulator-min-microvolt =3D <3000000>;
+				regulator-max-microvolt =3D <3000000>;
+			};
=20
-			controller-data {
-				cs-gpio =3D <&gpa2 5 0>;
-				samsung,spi-feedback-delay =3D <0>;
+			ldo13_reg: LDO13 {
+				regulator-name =3D "P1.8V_LDO_OUT13";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
 			};
=20
-			partition@0 {
-				label =3D "U-Boot";
-				reg =3D <0x0 0x40000>;
-				read-only;
+			ldo14_reg: LDO14 {
+				regulator-name =3D "P1.8V_LDO_OUT14";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
 			};
=20
-			partition@40000 {
-				label =3D "Kernel";
-				reg =3D <0x40000 0xc0000>;
+			ldo15_reg: LDO15 {
+				regulator-name =3D "P1.0V_LDO_OUT15";
+				regulator-min-microvolt =3D <1000000>;
+				regulator-max-microvolt =3D <1000000>;
+			};
+
+			ldo16_reg: LDO16 {
+				regulator-name =3D "P1.8V_LDO_OUT16";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+			};
+
+			buck1_reg: BUCK1 {
+				regulator-name =3D "vdd_mif";
+				regulator-min-microvolt =3D <950000>;
+				regulator-max-microvolt =3D <1300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name =3D "vdd_arm";
+				regulator-min-microvolt =3D <850000>;
+				regulator-max-microvolt =3D <1350000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck3_reg: BUCK3 {
+				regulator-name =3D "vdd_int";
+				regulator-min-microvolt =3D <900000>;
+				regulator-max-microvolt =3D <1200000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck4_reg: BUCK4 {
+				regulator-name =3D "vdd_g3d";
+				regulator-min-microvolt =3D <850000>;
+				regulator-max-microvolt =3D <1300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck5_reg: BUCK5 {
+				regulator-name =3D "P1.8V_BUCK_OUT5";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
 			};
 		};
 	};
+};
+
+&i2c_1 {
+	status =3D "okay";
+	samsung,i2c-sda-delay =3D <100>;
+	samsung,i2c-max-bus-freq =3D <20000>;
=20
-	hdmi {
-		hpd-gpio =3D <&gpx3 7 0>;
+	eeprom@51 {
+		compatible =3D "samsung,s524ad0xd1";
+		reg =3D <0x51>;
 	};
=20
-	codec@11000000 {
-		samsung,mfc-r =3D <0x43000000 0x800000>;
-		samsung,mfc-l =3D <0x51000000 0x800000>;
+	wm8994: wm8994@1a {
+		compatible =3D "wlf,wm8994";
+		reg =3D <0x1a>;
+
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		clocks =3D <&codec_mclk>;
+		clock-names =3D "MCLK1";
+
+		AVDD2-supply =3D <&vdd>;
+		CPVDD-supply =3D <&vdd>;
+		DBVDD-supply =3D <&dbvdd>;
+		SPKVDD1-supply =3D <&spkvdd>;
+		SPKVDD2-supply =3D <&spkvdd>;
 	};
+};
=20
-	i2s0: i2s@03830000 {
-		status =3D "okay";
+&i2c_2 {
+	status =3D "okay";
+	samsung,i2c-sda-delay =3D <100>;
+	samsung,i2c-max-bus-freq =3D <66000>;
+
+	hdmiddc@50 {
+		compatible =3D "samsung,exynos4210-hdmiddc";
+		reg =3D <0x50>;
 	};
+};
=20
-	sound {
-		compatible =3D "samsung,smdk-wm8994";
+&i2c_8 {
+	status =3D "okay";
+	samsung,i2c-sda-delay =3D <100>;
+	samsung,i2c-max-bus-freq =3D <66000>;
=20
-		samsung,i2s-controller =3D <&i2s0>;
-		samsung,audio-codec =3D <&wm8994>;
+	hdmiphy@38 {
+		compatible =3D "samsung,exynos4212-hdmiphy";
+		reg =3D <0x38>;
 	};
+};
+
+&i2c_9 {
+	status =3D "okay";
+	samsung,i2c-sda-delay =3D <100>;
+	samsung,i2c-max-bus-freq =3D <40000>;
+	samsung,i2c-slave-addr =3D <0x38>;
=20
-	usb@12110000 {
-		samsung,vbus-gpio =3D <&gpx2 6 0>;
+	sata_phy_i2c: sata-phy@38 {
+		compatible =3D "samsung,exynos-sataphy-i2c";
+		reg =3D <0x38>;
 	};
+};
=20
-	dp-controller@145B0000 {
-		samsung,color-space =3D <0>;
-		samsung,dynamic-range =3D <0>;
-		samsung,ycbcr-coeff =3D <0>;
-		samsung,color-depth =3D <1>;
-		samsung,link-rate =3D <0x0a>;
-		samsung,lane-count =3D <4>;
-
-		pinctrl-names =3D "default";
-		pinctrl-0 =3D <&dp_hpd>;
-		status =3D "okay";
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
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
+
+	slot@0 {
+		reg =3D <0>;
+		bus-width =3D <8>;
 	};
+};
=20
-	fimd@14400000 {
-		status =3D "okay";
-		display-timings {
-			native-mode =3D <&timing0>;
-			timing0: timing@0 {
-				/* 1280x800 */
-				clock-frequency =3D <50000>;
-				hactive =3D <1280>;
-				vactive =3D <800>;
-				hfront-porch =3D <4>;
-				hback-porch =3D <4>;
-				hsync-len =3D <4>;
-				vback-porch =3D <4>;
-				vfront-porch =3D <4>;
-				vsync-len =3D <4>;
-			};
-		};
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
+		disable-wp;
 	};
+};
=20
-	fixed-rate-clocks {
-		xxti {
-			compatible =3D "samsung,clock-xxti";
-			clock-frequency =3D <24000000>;
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
+
+&spi_1 {
+	status =3D "okay";
+
+	w25q80bw@0 {
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+		compatible =3D "w25x80";
+		reg =3D <0>;
+		spi-max-frequency =3D <1000000>;
+
+		controller-data {
+			cs-gpio =3D <&gpa2 5 GPIO_ACTIVE_HIGH>;
+			samsung,spi-feedback-delay =3D <0>;
 		};
=20
-		codec_mclk: codec-mclk {
-			compatible =3D "fixed-clock";
-			#clock-cells =3D <0>;
-			clock-frequency =3D <16934000>;
+		partition@0 {
+			label =3D "U-Boot";
+			reg =3D <0x0 0x40000>;
+			read-only;
+		};
+
+		partition@40000 {
+			label =3D "Kernel";
+			reg =3D <0x40000 0xc0000>;
 		};
 	};
 };
--=20
1.9.3
