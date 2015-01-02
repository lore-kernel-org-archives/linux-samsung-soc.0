From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: DTS: Exynos: convert to generic power domain bindings
Date: Fri, 02 Jan 2015 10:36:29 +0100
Message-ID: <1420191389-1409-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:19480 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750722AbbABJgl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Jan 2015 04:36:41 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NHJ00D94MVTS560@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 02 Jan 2015 09:40:42 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Ulf Hansson <ulf.hansson@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kevin Hilman <khilman@kernel.org>

This patch replaces all custom samsung,power-domain device tree properties
with generic power domain bindings and updates documentation Samsung's devices
refering to old binding.

Suggested-by: Kevin Hilman <khilman@kernel.org>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../bindings/arm/exynos/power_domain.txt           |  2 +-
 .../devicetree/bindings/iommu/samsung,sysmmu.txt   |  6 +++---
 .../devicetree/bindings/media/s5p-mfc.txt          |  4 ++--
 .../devicetree/bindings/video/exynos_dsim.txt      |  4 ++--
 .../devicetree/bindings/video/samsung-fimd.txt     |  4 ++--
 arch/arm/boot/dts/exynos3250.dtsi                  | 11 +++++++---
 arch/arm/boot/dts/exynos4.dtsi                     | 25 ++++++++++++++--------
 arch/arm/boot/dts/exynos4210.dtsi                  |  1 +
 arch/arm/boot/dts/exynos4415.dtsi                  |  7 ++++++
 arch/arm/boot/dts/exynos4x12.dtsi                  |  7 +++---
 arch/arm/boot/dts/exynos5250.dtsi                  | 12 ++++++-----
 arch/arm/boot/dts/exynos5420.dtsi                  | 10 ++++++---
 12 files changed, 60 insertions(+), 33 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
index abde1ea8a119..f4445e5a2bbb 100644
--- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
+++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
@@ -23,7 +23,7 @@ Optional Properties:
 		devices in this power domain. Maximum of 4 pairs (N = 0 to 3)
 		are supported currently.
 
-Node of a device using power domains must have a samsung,power-domain property
+Node of a device using power domains must have a power-domains property
 defined with a phandle to respective power domain.
 
 Example:
diff --git a/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt b/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt
index 6fa4c737af23..729543c47046 100644
--- a/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt
+++ b/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt
@@ -45,7 +45,7 @@ Required properties:
 	       Exynos4 SoCs, there needs no "master" clock.
 	       Exynos5 SoCs, some System MMUs must have "master" clocks.
 - clocks: Required if the System MMU is needed to gate its clock.
-- samsung,power-domain: Required if the System MMU is needed to gate its power.
+- power-domains: Required if the System MMU is needed to gate its power.
 	  Please refer to the following document:
 	  Documentation/devicetree/bindings/arm/exynos/power_domain.txt
 
@@ -54,7 +54,7 @@ Examples:
 		compatible = "samsung,exynos5-gsc";
 		reg = <0x13e00000 0x1000>;
 		interrupts = <0 85 0>;
-		samsung,power-domain = <&pd_gsc>;
+		power-domains = <&pd_gsc>;
 		clocks = <&clock CLK_GSCL0>;
 		clock-names = "gscl";
 	};
@@ -66,5 +66,5 @@ Examples:
 		interrupts = <2 0>;
 		clock-names = "sysmmu", "master";
 		clocks = <&clock CLK_SMMU_GSCL0>, <&clock CLK_GSCL0>;
-		samsung,power-domain = <&pd_gsc>;
+		power-domains = <&pd_gsc>;
 	};
diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt b/Documentation/devicetree/bindings/media/s5p-mfc.txt
index 3e3c5f349570..2d5787eac91a 100644
--- a/Documentation/devicetree/bindings/media/s5p-mfc.txt
+++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
@@ -28,7 +28,7 @@ Required properties:
 		    for DMA contiguous memory allocation and its size.
 
 Optional properties:
-  - samsung,power-domain : power-domain property defined with a phandle
+  - power-domains : power-domain property defined with a phandle
 			   to respective power domain.
 
 Example:
