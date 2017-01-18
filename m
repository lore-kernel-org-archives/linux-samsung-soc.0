From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v3 2/2] arm64: dts: exynos: Add regulators for Vbus and
 Vbus-Boost
Date: Wed, 18 Jan 2017 12:02:53 +0530
Message-ID: <1484721173-30474-3-git-send-email-pankaj.dubey@samsung.com>
References: <1484721173-30474-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170118063009epcas5p27f555398c9f3f44d733e04a585e74139@epcas5p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1484721173-30474-1-git-send-email-pankaj.dubey@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, krzk@kernel.org, Vivek Gautam <gautamvivek1987@gmail.com>, javier@osg.samsung.com, robh+dt@kernel.org, kgene@kernel.org, sanath@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

From: Vivek Gautam <gautamvivek1987@gmail.com>

Adding fixed voltage regulators for Vbus and Vbus-boost required
by USB 3.0 DRD controller on Exynos7-espresso board.

Signed-off-by: Vivek Gautam <gautamvivek1987@gmail.com>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 45 +++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index 1b2db9f0..e4705fd 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -13,6 +13,7 @@
 #include "exynos7.dtsi"
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/clock/samsung,s2mps11.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Samsung Exynos7 Espresso board based on EXYNOS7";
@@ -32,6 +33,29 @@
 		device_type = "memory";
 		reg = <0x0 0x40000000 0x0 0xC0000000>;
 	};
+
+	usb30_vbus_reg: regulator-usb30 {
+		compatible = "regulator-fixed";
+		regulator-name = "VBUS_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gph1 1 GPIO_ACTIVE_HIGH>;
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
+		gpio = <&gpf4 1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb3drd_boost_en>;
+		enable-active-high;
+	};
+
 };
 
 &fin_pll {
@@ -365,3 +389,24 @@
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
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+
+	usb3drd_boost_en: usb3drd-boost-en {
+		samsung,pins = "gpf4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+};
-- 
2.7.4
