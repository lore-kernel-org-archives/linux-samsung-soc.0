From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 27/50] ARM: dts: exynos: align bus_wcore OPPs in
 Exynos5420
Date: Mon, 15 Jul 2019 14:43:54 +0200
Message-ID: <20190715124417.4787-28-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124456eucas1p2acf15d00e3fa7b77fe3a2b10ce1ab74f@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This is the most important bus in the Exynos5x SoC. The whole communication
inside SoC does through that bus (apart from direct requests from CCI to
DRAM controller). It is also modeled as a master bus in devfreq framework.
It is also the only one OPP table throughout other buses which has voltage
values. The devfreq software controls the speed of that bus and other
buses. The other buses follows the rate of the master. There is only one
regulator. The old lowest OPP had pair 925mV, 84MHz which is enough for
this frequency. However, due to the fact that the other buses follows the
WCORE bus by taking the OPP from their table with the same id, e.g. opp02,
the children frequency should be stable with the set voltage.
It could cause random faults very hard to debug.
Thus, the patch removes the lowest OPP to make other buses' lowest OPPs
working. The new lowest OPP has voltage high enough for buses working up
to 333MHz. It also changes the frequencies of the OPPs to align them to
PLL value such that it is possible to set them using only a divider without
reprogramming OPP. Reprogramming the PLL was not set, so the real frequency
values were not the one from the OPP table, which could confuse the
governor algorithms which relay on OPP speed values making the system to
behave weird.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index f8c36ff0d4c3..a355c76af5a5 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1107,22 +1107,18 @@
 			compatible = "operating-points-v2";
 
 			opp00 {
-				opp-hz = /bits/ 64 <84000000>;
-				opp-microvolt = <925000>;
+				opp-hz = /bits/ 64 <150000000>;
+				opp-microvolt = <950000>;
 			};
 			opp01 {
-				opp-hz = /bits/ 64 <111000000>;
+				opp-hz = /bits/ 64 <200000000>;
 				opp-microvolt = <950000>;
 			};
 			opp02 {
-				opp-hz = /bits/ 64 <222000000>;
+				opp-hz = /bits/ 64 <300000000>;
 				opp-microvolt = <950000>;
 			};
 			opp03 {
-				opp-hz = /bits/ 64 <333000000>;
-				opp-microvolt = <950000>;
-			};
-			opp04 {
 				opp-hz = /bits/ 64 <400000000>;
 				opp-microvolt = <987500>;
 			};
-- 
2.17.1