@@ -38,7 +38,7 @@ mfc: codec@13400000 {
 	compatible = "samsung,mfc-v5";
 	reg = <0x13400000 0x10000>;
 	interrupts = <0 94 0>;
-	samsung,power-domain = <&pd_mfc>;
+	power-domains = <&pd_mfc>;
 	clocks = <&clock 273>;
 	clock-names = "mfc";
 };
diff --git a/Documentation/devicetree/bindings/video/exynos_dsim.txt b/Documentation/devicetree/bindings/video/exynos_dsim.txt
index ca2b4aacd9af..802aa7ef64e5 100644
--- a/Documentation/devicetree/bindings/video/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/video/exynos_dsim.txt
@@ -21,7 +21,7 @@ Required properties:
     according to DSI host bindings (see MIPI DSI bindings [1])
 
 Optional properties:
-  - samsung,power-domain: a phandle to DSIM power domain node
+  - power-domains: a phandle to DSIM power domain node
 
 Child nodes:
   Should contain DSI peripheral nodes (see MIPI DSI bindings [1]).
@@ -53,7 +53,7 @@ Example:
 		phy-names = "dsim";
 		vddcore-supply = <&vusb_reg>;
 		vddio-supply = <&vmipi_reg>;
-		samsung,power-domain = <&pd_lcd0>;
+		power-domains = <&pd_lcd0>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		samsung,pll-clock-frequency = <24000000>;
diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b/Documentation/devicetree/bindings/video/samsung-fimd.txt
index cf1af6371021..a8bbbde03e79 100644
--- a/Documentation/devicetree/bindings/video/samsung-fimd.txt
+++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
@@ -38,7 +38,7 @@ Required properties:
                property. Must contain "sclk_fimd" and "fimd".
 
 Optional Properties:
-- samsung,power-domain: a phandle to FIMD power domain node.
+- power-domains: a phandle to FIMD power domain node.
 - samsung,invert-vden: video enable signal is inverted
 - samsung,invert-vclk: video clock signal is inverted
 - display-timings: timing settings for FIMD, as described in document [1].
@@ -97,7 +97,7 @@ SoC specific DT entry:
 		interrupts = <11 0>, <11 1>, <11 2>;
 		clocks = <&clock 140>, <&clock 283>;
 		clock-names = "sclk_fimd", "fimd";
-		samsung,power-domain = <&pd_lcd0>;
+		power-domains = <&pd_lcd0>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 22465494b796..60307f6a82b7 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -141,26 +141,31 @@
 		pd_cam: cam-power-domain@10023C00 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023C00 0x20>;
+			#power-domain-cells = <0>;
 		};
 
 		pd_mfc: mfc-power-domain@10023C40 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023C40 0x20>;
+			#power-domain-cells = <0>;
 		};
 
 		pd_g3d: g3d-power-domain@10023C60 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023C60 0x20>;
+			#power-domain-cells = <0>;
 		};
 
 		pd_lcd0: lcd0-power-domain@10023C80 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023C80 0x20>;
+			#power-domain-cells = <0>;
 		};
 
 		pd_isp: isp-power-domain@10023CA0 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023CA0 0x20>;
+			#power-domain-cells = <0>;
 		};
 
 		cmu: clock-controller@10030000 {
@@ -235,7 +240,7 @@
 			interrupts = <0 84 0>, <0 85 0>, <0 86 0>;
 			clocks = <&cmu CLK_SCLK_FIMD0>, <&cmu CLK_FIMD0>;
 			clock-names = "sclk_fimd", "fimd";
-			samsung,power-domain = <&pd_lcd0>;
+			power-domains = <&pd_lcd0>;
 			samsung,sysreg = <&sys_reg>;
 			status = "disabled";
 		};
@@ -245,7 +250,7 @@
 			reg = <0x11C80000 0x10000>;
 			interrupts = <0 83 0>;
 			samsung,phy-type = <0>;
-			samsung,power-domain = <&pd_lcd0>;
+			power-domains = <&pd_lcd0>;
 			phys = <&mipi_phy 1>;
 			phy-names = "dsim";
 			clocks = <&cmu CLK_DSIM0>, <&cmu CLK_SCLK_MIPI0>;
@@ -327,7 +332,7 @@
 			interrupts = <0 102 0>;
 			clock-names = "mfc", "sclk_mfc";
 			clocks = <&cmu CLK_MFC>, <&cmu CLK_SCLK_MFC>;
