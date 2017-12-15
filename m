From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH 04/25] arm: exynos/s3c: dts: Remove leading 0x and 0s from bindings notation
Date: Fri, 15 Dec 2017 13:46:29 +0100
Message-ID: <20171215124630.30082-1-malat@debian.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mathieu Malaterre <malat@debian.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Improve the DTS files by removing all the leading "0x" and zeros to fix the
following dtc warnings:

Warning (unit_address_format): Node /XXX unit name should not have leading "0x"

and

Warning (unit_address_format): Node /XXX unit name should not have leading 0s

Converted using the following command:

find . -type f \( -iname *.dts -o -iname *.dtsi \) -exec sed -i -e "s/@\([0-9a-fA-FxX\.;:#]+\)\s*{/@\L\1 {/g" -e "s/@0x\(.*\) {/@\1 {/g" -e "s/@0+\(.*\) {/@\1 {/g" {} +^C

For simplicity, two sed expressions were used to solve each warnings separately.

To make the regex expression more robust a few other issues were resolved,
namely setting unit-address to lower case, and adding a whitespace before the
the opening curly brace:

https://elinux.org/Device_Tree_Linux#Linux_conventions

This will solve as a side effect warning:

Warning (simple_bus_reg): Node /XXX@<UPPER> simple-bus unit address format error, expected "<lower>"

This is a follow up to commit 4c9847b7375a ("dt-bindings: Remove leading 0x from bindings notation")

Reported-by: David Daney <ddaney@caviumnetworks.com>
Suggested-by: Rob Herring <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/arm/boot/dts/exynos3250.dtsi             | 34 ++++++------
 arch/arm/boot/dts/exynos4.dtsi                | 56 +++++++++----------
 arch/arm/boot/dts/exynos4210.dtsi             |  8 +--
 arch/arm/boot/dts/exynos4412-pinctrl.dtsi     |  2 +-
 arch/arm/boot/dts/exynos4412.dtsi             | 22 ++++----
 arch/arm/boot/dts/exynos5.dtsi                | 22 ++++----
 arch/arm/boot/dts/exynos5250.dtsi             | 64 +++++++++++-----------
 arch/arm/boot/dts/exynos5260.dtsi             | 26 ++++-----
 arch/arm/boot/dts/exynos5420.dtsi             | 78 +++++++++++++--------------
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  2 +-
 arch/arm/boot/dts/exynos5440.dtsi             | 14 ++---
 arch/arm/boot/dts/s3c2416.dtsi                |  8 +--
 12 files changed, 168 insertions(+), 168 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 2bd3872221a1..8d47571b3984 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -164,31 +164,31 @@
 			syscon = <&pmu_system_controller>;
 		};
 
-		pd_cam: cam-power-domain@10023C00 {
+		pd_cam: cam-power-domain@10023c00 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023C00 0x20>;
 			#power-domain-cells = <0>;
 		};
 
-		pd_mfc: mfc-power-domain@10023C40 {
+		pd_mfc: mfc-power-domain@10023c40 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023C40 0x20>;
 			#power-domain-cells = <0>;
 		};
 
-		pd_g3d: g3d-power-domain@10023C60 {
+		pd_g3d: g3d-power-domain@10023c60 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023C60 0x20>;
 			#power-domain-cells = <0>;
 		};
 
-		pd_lcd0: lcd0-power-domain@10023C80 {
+		pd_lcd0: lcd0-power-domain@10023c80 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023C80 0x20>;
 			#power-domain-cells = <0>;
 		};
 
-		pd_isp: isp-power-domain@10023CA0 {
+		pd_isp: isp-power-domain@10023ca0 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023CA0 0x20>;
 			#power-domain-cells = <0>;
@@ -204,7 +204,7 @@
 						 <&cmu CLK_FIN_PLL>;
 		};
 
