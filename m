From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v3 2/4] ARM: dts: exynos: Add interrupt to DMC controller in
 Exynos5422
Date: Wed,  2 Oct 2019 08:04:53 +0200
Message-ID: <20191002060455.3834-3-l.luba@partner.samsung.com>
References: <20191002060455.3834-1-l.luba@partner.samsung.com>
        <CGME20191002060505eucas1p2efd80ccde8c728973df8d932580cd58b@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002060455.3834-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, robh+dt@kernel.org, willy.mh.wolff.ml@gmail.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add interrupt to Dynamic Memory Controller in Exynos5422 and Odroid
XU3-family boards. It will be used instead of devfreq polling mode
governor. The interrupt is connected to performance counters private
for DMC, which might track utilisation of the memory channels.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 92c5e0d8a824..98f6c71f57d8 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -240,6 +240,9 @@
 		dmc: memory-controller@10c20000 {
 			compatible = "samsung,exynos5422-dmc";
 			reg = <0x10c20000 0x100>, <0x10c30000 0x100>;
+			interrupt-parent = <&combiner>;
+			interrupts = <16 0>, <16 1>;
+			interrupt-names = "drex_0", "drex_1";
 			clocks = <&clock CLK_FOUT_SPLL>,
 				 <&clock CLK_MOUT_SCLK_SPLL>,
 				 <&clock CLK_FF_DOUT_SPLL2>,
-- 
2.17.1
