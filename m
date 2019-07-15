From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 24/50] ARM: dts: exynos: align OPPs with PLL rate for
 MSCL in Exynos5420
Date: Mon, 15 Jul 2019 14:43:51 +0200
Message-ID: <20190715124417.4787-25-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124453eucas1p1dbdfab862499d9a7bd8a853e30944bac@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The OPPs must reflect possible values after dividing the master clock.
The old values 400 and 333, 222, etc does not have common parent rate.
Thus, align the values to parent rate such that they will be set exactly
using only a divider.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 0739e7bd4628..74d014f3eaa6 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1336,18 +1336,15 @@
 			compatible = "operating-points-v2";
 
 			opp00 {
-				opp-hz = /bits/ 64 <84000000>;
+				opp-hz = /bits/ 64 <150000000>;
 			};
 			opp01 {
-				opp-hz = /bits/ 64 <167000000>;
+				opp-hz = /bits/ 64 <200000000>;
 			};
 			opp02 {
-				opp-hz = /bits/ 64 <222000000>;
+				opp-hz = /bits/ 64 <300000000>;
 			};
 			opp03 {
-				opp-hz = /bits/ 64 <333000000>;
-			};
-			opp04 {
 				opp-hz = /bits/ 64 <400000000>;
 			};
 		};
-- 
2.17.1
