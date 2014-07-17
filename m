From: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/4 v2] Documentation: dt-bindings: update exynos-adc.txt with
 syscon handle
Date: Thu, 17 Jul 2014 16:49:52 +0530
Message-ID: <1405595993-16661-4-git-send-email-ch.naveen@samsung.com>
References: <1405595993-16661-1-git-send-email-ch.naveen@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1405595993-16661-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch updates the DT bindings in exynos-adc.txt with the
syscon phandle to the ADC nodes.

Also removes the 2nd "reg" property, which used to carry the
ADC_PHY regiser base from PMU.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
Changes since v1:
rebased on top of Changwoo's v5 ADC patches for exynos3250

iio: adc: exynos_adc: Support Exynos3250 ADC and code clean
https://lkml.org/lkml/2014/6/27/16

 .../devicetree/bindings/iio/adc/exynos-adc.txt     |   15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/exynos-adc.txt b/Documentation/devicetree/bindings/iio/adc/exynos-adc.txt
index 0b0ed85..1634df3 100644
--- a/Documentation/devicetree/bindings/iio/adc/exynos-adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/exynos-adc.txt
@@ -1,10 +1,11 @@
 Samsung Exynos Analog to Digital Converter bindings
 
 The devicetree bindings are for the new ADC driver written for
-Exynos4 and upward SoCs from Samsung.
+Exynos4 and Exynos5 series SoCs from Samsung.
+Now supports Exynos3250 too.
 
 New driver handles the following
-1. Supports ADC IF found on EXYNOS4412/EXYNOS5250
+1. Supports ADC IF found on Exynos3250/EXYNOS4412/EXYNOS5 series
    and future SoCs from Samsung
 2. Add ADC driver under iio/adc framework
 3. Also adds the Documentation for device tree bindings
@@ -18,7 +19,7 @@ Required properties:
 				for controllers compatible with ADC of
 				Exynos3250.
 - reg:			Contains ADC register address range (base address and
-			length) and the address of the phy enable register.
+			length)
 - interrupts: 		Contains the interrupt information for the timer. The
 			format is being dependent on which interrupt controller
 			the Samsung device uses.
@@ -31,6 +32,8 @@ Required properties:
 			- "sclk_adc" : ADC special clock (only for Exynos3250
 				       and compatible ADC block)
 - vdd-supply		VDD input supply.
+- samsung,syscon-phandle Contains the PMU system controller node
+			(To access the ADC_PHY register)
 
 Note: child nodes can be added for auto probing from device tree.
 
@@ -38,7 +41,7 @@ Example: adding device info in dtsi file
 
 adc: adc@12D10000 {
 	compatible = "samsung,exynos-adc-v1";
-	reg = <0x12D10000 0x100>, <0x10040718 0x4>;
+	reg = <0x12D10000 0x100>;
 	interrupts = <0 106 0>;
 	#io-channel-cells = <1>;
 	io-channel-ranges;
@@ -47,13 +50,14 @@ adc: adc@12D10000 {
 	clock-names = "adc";
 
 	vdd-supply = <&buck5_reg>;
+	samsung,syscon-phandle = <&pmu_system_controller>;
 };
 
 Example: adding device info in dtsi file for Exynos3250 with additional sclk
 
 adc: adc@126C0000 {
 	compatible = "samsung,exynos3250-adc-v2";
-	reg = <0x126C0000 0x100>, <0x10020718 0x4>;
+	reg = <0x126C0000 0x100>;
 	interrupts = <0 137 0>;
 	#io-channel-cells = <1>;
 	io-channel-ranges;
@@ -62,6 +66,7 @@ adc: adc@126C0000 {
 	clock-names = "adc", "sclk_adc";
 
 	vdd-supply = <&buck5_reg>;
+	samsung,syscon-phandle = <&pmu_system_controller>;
 };
 
 Example: Adding child nodes in dts file
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
