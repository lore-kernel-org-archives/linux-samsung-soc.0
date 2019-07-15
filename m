From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 19/50] ARM: dts: exynos: change OPPs values for FSYS2 in
 Exynos5420
Date: Mon, 15 Jul 2019 14:43:46 +0200
Message-ID: <20190715124417.4787-20-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124449eucas1p130d853368cb8bf02bef337da2d513fff@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The OPPs values for FSYS2 does not reflect the real possible frequencies.
According to the documentation the maximum frequency is 240MHz. This clock
is important to MMC controller controlling the AXI data bus speed and
internal buses. The new OPP values are aligned to parent PLL rate so that
there is no need of reprogramming PLL and the integer values are possible
to get using only a clock divider.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 1b717c5c3b1a..941c58bdd809 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1161,13 +1161,13 @@
 			compatible = "operating-points-v2";
 
 			opp00 {
-				opp-hz = /bits/ 64 <75000000>;
+				opp-hz = /bits/ 64 <150000000>;
 			};
 			opp01 {
-				opp-hz = /bits/ 64 <100000000>;
+				opp-hz = /bits/ 64 <200000000>;
 			};
 			opp02 {
-				opp-hz = /bits/ 64 <150000000>;
+				opp-hz = /bits/ 64 <240000000>;
 			};
 		};
 
-- 
2.17.1
