From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RFC v4 7/7] ARM: dts: exynos: Add extcon-usb-gpio node for Odroid XU3
Date: Wed, 08 Jun 2016 15:48:06 +0200
Message-ID: <1465393686-16644-8-git-send-email-k.kozlowski@samsung.com>
References: <1465393686-16644-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1465393686-16644-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: rogerq@ti.com, Peter Chen <peter.chen@freescale.com>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, balbi@ti.com, kishon@ti.com, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add node for extcon-usb-gpio driver which will be providing
notifications about VBUS/ID changes to the dwc3 driver.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts | 21 +++++++++++++++++++++
 arch/arm/boot/dts/exynos5422-odroidxu3.dts      | 21 +++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts b/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts
index 03fa88c45426..3d4d51bc2e3d 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts
@@ -19,6 +19,27 @@
 / {
 	model = "Hardkernel Odroid XU3 Lite";
 	compatible = "hardkernel,odroid-xu3-lite", "samsung,exynos5800", "samsung,exynos5";
+
+	extcon_usb: extcon_usb {
+		compatible = "linux,extcon-usb-gpio";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_otg_id &usb_vbus>;
+		id-gpio = <&gpx1 1 GPIO_ACTIVE_HIGH>;
+		vbus-gpio = <&gpx3 4 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&pinctrl_0 {
+	usb_otg_id: usb-otg-id {
+		samsung,pins = "gpx1-1";
+		samsung,pin-pud = <0>;
+	};
+
+	usb_vbus: usb-vbus {
+		samsung,pins = "gpx3-4";
+		samsung,pin-pud = <0>;
+	};
 };
 
 &pwm {
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index 9ed6564acfb0..020eb097c9c6 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -18,6 +18,15 @@
 / {
 	model = "Hardkernel Odroid XU3";
 	compatible = "hardkernel,odroid-xu3", "samsung,exynos5800", "samsung,exynos5";
+
+	extcon_usb: extcon_usb {
+		compatible = "linux,extcon-usb-gpio";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_otg_id &usb_vbus>;
+		id-gpio = <&gpx1 1 GPIO_ACTIVE_HIGH>;
+		vbus-gpio = <&gpx3 4 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &i2c_0 {
@@ -52,6 +61,18 @@
 	};
 };
 
+&pinctrl_0 {
+	usb_otg_id: usb-otg-id {
+		samsung,pins = "gpx1-1";
+		samsung,pin-pud = <0>;
+	};
+
+	usb_vbus: usb-vbus {
+		samsung,pins = "gpx3-4";
+		samsung,pin-pud = <0>;
+	};
+};
+
 &pwm {
 	/*
 	 * PWM 0 -- fan
-- 
1.9.1
