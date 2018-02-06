From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] ARM: dts: exynos: Use pmu label in exynos4412
Date: Tue, 06 Feb 2018 12:25:52 +0100
Message-ID: <1517916352-13614-1-git-send-email-m.purski@samsung.com>
References: <CGME20180206112602eucas1p28e3a797fe752adc65dbe7571aa02a8aa@eucas1p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

In order to use soc node, we need to reference soc child nodes by label
in exynos4412. Define pmu label in exynos4.dtsi. Use it in exynos4412
instead of redefining the node.

Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos4.dtsi    | 2 +-
 arch/arm/boot/dts/exynos4412.dtsi | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 6d4775a..da284f3 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -162,7 +162,7 @@
 		reg = <0x10440000 0x1000>;
 	};
 
-	pmu {
+	pmu: pmu {
 		compatible = "arm,cortex-a9-pmu";
 		interrupt-parent = <&combiner>;
 		interrupts = <2 2>, <3 2>;
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index a6f3f59..e012cda 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -546,10 +546,6 @@
 			opp-hz = /bits/ 64 <100000000>;
 		};
 	};
-
-	pmu {
-		interrupts = <2 2>, <3 2>, <18 2>, <19 2>;
-	};
 };
 
 &combiner {
@@ -724,6 +720,9 @@
 		 <&clock CLK_SCLK_HDMI>, <&clock CLK_VP>;
 };
 
+&pmu {
+	interrupts = <2 2>, <3 2>, <18 2>, <19 2>;
+};
 
 &pmu_system_controller {
 	compatible = "samsung,exynos4412-pmu", "syscon";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
