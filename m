From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/3 RESEND] ARM: dts: exynos: Move audio clocks
 configuration to odroidxu3-audio.dtsi
Date: Fri, 29 Sep 2017 14:33:25 +0200
Message-ID: <1506688405-12624-1-git-send-email-m.szyprowski@samsung.com>
References: <1506684783-9722-2-git-send-email-m.szyprowski@samsung.com>
        <CGME20170929123353eucas1p164a4d125cf71345f98dc27d5eb8d1e3d@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:60215 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750715AbdI2Md4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 08:33:56 -0400
In-reply-to: <1506684783-9722-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Audio subsystem clocks configuration is a part of audio block,
so there it should be moved to exynos5422-odroidxu3-audio.dtsi
to avoid it on Odroid XU4, which has no audio codec.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Resend reason: added missing patch description
---
 arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi  | 13 +++++++++++++
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 12 ------------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
index c0b85981c6bf..da3141a307d5 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
@@ -11,6 +11,8 @@
  * published by the Free Software Foundation.
 */
 
+#include <dt-bindings/sound/samsung-i2s.h>
+
 / {
 	sound: sound {
 		compatible = "simple-audio-card";
@@ -43,6 +45,17 @@
 	};
 };
 
+&clock_audss {
+	assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
+			<&clock_audss EXYNOS_MOUT_I2S>,
+			<&clock_audss EXYNOS_DOUT_AUD_BUS>;
+	assigned-clock-parents = <&clock CLK_FIN_PLL>,
+			<&clock_audss EXYNOS_MOUT_AUDSS>;
+	assigned-clock-rates = <0>,
+			<0>,
+			<19200000>;
+};
+
 &hsi2c_5 {
 	status = "okay";
 	max98090: max98090@10 {
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 305c2a2b728c..4478a089353a 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -16,7 +16,6 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/sound/samsung-i2s.h>
 #include "exynos5800.dtsi"
 #include "exynos5422-cpus.dtsi"
 
@@ -455,17 +454,6 @@
 	status = "okay";
 };
 
-&clock_audss {
-	assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
-			<&clock_audss EXYNOS_MOUT_I2S>,
-			<&clock_audss EXYNOS_DOUT_AUD_BUS>;
-	assigned-clock-parents = <&clock CLK_FIN_PLL>,
-			<&clock_audss EXYNOS_MOUT_AUDSS>;
-	assigned-clock-rates = <0>,
-			<0>,
-			<19200000>;
-};
-
 &cpu0 {
 	cpu-supply = <&buck6_reg>;
 };
-- 
1.9.1