-			samsung,power-domain = <&pd_mfc>;
+			power-domains = <&pd_mfc>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index b8168f1f8139..c5dc2efb99ed 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -81,36 +81,43 @@
 	pd_mfc: mfc-power-domain@10023C40 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023C40 0x20>;
+		#power-domain-cells = <0>;
 	};
 
 	pd_g3d: g3d-power-domain@10023C60 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023C60 0x20>;
+		#power-domain-cells = <0>;
 	};
 
 	pd_lcd0: lcd0-power-domain@10023C80 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023C80 0x20>;
+		#power-domain-cells = <0>;
 	};
 
 	pd_tv: tv-power-domain@10023C20 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023C20 0x20>;
+		#power-domain-cells = <0>;
 	};
 
 	pd_cam: cam-power-domain@10023C00 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023C00 0x20>;
+		#power-domain-cells = <0>;
 	};
 
 	pd_gps: gps-power-domain@10023CE0 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023CE0 0x20>;
+		#power-domain-cells = <0>;
 	};
 
 	pd_gps_alive: gps-alive-power-domain@10023D00 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023D00 0x20>;
+		#power-domain-cells = <0>;
 	};
 
 	gic: interrupt-controller@10490000 {
@@ -147,7 +154,7 @@
 		compatible = "samsung,exynos4210-mipi-dsi";
 		reg = <0x11C80000 0x10000>;
 		interrupts = <0 79 0>;
-		samsung,power-domain = <&pd_lcd0>;
+		power-domains = <&pd_lcd0>;
 		phys = <&mipi_phy 1>;
 		phy-names = "dsim";
 		clocks = <&clock CLK_DSIM0>, <&clock CLK_SCLK_MIPI0>;
@@ -172,7 +179,7 @@
 			interrupts = <0 84 0>;
 			clocks = <&clock CLK_FIMC0>, <&clock CLK_SCLK_FIMC0>;
 			clock-names = "fimc", "sclk_fimc";
-			samsung,power-domain = <&pd_cam>;
+			power-domains = <&pd_cam>;
 			samsung,sysreg = <&sys_reg>;
 			status = "disabled";
 		};
@@ -183,7 +190,7 @@
 			interrupts = <0 85 0>;
 			clocks = <&clock CLK_FIMC1>, <&clock CLK_SCLK_FIMC1>;
 			clock-names = "fimc", "sclk_fimc";
-			samsung,power-domain = <&pd_cam>;
+			power-domains = <&pd_cam>;
 			samsung,sysreg = <&sys_reg>;
 			status = "disabled";
 		};
@@ -194,7 +201,7 @@
 			interrupts = <0 86 0>;
 			clocks = <&clock CLK_FIMC2>, <&clock CLK_SCLK_FIMC2>;
 			clock-names = "fimc", "sclk_fimc";
-			samsung,power-domain = <&pd_cam>;
+			power-domains = <&pd_cam>;
 			samsung,sysreg = <&sys_reg>;
 			status = "disabled";
 		};
@@ -205,7 +212,7 @@
 			interrupts = <0 87 0>;
 			clocks = <&clock CLK_FIMC3>, <&clock CLK_SCLK_FIMC3>;
 			clock-names = "fimc", "sclk_fimc";
-			samsung,power-domain = <&pd_cam>;
+			power-domains = <&pd_cam>;
 			samsung,sysreg = <&sys_reg>;
 			status = "disabled";
 		};
@@ -217,7 +224,7 @@
 			clocks = <&clock CLK_CSIS0>, <&clock CLK_SCLK_CSIS0>;
 			clock-names = "csis", "sclk_csis";
 			bus-width = <4>;
-			samsung,power-domain = <&pd_cam>;
+			power-domains = <&pd_cam>;
 			phys = <&mipi_phy 0>;
 			phy-names = "csis";
 			status = "disabled";
@@ -232,7 +239,7 @@
 			clocks = <&clock CLK_CSIS1>, <&clock CLK_SCLK_CSIS1>;
 			clock-names = "csis", "sclk_csis";
 			bus-width = <2>;
-			samsung,power-domain = <&pd_cam>;
+			power-domains = <&pd_cam>;
 			phys = <&mipi_phy 2>;
 			phy-names = "csis";
 			status = "disabled";
