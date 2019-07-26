From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 3/3] ARM: dts: exynos: Use standard arrays of generic
 PHYs for EHCI/OHCI devices
Date: Fri, 26 Jul 2019 10:14:53 +0200
Message-ID: <20190726081453.9456-4-m.szyprowski@samsung.com>
References: <20190726081453.9456-1-m.szyprowski@samsung.com>
        <CGME20190726081506eucas1p20e7e633e89529b862952fe9f783f72e5@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190726081453.9456-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, =?UTF-8?q?M=C3=A5ns=20Rullg=C3=A5rd?= <mans@mansr.com>, Krzysztof Kozlowski <krzk@kernel.org>, Peter Chen <peter.chen@nxp.com>, Alan Stern <stern@rowland.harvard.edu>, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Move USB PHYs to a standard arrays for Exynos EHCI/OHCI devices. This
resolves the conflict between Exynos EHCI/OHCI sub-nodes and generic USB
device bindings. Once the Exynos EHCI/OHCI sub-nodes are removed, the
boards can finally provide sub-nodes for the USB devices using generic USB
device bindings.

Suggested-by: Måns Rullgård <mans@mansr.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi                | 28 +++----------------
 .../boot/dts/exynos4210-universal_c210.dts    |  8 ++----
 arch/arm/boot/dts/exynos4412-itop-elite.dts   |  9 ++----
 arch/arm/boot/dts/exynos4412-odroidu3.dts     |  8 ++----
 arch/arm/boot/dts/exynos4412-odroidx.dts      |  5 ++--
 arch/arm/boot/dts/exynos4412-origen.dts       |  9 ++----
 arch/arm/boot/dts/exynos5250.dtsi             | 16 +++--------
 arch/arm/boot/dts/exynos54xx.dtsi             | 18 +++---------
 8 files changed, 22 insertions(+), 79 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 1264cc431ff6..433f109d97ca 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -380,23 +380,8 @@
 			clocks = <&clock CLK_USB_HOST>;
 			clock-names = "usbhost";
 			status = "disabled";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			port@0 {
-				reg = <0>;
-				phys = <&exynos_usbphy 1>;
-				status = "disabled";
-			};
-			port@1 {
-				reg = <1>;
-				phys = <&exynos_usbphy 2>;
-				status = "disabled";
-			};
-			port@2 {
-				reg = <2>;
-				phys = <&exynos_usbphy 3>;
-				status = "disabled";
-			};
+			phys = <&exynos_usbphy 1>, <&exynos_usbphy 2>, <&exynos_usbphy 3>;
+			phy-names = "host", "hsic0", "hsic1";
 		};
 
 		ohci: ohci@12590000 {
@@ -406,13 +391,8 @@
 			clocks = <&clock CLK_USB_HOST>;
 			clock-names = "usbhost";
 			status = "disabled";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			port@0 {
-				reg = <0>;
-				phys = <&exynos_usbphy 1>;
-				status = "disabled";
-			};
+			phys = <&exynos_usbphy 1>;
+			phy-names = "host";
 		};
 
 		gpu: gpu@13000000 {
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 82a8b5449978..09d3d54d09ff 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -204,9 +204,8 @@
 
 &ehci {
 	status = "okay";
-	port@0 {
-		status = "okay";
-	};
+	phys = <&exynos_usbphy 1>;
+	phy-names = "host";
 };
 
 &exynos_usbphy {
@@ -520,9 +519,6 @@
 
 &ohci {
 	status = "okay";
-	port@0 {
-		status = "okay";
-	};
 };
 
 &pinctrl_1 {
diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
index 0dedeba89b5f..f6d0a5f5d339 100644
--- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
+++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
@@ -146,13 +146,8 @@
 	/* In order to reset USB ethernet */
 	samsung,vbus-gpio = <&gpc0 1 GPIO_ACTIVE_HIGH>;
 
-	port@0 {
-		status = "okay";
-	};
-
-	port@2 {
-		status = "okay";
-	};
+	phys = <&exynos_usbphy 1>, <&exynos_usbphy 3>;
+	phy-names = "host", "hsic1";
 };
 
 &exynos_usbphy {
diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index 96d99887bceb..8ff243ba4542 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -105,12 +105,8 @@
 };
 
 &ehci {
-	port@1 {
-		status = "okay";
-	};
-	port@2 {
-		status = "okay";
-	};
+	phys = <&exynos_usbphy 2>, <&exynos_usbphy 3>;
+	phy-names = "hsic0", "hsic1";
 };
 
 &sound {
diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index a2251581f6b6..3ea2a0101e80 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -72,9 +72,8 @@
 };
 
 &ehci {
-	port@1 {
-		status = "okay";
-	};
+	phys = <&exynos_usbphy 2>;
+	phy-names = "hsic0";
 };
 
 &mshc_0 {
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 698de4345d16..ecd14b283a6b 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -88,13 +88,8 @@
 &ehci {
 	samsung,vbus-gpio = <&gpx3 5 1>;
 	status = "okay";
-
-	port@1 {
-		status = "okay";
-	};
-	port@2 {
-		status = "okay";
-	};
+	phys = <&exynos_usbphy 2>, <&exynos_usbphy 3>;
+	phy-names = "hsic0", "hsic1";
 };
 
 &fimd {
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index d5e0392b409e..c5584f40ebfb 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -617,12 +617,8 @@
 
 			clocks = <&clock CLK_USB2>;
 			clock-names = "usbhost";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			port@0 {
-				reg = <0>;
-				phys = <&usb2_phy_gen 1>;
-			};
+			phys = <&usb2_phy_gen 1>;
+			phy-names = "host";
 		};
 
 		ohci: usb@12120000 {
@@ -632,12 +628,8 @@
 
 			clocks = <&clock CLK_USB2>;
 			clock-names = "usbhost";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			port@0 {
-				reg = <0>;
-				phys = <&usb2_phy_gen 1>;
-			};
+			phys = <&usb2_phy_gen 1>;
+			phy-names = "host";
 		};
 
 		usb2_phy_gen: phy@12130000 {
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index 0b27bebf9528..9c3b63b7cac6 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -189,26 +189,16 @@
 			compatible = "samsung,exynos4210-ehci";
 			reg = <0x12110000 0x100>;
 			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
-
-			#address-cells = <1>;
-			#size-cells = <0>;
-			port@0 {
-				reg = <0>;
-				phys = <&usb2_phy 1>;
-			};
+			phys = <&usb2_phy 1>;
+			phy-names = "host";
 		};
 
 		usbhost1: usb@12120000 {
 			compatible = "samsung,exynos4210-ohci";
 			reg = <0x12120000 0x100>;
 			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
-
-			#address-cells = <1>;
-			#size-cells = <0>;
-			port@0 {
-				reg = <0>;
-				phys = <&usb2_phy 1>;
-			};
+			phys = <&usb2_phy 1>;
+			phy-names = "host";
 		};
 
 		usb2_phy: phy@12130000 {
-- 
2.17.1