-		cmu_dmc: clock-controller@105C0000 {
+		cmu_dmc: clock-controller@105c0000 {
 			compatible = "samsung,exynos3250-cmu-dmc";
 			reg = <0x105C0000 0x2000>;
 			#clock-cells = <1>;
@@ -219,7 +219,7 @@
 			status = "disabled";
 		};
 
-		tmu: tmu@100C0000 {
+		tmu: tmu@100c0000 {
 			compatible = "samsung,exynos3250-tmu";
 			reg = <0x100C0000 0x100>;
 			interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
@@ -287,7 +287,7 @@
 			status = "disabled";
 		};
 
-		sysmmu_jpeg: sysmmu@11A60000 {
+		sysmmu_jpeg: sysmmu@11a60000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x11a60000 0x1000>;
 			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
@@ -313,7 +313,7 @@
 			status = "disabled";
 		};
 
-		dsi_0: dsi@11C80000 {
+		dsi_0: dsi@11c80000 {
 			compatible = "samsung,exynos3250-mipi-dsi";
 			reg = <0x11C80000 0x10000>;
 			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
@@ -328,7 +328,7 @@
 			status = "disabled";
 		};
 
-		sysmmu_fimd0: sysmmu@11E20000 {
+		sysmmu_fimd0: sysmmu@11e20000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x11e20000 0x1000>;
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
@@ -386,7 +386,7 @@
 			status = "disabled";
 		};
 
-		exynos_usbphy: exynos-usbphy@125B0000 {
+		exynos_usbphy: exynos-usbphy@125b0000 {
 			compatible = "samsung,exynos3250-usb2-phy";
 			reg = <0x125B0000 0x100>;
 			samsung,pmureg-phandle = <&pmu_system_controller>;
@@ -425,7 +425,7 @@
 			};
 		};
 
-		adc: adc@126C0000 {
+		adc: adc@126c0000 {
 			compatible = "samsung,exynos3250-adc",
 				     "samsung,exynos-adc-v2";
 			reg = <0x126C0000 0x100>;
@@ -544,7 +544,7 @@
 			status = "disabled";
 		};
 
-		i2c_4: i2c@138A0000 {
+		i2c_4: i2c@138a0000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
@@ -557,7 +557,7 @@
 			status = "disabled";
 		};
 
-		i2c_5: i2c@138B0000 {
+		i2c_5: i2c@138b0000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
@@ -570,7 +570,7 @@
 			status = "disabled";
 		};
 
-		i2c_6: i2c@138C0000 {
+		i2c_6: i2c@138c0000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
@@ -583,7 +583,7 @@
 			status = "disabled";
 		};
 
-		i2c_7: i2c@138D0000 {
+		i2c_7: i2c@138d0000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
@@ -641,7 +641,7 @@
 			status = "disabled";
 		};
 
-		pwm: pwm@139D0000 {
+		pwm: pwm@139d0000 {
 			compatible = "samsung,exynos4210-pwm";
 			reg = <0x139D0000 0x1000>;
 			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 4768b086ed67..d40fcf7bd273 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -101,28 +101,28 @@
 		syscon = <&pmu_system_controller>;
 	};
 
-	pd_mfc: mfc-power-domain@10023C40 {
+	pd_mfc: mfc-power-domain@10023c40 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023C40 0x20>;
 		#power-domain-cells = <0>;
 		label = "MFC";
 	};
 
-	pd_g3d: g3d-power-domain@10023C60 {
+	pd_g3d: g3d-power-domain@10023c60 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023C60 0x20>;
 		#power-domain-cells = <0>;
 		label = "G3D";
 	};
 
-	pd_lcd0: lcd0-power-domain@10023C80 {
+	pd_lcd0: lcd0-power-domain@10023c80 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023C80 0x20>;
 		#power-domain-cells = <0>;
 		label = "LCD0";
 	};
 
-	pd_tv: tv-power-domain@10023C20 {
+	pd_tv: tv-power-domain@10023c20 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023C20 0x20>;
 		#power-domain-cells = <0>;
@@ -130,21 +130,21 @@
 		label = "TV";
 	};
 
-	pd_cam: cam-power-domain@10023C00 {
+	pd_cam: cam-power-domain@10023c00 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023C00 0x20>;
 		#power-domain-cells = <0>;
 		label = "CAM";
 	};
 
-	pd_gps: gps-power-domain@10023CE0 {
+	pd_gps: gps-power-domain@10023ce0 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023CE0 0x20>;
 		#power-domain-cells = <0>;
 		label = "GPS";
 	};
 
-	pd_gps_alive: gps-alive-power-domain@10023D00 {
+	pd_gps_alive: gps-alive-power-domain@10023d00 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023D00 0x20>;
 		#power-domain-cells = <0>;
@@ -184,7 +184,7 @@
 		interrupt-parent = <&gic>;
 	};
 
-	dsi_0: dsi@11C80000 {
+	dsi_0: dsi@11c80000 {
 		compatible = "samsung,exynos4210-mipi-dsi";
 		reg = <0x11C80000 0x10000>;
 		interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
@@ -297,7 +297,7 @@
 		status = "disabled";
 	};
 
-	keypad: keypad@100A0000 {
+	keypad: keypad@100a0000 {
 		compatible = "samsung,s5pv210-keypad";
 		reg = <0x100A0000 0x100>;
 		interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
@@ -342,7 +342,7 @@
 		status = "disabled";
 	};
 
-	exynos_usbphy: exynos-usbphy@125B0000 {
+	exynos_usbphy: exynos-usbphy@125b0000 {
 		compatible = "samsung,exynos4210-usb2-phy";
 		reg = <0x125B0000 0x100>;
 		samsung,pmureg-phandle = <&pmu_system_controller>;
@@ -538,7 +538,7 @@
 		status = "disabled";
 	};
 
-	i2c_4: i2c@138A0000 {
+	i2c_4: i2c@138a0000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
@@ -551,7 +551,7 @@
 		status = "disabled";
 	};
 
-	i2c_5: i2c@138B0000 {
+	i2c_5: i2c@138b0000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
@@ -564,7 +564,7 @@
 		status = "disabled";
 	};
 
-	i2c_6: i2c@138C0000 {
+	i2c_6: i2c@138c0000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
@@ -577,7 +577,7 @@
 		status = "disabled";
 	};
 
-	i2c_7: i2c@138D0000 {
+	i2c_7: i2c@138d0000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
@@ -590,7 +590,7 @@
 		status = "disabled";
 	};
 
-	i2c_8: i2c@138E0000 {
+	i2c_8: i2c@138e0000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "samsung,s3c2440-hdmiphy-i2c";
@@ -651,7 +651,7 @@
 		status = "disabled";
 	};
 
-	pwm: pwm@139D0000 {
+	pwm: pwm@139d0000 {
 		compatible = "samsung,exynos4210-pwm";
 		reg = <0x139D0000 0x1000>;
 		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
@@ -720,7 +720,7 @@
 		status = "disabled";
 	};
 
-	tmu: tmu@100C0000 {
+	tmu: tmu@100c0000 {
 		#include "exynos4412-tmu-sensor-conf.dtsi"
 	};
 
@@ -743,7 +743,7 @@
 		iommus = <&sysmmu_rotator>;
 	};
 
-	hdmi: hdmi@12D00000 {
+	hdmi: hdmi@12d00000 {
 		compatible = "samsung,exynos4210-hdmi";
 		reg = <0x12D00000 0x70000>;
 		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
@@ -758,7 +758,7 @@
 		status = "disabled";
 	};
 
-	hdmicec: cec@100B0000 {
+	hdmicec: cec@100b0000 {
 		compatible = "samsung,s5p-cec";
 		reg = <0x100B0000 0x200>;
 		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
@@ -771,7 +771,7 @@
 		status = "disabled";
 	};
 
-	mixer: mixer@12C10000 {
+	mixer: mixer@12c10000 {
 		compatible = "samsung,exynos4210-mixer";
 		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 		reg = <0x12C10000 0x2100>, <0x12c00000 0x300>;
@@ -910,7 +910,7 @@
 		#iommu-cells = <0>;
 	};
 
-	sysmmu_tv: sysmmu@12E20000 {
+	sysmmu_tv: sysmmu@12e20000 {
 		compatible = "samsung,exynos-sysmmu";
 		reg = <0x12E20000 0x1000>;
 		interrupt-parent = <&combiner>;
@@ -921,7 +921,7 @@
 		#iommu-cells = <0>;
 	};
 
-	sysmmu_fimc0: sysmmu@11A20000 {
+	sysmmu_fimc0: sysmmu@11a20000 {
 		compatible = "samsung,exynos-sysmmu";
 		reg = <0x11A20000 0x1000>;
 		interrupt-parent = <&combiner>;
@@ -932,7 +932,7 @@
 		#iommu-cells = <0>;
 	};
 
-	sysmmu_fimc1: sysmmu@11A30000 {
+	sysmmu_fimc1: sysmmu@11a30000 {
 		compatible = "samsung,exynos-sysmmu";
 		reg = <0x11A30000 0x1000>;
 		interrupt-parent = <&combiner>;
@@ -943,7 +943,7 @@
 		#iommu-cells = <0>;
 	};
 
-	sysmmu_fimc2: sysmmu@11A40000 {
+	sysmmu_fimc2: sysmmu@11a40000 {
 		compatible = "samsung,exynos-sysmmu";
 		reg = <0x11A40000 0x1000>;
 		interrupt-parent = <&combiner>;
@@ -954,7 +954,7 @@
 		#iommu-cells = <0>;
 	};
 
-	sysmmu_fimc3: sysmmu@11A50000 {
+	sysmmu_fimc3: sysmmu@11a50000 {
 		compatible = "samsung,exynos-sysmmu";
 		reg = <0x11A50000 0x1000>;
 		interrupt-parent = <&combiner>;
@@ -965,7 +965,7 @@
 		#iommu-cells = <0>;
 	};
 
-	sysmmu_jpeg: sysmmu@11A60000 {
+	sysmmu_jpeg: sysmmu@11a60000 {
 		compatible = "samsung,exynos-sysmmu";
 		reg = <0x11A60000 0x1000>;
 		interrupt-parent = <&combiner>;
@@ -976,7 +976,7 @@
 		#iommu-cells = <0>;
 	};
 
-	sysmmu_rotator: sysmmu@12A30000 {
+	sysmmu_rotator: sysmmu@12a30000 {
 		compatible = "samsung,exynos-sysmmu";
 		reg = <0x12A30000 0x1000>;
 		interrupt-parent = <&combiner>;
@@ -986,7 +986,7 @@
 		#iommu-cells = <0>;
 	};
 
-	sysmmu_fimd0: sysmmu@11E20000 {
+	sysmmu_fimd0: sysmmu@11e20000 {
 		compatible = "samsung,exynos-sysmmu";
 		reg = <0x11E20000 0x1000>;
 		interrupt-parent = <&combiner>;
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 03dd61f64809..ce161ad1215d 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -82,7 +82,7 @@
 		};
 	};
 
-	pd_lcd1: lcd1-power-domain@10023CA0 {
+	pd_lcd1: lcd1-power-domain@10023ca0 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023CA0 0x20>;
 		#power-domain-cells = <0>;
@@ -156,7 +156,7 @@
 		reg = <0x03860000 0x1000>;
 	};
 
-	tmu: tmu@100C0000 {
+	tmu: tmu@100c0000 {
 		compatible = "samsung,exynos4210-tmu";
 		interrupt-parent = <&combiner>;
 		reg = <0x100C0000 0x100>;
@@ -229,7 +229,7 @@
 		};
 	};
 
-	mixer: mixer@12C10000 {
+	mixer: mixer@12c10000 {
 		clock-names = "mixer", "hdmi", "sclk_hdmi", "vp", "mout_mixer",
 			"sclk_mixer";
 		clocks = <&clock CLK_MIXER>, <&clock CLK_HDMI>,
@@ -245,7 +245,7 @@
 		status = "disabled";
 	};
 
-	sysmmu_g2d: sysmmu@12A20000 {
+	sysmmu_g2d: sysmmu@12a20000 {
 		compatible = "samsung,exynos-sysmmu";
 		reg = <0x12A20000 0x1000>;
 		interrupt-parent = <&combiner>;
diff --git a/arch/arm/boot/dts/exynos4412-pinctrl.dtsi b/arch/arm/boot/dts/exynos4412-pinctrl.dtsi
index 4eebd4721a5f..ef7b89d3db9e 100644
--- a/arch/arm/boot/dts/exynos4412-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4412-pinctrl.dtsi
@@ -925,7 +925,7 @@
 		};
 	};
 
-	pinctrl_3: pinctrl@106E0000 {
+	pinctrl_3: pinctrl@106e0000 {
 		gpv0: gpv0 {
 			gpio-controller;
 			#gpio-cells = <2>;
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index b255ac55b1c1..29990ad56e1f 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -38,7 +38,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu0: cpu@A00 {
+		cpu0: cpu@a00 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0xA00>;
@@ -50,21 +50,21 @@
 			#cooling-cells = <2>; /* min followed by max */
 		};
 
-		cpu@A01 {
+		cpu@a01 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0xA01>;
 			operating-points-v2 = <&cpu0_opp_table>;
 		};
 
-		cpu@A02 {
+		cpu@a02 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0xA02>;
 			operating-points-v2 = <&cpu0_opp_table>;
 		};
 
-		cpu@A03 {
+		cpu@a03 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0xA03>;
@@ -168,7 +168,7 @@
 		};
 	};
 
-	pd_isp: isp-power-domain@10023CA0 {
+	pd_isp: isp-power-domain@10023ca0 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023CA0 0x20>;
 		#power-domain-cells = <0>;
@@ -224,7 +224,7 @@
 		samsung,syscon-phandle = <&pmu_system_controller>;
 	};
 
-	adc: adc@126C0000 {
+	adc: adc@126c0000 {
 		compatible = "samsung,exynos-adc-v1";
 		reg = <0x126C0000 0x100>;
 		interrupt-parent = <&combiner>;
@@ -263,7 +263,7 @@
 			status = "disabled";
 		};
 
-		fimc_lite_1: fimc-lite@123A0000 {
+		fimc_lite_1: fimc-lite@123a0000 {
 			compatible = "samsung,exynos4212-fimc-lite";
 			reg = <0x123A0000 0x1000>;
 			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
@@ -370,7 +370,7 @@
 		#iommu-cells = <0>;
 	};
 
-	sysmmu_fimc_fd: sysmmu@122A0000 {
+	sysmmu_fimc_fd: sysmmu@122a0000 {
 		compatible = "samsung,exynos-sysmmu";
 		reg = <0x122A0000 0x1000>;
 		interrupt-parent = <&combiner>;
@@ -381,7 +381,7 @@
 		#iommu-cells = <0>;
 	};
 
-	sysmmu_fimc_mcuctl: sysmmu@122B0000 {
+	sysmmu_fimc_mcuctl: sysmmu@122b0000 {
 		compatible = "samsung,exynos-sysmmu";
 		reg = <0x122B0000 0x1000>;
 		interrupt-parent = <&combiner>;
@@ -392,7 +392,7 @@
 		#iommu-cells = <0>;
 	};
 
-	sysmmu_fimc_lite0: sysmmu@123B0000 {
+	sysmmu_fimc_lite0: sysmmu@123b0000 {
 		compatible = "samsung,exynos-sysmmu";
 		reg = <0x123B0000 0x1000>;
 		interrupt-parent = <&combiner>;
@@ -403,7 +403,7 @@
 		#iommu-cells = <0>;
 	};
 
-	sysmmu_fimc_lite1: sysmmu@123C0000 {
+	sysmmu_fimc_lite1: sysmmu@123c0000 {
 		compatible = "samsung,exynos-sysmmu";
 		reg = <0x123C0000 0x1000>;
 		interrupt-parent = <&combiner>;
diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 66d22521c976..7d7b3133cbcb 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -106,31 +106,31 @@
 			reg = <0x10050000 0x5000>;
 		};
 
-		serial_0: serial@12C00000 {
+		serial_0: serial@12c00000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x12C00000 0x100>;
 			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		serial_1: serial@12C10000 {
+		serial_1: serial@12c10000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x12C10000 0x100>;
 			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		serial_2: serial@12C20000 {
+		serial_2: serial@12c20000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x12C20000 0x100>;
 			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		serial_3: serial@12C30000 {
+		serial_3: serial@12c30000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x12C30000 0x100>;
 			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		i2c_0: i2c@12C60000 {
+		i2c_0: i2c@12c60000 {
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x12C60000 0x100>;
 			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
@@ -140,7 +140,7 @@
 			status = "disabled";
 		};
 
-		i2c_1: i2c@12C70000 {
+		i2c_1: i2c@12c70000 {
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x12C70000 0x100>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
@@ -150,7 +150,7 @@
 			status = "disabled";
 		};
 
-		i2c_2: i2c@12C80000 {
+		i2c_2: i2c@12c80000 {
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x12C80000 0x100>;
 			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
@@ -160,7 +160,7 @@
 			status = "disabled";
 		};
 
-		i2c_3: i2c@12C90000 {
+		i2c_3: i2c@12c90000 {
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x12C90000 0x100>;
 			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
@@ -170,14 +170,14 @@
 			status = "disabled";
 		};
 
-		pwm: pwm@12DD0000 {
+		pwm: pwm@12dd0000 {
 			compatible = "samsung,exynos4210-pwm";
 			reg = <0x12DD0000 0x100>;
 			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 			#pwm-cells = <3>;
 		};
 
-		rtc: rtc@101E0000 {
+		rtc: rtc@101e0000 {
 			compatible = "samsung,s3c6410-rtc";
 			reg = <0x101E0000 0x100>;
 			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
@@ -195,7 +195,7 @@
 			status = "disabled";
 		};
 
-		dp: dp-controller@145B0000 {
+		dp: dp-controller@145b0000 {
 			compatible = "samsung,exynos5-dp";
 			reg = <0x145B0000 0x1000>;
 			interrupts = <10 3>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 5286084e1032..a596ce260e2a 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -125,7 +125,7 @@
 			label = "MFC";
 		};
 
-		pd_disp1: disp1-power-domain@100440A0 {
+		pd_disp1: disp1-power-domain@100440a0 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x100440A0 0x20>;
 			#power-domain-cells = <0>;
@@ -165,7 +165,7 @@
 			clock-frequency = <24000000>;
 		};
 
-		mct@101C0000 {
+		mct@101c0000 {
 			compatible = "samsung,exynos4210-mct";
 			reg = <0x101C0000 0x800>;
 			interrupt-controller;
@@ -236,7 +236,7 @@
 			interrupt-parent = <&gic>;
 		};
 
-		watchdog@101D0000 {
+		watchdog@101d0000 {
 			compatible = "samsung,exynos5250-wdt";
 			reg = <0x101D0000 0x100>;
 			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
@@ -265,7 +265,7 @@
 			iommu-names = "left", "right";
 		};
 
-		rotator: rotator@11C00000 {
+		rotator: rotator@11c00000 {
 			compatible = "samsung,exynos5250-rotator";
 			reg = <0x11C00000 0x64>;
 			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
@@ -283,7 +283,7 @@
 			#include "exynos4412-tmu-sensor-conf.dtsi"
 		};
 
-		sata: sata@122F0000 {
+		sata: sata@122f0000 {
 			compatible = "snps,dwc-ahci";
 			samsung,sata-freq = <66>;
 			reg = <0x122F0000 0x1ff>;
@@ -306,7 +306,7 @@
 		};
 
 		/* i2c_0-3 are defined in exynos5.dtsi */
-		i2c_4: i2c@12CA0000 {
+		i2c_4: i2c@12ca0000 {
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x12CA0000 0x100>;
 			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
@@ -319,7 +319,7 @@
 			status = "disabled";
 		};
 
-		i2c_5: i2c@12CB0000 {
+		i2c_5: i2c@12cb0000 {
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x12CB0000 0x100>;
 			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
@@ -332,7 +332,7 @@
 			status = "disabled";
 		};
 
-		i2c_6: i2c@12CC0000 {
+		i2c_6: i2c@12cc0000 {
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x12CC0000 0x100>;
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
@@ -345,7 +345,7 @@
 			status = "disabled";
 		};
 
-		i2c_7: i2c@12CD0000 {
+		i2c_7: i2c@12cd0000 {
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x12CD0000 0x100>;
 			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
@@ -358,7 +358,7 @@
 			status = "disabled";
 		};
 
-		i2c_8: i2c@12CE0000 {
+		i2c_8: i2c@12ce0000 {
 			compatible = "samsung,s3c2440-hdmiphy-i2c";
 			reg = <0x12CE0000 0x1000>;
 			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
@@ -374,7 +374,7 @@
 			};
 		};
 
-		i2c_9: i2c@121D0000 {
+		i2c_9: i2c@121d0000 {
 			compatible = "samsung,exynos5-sata-phy-i2c";
 			reg = <0x121D0000 0x100>;
 			#address-cells = <1>;
@@ -497,7 +497,7 @@
 			pinctrl-0 = <&i2s0_bus>;
 		};
 
-		i2s1: i2s@12D60000 {
+		i2s1: i2s@12d60000 {
 			compatible = "samsung,s3c6410-i2s";
 			status = "disabled";
 			reg = <0x12D60000 0x100>;
@@ -510,7 +510,7 @@
 			pinctrl-0 = <&i2s1_bus>;
 		};
 
-		i2s2: i2s@12D70000 {
+		i2s2: i2s@12d70000 {
 			compatible = "samsung,s3c6410-i2s";
 			status = "disabled";
 			reg = <0x12D70000 0x100>;
@@ -596,7 +596,7 @@
 			interrupt-parent = <&gic>;
 			ranges;
 
-			pdma0: pdma@121A0000 {
+			pdma0: pdma@121a0000 {
 				compatible = "arm,pl330", "arm,primecell";
 				reg = <0x121A0000 0x1000>;
 				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
@@ -607,7 +607,7 @@
 				#dma-requests = <32>;
 			};
 
-			pdma1: pdma@121B0000 {
+			pdma1: pdma@121b0000 {
 				compatible = "arm,pl330", "arm,primecell";
 				reg = <0x121B0000 0x1000>;
 				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
@@ -629,7 +629,7 @@
 				#dma-requests = <1>;
 			};
 
-			mdma1: mdma@11C10000 {
+			mdma1: mdma@11c10000 {
 				compatible = "arm,pl330", "arm,primecell";
 				reg = <0x11C10000 0x1000>;
 				interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
@@ -696,7 +696,7 @@
 			status = "disabled";
 		};
 
-		hdmicec: cec@101B0000 {
+		hdmicec: cec@101b0000 {
 			compatible = "samsung,s5p-cec";
 			reg = <0x101B0000 0x200>;
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
@@ -727,7 +727,7 @@
 			#phy-cells = <0>;
 		};
 
-		adc: adc@12D10000 {
+		adc: adc@12d10000 {
 			compatible = "samsung,exynos-adc-v1";
 			reg = <0x12D10000 0x100>;
 			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
@@ -747,7 +747,7 @@
 			clock-names = "secss";
 		};
 
-		sysmmu_g2d: sysmmu@10A60000 {
+		sysmmu_g2d: sysmmu@10a60000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x10A60000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -779,7 +779,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_rotator: sysmmu@11D40000 {
+		sysmmu_rotator: sysmmu@11d40000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x11D40000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -789,7 +789,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_jpeg: sysmmu@11F20000 {
+		sysmmu_jpeg: sysmmu@11f20000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x11F20000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -820,7 +820,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_fimc_fd: sysmmu@132A0000 {
+		sysmmu_fimc_fd: sysmmu@132a0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x132A0000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -850,7 +850,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_fimc_mcuctl: sysmmu@132B0000 {
+		sysmmu_fimc_mcuctl: sysmmu@132b0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x132B0000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -860,7 +860,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_fimc_odc: sysmmu@132C0000 {
+		sysmmu_fimc_odc: sysmmu@132c0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x132C0000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -870,7 +870,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_fimc_dis0: sysmmu@132D0000 {
+		sysmmu_fimc_dis0: sysmmu@132d0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x132D0000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -890,7 +890,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_fimc_3dnr: sysmmu@132F0000 {
+		sysmmu_fimc_3dnr: sysmmu@132f0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x132F0000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -900,7 +900,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_fimc_lite0: sysmmu@13C40000 {
+		sysmmu_fimc_lite0: sysmmu@13c40000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13C40000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -911,7 +911,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_fimc_lite1: sysmmu@13C50000 {
+		sysmmu_fimc_lite1: sysmmu@13c50000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13C50000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -922,7 +922,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_gsc0: sysmmu@13E80000 {
+		sysmmu_gsc0: sysmmu@13e80000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13E80000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -933,7 +933,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_gsc1: sysmmu@13E90000 {
+		sysmmu_gsc1: sysmmu@13e90000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13E90000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -944,7 +944,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_gsc2: sysmmu@13EA0000 {
+		sysmmu_gsc2: sysmmu@13ea0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13EA0000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -955,7 +955,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_gsc3: sysmmu@13EB0000 {
+		sysmmu_gsc3: sysmmu@13eb0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13EB0000 0x1000>;
 			interrupt-parent = <&combiner>;
diff --git a/arch/arm/boot/dts/exynos5260.dtsi b/arch/arm/boot/dts/exynos5260.dtsi
index 5e88c9645975..12c6b011576b 100644
--- a/arch/arm/boot/dts/exynos5260.dtsi
+++ b/arch/arm/boot/dts/exynos5260.dtsi
@@ -106,13 +106,13 @@
 			#clock-cells = <1>;
 		};
 
-		clock_g2d: clock-controller@10A00000 {
+		clock_g2d: clock-controller@10a00000 {
 			compatible = "samsung,exynos5260-clock-g2d";
 			reg = <0x10A00000 0x10000>;
 			#clock-cells = <1>;
 		};
 
-		clock_mif: clock-controller@10CE0000 {
+		clock_mif: clock-controller@10ce0000 {
 			compatible = "samsung,exynos5260-clock-mif";
 			reg = <0x10CE0000 0x10000>;
 			#clock-cells = <1>;
@@ -130,25 +130,25 @@
 			#clock-cells = <1>;
 		};
 
-		clock_fsys: clock-controller@122E0000 {
+		clock_fsys: clock-controller@122e0000 {
 			compatible = "samsung,exynos5260-clock-fsys";
 			reg = <0x122E0000 0x10000>;
 			#clock-cells = <1>;
 		};
 
-		clock_aud: clock-controller@128C0000 {
+		clock_aud: clock-controller@128c0000 {
 			compatible = "samsung,exynos5260-clock-aud";
 			reg = <0x128C0000 0x10000>;
 			#clock-cells = <1>;
 		};
 
-		clock_isp: clock-controller@133C0000 {
+		clock_isp: clock-controller@133c0000 {
 			compatible = "samsung,exynos5260-clock-isp";
 			reg = <0x133C0000 0x10000>;
 			#clock-cells = <1>;
 		};
 
-		clock_gscl: clock-controller@13F00000 {
+		clock_gscl: clock-controller@13f00000 {
 			compatible = "samsung,exynos5260-clock-gscl";
 			reg = <0x13F00000 0x10000>;
 			#clock-cells = <1>;
@@ -179,7 +179,7 @@
 			reg = <0x10000000 0x100>;
 		};
 
-		mct: mct@100B0000 {
+		mct: mct@100b0000 {
 			compatible = "samsung,exynos4210-mct";
 			reg = <0x100B0000 0x1000>;
 			clocks = <&fin_pll>, <&clock_peri PERI_CLK_MCT>;
@@ -198,7 +198,7 @@
 				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		cci: cci@10F00000 {
+		cci: cci@10f00000 {
 			compatible = "arm,cci-400";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -236,18 +236,18 @@
 			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		pinctrl_2: pinctrl@128B0000 {
+		pinctrl_2: pinctrl@128b0000 {
 			compatible = "samsung,exynos5260-pinctrl";
 			reg = <0x128B0000 0x1000>;
 			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		pmu_system_controller: system-controller@10D50000 {
+		pmu_system_controller: system-controller@10d50000 {
 			compatible = "samsung,exynos5260-pmu", "syscon";
 			reg = <0x10D50000 0x10000>;
 		};
 
-		uart0: serial@12C00000 {
+		uart0: serial@12c00000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x12C00000 0x100>;
 			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
@@ -256,7 +256,7 @@
 			status = "disabled";
 		};
 
-		uart1: serial@12C10000 {
+		uart1: serial@12c10000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x12C10000 0x100>;
 			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
@@ -265,7 +265,7 @@
 			status = "disabled";
 		};
 
-		uart2: serial@12C20000 {
+		uart2: serial@12c20000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x12C20000 0x100>;
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 8aa2cc7aa125..fd3bdb7297ac 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -237,37 +237,37 @@
 			status = "disabled";
 		};
 
-		nocp_mem0_0: nocp@10CA1000 {
+		nocp_mem0_0: nocp@10ca1000 {
 			compatible = "samsung,exynos5420-nocp";
 			reg = <0x10CA1000 0x200>;
 			status = "disabled";
 		};
 
-		nocp_mem0_1: nocp@10CA1400 {
+		nocp_mem0_1: nocp@10ca1400 {
 			compatible = "samsung,exynos5420-nocp";
 			reg = <0x10CA1400 0x200>;
 			status = "disabled";
 		};
 
-		nocp_mem1_0: nocp@10CA1800 {
+		nocp_mem1_0: nocp@10ca1800 {
 			compatible = "samsung,exynos5420-nocp";
 			reg = <0x10CA1800 0x200>;
 			status = "disabled";
 		};
 
-		nocp_mem1_1: nocp@10CA1C00 {
+		nocp_mem1_1: nocp@10ca1c00 {
 			compatible = "samsung,exynos5420-nocp";
 			reg = <0x10CA1C00 0x200>;
 			status = "disabled";
 		};
 
-		nocp_g3d_0: nocp@11A51000 {
+		nocp_g3d_0: nocp@11a51000 {
 			compatible = "samsung,exynos5420-nocp";
 			reg = <0x11A51000 0x200>;
 			status = "disabled";
 		};
 
-		nocp_g3d_1: nocp@11A51400 {
+		nocp_g3d_1: nocp@11a51400 {
 			compatible = "samsung,exynos5420-nocp";
 			reg = <0x11A51400 0x200>;
 			status = "disabled";
@@ -309,7 +309,7 @@
 			label = "MSC";
 		};
 
-		disp_pd: power-domain@100440C0 {
+		disp_pd: power-domain@100440c0 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x100440C0 0x20>;
 			#power-domain-cells = <0>;
@@ -376,7 +376,7 @@
 				#dma-requests = <16>;
 			};
 
-			pdma0: pdma@121A0000 {
+			pdma0: pdma@121a0000 {
 				compatible = "arm,pl330", "arm,primecell";
 				reg = <0x121A0000 0x1000>;
 				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
@@ -387,7 +387,7 @@
 				#dma-requests = <32>;
 			};
 
-			pdma1: pdma@121B0000 {
+			pdma1: pdma@121b0000 {
 				compatible = "arm,pl330", "arm,primecell";
 				reg = <0x121B0000 0x1000>;
 				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
@@ -409,7 +409,7 @@
 				#dma-requests = <1>;
 			};
 
-			mdma1: mdma@11C10000 {
+			mdma1: mdma@11c10000 {
 				compatible = "arm,pl330", "arm,primecell";
 				reg = <0x11C10000 0x1000>;
 				interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
@@ -449,7 +449,7 @@
 			status = "disabled";
 		};
 
-		i2s1: i2s@12D60000 {
+		i2s1: i2s@12d60000 {
 			compatible = "samsung,exynos5420-i2s";
 			reg = <0x12D60000 0x100>;
 			dmas = <&pdma1 12
@@ -465,7 +465,7 @@
 			status = "disabled";
 		};
 
-		i2s2: i2s@12D70000 {
+		i2s2: i2s@12d70000 {
 			compatible = "samsung,exynos5420-i2s";
 			reg = <0x12D70000 0x100>;
 			dmas = <&pdma0 12
@@ -554,7 +554,7 @@
 			status = "disabled";
 		};
 
-		adc: adc@12D10000 {
+		adc: adc@12d10000 {
 			compatible = "samsung,exynos-adc-v2";
 			reg = <0x12D10000 0x100>;
 			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
@@ -566,7 +566,7 @@
 			status = "disabled";
 		};
 
-		hsi2c_8: i2c@12E00000 {
+		hsi2c_8: i2c@12e00000 {
 			compatible = "samsung,exynos5250-hsi2c";
 			reg = <0x12E00000 0x1000>;
 			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
@@ -579,7 +579,7 @@
 			status = "disabled";
 		};
 
-		hsi2c_9: i2c@12E10000 {
+		hsi2c_9: i2c@12e10000 {
 			compatible = "samsung,exynos5250-hsi2c";
 			reg = <0x12E10000 0x1000>;
 			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
@@ -592,7 +592,7 @@
 			status = "disabled";
 		};
 
-		hsi2c_10: i2c@12E20000 {
+		hsi2c_10: i2c@12e20000 {
 			compatible = "samsung,exynos5250-hsi2c";
 			reg = <0x12E20000 0x1000>;
 			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
@@ -620,11 +620,11 @@
 			power-domains = <&disp_pd>;
 		};
 
-		hdmiphy: hdmiphy@145D0000 {
+		hdmiphy: hdmiphy@145d0000 {
 			reg = <0x145D0000 0x20>;
 		};
 
-		hdmicec: cec@101B0000 {
+		hdmicec: cec@101b0000 {
 			compatible = "samsung,s5p-cec";
 			reg = <0x101B0000 0x200>;
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
@@ -649,7 +649,7 @@
 			status = "disabled";
 		};
 
-		rotator: rotator@11C00000 {
+		rotator: rotator@11c00000 {
 			compatible = "samsung,exynos5250-rotator";
 			reg = <0x11C00000 0x64>;
 			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
@@ -678,7 +678,7 @@
 			iommus = <&sysmmu_gscl1>;
 		};
 
-		jpeg_0: jpeg@11F50000 {
+		jpeg_0: jpeg@11f50000 {
 			compatible = "samsung,exynos5420-jpeg";
 			reg = <0x11F50000 0x1000>;
 			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
@@ -687,7 +687,7 @@
 			iommus = <&sysmmu_jpeg0>;
 		};
 
-		jpeg_1: jpeg@11F60000 {
+		jpeg_1: jpeg@11f60000 {
 			compatible = "samsung,exynos5420-jpeg";
 			reg = <0x11F60000 0x1000>;
 			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
@@ -752,7 +752,7 @@
 			#include "exynos5420-tmu-sensor-conf.dtsi"
 		};
 
-		sysmmu_g2dr: sysmmu@0x10A60000 {
+		sysmmu_g2dr: sysmmu@10a60000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x10A60000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -762,7 +762,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_g2dw: sysmmu@0x10A70000 {
+		sysmmu_g2dw: sysmmu@10a70000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x10A70000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -772,7 +772,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_tv: sysmmu@0x14650000 {
+		sysmmu_tv: sysmmu@14650000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x14650000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -783,7 +783,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_gscl0: sysmmu@0x13E80000 {
+		sysmmu_gscl0: sysmmu@13e80000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13E80000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -794,7 +794,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_gscl1: sysmmu@0x13E90000 {
+		sysmmu_gscl1: sysmmu@13e90000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13E90000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -805,7 +805,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_scaler0r: sysmmu@0x12880000 {
+		sysmmu_scaler0r: sysmmu@12880000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x12880000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -815,7 +815,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_scaler1r: sysmmu@0x12890000 {
+		sysmmu_scaler1r: sysmmu@12890000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x12890000 0x1000>;
 			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
@@ -824,7 +824,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_scaler2r: sysmmu@0x128A0000 {
+		sysmmu_scaler2r: sysmmu@128a0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x128A0000 0x1000>;
 			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
@@ -833,7 +833,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_scaler0w: sysmmu@0x128C0000 {
+		sysmmu_scaler0w: sysmmu@128c0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x128C0000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -843,7 +843,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_scaler1w: sysmmu@0x128D0000 {
+		sysmmu_scaler1w: sysmmu@128d0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x128D0000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -853,7 +853,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_scaler2w: sysmmu@0x128E0000 {
+		sysmmu_scaler2w: sysmmu@128e0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x128E0000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -863,7 +863,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_rotator: sysmmu@0x11D40000 {
+		sysmmu_rotator: sysmmu@11d40000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x11D40000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -873,7 +873,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_jpeg0: sysmmu@0x11F10000 {
+		sysmmu_jpeg0: sysmmu@11f10000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x11F10000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -883,7 +883,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_jpeg1: sysmmu@0x11F20000 {
+		sysmmu_jpeg1: sysmmu@11f20000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x11F20000 0x1000>;
 			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
@@ -892,7 +892,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_mfc_l: sysmmu@0x11200000 {
+		sysmmu_mfc_l: sysmmu@11200000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x11200000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -903,7 +903,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_mfc_r: sysmmu@0x11210000 {
+		sysmmu_mfc_r: sysmmu@11210000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x11210000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -914,7 +914,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_fimd1_0: sysmmu@0x14640000 {
+		sysmmu_fimd1_0: sysmmu@14640000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x14640000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -925,7 +925,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_fimd1_1: sysmmu@0x14680000 {
+		sysmmu_fimd1_1: sysmmu@14680000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x14680000 0x1000>;
 			interrupt-parent = <&combiner>;
diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index a5b8d0f0877e..353428fe10c4 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -26,7 +26,7 @@
 		stdout-path = "serial2:115200n8";
 	};
 
-	firmware@02073000 {
+	firmware@2073000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x02073000 0x1000>;
 	};
diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 9c3c75ae5e48..3acf3f2d643e 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -35,7 +35,7 @@
 		#clock-cells = <1>;
 	};
 
-	gic: interrupt-controller@2E0000 {
+	gic: interrupt-controller@2e0000 {
 		compatible = "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
@@ -108,7 +108,7 @@
 		>;
 	};
 
-	serial_0: serial@B0000 {
+	serial_0: serial@b0000 {
 		compatible = "samsung,exynos4210-uart";
 		reg = <0xB0000 0x1000>;
 		interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
@@ -116,7 +116,7 @@
 		clock-names = "uart", "clk_uart_baud0";
 	};
 
-	serial_1: serial@C0000 {
+	serial_1: serial@c0000 {
 		compatible = "samsung,exynos4210-uart";
 		reg = <0xC0000 0x1000>;
 		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
@@ -124,7 +124,7 @@
 		clock-names = "uart", "clk_uart_baud0";
 	};
 
-	spi_0: spi@D0000 {
+	spi_0: spi@d0000 {
 		compatible = "samsung,exynos5440-spi";
 		reg = <0xD0000 0x100>;
 		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
@@ -136,7 +136,7 @@
 		clock-names = "spi", "spi_busclk0";
 	};
 
-	pin_ctrl: pinctrl@E0000 {
+	pin_ctrl: pinctrl@e0000 {
 		compatible = "samsung,exynos5440-pinctrl";
 		reg = <0xE0000 0x1000>;
 		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
@@ -168,7 +168,7 @@
 		};
 	};
 
-	i2c@F0000 {
+	i2c@f0000 {
 		compatible = "samsung,exynos5440-i2c";
 		reg = <0xF0000 0x1000>;
 		interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
@@ -233,7 +233,7 @@
 		#include "exynos5440-tmu-sensor-conf.dtsi"
 	};
 
-	tmuctrl_1: tmuctrl@16011C {
+	tmuctrl_1: tmuctrl@16011c {
 		compatible = "samsung,exynos5440-tmu";
 		reg = <0x16011C 0x230>, <0x160368 0x10>;
 		interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/s3c2416.dtsi b/arch/arm/boot/dts/s3c2416.dtsi
index 80f007550324..568524325f1a 100644
--- a/arch/arm/boot/dts/s3c2416.dtsi
+++ b/arch/arm/boot/dts/s3c2416.dtsi
@@ -33,7 +33,7 @@
 		compatible = "samsung,s3c2416-irq";
 	};
 
-	clocks: clock-controller@0x4c000000 {
+	clocks: clock-controller@4c000000 {
 		compatible = "samsung,s3c2416-clock";
 		reg = <0x4c000000 0x40>;
 		#clock-cells = <1>;
@@ -72,7 +72,7 @@
 				<&clocks SCLK_UART>;
 	};
 
-	uart_3: serial@5000C000 {
+	uart_3: serial@5000c000 {
 		compatible = "samsung,s3c2440-uart";
 		reg = <0x5000C000 0x4000>;
 		interrupts = <1 18 24 4>, <1 18 25 4>;
@@ -83,7 +83,7 @@
 		status = "disabled";
 	};
 
-	sdhci_1: sdhci@4AC00000 {
+	sdhci_1: sdhci@4ac00000 {
 		compatible = "samsung,s3c6410-sdhci";
 		reg = <0x4AC00000 0x100>;
 		interrupts = <0 0 21 3>;
@@ -94,7 +94,7 @@
 		status = "disabled";
 	};
 
-	sdhci_0: sdhci@4A800000 {
+	sdhci_0: sdhci@4a800000 {
 		compatible = "samsung,s3c6410-sdhci";
 		reg = <0x4A800000 0x100>;
 		interrupts = <0 0 20 3>;
-- 
2.11.0