@@ -391,7 +398,7 @@
 		compatible = "samsung,mfc-v5";
 		reg = <0x13400000 0x10000>;
 		interrupts = <0 94 0>;
-		samsung,power-domain = <&pd_mfc>;
+		power-domains = <&pd_mfc>;
 		clocks = <&clock CLK_MFC>, <&clock CLK_SCLK_MFC>;
 		clock-names = "mfc", "sclk_mfc";
 		status = "disabled";
@@ -641,7 +648,7 @@
 		interrupts = <11 0>, <11 1>, <11 2>;
 		clocks = <&clock CLK_SCLK_FIMD0>, <&clock CLK_FIMD0>;
 		clock-names = "sclk_fimd", "fimd";
-		samsung,power-domain = <&pd_lcd0>;
+		power-domains = <&pd_lcd0>;
 		samsung,sysreg = <&sys_reg>;
 		status = "disabled";
 	};
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index bcc9e63c8070..6728aaa2af9d 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -79,6 +79,7 @@
 	pd_lcd1: lcd1-power-domain@10023CA0 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023CA0 0x20>;
+		#power-domain-cells = <0>;
 	};
 
 	gic: interrupt-controller@10490000 {
diff --git a/arch/arm/boot/dts/exynos4415.dtsi b/arch/arm/boot/dts/exynos4415.dtsi
index c1c9b37340d9..2007def1ab43 100644
--- a/arch/arm/boot/dts/exynos4415.dtsi
+++ b/arch/arm/boot/dts/exynos4415.dtsi
@@ -131,36 +131,43 @@
 		pd_cam: cam-power-domain@10024000 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10024000 0x20>;
+			#power-domain-cells = <0>;
 		};
 
 		pd_tv: tv-power-domain@10024020 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10024020 0x20>;
+			#power-domain-cells = <0>;
 		};
 
 		pd_mfc: mfc-power-domain@10024040 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10024040 0x20>;
+			#power-domain-cells = <0>;
 		};
 
 		pd_g3d: g3d-power-domain@10024060 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10024060 0x20>;
+			#power-domain-cells = <0>;
 		};
 
 		pd_lcd0: lcd0-power-domain@10024080 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10024080 0x20>;
+			#power-domain-cells = <0>;
 		};
 
 		pd_isp0: isp0-power-domain@100240A0 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x100240A0 0x20>;
+			#power-domain-cells = <0>;
 		};
 
 		pd_isp1: isp1-power-domain@100240E0 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x100240E0 0x20>;
+			#power-domain-cells = <0>;
 		};
 
 		cmu: clock-controller@10030000 {
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 93b70402e943..da8734e25f50 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -52,6 +52,7 @@
 	pd_isp: isp-power-domain@10023CA0 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023CA0 0x20>;
+		#power-domain-cells = <0>;
 	};
 
 	clock: clock-controller@10030000 {
@@ -195,7 +196,7 @@
 			compatible = "samsung,exynos4212-fimc-lite";
 			reg = <0x12390000 0x1000>;
 			interrupts = <0 105 0>;
-			samsung,power-domain = <&pd_isp>;
+			power-domains = <&pd_isp>;
 			clocks = <&clock CLK_FIMC_LITE0>;
 			clock-names = "flite";
 			status = "disabled";
@@ -205,7 +206,7 @@
 			compatible = "samsung,exynos4212-fimc-lite";
 			reg = <0x123A0000 0x1000>;
 			interrupts = <0 106 0>;
-			samsung,power-domain = <&pd_isp>;
+			power-domains = <&pd_isp>;
 			clocks = <&clock CLK_FIMC_LITE1>;
 			clock-names = "flite";
 			status = "disabled";
@@ -215,7 +216,7 @@
 			compatible = "samsung,exynos4212-fimc-is", "simple-bus";
 			reg = <0x12000000 0x260000>;
 			interrupts = <0 90 0>, <0 95 0>;
-			samsung,power-domain = <&pd_isp>;
+			power-domains = <&pd_isp>;
 			clocks = <&clock CLK_FIMC_LITE0>,
 				 <&clock CLK_FIMC_LITE1>, <&clock CLK_PPMUISPX>,
 				 <&clock CLK_PPMUISPMX>,
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 0a229fcd7acf..2b5a62c91d26 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -93,11 +93,13 @@
 	pd_gsc: gsc-power-domain@10044000 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044000 0x20>;
+		#power-domain-cells = <0>;
 	};
 
 	pd_mfc: mfc-power-domain@10044040 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044040 0x20>;
