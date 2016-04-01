From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 01/11] ARM: dts: exynos: Fix DTC unit name warnings in
 cros-adc-thermistors
Date: Fri, 01 Apr 2016 15:57:44 +0900
Message-ID: <1459493874-2366-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Fix following DTC warnings in cros-adc-thermistors:
Warning (unit_address_vs_reg): Node /adc@12D10000/ncp15wb473@3 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /adc@12D10000/ncp15wb473@4 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /adc@12D10000/ncp15wb473@5 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /adc@12D10000/ncp15wb473@6 has a unit name, but no reg property

Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/cros-adc-thermistors.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/cros-adc-thermistors.dtsi b/arch/arm/boot/dts/cros-adc-thermistors.dtsi
index acd4fe1833f2..87e676917603 100644
--- a/arch/arm/boot/dts/cros-adc-thermistors.dtsi
+++ b/arch/arm/boot/dts/cros-adc-thermistors.dtsi
@@ -13,28 +13,28 @@
 */
 
 &adc {
-	ncp15wb473@3 {
+	ncp15wb473_3 {
 		compatible = "murata,ncp15wb473";
 		pullup-uv = <1800000>;
 		pullup-ohm = <47000>;
 		pulldown-ohm = <0>;
 		io-channels = <&adc 3>;
 	};
-	ncp15wb473@4 {
+	ncp15wb473_4 {
 		compatible = "murata,ncp15wb473";
 		pullup-uv = <1800000>;
 		pullup-ohm = <47000>;
 		pulldown-ohm = <0>;
 		io-channels = <&adc 4>;
 	};
-	ncp15wb473@5 {
+	ncp15wb473_5 {
 		compatible = "murata,ncp15wb473";
 		pullup-uv = <1800000>;
 		pullup-ohm = <47000>;
 		pulldown-ohm = <0>;
 		io-channels = <&adc 5>;
 	};
-	ncp15wb473@6 {
+	ncp15wb473_6 {
 		compatible = "murata,ncp15wb473";
 		pullup-uv = <1800000>;
 		pullup-ohm = <47000>;
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
