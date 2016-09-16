From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 06/10] ARM: dts: exynos: Fix invalid GIC interrupt flags in exynos5
Date: Fri, 16 Sep 2016 21:42:47 +0200
Message-ID: <1474054971-16831-7-git-send-email-krzk@kernel.org>
References: <1474054971-16831-1-git-send-email-krzk@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474054971-16831-1-git-send-email-krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alban Browaeys <alban.browaeys-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Interrupt of type IRQ_TYPE_NONE is not allowed for GIC interrupts and
generates an error:
	genirq: Setting trigger mode 0 for irq 16 failed (gic_set_type+0x0/0x68)

The GIC requires shared interrupts to be edge rising or level high.
Platform declares support for both.  Choose level high everywhere.

Reported-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reported-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Reported-by: Alban Browaeys <alban.browaeys-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/exynos5.dtsi | 60 ++++++++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 8f06609879f5..d9b1607db5ad 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -13,6 +13,7 @@
  * published by the Free Software Foundation.
  */
 
+#include <dt-bindings/interrupt-controller/irq.h>
 #include "exynos-syscon-restart.dtsi"
 
 / {
@@ -53,14 +54,38 @@
 			interrupt-controller;
 			samsung,combiner-nr = <32>;
 			reg = <0x10440000 0x1000>;
-			interrupts =	<0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
-					<0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
-					<0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
-					<0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>,
-					<0 16 0>, <0 17 0>, <0 18 0>, <0 19 0>,
-					<0 20 0>, <0 21 0>, <0 22 0>, <0 23 0>,
-					<0 24 0>, <0 25 0>, <0 26 0>, <0 27 0>,
-					<0 28 0>, <0 29 0>, <0 30 0>, <0 31 0>;
+			interrupts = <0 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 5 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 6 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 7 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 8 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 9 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 10 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 11 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 13 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 14 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 15 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 16 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 17 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 18 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 19 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 20 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 21 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 22 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 23 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 24 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 25 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 26 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 27 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 28 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 29 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 30 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 31 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		gic: interrupt-controller@10481000 {
@@ -82,31 +107,31 @@
 		serial_0: serial@12C00000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x12C00000 0x100>;
-			interrupts = <0 51 0>;
+			interrupts = <0 51 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		serial_1: serial@12C10000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x12C10000 0x100>;
-			interrupts = <0 52 0>;
+			interrupts = <0 52 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		serial_2: serial@12C20000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x12C20000 0x100>;
-			interrupts = <0 53 0>;
+			interrupts = <0 53 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		serial_3: serial@12C30000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x12C30000 0x100>;
-			interrupts = <0 54 0>;
+			interrupts = <0 54 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		i2c_0: i2c@12C60000 {
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x12C60000 0x100>;
-			interrupts = <0 56 0>;
+			interrupts = <0 56 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			samsung,sysreg-phandle = <&sysreg_system_controller>;
@@ -116,7 +141,7 @@
 		i2c_1: i2c@12C70000 {
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x12C70000 0x100>;
-			interrupts = <0 57 0>;
+			interrupts = <0 57 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			samsung,sysreg-phandle = <&sysreg_system_controller>;
@@ -126,7 +151,7 @@
 		i2c_2: i2c@12C80000 {
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x12C80000 0x100>;
-			interrupts = <0 58 0>;
+			interrupts = <0 58 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			samsung,sysreg-phandle = <&sysreg_system_controller>;
@@ -136,7 +161,7 @@
 		i2c_3: i2c@12C90000 {
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x12C90000 0x100>;
-			interrupts = <0 59 0>;
+			interrupts = <0 59 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			samsung,sysreg-phandle = <&sysreg_system_controller>;
@@ -153,7 +178,8 @@
 		rtc: rtc@101E0000 {
 			compatible = "samsung,s3c6410-rtc";
 			reg = <0x101E0000 0x100>;
-			interrupts = <0 43 0>, <0 44 0>;
+			interrupts = <0 43 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 44 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
