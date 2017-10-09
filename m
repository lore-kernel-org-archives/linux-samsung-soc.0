From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [RESEND PATCH v5] ARM: dts: exynos: Add HDMI and Sil9234 to Trats2
 board
Date: Mon, 09 Oct 2017 09:39:38 +0200
Message-ID: <1507534778-31447-1-git-send-email-m.purski@samsung.com>
References: <20171008114819.deffq33oqbvr4azc@kozik-lap>
        <CGME20171009074012eucas1p17a1e713558fc8faf18220643bdee0afc@eucas1p1.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20171008114819.deffq33oqbvr4azc@kozik-lap>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add HDMI and Sil9234 MHL converter to Trats2 board.
Following in SoC devices have been enabled:
- HDMI (HDMI signal encoder),
- Mixer (video buffer scanout device),
- I2C_5 bus (used for HDMI DDC)
- I2C_8 bus (used for HDMI_PHY control).

Based on previous work by:
Tomasz Stanislawski <t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos4412-trats2.dts | 111 ++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index bceb919..d7f77a6 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -18,6 +18,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/clock/maxim,max77686.h>
+#include <dt-bindings/pinctrl/samsung.h>
 
 / {
 	model = "Samsung Trats 2 based on Exynos4412";
@@ -97,6 +98,34 @@
 			gpio = <&gpj0 5 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
+
+		vsil12: voltage-regulator-6 {
+			compatible = "regulator-fixed";
+			regulator-name = "VSIL_1.2V";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&buck7_reg>;
+		};
+
+		vcc33mhl: voltage-regulator-7 {
+			compatible = "regulator-fixed";
+			regulator-name = "VCC_3.3_MHL";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		vcc18mhl: voltage-regulator-8 {
+			compatible = "regulator-fixed";
+			regulator-name = "VCC_1.8_MHL";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
 	};
 
 	gpio-keys {
@@ -229,6 +258,36 @@
 		};
 	};
 
+	i2c-mhl {
+		compatible = "i2c-gpio";
+		gpios = <&gpf0 4 GPIO_ACTIVE_HIGH>, <&gpf0 6 GPIO_ACTIVE_HIGH>;
+		i2c-gpio,delay-us = <100>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pinctrl-0 = <&i2c_mhl_bus>;
+		pinctrl-names = "default";
+		status = "okay";
+
+		sii9234: hdmi-bridge@39 {
+			compatible = "sil,sii9234";
+			avcc33-supply = <&vcc33mhl>;
+			iovcc18-supply = <&vcc18mhl>;
+			avcc12-supply = <&vsil12>;
+			cvcc12-supply = <&vsil12>;
+			reset-gpios = <&gpf3 4 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&gpf3>;
+			interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x39>;
+
+			port {
+				mhl_to_hdmi: endpoint {
+					remote-endpoint = <&hdmi_to_mhl>;
+				};
+			};
+		};
+	};
+
 	camera: camera {
 		pinctrl-0 = <&cam_port_a_clk_active &cam_port_b_clk_active>;
 		pinctrl-names = "default";
@@ -501,6 +560,29 @@
 	status = "okay";
 };
 
+&hdmi {
+	hpd-gpios = <&gpx3 7 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_hpd>;
+	vdd-supply = <&ldo3_reg>;
+	vdd_osc-supply = <&ldo4_reg>;
+	vdd_pll-supply = <&ldo3_reg>;
+	ddc = <&i2c_5>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			hdmi_to_mhl: endpoint {
+				remote-endpoint = <&mhl_to_hdmi>;
+			};
+		};
+	};
+};
+
 &hsotg {
 	vusb_d-supply = <&ldo15_reg>;
 	vusb_a-supply = <&ldo12_reg>;
@@ -579,6 +661,10 @@
 	};
 };
 
+&i2c_5 {
+	status = "okay";
+};
+
 &i2c_7 {
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
@@ -873,12 +959,20 @@
 	};
 };
 
+&i2c_8 {
+	status = "okay";
+};
+
 &i2s0 {
 	pinctrl-0 = <&i2s0_bus>;
 	pinctrl-names = "default";
 	status = "okay";
 };
 
+&mixer {
+	status = "okay";
+};
+
 &mshc_0 {
 	broken-cd;
 	non-removable;
@@ -904,6 +998,18 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&sleep0>;
 
+	mhl_int: mhl-int {
+		samsung,pins = "gpf3-5";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	i2c_mhl_bus: i2c-mhl-bus {
+		samsung,pins = "gpf0-4", "gpf0-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+
 	sleep0: sleep-states {
 		PIN_SLP(gpa0-0, INPUT, NONE);
 		PIN_SLP(gpa0-1, OUT0, NONE);
@@ -1007,6 +1113,11 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&sleep1>;
 
+	hdmi_hpd: hdmi-hpd {
+		samsung,pins = "gpx3-7";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
 	sleep1: sleep-states {
 		PIN_SLP(gpk0-0, PREV, NONE);
 		PIN_SLP(gpk0-1, PREV, NONE);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
