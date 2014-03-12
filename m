From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv2 5/5] ARM: dts: exynos4412-trats2: Add ADC/themistor dt data
 to get temperature of SoC/battery
Date: Wed, 12 Mar 2014 15:19:16 +0900
Message-ID: <1394605156-7768-6-git-send-email-cw00.choi@samsung.com>
References: <1394605156-7768-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1394605156-7768-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene.kim@samsung.com, t.figa@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch use ADC to get the temperature of SoC/battery by using NTC thermistor
driver in hwmon. NTC thermistor driver covnvert ADC's raw data to temperature
by using following variables:

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 4f851cc..3228506 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -106,6 +106,11 @@
 		};
 	};
 
+	adc: adc@126C0000 {
+		vdd-supply = <&ldo3_reg>;
+		status = "okay";
+	};
+
 	i2c@13890000 {
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-slave-addr = <0x10>;
@@ -589,4 +594,20 @@
 			};
 		};
 	};
+
+	thermistor-ap@0 {
+		compatible = "ntc,ncp15wb473";
+		pullup-uv = <1800000>;	 /* VCC_1.8V_AP */
+		pullup-ohm = <100000>;	 /* 100K */
+		pulldown-ohm = <100000>; /* 100K */
+		io-channels = <&adc 1>;  /* AP temperature */
+	};
+
+	thermistor-battery@1 {
+		compatible = "ntc,ncp15wb473";
+		pullup-uv = <1800000>;	 /* VCC_1.8V_AP */
+		pullup-ohm = <100000>;	 /* 100K */
+		pulldown-ohm = <100000>; /* 100K */
+		io-channels = <&adc 2>;  /* Battery temperature */
+	};
 };
-- 
1.8.0
