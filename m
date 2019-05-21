From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/5] ARM: dts: exynos: Add array of generic PHYs to
 EHCI/OHCI devices
Date: Tue, 21 May 2019 13:58:46 +0200
Message-ID: <20190521115849.9882-3-m.szyprowski@samsung.com>
References: <20190521115849.9882-1-m.szyprowski@samsung.com>
        <CGME20190521120205eucas1p27671f3b96e443da8b13bd10618a77636@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190521115849.9882-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, =?UTF-8?q?M=C3=A5ns=20Rullg=C3=A5rd?= <mans@mansr.com>, Krzysztof Kozlowski <krzk@kernel.org>, Peter Chen <peter.chen@nxp.com>, Alan Stern <stern@rowland.harvard.edu>, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add a standard array of PHYs to Exynos EHCI/OHCI devices. This is a first
step in resolving the conflict between Exynos EHCI/OHCI sub-nodes and
generic USB device bindings. Later the sub-nodes currently used for
assigning PHYs to root ports of the controller will be removed making
a place for the generic USB device bindings nodes.

Suggested-by: Måns Rullgård <mans@mansr.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi                  | 4 ++++
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 2 ++
 arch/arm/boot/dts/exynos4412-itop-elite.dts     | 2 ++
 arch/arm/boot/dts/exynos4412-odroidu3.dts       | 2 ++
 arch/arm/boot/dts/exynos4412-odroidx.dts        | 2 ++
 arch/arm/boot/dts/exynos4412-origen.dts         | 2 ++
 arch/arm/boot/dts/exynos5250.dtsi               | 4 ++++
 arch/arm/boot/dts/exynos54xx.dtsi               | 4 ++++
 8 files changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 36ccf227434d..7b94fbd9ed6c 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -380,6 +380,8 @@
 			clocks = <&clock CLK_USB_HOST>;
 			clock-names = "usbhost";
 			status = "disabled";
+			phys = <&exynos_usbphy 1>, <&exynos_usbphy 2>, <&exynos_usbphy 3>;
+			phy-names = "host", "hsic0", "hsic1";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			port@0 {
@@ -406,6 +408,8 @@
 			clocks = <&clock CLK_USB_HOST>;
 			clock-names = "usbhost";
 			status = "disabled";
+			phys = <&exynos_usbphy 1>;
+			phy-names = "host";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			port@0 {
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index bf092e97e14f..dbd6b43dbe52 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -204,6 +204,8 @@
 
 &ehci {
 	status = "okay";
+	phys = <&exynos_usbphy 1>;
+	phy-names = "host";
 	port@0 {
 		status = "okay";
 	};
diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
index 0dedeba89b5f..1763b42c01cb 100644
--- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
+++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
@@ -146,6 +146,8 @@
 	/* In order to reset USB ethernet */
 	samsung,vbus-gpio = <&gpc0 1 GPIO_ACTIVE_HIGH>;
 
+	phys = <&exynos_usbphy 1>, <&exynos_usbphy 3>;
+	phy-names = "host", "hsic1";
 	port@0 {
 		status = "okay";
 	};
diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index 96d99887bceb..5bbaccffc9be 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -105,6 +105,8 @@
 };
 
 &ehci {
+	phys = <&exynos_usbphy 2>, <&exynos_usbphy 3>;
+	phy-names = "hsic0", "hsic1";
 	port@1 {
 		status = "okay";
 	};
diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index a2251581f6b6..306dd9365a91 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -72,6 +72,8 @@
 };
 
 &ehci {
+	phys = <&exynos_usbphy 2>;
+	phy-names = "hsic0";
 	port@1 {
 		status = "okay";
 	};
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 698de4345d16..e609e2af22d1 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -88,6 +88,8 @@
 &ehci {
 	samsung,vbus-gpio = <&gpx3 5 1>;
 	status = "okay";
+	phys = <&exynos_usbphy 2>, <&exynos_usbphy 3>;
+	phy-names = "hsic0", "hsic1";
 
 	port@1 {
 		status = "okay";
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index d5e0392b409e..2d23e99985e1 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -617,6 +617,8 @@
 
 			clocks = <&clock CLK_USB2>;
 			clock-names = "usbhost";
+			phys = <&usb2_phy_gen 1>;
+			phy-names = "host";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			port@0 {
@@ -632,6 +634,8 @@
 
 			clocks = <&clock CLK_USB2>;
 			clock-names = "usbhost";
+			phys = <&usb2_phy_gen 1>;
+			phy-names = "host";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			port@0 {
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index ae866bcc30c4..ab1642cf0428 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -180,6 +180,8 @@
 			compatible = "samsung,exynos4210-ehci";
 			reg = <0x12110000 0x100>;
 			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usb2_phy 1>;
+			phy-names = "host";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -193,6 +195,8 @@
 			compatible = "samsung,exynos4210-ohci";
 			reg = <0x12120000 0x100>;
 			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usb2_phy 1>;
+			phy-names = "host";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.17.1
