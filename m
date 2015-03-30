From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [PATCH V3 2/2] ARM: dts: exynos5422-odroidxu3: add 'rtc_src' clock
 to rtc node
Date: Mon, 30 Mar 2015 17:38:10 +0200
Message-ID: <55196DE2.4030109@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:54705 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752601AbbC3PiN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Mar 2015 11:38:13 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>

The Exynos5422 SoC has a s3c6410 RTC where the source clock
is now a mandatory property.

This patch fixes probe failure of s3c-rtc on Odroid-XU3 boards.
It is based in v4.0-rc2.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
---
Changes since v2:
1. Dropped unused phandle.
Changes since v1:
1. Dropped Documentation.
2. Split into 2 parts.
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index 0408ec0..4a7ca15 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -274,10 +274,6 @@
 			reg = <0x50>;
 		};
 	};
-
-	rtc@101E0000 {
-		status = "okay";
-	};
 };
 
 &hdmi {
@@ -374,3 +370,9 @@
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
