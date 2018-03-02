From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Fix IOMMU support for GScaler devices on
 Exynos5250
Date: Fri, 02 Mar 2018 17:07:42 +0100
Message-ID: <20180302160742.16947-1-m.szyprowski@samsung.com>
References: <CGME20180302160746eucas1p2274e7b1cba7f90acc9beec511c09e279@eucas1p2.samsung.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The proper name for the property, which assign given device to IOMMU is
'iommus', not 'iommu'. Fix incorrect name and let all GScaler devices
to be properly handled when IOMMU support is enabled.

Reported-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Fixes: 6cbfdd73a94f ("ARM: dts: add sysmmu nodes for exynos5250")
CC: stable@vger.kernel.org # v4.8+
---
This issue has been introduced in kernel v4.2-rc1, but this patch applies
cleanly only on v4.8+ kernels.
---
 arch/arm/boot/dts/exynos5250.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 56626d1a4235..cf89385e7888 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -655,7 +655,7 @@
 			power-domains = <&pd_gsc>;
 			clocks = <&clock CLK_GSCL0>;
 			clock-names = "gscl";
-			iommu = <&sysmmu_gsc0>;
+			iommus = <&sysmmu_gsc0>;
 		};
 
 		gsc_1:  gsc@13e10000 {
@@ -665,7 +665,7 @@
 			power-domains = <&pd_gsc>;
 			clocks = <&clock CLK_GSCL1>;
 			clock-names = "gscl";
-			iommu = <&sysmmu_gsc1>;
+			iommus = <&sysmmu_gsc1>;
 		};
 
 		gsc_2:  gsc@13e20000 {
@@ -675,7 +675,7 @@
 			power-domains = <&pd_gsc>;
 			clocks = <&clock CLK_GSCL2>;
 			clock-names = "gscl";
-			iommu = <&sysmmu_gsc2>;
+			iommus = <&sysmmu_gsc2>;
 		};
 
 		gsc_3:  gsc@13e30000 {
@@ -685,7 +685,7 @@
 			power-domains = <&pd_gsc>;
 			clocks = <&clock CLK_GSCL3>;
 			clock-names = "gscl";
-			iommu = <&sysmmu_gsc3>;
+			iommus = <&sysmmu_gsc3>;
 		};
 
 		hdmi: hdmi@14530000 {
-- 
2.15.0
