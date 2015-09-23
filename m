From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH] ARM: dts: exynos5420: fix wrong clock binding for
 sysmmu_fimd1_1
Date: Wed, 23 Sep 2015 15:48:26 +0900
Message-ID: <1442990906-16411-1-git-send-email-jy0922.shim@samsung.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, stable@vger.kernel.org, k.kozlowski@samsung.com, kgene@kernel.org, m.szyprowski@samsung.com, jy0922.shim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The sysmmu_fimd1_1 should bind the clock CLK_SMMU_FIMD1M1, not the clock
CLK_SMMU_FIMD1M0. CLK_SMMU_FIMD1M0 is a clock for the sysmmu_fimd1_0.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: <stable@vger.kernel.org> # v4.2
---
 arch/arm/boot/dts/exynos5420.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index df9aee9..1b3d6c7 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1117,7 +1117,7 @@
 		interrupt-parent = <&combiner>;
 		interrupts = <3 0>;
 		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_FIMD1M0>, <&clock CLK_FIMD1>;
+		clocks = <&clock CLK_SMMU_FIMD1M1>, <&clock CLK_FIMD1>;
 		power-domains = <&disp_pd>;
 		#iommu-cells = <0>;
 	};
-- 
1.9.1
