From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 20/50] ARM: dts: exynos: change and rename FSYS OPP table
 in Exynos5420
Date: Mon, 15 Jul 2019 14:43:47 +0200
Message-ID: <20190715124417.4787-21-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124450eucas1p189043d196375aa6adacf898de81bfa9b@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The FSYS and FSYS2 buses have similar characteristics and both have max
frequency 240MHz. The old OPP table bus_fsys_apb_opp_table should be used
only to FSYS APB bus because APB max frequency is 200MHz.
The new OPPs for FSYS should increase its performance and related devices.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 941c58bdd809..c7fc4b829b2a 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -995,7 +995,7 @@
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_ACLK200_FSYS>;
 			clock-names = "bus";
-			operating-points-v2 = <&bus_fsys_apb_opp_table>;
+			operating-points-v2 = <&bus_fsys_opp_table>;
 			status = "disabled";
 		};
 
@@ -1003,7 +1003,7 @@
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_ACLK200_FSYS2>;
 			clock-names = "bus";
-			operating-points-v2 = <&bus_fsys2_opp_table>;
+			operating-points-v2 = <&bus_fsys_opp_table>;
 			status = "disabled";
 		};
 
@@ -1157,7 +1157,7 @@
 			};
 		};
 
-		bus_fsys2_opp_table: opp_table5 {
+		bus_fsys_opp_table: opp_table5 {
 			compatible = "operating-points-v2";
 
 			opp00 {
-- 
2.17.1
