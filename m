From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>
Subject: [RFC PATCH 08/11] arm: dts: exynos: Add parents and
 #interconnect-cells to Exynos4412
Date: Tue, 23 Jul 2019 14:20:13 +0200
Message-ID: <20190723122016.30279-9-a.swigon@partner.samsung.com>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
        <CGME20190723122027eucas1p24b1d76e3139f7cc52614d7613ff9ba98@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723122016.30279-1-a.swigon@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: krzk@kernel.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds two fields tp the Exynos4412 DTS:
  - parent: to declare connections between nodes that are not in a
    parent-child relation in devfreq;
  - #interconnect-cells: required by the interconnect framework.

Please note that #interconnect-cells is always zero and node IDs are not
hardcoded anywhere.

Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 1 +
 arch/arm/boot/dts/exynos4412.dtsi               | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index ea55f377d17c..bdd61ae86103 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -106,6 +106,7 @@
 &bus_leftbus {
 	devfreq-events = <&ppmu_leftbus_3>, <&ppmu_rightbus_3>;
 	vdd-supply = <&buck3_reg>;
+	parent = <&bus_dmc>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index d20db2dfe8e2..a70a671acacd 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -390,6 +390,7 @@
 			clocks = <&clock CLK_DIV_DMC>;
 			clock-names = "bus";
 			operating-points-v2 = <&bus_dmc_opp_table>;
+			#interconnect-cells = <0>;
 			status = "disabled";
 		};
 
@@ -398,6 +399,7 @@
 			clocks = <&clock CLK_DIV_ACP>;
 			clock-names = "bus";
 			operating-points-v2 = <&bus_acp_opp_table>;
+			#interconnect-cells = <0>;
 			status = "disabled";
 		};
 
@@ -406,6 +408,7 @@
 			clocks = <&clock CLK_DIV_C2C>;
 			clock-names = "bus";
 			operating-points-v2 = <&bus_dmc_opp_table>;
+			#interconnect-cells = <0>;
 			status = "disabled";
 		};
 
@@ -459,6 +462,7 @@
 			clocks = <&clock CLK_DIV_GDL>;
 			clock-names = "bus";
 			operating-points-v2 = <&bus_leftbus_opp_table>;
+			#interconnect-cells = <0>;
 			status = "disabled";
 		};
 
@@ -467,6 +471,7 @@
 			clocks = <&clock CLK_DIV_GDR>;
 			clock-names = "bus";
 			operating-points-v2 = <&bus_leftbus_opp_table>;
+			#interconnect-cells = <0>;
 			status = "disabled";
 		};
 
@@ -475,6 +480,7 @@
 			clocks = <&clock CLK_ACLK160>;
 			clock-names = "bus";
 			operating-points-v2 = <&bus_display_opp_table>;
+			#interconnect-cells = <0>;
 			status = "disabled";
 		};
 
@@ -483,6 +489,7 @@
 			clocks = <&clock CLK_ACLK133>;
 			clock-names = "bus";
 			operating-points-v2 = <&bus_fsys_opp_table>;
+			#interconnect-cells = <0>;
 			status = "disabled";
 		};
 
@@ -491,6 +498,7 @@
 			clocks = <&clock CLK_ACLK100>;
 			clock-names = "bus";
 			operating-points-v2 = <&bus_peri_opp_table>;
+			#interconnect-cells = <0>;
 			status = "disabled";
 		};
 
@@ -499,6 +507,7 @@
 			clocks = <&clock CLK_SCLK_MFC>;
 			clock-names = "bus";
 			operating-points-v2 = <&bus_leftbus_opp_table>;
+			#interconnect-cells = <0>;
 			status = "disabled";
 		};
 
-- 
2.17.1
