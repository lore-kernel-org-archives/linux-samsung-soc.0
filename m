From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [PATCH 1/1] ARM: dts: exynos5422-odroidxu3: add 'rtc_src' clock to
 rtc node
Date: Mon, 30 Mar 2015 12:49:44 +0200
Message-ID: <55192A48.3070201@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:43284 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751659AbbC3LIN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Mar 2015 07:08:13 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>

The Exynos5422 SoC has a s3c6410 RTC where the source clock
is now a mandatory property.

This patch fixes probe failure of s3c-rtc on Odroid-XU3 boards.
It is based in v4.0-rc2.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
Tested-by: Anand Moon <linux.amoon@gmail.com>
---
 .../devicetree/bindings/clock/samsung,s2mps11.txt  | 67 ++++++++++++++++++++++
 arch/arm/boot/dts/exynos5422-odroidxu3.dts         | 12 ++--
 include/dt-bindings/clock/samsung,s2mps11.h        | 23 ++++++++
 3 files changed, 98 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
 create mode 100644 include/dt-bindings/clock/samsung,s2mps11.h

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.txt b/Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
new file mode 100644
index 0000000..46c61ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
@@ -0,0 +1,67 @@
+Binding for Samsung S2MPS11 32k clock generator block
+
+This is a part of device tree bindings of S2MPS11 multi-function device.
+More information can be found in bindings/mfd/s2mps11.txt file.
+
+The S2MPS11 contains three 32.768khz clock outputs that can be controlled
+(gated/ungated) over I2C.
+
+Following properties should be present in main device node of the MFD chip.
+
+Required properties:
+- #clock-cells: From common clock binding; shall be set to 1.
+
+Optional properties:
+- clock-output-names: From common clock binding.
+
+Each clock is assigned an identifier and client nodes can use this identifier
+to specify the clock which they consume. Following indices are allowed:
+     - 0: 32khz_ap clock,
+     - 1: 32khz_cp clock.
+     - 2: 32khz_bt clock
+
+Clocks are defined as preprocessor macros in dt-bindings/clock/samsung,s2mps11.h
+header and can be used in device tree sources.
+
+Example: Node of the MFD chip
+
+	s2mps11: s2mps11@66 {
+		compatible = "samsung,s2mps11";
+		interrupt-parent = <&wakeup_eint>;
+		interrupts = <26 0>;
+		reg = <0x66>;
+		#clock-cells = <1>;
+
+		/* ... */
+	};
+
+Example: Clock consumer node
+
+	foo@0 {
+		compatible = "bar,foo";
+		/* ... */
+		clock-names = "my-clock";
+		clocks = <&s2mps11 S2MPS11_CLK_32K_AP>;
+	};
+
+Presently (19.3.2015) the above said is not correct yet.
+Until s2mps11 mfd driver is updated you still need to specify like that:
+
+	s2mps11: s2mps11@66 {
+		compatible = "samsung,s2mps11-pmic";
+		reg = <0x66>;
+		s2mps11_osc: clocks {
+			#clock-cells = <1>;
+			clock-output-names = "s2mps11_ap",
+				"s2mps11_cp", "s2mps11_bt";
+                        };
+		/* ... */
+	}
+
+	foo@0 {
+		compatible = "bar,foo";
+		/* ... */
+		clock-names = "my-clock";
+	        clocks = <&s2mps11_osc S2MPS11_CLK_AP>;
+
+};
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index a519c86..7f1bb31 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -11,6 +11,7 @@
 */
 
 /dts-v1/;
+#include <dt-bindings/clock/samsung,s2mps11.h>
 #include "exynos5800.dtsi"
 
 / {
@@ -44,7 +45,7 @@
 	hsi2c_4: i2c@12CA0000 {
 		status = "okay";
 
-		s2mps11_pmic@66 {
+		s2mps11: s2mps11_pmic@66 {
 			compatible = "samsung,s2mps11-pmic";
 			reg = <0x66>;
 			s2mps11,buck2-ramp-delay = <12>;
@@ -275,9 +276,6 @@
 		};
 	};
 
-	rtc@101E0000 {
-		status = "okay";
-	};
 };
 
 &hdmi {
@@ -369,3 +367,9 @@
 		shunt-resistor = <10000>;
 	};
 };
+
+&rtc {
+	status = "okay";
+	clocks = <&clock CLK_RTC>, <&s2mps11_osc S2MPS11_CLK_AP>;
+	clock-names = "rtc", "rtc_src";
+};
diff --git a/include/dt-bindings/clock/samsung,s2mps11.h b/include/dt-bindings/clock/samsung,s2mps11.h
new file mode 100644
index 0000000..b903d7d
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,s2mps11.h
@@ -0,0 +1,23 @@
+/*
+ * Copyright (C) 2015 Markus Reichl
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Device Tree binding constants clocks for the Samsung S2MPS11 PMIC.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_SAMSUNG_S2MPS11_CLOCK_H
+#define _DT_BINDINGS_CLOCK_SAMSUNG_S2MPS11_CLOCK_H
+
+/* Fixed rate clocks. */
+
+#define S2MPS11_CLK_AP		0
+#define S2MPS11_CLK_CP		1
+#define S2MPS11_CLK_BT		2
+
+/* Total number of clocks. */
+#define S2MPS11_CLKS_NUM		(S2MPS11_CLK_BT + 1)
+
+#endif /* _DT_BINDINGS_CLOCK_SAMSUNG_S2MPS11_CLOCK_H */
-- 
1.9.1
