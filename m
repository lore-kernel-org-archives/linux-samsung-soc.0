From: Beomho Seo <beomho.seo@samsung.com>
Subject: [RESEND PATCH 2/3] ARM: dts: add cm36651 light/proximity sensor node
Date: Fri, 25 Apr 2014 11:06:06 +0900
Message-ID: <5359C30E.8090903@samsung.com>
References: <53327CEB.7080505@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63823 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751361AbaDYCGM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 22:06:12 -0400
In-reply-to: <53327CEB.7080505@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Myungjoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>

Exynos4412-trats2 board have light/proximity sensor.
This patch add cm36651 light/ proximity sensor node for exynos4412.
cm36651 is required properties as below.
- Use i2c-gpio for cm36651 sensor.
- Use fixed regulator for the IR LED.
  It is a part of the cm36651 for proximity detection.
- cm36651 is i2c device driver so need to use i2c-gpio driver.

Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 42418e2..c9f3c6e 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -21,6 +21,7 @@

 	aliases {
 		i2c8 = &i2c_ak8975;
+		i2c9 = &i2c_cm36651;
 	};

 	memory {
@@ -71,6 +72,14 @@
 			enable-active-high;
 		};

+		ps_als_reg: voltage-regulator-2 {
+			compatible = "regulator-fixed";
+			regulator-name = "LED_A_3.0V";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			gpio = <&gpj0 5 0>;
+			enable-active-high;
+		};
 		/* More to come */
 	};

@@ -500,6 +509,23 @@
 		};
 	};

+	i2c_cm36651: i2c-gpio-2 {
+		compatible = "i2c-gpio";
+		gpios = <&gpf0 0 0>, <&gpf0 1 0>;
+		i2c-gpio,delay-us = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		cm36651@18 {
+			compatible = "cm36651";
+			reg = <0x18>;
+			interrupt-parent = <&gpx0>;
+			interrupts = <2 0>;
+			vled-supply = <&ps_als_reg>;
+		};
+	};
+
 	spi_1: spi@13930000 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&spi1_bus>;
-- 
1.7.9.5
