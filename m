From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 1/2] ARM: dts: exynos: Use macro for PWM signal polarity in Exynos4 boards
Date: Thu, 27 Oct 2016 14:47:17 -0300
Message-ID: <1477590438-18095-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:49763
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934036AbcJ0Rrc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 13:47:32 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org

Using the PWM_POLARITY_INVERTED macro instead of the hardcoded number
0 makes the DTS easier to read.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 arch/arm/boot/dts/exynos4412-odroidu3.dts | 3 ++-
 arch/arm/boot/dts/exynos4412-trats2.dts   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index 99634c54dca9..480a80624b77 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -12,6 +12,7 @@
 */
 
 /dts-v1/;
+#include <dt-bindings/pwm/pwm.h>
 #include "exynos4412-odroid-common.dtsi"
 
 / {
@@ -35,7 +36,7 @@
 
 	fan0: pwm-fan {
 		compatible = "pwm-fan";
-		pwms = <&pwm 0 10000 0>;
+		pwms = <&pwm 0 10000 PWM_POLARITY_INVERTED>;
 		cooling-min-state = <0>;
 		cooling-max-state = <3>;
 		#cooling-cells = <2>;
diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 41ecd6d465a7..63ad30507d4f 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -18,6 +18,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/clock/maxim,max77686.h>
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "Samsung Trats 2 based on Exynos4412";
@@ -164,7 +165,7 @@
 			max77693_haptic {
 				compatible = "maxim,max77693-haptic";
 				haptic-supply = <&ldo26_reg>;
-				pwms = <&pwm 0 38022 0>;
+				pwms = <&pwm 0 38022 PWM_POLARITY_INVERTED>;
 			};
 
 			charger {
-- 
2.7.4
