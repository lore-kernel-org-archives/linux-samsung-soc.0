From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 18/50] ARM: dts: exynos: add bus_isp with OPP table
Date: Mon, 15 Jul 2019 14:43:45 +0200
Message-ID: <20190715124417.4787-19-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124448eucas1p1b3a8d16d6f5e9fd4ed49c3b7fa66e18e@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add bus_isp which controls ACLK400_ISP clock. The OPPs are aligned to
parent clock and PLL rate so that the PLL would not need to be
reprogrammed.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 5fb2326875dc..1b717c5c3b1a 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1095,6 +1095,14 @@
 			status = "disabled";
 		};
 
+		bus_isp: bus_isp {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_DOUT_ACLK400_ISP>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_isp_opp_table>;
+			status = "disabled";
+		};
+
 		bus_wcore_opp_table: opp_table2 {
 			compatible = "operating-points-v2";
 
@@ -1337,6 +1345,23 @@
 				opp-hz = /bits/ 64 <400000000>;
 			};
 		};
+
+		bus_isp_opp_table: opp_table17 {
+			compatible = "operating-points-v2";
+
+			opp00 {
+				opp-hz = /bits/ 64 <150000000>;
+			};
+			opp01 {
+				opp-hz = /bits/ 64 <200000000>;
+			};
+			opp02 {
+				opp-hz = /bits/ 64 <300000000>;
+			};
+			opp03 {
+				opp-hz = /bits/ 64 <400000000>;
+			};
+		};
 	};
 
 	thermal-zones {
-- 
2.17.1
