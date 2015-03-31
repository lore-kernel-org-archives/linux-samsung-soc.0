From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [PATCH V4 2/2] ARM: dts: exynos5422-odroidxu3: add 'rtc_src' clock
 to rtc node
Date: Tue, 31 Mar 2015 13:48:33 +0200
Message-ID: <551A8991.7080706@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:53990 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751581AbbCaLsh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Mar 2015 07:48:37 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, cw00.choi@samsung.com

The Exynos5422 SoC has a s3c6410 RTC where the source clock
is now a mandatory property.

This patch fixes probe failure of s3c-rtc on Odroid-XU3 boards.
It is based on v4.0-rc2.

---
Changes since v3:
1. Readded slipped #include statement.
Sorry for the mess.
Changes since v2:
1. Dropped unused phandle.
Changes since v1:
1. Dropped Documentation.
2. Split into 2 parts.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index a519c86..d086398 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -11,6 +11,7 @@
 */
 
 /dts-v1/;
+#include <dt-bindings/clock/samsung,s2mps11.h>
 #include "exynos5800.dtsi"
 
 / {
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
