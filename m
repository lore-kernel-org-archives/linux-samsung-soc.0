From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 22/50] ARM: dts: exynos: OPPs for bus_disp1 in Exynos5420
Date: Mon, 15 Jul 2019 14:43:49 +0200
Message-ID: <20190715124417.4787-23-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124451eucas1p28ac87fa7bd7e602ffab69a6915f37536@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Update the bus_disp1 OPPs and add 400MHz which is max frequency for this
bus. The frequencies are aligned to parent clock such that it is not
needed to change the PLL rate.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 2b36c2f77a10..6e82ffcbeacd 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1305,7 +1305,7 @@
 			compatible = "operating-points-v2";
 
 			opp00 {
-				opp-hz = /bits/ 64 <120000000>;
+				opp-hz = /bits/ 64 <150000000>;
 			};
 			opp01 {
 				opp-hz = /bits/ 64 <200000000>;
@@ -1313,6 +1313,9 @@
 			opp02 {
 				opp-hz = /bits/ 64 <300000000>;
 			};
+			opp03 {
+				opp-hz = /bits/ 64 <400000000>;
+			};
 		};
 
 		bus_gscl_opp_table: opp_table15 {
-- 
2.17.1
