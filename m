From: Beomho Seo <beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 1/2] ARM: dts: add cm36651 light/proximity sensor node
Date: Tue, 20 May 2014 19:48:07 +0900
Message-ID: <537B32E7.4070905@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Myungjoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Exynos4412-trats2 board have light/proximity sensor.
This patch add cm36651 light/ proximity sensor node for exynos4412.
cm36651 is required properties as below.
- Use i2c-gpio for cm36651 sensor.
- Use fixed regulator for the IR LED.
  It is a part of the cm36651 for proximity detection.
- cm36651 is i2c device driver so need to use i2c-gpio driver.

Signed-off-by: Beomho Seo <beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Changes in v3:
- Remove "status" property.
- Change gpio/interrupt specified.

Changes in v2:
- None.
---
 arch/arm/boot/dts/exynos4412-trats2.dts |   27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index f621fd9..dda7517 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -21,6 +21,7 @@

 	aliases {
 		i2c9 = &i2c_ak8975;
+		i2c10 = &i2c_cm36651;
 	};

 	memory {
@@ -98,6 +99,16 @@
 			enable-active-high;
 			regulator-always-on;
 		};
+
+		ps_als_reg: voltage-regulator-5 {
+			compatible = "regulator-fixed";
+			regulator-name = "LED_A_3.0V";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			gpio = <&gpj0 5 0>;
+			enable-active-high;
+		};
+
 	};

 	gpio-keys {
@@ -558,6 +569,22 @@
 		};
 	};

+	i2c_cm36651: i2c-gpio-2 {
+		compatible = "i2c-gpio";
+		gpios = <&gpf0 0 1>, <&gpf0 1 1>;
+		i2c-gpio,delay-us = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cm36651@18 {
+			compatible = "capella,cm36651";
+			reg = <0x18>;
+			interrupt-parent = <&gpx0>;
+			interrupts = <2 2>;
+			vled-supply = <&ps_als_reg>;
+		};
+	};
+
 	spi_1: spi@13930000 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&spi1_bus>;
-- 
1.7.9.5
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
