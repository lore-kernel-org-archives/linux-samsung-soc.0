From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] ARM: dts: exynos: Add power button for Odroid XU3/4
Date: Tue, 12 Sep 2017 13:57:54 +0200
Message-ID: <1505217474-14725-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170912115804eucas1p1959db12366143b87d14725e227520854@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38082 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751289AbdILL6I (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 07:58:08 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Brian Kim <brian.kim@hardkernel.com>

From: Brian Kim <brian.kim@hardkernel.com>

The power button (SW2) on Odroid XU3/4 is connected to the PWRON pin
of the S2MPS11 PMIC.

The S2MPS11 datasheet says that ONOB pin operates as 'PWRON key active
low signal'. In fact, S2MPS11 PMIC acts as a 16ms debouce filter and
signal inverter, thus effectively repeating PWRON (active high) to ONOB
pin (active low).

ONOB PMIC pin is then connected to XEINT3 SoC pin, so we get the state
of the power button on the gpx0-3 GPIO.

This patch adds device-tree bindings for the power button of Odroid
XU3/4 boards.

Signed-off-by: Brian Kim <brian.kim@hardkernel.com>
[mszyprow: extended commit message, added comments and fixed minor
 issues in the dts]
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Changelog:

v2: fixed minor issues pointed by Krzysztof Kozlowski:
- added comments to dts
- extended commit message
- removed useless interrupts property
- used proper macros for gpios
- removed gpio prefix

v1: initial submission
https://patchwork.kernel.org/patch/9605023/

---
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index a183b56283f8..29a718ae621a 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -13,6 +13,7 @@
 */
 
 #include <dt-bindings/clock/samsung,s2mps11.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/sound/samsung-i2s.h>
@@ -41,6 +42,27 @@
 		};
 	};
 
+	gpio_keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&power_key>;
+
+		power_key {
+			/*
+			 * The power button (SW2) is connected to the PWRON
+			 * pin (active high) of the S2MPS11 PMIC, which acts
+			 * as a 16ms debouce filter and signal inverter with
+			 * output on ONOB pin (active low). ONOB PMIC pin is
+			 * then connected to XEINT3 SoC pin.
+			 */
+			gpios = <&gpx0 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			label = "power key";
+			debounce-interval = <0>;
+			wakeup-source;
+		};
+	};
+
 	emmc_pwrseq: pwrseq {
 		pinctrl-0 = <&emmc_nrst_pin>;
 		pinctrl-names = "default";
@@ -561,6 +583,13 @@
 };
 
 &pinctrl_0 {
+	power_key: power-key {
+		samsung,pins = "gpx0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
 	hdmi_hpd_irq: hdmi-hpd-irq {
 		samsung,pins = "gpx3-7";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
-- 
1.9.1
