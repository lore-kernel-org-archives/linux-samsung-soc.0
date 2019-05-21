From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/5] ARM: dts: exynos: Remove obsolete port sub-nodes from
 EHCI/OHCI devices
Date: Tue, 21 May 2019 13:58:48 +0200
Message-ID: <20190521115849.9882-5-m.szyprowski@samsung.com>
References: <20190521115849.9882-1-m.szyprowski@samsung.com>
        <CGME20190521120330eucas1p21d9704bfd16f286ae764d20e456ef6b3@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190521115849.9882-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, =?UTF-8?q?M=C3=A5ns=20Rullg=C3=A5rd?= <mans@mansr.com>, Krzysztof Kozlowski <krzk@kernel.org>, Peter Chen <peter.chen@nxp.com>, Alan Stern <stern@rowland.harvard.edu>, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Remove custom port sub-nodes from EHCI/OHCI devices. This way boards can
define sub-nodes for the USB devices using generic USB device bindings.

Suggested-by: Måns Rullgård <mans@mansr.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi                | 24 -------------------
 .../boot/dts/exynos4210-universal_c210.dts    |  6 -----
 arch/arm/boot/dts/exynos4412-itop-elite.dts   |  7 ------
 arch/arm/boot/dts/exynos4412-odroidu3.dts     |  6 -----
 arch/arm/boot/dts/exynos4412-odroidx.dts      |  3 ---
 arch/arm/boot/dts/exynos4412-origen.dts       |  7 ------
 arch/arm/boot/dts/exynos5250.dtsi             | 12 ----------
 arch/arm/boot/dts/exynos54xx.dtsi             | 14 -----------
 8 files changed, 79 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 7b94fbd9ed6c..09cae6a0ca77 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -382,23 +382,6 @@
 			status = "disabled";
 			phys = <&exynos_usbphy 1>, <&exynos_usbphy 2>, <&exynos_usbphy 3>;
 			phy-names = "host", "hsic0", "hsic1";
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
 		};
 
 		ohci: ohci@12590000 {
@@ -410,13 +393,6 @@
 			status = "disabled";
 			phys = <&exynos_usbphy 1>;
 			phy-names = "host";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			port@0 {
-				reg = <0>;
-				phys = <&exynos_usbphy 1>;
-				status = "disabled";
-			};
 		};
 
 		i2s1: i2s@13960000 {
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index dbd6b43dbe52..c1c2fd537333 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -206,9 +206,6 @@
 	status = "okay";
 	phys = <&exynos_usbphy 1>;
 	phy-names = "host";
-	port@0 {
-		status = "okay";
-	};
 };
 
 &exynos_usbphy {
@@ -517,9 +514,6 @@
 
 &ohci {
 	status = "okay";
-	port@0 {
-		status = "okay";
-	};
 };
 
 &pinctrl_1 {
diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
index 1763b42c01cb..f6d0a5f5d339 100644
--- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
+++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
@@ -148,13 +148,6 @@
 
 	phys = <&exynos_usbphy 1>, <&exynos_usbphy 3>;
 	phy-names = "host", "hsic1";
-	port@0 {
-		status = "okay";
-	};
-
-	port@2 {
-		status = "okay";
-	};
 };
 
 &exynos_usbphy {
diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index 5bbaccffc9be..8ff243ba4542 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -107,12 +107,6 @@
 &ehci {
 	phys = <&exynos_usbphy 2>, <&exynos_usbphy 3>;
 	phy-names = "hsic0", "hsic1";
-	port@1 {
-		status = "okay";
-	};
-	port@2 {
-		status = "okay";
-	};
 };
 
 &sound {
diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 306dd9365a91..3ea2a0101e80 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -74,9 +74,6 @@
 &ehci {
 	phys = <&exynos_usbphy 2>;
 	phy-names = "hsic0";
-	port@1 {
-		status = "okay";
-	};
 };
 
 &mshc_0 {
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index e609e2af22d1..ecd14b283a6b 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -90,13 +90,6 @@
 	status = "okay";
 	phys = <&exynos_usbphy 2>, <&exynos_usbphy 3>;
 	phy-names = "hsic0", "hsic1";
-
-	port@1 {
-		status = "okay";
-	};
-	port@2 {
-		status = "okay";
-	};
 };
 
 &fimd {
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 2d23e99985e1..c5584f40ebfb 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -619,12 +619,6 @@
 			clock-names = "usbhost";
 			phys = <&usb2_phy_gen 1>;
 			phy-names = "host";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			port@0 {
-				reg = <0>;
-				phys = <&usb2_phy_gen 1>;
-			};
 		};
 
 		ohci: usb@12120000 {
@@ -636,12 +630,6 @@
 			clock-names = "usbhost";
 			phys = <&usb2_phy_gen 1>;
 			phy-names = "host";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			port@0 {
-				reg = <0>;
-				phys = <&usb2_phy_gen 1>;
-			};
 		};
 
 		usb2_phy_gen: phy@12130000 {
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index ab1642cf0428..97746a68791a 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -182,13 +182,6 @@
 			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usb2_phy 1>;
 			phy-names = "host";
-
-			#address-cells = <1>;
-			#size-cells = <0>;
-			port@0 {
-				reg = <0>;
-				phys = <&usb2_phy 1>;
-			};
 		};
 
 		usbhost1: usb@12120000 {
@@ -197,13 +190,6 @@
 			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usb2_phy 1>;
 			phy-names = "host";
-
-			#address-cells = <1>;
-			#size-cells = <0>;
-			port@0 {
-				reg = <0>;
-				phys = <&usb2_phy 1>;
-			};
 		};
 
 		usb2_phy: phy@12130000 {
-- 
2.17.1
