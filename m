From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 48/50] ARM: dts: exynos: set proper parents to bus_isp266
 Exynos5422
Date: Mon, 15 Jul 2019 14:44:15 +0200
Message-ID: <20190715124417.4787-49-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124514eucas1p1531a88cfb9b4e2fdb801074963372688@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Exynos5422 there is a dedicated clock hierarchy for ACLK_266_ISP which
should be set to proper values to fully use the HW performance.
The old settings left after boot set minimal values to this bus.
In the Exynos5420 the bus is connected to ACLK_266 so there is no need for
aligning the values. In the Exynos5422 the proper hierarchy of these
clocks should be model in the software to use the full HW feature set.
The patch sets proper parent (MPLL) and initial frequency to the bus also
enabling it.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index d278339f259c..c770d17141e8 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -187,6 +187,17 @@
 	status = "okay";
 };
 
+&bus_isp266 {
+	devfreq = <&bus_wcore>;
+	assigned-clocks = <&clock CLK_MOUT_ACLK266_ISP>,
+			  <&clock CLK_MOUT_USER_ACLK266_ISP>,
+			  <&clock CLK_DOUT_ACLK266_ISP>;
+	assigned-clock-parents = <&clock CLK_MOUT_SCLK_MPLL>,
+				 <&clock CLK_MOUT_SW_ACLK266_ISP>;
+	assigned-clock-rates = <0>, <0>,<300000000>;
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&buck6_reg>;
 };
-- 
2.17.1
