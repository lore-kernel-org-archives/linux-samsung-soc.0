From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 32/50] ARM: dts: exynos: remove lowest OPP from bus_mfc
 in Exynos5420
Date: Mon, 15 Jul 2019 14:43:59 +0200
Message-ID: <20190715124417.4787-33-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124500eucas1p114c6cbbbb4efa421b2e24d49a6d3d603@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Align number of OPPs with the number in bus_wcore OPP table.
The higher OPPs would not be set, thus clean them.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 0be799f843dc..18c5273091bd 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1171,18 +1171,15 @@
 			compatible = "operating-points-v2";
 
 			opp00 {
-				opp-hz = /bits/ 64 <96000000>;
-			};
-			opp01 {
 				opp-hz = /bits/ 64 <111000000>;
 			};
-			opp02 {
+			opp01 {
 				opp-hz = /bits/ 64 <167000000>;
 			};
-			opp03 {
+			opp02 {
 				opp-hz = /bits/ 64 <222000000>;
 			};
-			opp04 {
+			opp03 {
 				opp-hz = /bits/ 64 <333000000>;
 			};
 		};
-- 
2.17.1