+		#power-domain-cells = <0>;
 	};
 
 	clock: clock-controller@10010000 {
@@ -222,7 +224,7 @@
 		compatible = "samsung,mfc-v6";
 		reg = <0x11000000 0x10000>;
 		interrupts = <0 96 0>;
-		samsung,power-domain = <&pd_mfc>;
+		power-domains = <&pd_mfc>;
 		clocks = <&clock CLK_MFC>;
 		clock-names = "mfc";
 	};
@@ -682,7 +684,7 @@
 		compatible = "samsung,exynos5-gsc";
 		reg = <0x13e00000 0x1000>;
 		interrupts = <0 85 0>;
-		samsung,power-domain = <&pd_gsc>;
+		power-domains = <&pd_gsc>;
 		clocks = <&clock CLK_GSCL0>;
 		clock-names = "gscl";
 	};
@@ -691,7 +693,7 @@
 		compatible = "samsung,exynos5-gsc";
 		reg = <0x13e10000 0x1000>;
 		interrupts = <0 86 0>;
-		samsung,power-domain = <&pd_gsc>;
+		power-domains = <&pd_gsc>;
 		clocks = <&clock CLK_GSCL1>;
 		clock-names = "gscl";
 	};
@@ -700,7 +702,7 @@
 		compatible = "samsung,exynos5-gsc";
 		reg = <0x13e20000 0x1000>;
 		interrupts = <0 87 0>;
-		samsung,power-domain = <&pd_gsc>;
+		power-domains = <&pd_gsc>;
 		clocks = <&clock CLK_GSCL2>;
 		clock-names = "gscl";
 	};
@@ -709,7 +711,7 @@
 		compatible = "samsung,exynos5-gsc";
 		reg = <0x13e30000 0x1000>;
 		interrupts = <0 88 0>;
-		samsung,power-domain = <&pd_gsc>;
+		power-domains = <&pd_gsc>;
 		clocks = <&clock CLK_GSCL3>;
 		clock-names = "gscl";
 	};
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 517e50f6760b..03ef2481c640 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -178,7 +178,7 @@
 		interrupts = <0 96 0>;
 		clocks = <&clock CLK_MFC>;
 		clock-names = "mfc";
-		samsung,power-domain = <&mfc_pd>;
+		power-domains = <&mfc_pd>;
 	};
 
 	mmc_0: mmc@12200000 {
@@ -250,11 +250,13 @@
 	gsc_pd: power-domain@10044000 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044000 0x20>;
+		#power-domain-cells = <0>;
 	};
 
 	isp_pd: power-domain@10044020 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044020 0x20>;
+		#power-domain-cells = <0>;
 	};
 
 	mfc_pd: power-domain@10044060 {
@@ -263,11 +265,13 @@
 		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MOUT_SW_ACLK333>,
 			<&clock CLK_MOUT_USER_ACLK333>;
 		clock-names = "oscclk", "pclk0", "clk0";
+		#power-domain-cells = <0>;
 	};
 
 	msc_pd: power-domain@10044120 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044120 0x20>;
+		#power-domain-cells = <0>;
 	};
 
 	pinctrl_0: pinctrl@13400000 {
@@ -730,7 +734,7 @@
 		interrupts = <0 85 0>;
 		clocks = <&clock CLK_GSCL0>;
 		clock-names = "gscl";
-		samsung,power-domain = <&gsc_pd>;
+		power-domains = <&gsc_pd>;
 	};
 
 	gsc_1: video-scaler@13e10000 {
@@ -739,7 +743,7 @@
 		interrupts = <0 86 0>;
 		clocks = <&clock CLK_GSCL1>;
 		clock-names = "gscl";
-		samsung,power-domain = <&gsc_pd>;
+		power-domains = <&gsc_pd>;
 	};
 
 	pmu_system_controller: system-controller@10040000 {
-- 
1.9.2
