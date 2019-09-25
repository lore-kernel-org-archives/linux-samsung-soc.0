From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH 2/3] ARM: dts: exynos: map 0x10000 SFR instead of 0x100 in
 DMC Exynos5422
Date: Wed, 25 Sep 2019 18:18:12 +0200
Message-ID: <20190925161813.21117-3-l.luba@partner.samsung.com>
References: <20190925161813.21117-1-l.luba@partner.samsung.com>
        <CGME20190925161843eucas1p1abaa1aaa20fcf5c55c9e52bb6a491317@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190925161813.21117-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, robh+dt@kernel.org, willy.mh.wolff.ml@gmail.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

There is a need to access registers at address offset near 0x10000.
These registers are private DMC performance counters, which might be used
as interrupt trigger when overflow. Potential usage is to skip polling
in devfreq framework and switch to interrupt managed bandwidth control.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 72738e620d11..b695f07f7eed 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -239,7 +239,7 @@
 
 		dmc: memory-controller@10c20000 {
 			compatible = "samsung,exynos5422-dmc";
-			reg = <0x10c20000 0x100>, <0x10c30000 0x100>;
+			reg = <0x10c20000 0x10000>, <0x10c30000 0x10000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <16 0>;
 			clocks = <&clock CLK_FOUT_SPLL>,
-- 
2.17.1
