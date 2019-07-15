From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 35/50] ARM: dts: exynos: change speed and parent of NoC
 clock in Exynos5420
Date: Mon, 15 Jul 2019 14:44:02 +0200
Message-ID: <20190715124417.4787-36-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124502eucas1p1b795c100232b405070f4700e3ca6130b@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch changes speed and parent of NoC WCORE bus to 400MHz. The clock
is now attached to a branch were the root is the DPLL which speed is set to
1200MHz. The OPPs are aligned to this rate accordingly.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index 25d95de15c9b..aaf18653d8ac 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -46,6 +46,13 @@
 			<&nocp_mem1_0>, <&nocp_mem1_1>;
 	vdd-supply = <&buck3_reg>;
 	exynos,saturation-ratio = <100>;
+	assigned-clocks = <&clock CLK_MOUT_ACLK400_WCORE>,
+			  <&clock CLK_MOUT_SW_ACLK400_WCORE>,
+			  <&clock CLK_DOUT_ACLK400_WCORE>,
+			  <&clock CLK_FOUT_DPLL>;
+	assigned-clock-parents = <&clock CLK_MOUT_SCLK_DPLL>,
+				 <&clock CLK_DOUT_ACLK400_WCORE>;
+	assigned-clock-rates = <0>, <0>, <400000000>, <1200000000>;
 	status = "okay";
 };
 
-- 
2.17.1
