From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH] ARM: dts: odroidxu3: Enable wake alarm of S2MPS11 RTC
Date: Mon, 25 May 2015 20:44:13 +0900
Message-ID: <1432554253-25886-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:33234 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751520AbbEYLot (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 May 2015 07:44:49 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

The IRQB of S2MPS11 PMIC is wired to XEINT4 (GPX0-4) through pull-up
resistor.

Add interrupt properties and pinctrl configuration to enable RTC wake
alarm of rtc-s5m driver. This also removes a warning:
sec_pmic 4-0066: No interrupt specified, no interrupts

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index c16987950aa1..27014bb0c586 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -12,6 +12,7 @@
 
 /dts-v1/;
 #include <dt-bindings/clock/samsung,s2mps11.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/sound/samsung-i2s.h>
 #include "exynos5800.dtsi"
@@ -153,6 +154,11 @@
 		s2mps11,buck3-ramp-enable = <1>;
 		s2mps11,buck4-ramp-enable = <1>;
 
+		interrupt-parent = <&gpx0>;
+		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&s2mps11_irq>;
+
 		s2mps11_osc: clocks {
 			#clock-cells = <1>;
 			clock-output-names = "s2mps11_ap",
@@ -473,6 +479,13 @@
 		samsung,pin-pud = <0>;
 		samsung,pin-drv = <0>;
 	};
+
+	s2mps11_irq: s2mps11-irq {
+		samsung,pins = "gpx0-4";
+		samsung,pin-function = <0xf>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
 };
 
 &pwm {
-- 
2.1.4
