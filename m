From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v2 4/4] dt: exynos5420: Enable support for DWC3 controller
Date: Wed, 04 Dec 2013 15:39:07 +0530
Message-ID: <1386151747-3209-5-git-send-email-gautam.vivek@samsung.com>
References: <1386151747-3209-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1386151747-3209-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, balbi@ti.com, rob.herring@calxeda.com, kgene.kim@samsung.com, kishon@ti.com, jg1.han@samsung.com, s.nawrocki@samsung.com, t.figa@samsung.com, jwerner@chromium.org, k.debski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Add device tree nodes for DWC3 controller present on
Exynos 5420 SoC, to enable support for USB 3.0.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   38 +++++++++++++++++++++++++++++++++++-
 1 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index a88ab00..0554a68 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -313,7 +313,24 @@
 		clock-names = "mixer", "sclk_hdmi";
 	};
 
-	usbphy@12100000 {
+	usb@12000000 {
+		compatible = "samsung,exynos5250-dwusb3";
+		clocks = <&clock 366>;
+		clock-names = "usbdrd30";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		dwc3 {
+			compatible = "synopsys,dwc3";
+			reg = <0x12000000 0x10000>;
+			interrupts = <0 72 0>;
+			phys = <&usb3_phy0>;
+			phy-names = "usb3-phy";
+		};
+	};
+
+	usb3_phy0: usbphy@12100000 {
 		compatible = "samsung,exynos5420-usb3phy";
 		reg = <0x12100000 0x100>;
 		clocks = <&clock 366>, <&clock 1>, <&clock 152>;
@@ -322,7 +339,24 @@
 		#phy-cells = <0>;
 	};
 
-	usbphy@12500000 {
+	usb@12400000 {
+		compatible = "samsung,exynos5250-dwusb3";
+		clocks = <&clock 367>;
+		clock-names = "usbdrd30";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		dwc3 {
+			compatible = "synopsys,dwc3";
+			reg = <0x12400000 0x10000>;
+			interrupts = <0 73 0>;
+			phys = <&usb3_phy1>;
+			phy-names = "usb3-phy";
+		};
+	};
+
+	usb3_phy1: usbphy@12500000 {
 		compatible = "samsung,exynos5420-usb3phy";
 		reg = <0x12500000 0x100>;
 		clocks = <&clock 367>, <&clock 1>, <&clock 153>;
-- 
1.7.6.5
