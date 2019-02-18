From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] ARM: dts: exynos: Add CPU cooling on Arndale Octa
Date: Mon, 18 Feb 2019 20:48:40 +0100
Message-ID: <20190218194841.21374-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Markus Reichl <reichl@t-online.de>
List-Id: linux-samsung-soc@vger.kernel.org

Arndale Octa board comes without fan so proper CPU cooling is necessary
to avoid critical shutdowns when CPUs are busy.  Although thermal zones
were present but CPU cooling was missing in DTS.

Adjust the trip points and add respective cooling nodes for each CPU
thermal zone.  The CPU throttling will start at 60 degrees of C,
intensify at 80 degrees of C and slow down CPUs as much as possible at
110 degrees of C.

With this configuration, when running four CPU intensive tasks, the
temperatures did not exceed 90 degrees of Celsius mostly oscillating
around 88 degrees in hottest thermal zone.  Test was however done with
only four CPUs online (big cluster, Cortex A15) because of errors when
booting secondary CPUs.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 264 ++++++++++++++++++
 1 file changed, 264 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index c7d9604a119e..2b227246c685 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -59,6 +59,270 @@
 	cpu-supply = <&buck6_reg>;
 };
 
+&cpu0_thermal {
+	trips {
+		cpu0_alert0: cpu-alert-0 {
+			temperature = <60000>; /* millicelsius */
+			hysteresis = <5000>; /* millicelsius */
+			type = "passive";
+		};
+		cpu0_alert1: cpu-alert-1 {
+			temperature = <80000>; /* millicelsius */
+			hysteresis = <10000>; /* millicelsius */
+			type = "passive";
+		};
+		cpu0_alert2: cpu-alert-2 {
+			temperature = <110000>; /* millicelsius */
+			hysteresis = <10000>; /* millicelsius */
+			type = "passive";
+		};
+		cpu0_crit0: cpu-crit-0 {
+			temperature = <120000>; /* millicelsius */
+			hysteresis = <0>; /* millicelsius */
+			type = "critical";
+		};
+	};
+
+	cooling-maps {
+		/*
+		 * Reduce the CPU speed by 2 steps, down to: 1600 MHz
+		 * and 1100 MHz.
+		 */
+		map0 {
+			trip = <&cpu0_alert0>;
+			cooling-device = <&cpu0 0 2>,
+					 <&cpu1 0 2>,
+					 <&cpu2 0 2>,
+					 <&cpu3 0 2>,
+					 <&cpu4 0 2>,
+					 <&cpu5 0 2>,
+					 <&cpu6 0 2>,
+					 <&cpu7 0 2>;
+		};
+
+		/*
+		 * Reduce the CPU speed down to 1200 MHz big (6 steps)
+		 * and 800 MHz LITTLE (5 steps).
+		 */
+		map1 {
+			trip = <&cpu0_alert1>;
+			cooling-device = <&cpu0 3 6>,
+					 <&cpu1 3 6>,
+					 <&cpu2 3 6>,
+					 <&cpu3 3 6>,
+					 <&cpu4 3 5>,
+					 <&cpu5 3 5>,
+					 <&cpu6 3 5>,
+					 <&cpu7 3 5>;
+		};
+
+		/*
+		 * Reduce the CPU speed as much as possible, down to 700 MHz
+		 * big (11 steps) and 600 MHz LITTLE (7 steps).
+		 */
+		map2 {
+			trip = <&cpu0_alert2>;
+			cooling-device = <&cpu0 6 11>,
+					 <&cpu1 6 11>,
+					 <&cpu2 6 11>,
+					 <&cpu3 6 11>,
+					 <&cpu4 5 7>,
+					 <&cpu5 5 7>,
+					 <&cpu6 5 7>,
+					 <&cpu7 5 7>;
+		};
+	};
+};
+
+&cpu1_thermal {
+	trips {
+		cpu1_alert0: cpu-alert-0 {
+			temperature = <60000>; /* millicelsius */
+			hysteresis = <5000>; /* millicelsius */
+			type = "passive";
+		};
+		cpu1_alert1: cpu-alert-1 {
+			temperature = <80000>; /* millicelsius */
+			hysteresis = <10000>; /* millicelsius */
+			type = "passive";
+		};
+		cpu1_alert2: cpu-alert-2 {
+			temperature = <110000>; /* millicelsius */
+			hysteresis = <10000>; /* millicelsius */
+			type = "passive";
+		};
+		cpu1_crit0: cpu-crit-0 {
+			temperature = <120000>; /* millicelsius */
+			hysteresis = <0>; /* millicelsius */
+			type = "critical";
+		};
+	};
+
+	cooling-maps {
+		map0 {
+			trip = <&cpu1_alert0>;
+			cooling-device = <&cpu0 0 2>,
+					 <&cpu1 0 2>,
+					 <&cpu2 0 2>,
+					 <&cpu3 0 2>,
+					 <&cpu4 0 2>,
+					 <&cpu5 0 2>,
+					 <&cpu6 0 2>,
+					 <&cpu7 0 2>;
+		};
+
+		map1 {
+			trip = <&cpu1_alert1>;
+			cooling-device = <&cpu0 3 6>,
+					 <&cpu1 3 6>,
+					 <&cpu2 3 6>,
+					 <&cpu3 3 6>,
+					 <&cpu4 3 5>,
+					 <&cpu5 3 5>,
+					 <&cpu6 3 5>,
+					 <&cpu7 3 5>;
+		};
+
+		map2 {
+			trip = <&cpu1_alert2>;
+			cooling-device = <&cpu0 6 11>,
+					 <&cpu1 6 11>,
+					 <&cpu2 6 11>,
+					 <&cpu3 6 11>,
+					 <&cpu4 5 7>,
+					 <&cpu5 5 7>,
+					 <&cpu6 5 7>,
+					 <&cpu7 5 7>;
+		};
+	};
+};
+
+&cpu2_thermal {
+	trips {
+		cpu2_alert0: cpu-alert-0 {
+			temperature = <60000>; /* millicelsius */
+			hysteresis = <5000>; /* millicelsius */
+			type = "passive";
+		};
+		cpu2_alert1: cpu-alert-1 {
+			temperature = <80000>; /* millicelsius */
+			hysteresis = <10000>; /* millicelsius */
+			type = "passive";
+		};
+		cpu2_alert2: cpu-alert-2 {
+			temperature = <110000>; /* millicelsius */
+			hysteresis = <10000>; /* millicelsius */
+			type = "passive";
+		};
+		cpu2_crit0: cpu-crit-0 {
+			temperature = <120000>; /* millicelsius */
+			hysteresis = <0>; /* millicelsius */
+			type = "critical";
+		};
+	};
+
+	cooling-maps {
+		map0 {
+			trip = <&cpu2_alert0>;
+			cooling-device = <&cpu0 0 2>,
+					 <&cpu1 0 2>,
+					 <&cpu2 0 2>,
+					 <&cpu3 0 2>,
+					 <&cpu4 0 2>,
+					 <&cpu5 0 2>,
+					 <&cpu6 0 2>,
+					 <&cpu7 0 2>;
+		};
+
+		map1 {
+			trip = <&cpu2_alert1>;
+			cooling-device = <&cpu0 3 6>,
+					 <&cpu1 3 6>,
+					 <&cpu2 3 6>,
+					 <&cpu3 3 6>,
+					 <&cpu4 3 5>,
+					 <&cpu5 3 5>,
+					 <&cpu6 3 5>,
+					 <&cpu7 3 5>;
+		};
+
+		map2 {
+			trip = <&cpu2_alert2>;
+			cooling-device = <&cpu0 6 11>,
+					 <&cpu1 6 11>,
+					 <&cpu2 6 11>,
+					 <&cpu3 6 11>,
+					 <&cpu4 6 7>,
+					 <&cpu5 6 7>,
+					 <&cpu6 6 7>,
+					 <&cpu7 6 7>;
+		};
+	};
+};
+
+&cpu3_thermal {
+	trips {
+		cpu3_alert0: cpu-alert-0 {
+			temperature = <60000>; /* millicelsius */
+			hysteresis = <5000>; /* millicelsius */
+			type = "passive";
+		};
+		cpu3_alert1: cpu-alert-1 {
+			temperature = <80000>; /* millicelsius */
+			hysteresis = <10000>; /* millicelsius */
+			type = "passive";
+		};
+		cpu3_alert2: cpu-alert-2 {
+			temperature = <110000>; /* millicelsius */
+			hysteresis = <10000>; /* millicelsius */
+			type = "passive";
+		};
+		cpu3_crit0: cpu-crit-0 {
+			temperature = <120000>; /* millicelsius */
+			hysteresis = <0>; /* millicelsius */
+			type = "critical";
+		};
+	};
+
+	cooling-maps {
+		map0 {
+			trip = <&cpu3_alert0>;
+			cooling-device = <&cpu0 0 2>,
+					 <&cpu1 0 2>,
+					 <&cpu2 0 2>,
+					 <&cpu3 0 2>,
+					 <&cpu4 0 2>,
+					 <&cpu5 0 2>,
+					 <&cpu6 0 2>,
+					 <&cpu7 0 2>;
+		};
+
+		map1 {
+			trip = <&cpu3_alert1>;
+			cooling-device = <&cpu0 3 6>,
+					 <&cpu1 3 6>,
+					 <&cpu2 3 6>,
+					 <&cpu3 3 6>,
+					 <&cpu4 3 5>,
+					 <&cpu5 3 5>,
+					 <&cpu6 3 5>,
+					 <&cpu7 3 5>;
+		};
+
+		map2 {
+			trip = <&cpu3_alert2>;
+			cooling-device = <&cpu0 6 11>,
+					 <&cpu1 6 11>,
+					 <&cpu2 6 11>,
+					 <&cpu3 6 11>,
+					 <&cpu4 5 7>,
+					 <&cpu5 5 7>,
+					 <&cpu6 5 7>,
+					 <&cpu7 5 7>;
+		};
+	};
+};
+
 &usbdrd_dwc3_1 {
 	dr_mode = "host";
 };
-- 
2.17.1
