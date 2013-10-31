From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 4/4] dt: exynos5420: Enable support for DWC3 controller
Date: Thu, 31 Oct 2013 13:15:44 +0530
Message-ID: <1383205544-32244-5-git-send-email-gautam.vivek@samsung.com>
References: <1383205544-32244-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1383205544-32244-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, gregkh@linuxfoundation.org, kishon@ti.com, kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, t.figa@samsung.com, balbi@ti.com, jwerner@chromium.org, jg1.han@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Add device tree nodes for DWC3 controller present on
Exynos 5420 SoC, to enable support for USB 3.0.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   38 +++++++++++++++++++++++++++++++++++-
 1 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 5df3308..4f676c1 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -236,7 +236,24 @@
 		status = "disabled";
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
 		reg = <0x12100000 0x100 0x10040704 0x4>;
 		clocks = <&clock 366>, <&clock 1>, <&clock 152>;
@@ -244,7 +261,24 @@
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
 		reg = <0x12500000 0x100 0x10040708 0x4>;
 		clocks = <&clock 367>, <&clock 1>, <&clock 153>;
-- 
1.7.6.5
