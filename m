From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos4412-odroid: add support for GPIO buttons
Date: Tue, 01 Jul 2014 09:20:09 +0200
Message-ID: <1404199209-9722-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:23773 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753109AbaGAHUZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 03:20:25 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N8000F7AV1QRS70@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 01 Jul 2014 08:20:15 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

This patch adds support for simple GPIO-based button availabled on
Exynos4 based Odroid boards. All supported boards have POWER button,
which has been defined in exynos4412-odroid-common.dtsi. X/X2 boards
also have additional user-configurable button which has been mapped to
KEY_HOME. All defined keys have been marked as possible wakeup source.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Hello,

This patch is a continuation of the '[PATCH v2 0/4] Add Exynos4412 based
Odroid X2 and U2/U3/U3+ support' series
(http://www.spinics.net/lists/linux-samsung-soc/msg33115.html).

Best regards
Marek Szyprowski
Samsung R&D Institute Poland
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 24 ++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4412-odroidx.dts        | 21 +++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index ad2cb32a3439..d1b33a8efa9d 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -7,6 +7,7 @@
  * published by the Free Software Foundation.
 */
 
+#include <dt-bindings/input/input.h>
 #include "exynos4412.dtsi"
 
 / {
@@ -15,6 +16,22 @@
 		reg = <0x0204F000 0x1000>;
 	};
 
+	gpio_keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_power_key>;
+
+		power_key {
+			interrupt-parent = <&gpx1>;
+			interrupts = <3 0>;
+			gpios = <&gpx1 3 1>;
+			linux,code = <KEY_POWER>;
+			label = "power key";
+			debounce-interval = <10>;
+			gpio-key,wakeup;
+		};
+	};
+
 	mmc@12550000 {
 		pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
 		pinctrl-names = "default";
@@ -316,3 +333,10 @@
 		status = "okay";
 	};
 };
+
+&pinctrl_1 {
+	gpio_power_key: power_key {
+		samsung,pins = "gpx1-3";
+		samsung,pin-pud = <0>;
+	};
+};
diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 990a04760313..18c567f5dbea 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -46,6 +46,20 @@
 		status = "okay";
 	};
 
+	gpio_keys {
+		pinctrl-0 = <&gpio_power_key &gpio_home_key>;
+
+		home_key {
+			interrupt-parent = <&gpx2>;
+			interrupts = <2 0>;
+			gpios = <&gpx2 2 0>;
+			linux,code = <KEY_HOME>;
+			label = "home key";
+			debounce-interval = <10>;
+			gpio-key,wakeup;
+		};
+	};
+
 	regulator_p3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "p3v3_en";
@@ -62,3 +76,10 @@
 		status = "okay";
 	};
 };
+
+&pinctrl_1 {
+	gpio_home_key: home_key {
+		samsung,pins = "gpx2-2";
+		samsung,pin-pud = <0>;
+	};
+};
-- 
1.9.2
