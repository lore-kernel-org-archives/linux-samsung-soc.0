From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 28/50] ARM: dts: exynos: change OPPs for g2d and g2d_acp
 buses in Exynos5420
Date: Mon, 15 Jul 2019 14:43:55 +0200
Message-ID: <20190715124417.4787-29-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124457eucas1p1b3033c2505581b350191eed7ba47bb40@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Align the frequencies in OPPs to values which are possible to set using
a divider and parent clock rate. Keep the OPP number in the table equal
or less to the number in bus_wcore (any higher OPPs would not be set).

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index a355c76af5a5..3a128cd717e2 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1216,7 +1216,7 @@
 			compatible = "operating-points-v2";
 
 			opp00 {
-				opp-hz = /bits/ 64 <84000000>;
+				opp-hz = /bits/ 64 <110000000>;
 			};
 			opp01 {
 				opp-hz = /bits/ 64 <167000000>;
@@ -1225,9 +1225,6 @@
 				opp-hz = /bits/ 64 <222000000>;
 			};
 			opp03 {
-				opp-hz = /bits/ 64 <300000000>;
-			};
-			opp04 {
 				opp-hz = /bits/ 64 <333000000>;
 			};
 		};
@@ -1236,16 +1233,16 @@
 			compatible = "operating-points-v2";
 
 			opp00 {
-				opp-hz = /bits/ 64 <67000000>;
+				opp-hz = /bits/ 64 <100000000>;
 			};
 			opp01 {
-				opp-hz = /bits/ 64 <133000000>;
+				opp-hz = /bits/ 64 <150000000>;
 			};
 			opp02 {
-				opp-hz = /bits/ 64 <178000000>;
+				opp-hz = /bits/ 64 <200000000>;
 			};
 			opp03 {
-				opp-hz = /bits/ 64 <267000000>;
+				opp-hz = /bits/ 64 <300000000>;
 			};
 		};
 
-- 
2.17.1
