From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Subject: [PATCH 4/4] arm: dts: r8a7790: add cpu capacity-dmips-mhz information
Date: Wed, 30 Aug 2017 15:41:20 +0100
Message-ID: <20170830144120.9312-5-dietmar.eggemann@arm.com>
References: <20170830144120.9312-1-dietmar.eggemann@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:45570 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751730AbdH3Olx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 10:41:53 -0400
In-Reply-To: <20170830144120.9312-1-dietmar.eggemann@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, Juri Lelli <juri.lelli@arm.com>

The following 'capacity-dmips-mhz' dt property values are used:

Cortex-A15: 1024, Cortex-A7: 539

They have been derived form the cpu_efficiency values:

Cortex-A15: 3891, Cortex-A7: 2048

by scaling them so that the Cortex-A15s (big cores) use 1024.

The cpu_efficiency values were originally derived from the "Big.LITTLE
Processing with ARM Cortex™-A15 & Cortex-A7" white paper
(http://www.cl.cam.ac.uk/~rdm34/big.LITTLE.pdf). Table 1 lists 1.9x
(3891/2048) as the Cortex-A15 vs Cortex-A7 performance ratio for the
Dhrystone benchmark.

The following platform is affected once cpu-invariant accounting
support is re-connected to the task scheduler:

r8a7790-lager

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
---
 arch/arm/boot/dts/r8a7790.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 2805a8608d4b..a57c0e170d8b 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -56,6 +56,7 @@
 			clock-latency = <300000>; /* 300 us */
 			power-domains = <&sysc R8A7790_PD_CA15_CPU0>;
 			next-level-cache = <&L2_CA15>;
+			capacity-dmips-mhz = <1024>;
 
 			/* kHz - uV - OPPs unknown yet */
 			operating-points = <1400000 1000000>,
@@ -73,6 +74,7 @@
 			clock-frequency = <1300000000>;
 			power-domains = <&sysc R8A7790_PD_CA15_CPU1>;
 			next-level-cache = <&L2_CA15>;
+			capacity-dmips-mhz = <1024>;
 		};
 
 		cpu2: cpu@2 {
@@ -82,6 +84,7 @@
 			clock-frequency = <1300000000>;
 			power-domains = <&sysc R8A7790_PD_CA15_CPU2>;
 			next-level-cache = <&L2_CA15>;
+			capacity-dmips-mhz = <1024>;
 		};
 
 		cpu3: cpu@3 {
@@ -91,6 +94,7 @@
 			clock-frequency = <1300000000>;
 			power-domains = <&sysc R8A7790_PD_CA15_CPU3>;
 			next-level-cache = <&L2_CA15>;
+			capacity-dmips-mhz = <1024>;
 		};
 
 		cpu4: cpu@100 {
@@ -100,6 +104,7 @@
 			clock-frequency = <780000000>;
 			power-domains = <&sysc R8A7790_PD_CA7_CPU0>;
 			next-level-cache = <&L2_CA7>;
+			capacity-dmips-mhz = <539>;
 		};
 
 		cpu5: cpu@101 {
@@ -109,6 +114,7 @@
 			clock-frequency = <780000000>;
 			power-domains = <&sysc R8A7790_PD_CA7_CPU1>;
 			next-level-cache = <&L2_CA7>;
+			capacity-dmips-mhz = <539>;
 		};
 
 		cpu6: cpu@102 {
@@ -118,6 +124,7 @@
 			clock-frequency = <780000000>;
 			power-domains = <&sysc R8A7790_PD_CA7_CPU2>;
 			next-level-cache = <&L2_CA7>;
+			capacity-dmips-mhz = <539>;
 		};
 
 		cpu7: cpu@103 {
@@ -127,6 +134,7 @@
 			clock-frequency = <780000000>;
 			power-domains = <&sysc R8A7790_PD_CA7_CPU3>;
 			next-level-cache = <&L2_CA7>;
+			capacity-dmips-mhz = <539>;
 		};
 
 		L2_CA15: cache-controller-0 {
-- 
2.11.0
