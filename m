From: Willy WOLFF <willy.mh.wolff@gmail.com>
Subject: [PATCH] Exynos5422-odroidxu3: Incomplete thermal-zones definition
Date: Thu, 2 Feb 2017 17:14:40 +0000
Message-ID: <9e32c530-0d15-223f-c280-617f8ae2540d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wj0-f196.google.com ([209.85.210.196]:35820 "EHLO
        mail-wj0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752053AbdBBRPR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Feb 2017 12:15:17 -0500
Received: by mail-wj0-f196.google.com with SMTP id i7so1742969wjf.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Feb 2017 09:14:43 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org

Odroid XU3-familly boards has thermal sensors per A15 core, but the actual thermal-zones define only cooling-maps action for cpu0.
If the application is running on all cores but core4 (first core of the A15 cluster), the CPU can reach high temperature without cooling action.

Also, the comment for cpu_alert4 in cooling-maps definition is not accurate. 11 steps for A15 correspond to 700MHz.

Signed-off-by: Willy Wolff <willy.mh.wolff@gmail.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 287 +++++++++++++++++++--
 1 file changed, 269 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 05b9afdd..92328c1 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -64,22 +64,22 @@
 			polling-delay-passive = <250>;
 			polling-delay = <0>;
 			trips {
-				cpu_alert0: cpu-alert-0 {
+				cpu0_alert0: cpu-alert-0 {
 					temperature = <50000>; /* millicelsius */
 					hysteresis = <5000>; /* millicelsius */
 					type = "active";
 				};
-				cpu_alert1: cpu-alert-1 {
+				cpu0_alert1: cpu-alert-1 {
 					temperature = <60000>; /* millicelsius */
 					hysteresis = <5000>; /* millicelsius */
 					type = "active";
 				};
-				cpu_alert2: cpu-alert-2 {
+				cpu0_alert2: cpu-alert-2 {
 					temperature = <70000>; /* millicelsius */
 					hysteresis = <5000>; /* millicelsius */
 					type = "active";
 				};
-				cpu_crit0: cpu-crit-0 {
+				cpu0_crit0: cpu-crit-0 {
 					temperature = <120000>; /* millicelsius */
 					hysteresis = <0>; /* millicelsius */
 					type = "critical";
@@ -88,59 +88,310 @@
 				 * Exynos542x supports only 4 trip-points
 				 * so for these polling mode is required.
 				 * Start polling at temperature level of last
-				 * interrupt-driven trip: cpu_alert2
+				 * interrupt-driven trip: cpu0_alert2
 				 */
-				cpu_alert3: cpu-alert-3 {
+				cpu0_alert3: cpu-alert-3 {
 					temperature = <70000>; /* millicelsius */
 					hysteresis = <10000>; /* millicelsius */
 					type = "passive";
 				};
-				cpu_alert4: cpu-alert-4 {
+				cpu0_alert4: cpu-alert-4 {
 					temperature = <85000>; /* millicelsius */
 					hysteresis = <10000>; /* millicelsius */
 					type = "passive";
 				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu0_alert0>;
+					cooling-device = <&fan0 0 1>;
+				};
+				map1 {
+					trip = <&cpu0_alert1>;
+					cooling-device = <&fan0 1 2>;
+				};
+				map2 {
+					trip = <&cpu0_alert2>;
+					cooling-device = <&fan0 2 3>;
+				};
+				/*
+				 * When reaching cpu0_alert3, reduce CPU
+				 * by 2 steps. On Exynos5422/5800 that would
+				 * be: 1600 MHz and 1100 MHz.
+				 */
+				map3 {
+					trip = <&cpu0_alert3>;
+					cooling-device = <&cpu0 0 2>;
+				};
+				map4 {
+					trip = <&cpu0_alert3>;
+					cooling-device = <&cpu4 0 2>;
+				};
+
+				/*
+				 * When reaching cpu0_alert4, reduce CPU
+				 * further, down to 600 MHz (12 steps for big,
+				 * 7 steps for LITTLE).
+				 */
+				map5 {
+					trip = <&cpu0_alert4>;
+					cooling-device = <&cpu0 3 7>;
+				};
+				map6 {
+					trip = <&cpu0_alert4>;
+					cooling-device = <&cpu4 3 12>;
+				};
+			};
+		};
+		cpu1_thermal: cpu1-thermal {
+			thermal-sensors = <&tmu_cpu1 0>;
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			trips {
+				cpu1_alert0: cpu-alert-0 {
+					temperature = <50000>; /* millicelsius */
+					hysteresis = <5000>; /* millicelsius */
+					type = "active";
+				};
+				cpu1_alert1: cpu-alert-1 {
+					temperature = <60000>; /* millicelsius */
+					hysteresis = <5000>; /* millicelsius */
+					type = "active";
+				};
+				cpu1_alert2: cpu-alert-2 {
+					temperature = <70000>; /* millicelsius */
+					hysteresis = <5000>; /* millicelsius */
+					type = "active";
+				};
+				cpu1_crit0: cpu-crit-0 {
+					temperature = <120000>; /* millicelsius */
+					hysteresis = <0>; /* millicelsius */
+					type = "critical";
+				};
+				/*
+				 * Exynos542x supports only 4 trip-points
+				 * so for these polling mode is required.
+				 * Start polling at temperature level of last
+				 * interrupt-driven trip: cpu1_alert2
+				 */
+				cpu1_alert3: cpu-alert-3 {
+					temperature = <70000>; /* millicelsius */
+					hysteresis = <10000>; /* millicelsius */
+					type = "passive";
+				};
+				cpu1_alert4: cpu-alert-4 {
+					temperature = <85000>; /* millicelsius */
+					hysteresis = <10000>; /* millicelsius */
+					type = "passive";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu1_alert0>;
+					cooling-device = <&fan0 0 1>;
+				};
+				map1 {
+					trip = <&cpu1_alert1>;
+					cooling-device = <&fan0 1 2>;
+				};
+				map2 {
+					trip = <&cpu1_alert2>;
+					cooling-device = <&fan0 2 3>;
+				};
+				/*
+				 * When reaching cpu1_alert3, reduce CPU
+				 * by 2 steps. On Exynos5422/5800 that would
+				 * be: 1600 MHz and 1100 MHz.
+				 */
+				map3 {
+					trip = <&cpu1_alert3>;
+					cooling-device = <&cpu0 0 2>;
+				};
+				map4 {
+					trip = <&cpu1_alert3>;
+					cooling-device = <&cpu4 0 2>;
+				};
 
+				/*
+				 * When reaching cpu1_alert4, reduce CPU
+				 * further, down to 600 MHz (12 steps for big,
+				 * 7 steps for LITTLE).
+				 */
+				map5 {
+					trip = <&cpu1_alert4>;
+					cooling-device = <&cpu0 3 7>;
+				};
+				map6 {
+					trip = <&cpu1_alert4>;
+					cooling-device = <&cpu4 3 12>;
+				};
+			};
+		};
+		cpu2_thermal: cpu2-thermal {
+			thermal-sensors = <&tmu_cpu2 0>;
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			trips {
+				cpu2_alert0: cpu-alert-0 {
+					temperature = <50000>; /* millicelsius */
+					hysteresis = <5000>; /* millicelsius */
+					type = "active";
+				};
+				cpu2_alert1: cpu-alert-1 {
+					temperature = <60000>; /* millicelsius */
+					hysteresis = <5000>; /* millicelsius */
+					type = "active";
+				};
+				cpu2_alert2: cpu-alert-2 {
+					temperature = <70000>; /* millicelsius */
+					hysteresis = <5000>; /* millicelsius */
+					type = "active";
+				};
+				cpu2_crit0: cpu-crit-0 {
+					temperature = <120000>; /* millicelsius */
+					hysteresis = <0>; /* millicelsius */
+					type = "critical";
+				};
+				/*
+				 * Exynos542x supports only 4 trip-points
+				 * so for these polling mode is required.
+				 * Start polling at temperature level of last
+				 * interrupt-driven trip: cpu2_alert2
+				 */
+				cpu2_alert3: cpu-alert-3 {
+					temperature = <70000>; /* millicelsius */
+					hysteresis = <10000>; /* millicelsius */
+					type = "passive";
+				};
+				cpu2_alert4: cpu-alert-4 {
+					temperature = <85000>; /* millicelsius */
+					hysteresis = <10000>; /* millicelsius */
+					type = "passive";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu2_alert0>;
+					cooling-device = <&fan0 0 1>;
+				};
+				map1 {
+					trip = <&cpu2_alert1>;
+					cooling-device = <&fan0 1 2>;
+				};
+				map2 {
+					trip = <&cpu2_alert2>;
+					cooling-device = <&fan0 2 3>;
+				};
+				/*
+				 * When reaching cpu2_alert3, reduce CPU
+				 * by 2 steps. On Exynos5422/5800 that would
+				 * be: 1600 MHz and 1100 MHz.
+				 */
+				map3 {
+					trip = <&cpu2_alert3>;
+					cooling-device = <&cpu0 0 2>;
+				};
+				map4 {
+					trip = <&cpu2_alert3>;
+					cooling-device = <&cpu4 0 2>;
+				};
+
+				/*
+				 * When reaching cpu2_alert4, reduce CPU
+				 * further, down to 600 MHz (12 steps for big,
+				 * 7 steps for LITTLE).
+				 */
+				map5 {
+					trip = <&cpu2_alert4>;
+					cooling-device = <&cpu0 3 7>;
+				};
+				map6 {
+					trip = <&cpu2_alert4>;
+					cooling-device = <&cpu4 3 12>;
+				};
+			};
+		};
+		cpu3_thermal: cpu3-thermal {
+			thermal-sensors = <&tmu_cpu3 0>;
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			trips {
+				cpu3_alert0: cpu-alert-0 {
+					temperature = <50000>; /* millicelsius */
+					hysteresis = <5000>; /* millicelsius */
+					type = "active";
+				};
+				cpu3_alert1: cpu-alert-1 {
+					temperature = <60000>; /* millicelsius */
+					hysteresis = <5000>; /* millicelsius */
+					type = "active";
+				};
+				cpu3_alert2: cpu-alert-2 {
+					temperature = <70000>; /* millicelsius */
+					hysteresis = <5000>; /* millicelsius */
+					type = "active";
+				};
+				cpu3_crit0: cpu-crit-0 {
+					temperature = <120000>; /* millicelsius */
+					hysteresis = <0>; /* millicelsius */
+					type = "critical";
+				};
+				/*
+				 * Exynos542x supports only 4 trip-points
+				 * so for these polling mode is required.
+				 * Start polling at temperature level of last
+				 * interrupt-driven trip: cpu3_alert2
+				 */
+				cpu3_alert3: cpu-alert-3 {
+					temperature = <70000>; /* millicelsius */
+					hysteresis = <10000>; /* millicelsius */
+					type = "passive";
+				};
+				cpu3_alert4: cpu-alert-4 {
+					temperature = <85000>; /* millicelsius */
+					hysteresis = <10000>; /* millicelsius */
+					type = "passive";
+				};
 			};
 			cooling-maps {
 				map0 {
-					trip = <&cpu_alert0>;
+					trip = <&cpu3_alert0>;
 					cooling-device = <&fan0 0 1>;
 				};
 				map1 {
-					trip = <&cpu_alert1>;
+					trip = <&cpu3_alert1>;
 					cooling-device = <&fan0 1 2>;
 				};
 				map2 {
-					trip = <&cpu_alert2>;
+					trip = <&cpu3_alert2>;
 					cooling-device = <&fan0 2 3>;
 				};
 				/*
-				 * When reaching cpu_alert3, reduce CPU
+				 * When reaching cpu3_alert3, reduce CPU
 				 * by 2 steps. On Exynos5422/5800 that would
 				 * be: 1600 MHz and 1100 MHz.
 				 */
 				map3 {
-					trip = <&cpu_alert3>;
+					trip = <&cpu3_alert3>;
 					cooling-device = <&cpu0 0 2>;
 				};
 				map4 {
-					trip = <&cpu_alert3>;
+					trip = <&cpu3_alert3>;
 					cooling-device = <&cpu4 0 2>;
 				};
 
 				/*
-				 * When reaching cpu_alert4, reduce CPU
-				 * further, down to 600 MHz (11 steps for big,
+				 * When reaching cpu3_alert4, reduce CPU
+				 * further, down to 600 MHz (12 steps for big,
 				 * 7 steps for LITTLE).
 				 */
 				map5 {
-					trip = <&cpu_alert4>;
+					trip = <&cpu3_alert4>;
 					cooling-device = <&cpu0 3 7>;
 				};
 				map6 {
-					trip = <&cpu_alert4>;
-					cooling-device = <&cpu4 3 11>;
+					trip = <&cpu3_alert4>;
+					cooling-device = <&cpu4 3 12>;
 				};
 			};
 		};
-- 
2.1.4
