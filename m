From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 3/4] arm: dts: exynos5250: Use regulator for USB 2.0 VBUS supply
Date: Thu, 11 Dec 2014 17:32:46 +0530
Message-ID: <1418299367-2412-4-git-send-email-gautam.vivek@samsung.com>
References: <1418299367-2412-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42613 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751985AbaLKMMq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Dec 2014 07:12:46 -0500
In-reply-to: <1418299367-2412-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, kishon@ti.com, k.debski@samsung.com, kgene@kernel.org, jg1.han@samsung.com, Vivek Gautam <gautam.vivek@samsung.com>

Start using VBUS regulator for USB 2.0 phy, so that we can
remove the gpio property from host's node later.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   22 ++++++++++++++++++++++
 arch/arm/boot/dts/exynos5250-snow.dts     |   22 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index a759100..85e74df 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -361,6 +361,17 @@
 		samsung,audio-codec = <&wm8994>;
 	};
 
+	usb2_vbus_reg: regulator-usb2 {
+		compatible = "regulator-fixed";
+		regulator-name = "P5.0V_USB2";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpx2 6 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb2_vbus_en>;
+		enable-active-high;
+	};
+
 	usb@12110000 {
 		samsung,vbus-gpio = <&gpx2 6 0>;
 	};
@@ -418,4 +429,15 @@
 		samsung,pin-pud = <0>;
 		samsung,pin-drv = <0>;
 	};
+
+	usb2_vbus_en: usb2-vbus-en {
+		samsung,pins = "gpx2-6";
+		samsung,pin-function = <1>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+};
+
+&usb2_phy_gen {
+	vbus-supply = <&usb2_vbus_reg>;
 };
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 60429ad..8085750 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -285,6 +285,17 @@
 		vbus-supply = <&usb3_vbus_reg>;
 	};
 
+	usb2_vbus_reg: regulator-usb2 {
+		compatible = "regulator-fixed";
+		regulator-name = "P5.0V_USB2";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpx1 1 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb2_vbus_en>;
+		enable-active-high;
+	};
+
 	usb@12110000 {
 		samsung,vbus-gpio = <&gpx1 1 0>;
 	};
@@ -616,6 +627,13 @@
 		samsung,pin-pud = <0>;
 		samsung,pin-drv = <0>;
 	};
+
+	usb2_vbus_en: usb2-vbus-en {
+		samsung,pins = "gpx1-1";
+		samsung,pin-function = <1>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
 };
 
 &spi_1 {
@@ -628,4 +646,8 @@
 	dr_mode = "host";
 };
 
+&usb2_phy_gen {
+	vbus-supply = <&usb2_vbus_reg>;
+};
+
 #include "cros-ec-keyboard.dtsi"
-- 
1.7.10.4
