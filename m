From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 43/50] ARM: dts: exynos: add bus_isp in Exynos5422
Date: Mon, 15 Jul 2019 14:44:10 +0200
Message-ID: <20190715124417.4787-44-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124509eucas1p1f2e44af951158fbef1a245467956ef93@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add bus_isp which changes ACLK400_ISP clock speed according to the bus
documentation in the documentation. The bus_isp OPP table has been
aligned to the new parent rate. This patch sets the proper parent and
picks the init frequency before the devfreq governor starts working.
It sets also parent rate (DPLL to 1200MHz).

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index 990fe03fce75..852cb3dd495d 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -166,6 +166,18 @@
 	status = "okay";
 };
 
+&bus_isp {
+	devfreq = <&bus_wcore>;
+	assigned-clocks = <&clock CLK_MOUT_ACLK400_ISP>,
+			  <&clock CLK_MOUT_SW_ACLK400_ISP>,
+			  <&clock CLK_DOUT_ACLK400_ISP>,
+			  <&clock CLK_FOUT_DPLL>;
+	assigned-clock-parents = <&clock CLK_MOUT_SCLK_DPLL>,
+				 <&clock CLK_DOUT_ACLK400_ISP>;
+	assigned-clock-rates = <0>, <0>, <400000000>, <1200000000>;
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&buck6_reg>;
 };
-- 
2.17.1
