From: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/2] arm64: dts: exynos: Add regulators for Vbus and Vbus-Boost
Date: Tue, 17 Jan 2017 16:02:23 +0530
Message-ID: <1484649143-19423-3-git-send-email-pankaj.dubey@samsung.com>
References: <1484649143-19423-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170117102941epcas1p3a33a312bedd013edb0997b16786dede6@epcas1p3.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1484649143-19423-1-git-send-email-pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sanath-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Adding fixed voltage regulators for Vbus and Vbus-boost required
by USB 3.0 DRD controller on Exynos7-espresso board.

Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 44 +++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index 9cf73cf..68f3a51 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -33,6 +33,29 @@
 		device_type = "memory";
 		reg = <0x0 0x40000000 0x0 0xC0000000>;
 	};
+
+	usb30_vbus_reg: regulator-usb30 {
+		compatible = "regulator-fixed";
+		regulator-name = "VBUS_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gph1 1 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb30_vbus_en>;
+		enable-active-high;
+	};
+
+	usb3drd_boost_5v: regulator-usb3drd-boost {
+		compatible = "regulator-fixed";
+		regulator-name = "VUSB_VBUS_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpf4 1 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb3drd_boost_en>;
+		enable-active-high;
+	};
+
 };
 
 &fin_pll {
@@ -366,3 +389,24 @@
 	vqmmc-supply = <&ldo2_reg>;
 	disable-wp;
 };
+
+&usbdrd_phy {
+	vbus-supply = <&usb30_vbus_reg>;
+	vbus-boost-supply = <&usb3drd_boost_5v>;
+};
+
+&pinctrl_bus1 {
+	usb30_vbus_en: usb30-vbus-en {
+		samsung,pins = "gph1-1";
+		samsung,pin-function = <1>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
+	usb3drd_boost_en: usb3drd-boost-en {
+		samsung,pins = "gpf4-1";
+		samsung,pin-function = <1>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
