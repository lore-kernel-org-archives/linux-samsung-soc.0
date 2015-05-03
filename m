From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [RESEND] [PATCH V4 2/2] ARM: dts: exynos5422-odroidxu3: add 'rtc_src' clock to rtc node
Date: Sun, 03 May 2015 18:34:29 +0200
Message-ID: <18118883.KTZmm2WyxS@dell2.five-lan.de>
References: <551A8991.7080706@fivetechno.de> <55445D2C.7030204@samsung.com>
Reply-To: m.reichl@fivetechno.de
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:53599 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750899AbbECQep (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 May 2015 12:34:45 -0400
In-Reply-To: <55445D2C.7030204@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, cw00.choi@samsung.com, Kukjin Kim <kgene.kim@samsung.com>

The Exynos5422 SoC has a s3c6410 RTC where the source clock
is now a mandatory property.

This patch fixes probe failure of s3c-rtc on Odroid-XU3 boards.
It is based on v4.0-rc2.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de
Tested-by: Anand Moon <linux.amoon@gmail.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
Added accumulated reviews for RESEND
Changes since v3:
1. Readded slipped #include statement.
Sorry for the mess.
Changes since v2:
1. Dropped unused phandle.
Changes since v1:
1. Dropped Documentation.
2. Split into 2 parts.

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
