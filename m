From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [PATCH V2 2/2] ARM: dts: exynos5422-odroidxu3: add 'rtc_src' clock
 to rtc node
Date: Mon, 30 Mar 2015 16:16:04 +0200
Message-ID: <55195AA4.9060205@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:57982 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752735AbbC3OQK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Mar 2015 10:16:10 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>

The Exynos5422 SoC has a s3c6410 RTC where the source clock
is now a mandatory property.

This patch fixes probe failure of s3c-rtc on Odroid-XU3 boards.
It is based in v4.0-rc2.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
---
Changes since v1:
1. Dropped Documentation.
2. Split into 2 parts.
---

 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index a519c86..ac663ec 100644
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
@@ -274,10 +275,6 @@
 			reg = <0x50>;
 		};
 	};
-
-	rtc@101E0000 {
-		status = "okay";
-	};
 };
 
 &hdmi {
@@ -369,3 +366,9 @@
 		shunt-resistor = <10000>;
 	};
 };
+
+&rtc {
+	status = "okay";
+	clocks = <&clock CLK_RTC>, <&s2mps11_osc S2MPS11_CLK_AP>;
+	clock-names = "rtc", "rtc_src";
+};
-- 
1.9.1
