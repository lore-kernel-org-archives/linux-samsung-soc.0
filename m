From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH v2] arm64: dts: Enable ir-spi in the tm2 and tm2e boards
Date: Fri, 10 Feb 2017 11:22:38 +0900
Message-ID: <20170210022238.12401-1-andi.shyti@samsung.com>
References: <CGME20170210022252epcas1p2cad2a32fb74a5ecc17ed73387579c6ab@epcas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50851 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750989AbdBJCx7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Feb 2017 21:53:59 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>

Add the device tree node for the ir-spi driver which enable the
ir led for remote controlling.

This patch sets first the GPR3[3] gpio line as a regulator-fixed
for enabling an external regulator which powers the IR LED.

Removes also the default assignment of GPG3[7] related to the
MOSI line of the SPI3 bus.

Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
---
Changelog v1 -> v2
==================
v1: https://marc.info/?l=linux-kernel&m=148645523229894&w=2

 - used 'GPIO_ACTIVE_HIGH' instead of '0'
 - added back the gpg3-5 gpio initialization related to the SPI3
   CS line that was erroneously removed
   
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 098ad557fee3..4df6b57a0a68 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -106,6 +106,13 @@
 		};
 	};
 
+	irda_regulator: irda-regulator {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpr3 3 GPIO_ACTIVE_HIGH>;
+		regulator-name = "irda_regulator";
+	};
+
 	sound {
 		compatible = "samsung,tm2-audio";
 		audio-codec = <&wm5110>;
@@ -1074,7 +1081,6 @@
 		PIN(INPUT, gpg3-0, DOWN, FAST_SR1);
 		PIN(INPUT, gpg3-1, DOWN, FAST_SR1);
 		PIN(INPUT, gpg3-5, DOWN, FAST_SR1);
-		PIN(INPUT, gpg3-7, DOWN, FAST_SR1);
 	};
 };
 
@@ -1152,6 +1158,24 @@
 	};
 };
 
+&spi_3 {
+	status = "okay";
+	no-cs-readback;
+
+	irled@0 {
+		compatible = "ir-spi-led";
+		reg = <0x0>;
+		spi-max-frequency = <5000000>;
+		power-supply = <&irda_regulator>;
+		duty-cycle = <60>;
+		led-active-low;
+
+		controller-data {
+			samsung,spi-feedback-delay = <0>;
+		};
+	};
+};
+
 &timer {
 	clock-frequency = <24000000>;
 };
-- 
2.11.0
