From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH v2] ARM: dts: exynos5420: fix wrong clock binding for
 sysmmu_fimd1_1
Date: Wed, 23 Sep 2015 16:41:55 +0900
Message-ID: <1442994115-20167-1-git-send-email-jy0922.shim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:45895 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751921AbbIWHl5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Sep 2015 03:41:57 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, stable@vger.kernel.org, k.kozlowski@samsung.com, kgene@kernel.org, m.szyprowski@samsung.com, javier@osg.samsung.com, jy0922.shim@samsung.com

The sysmmu_fimd1_1 should bind the clock CLK_SMMU_FIMD1M1, not the clock
CLK_SMMU_FIMD1M0. CLK_SMMU_FIMD1M0 is a clock for the sysmmu_fimd1_0.

This wrong clock binding causes the problem that is blocked in iommu_map
function when IOMMU is enabled and exynos-drm driver tries to allocate
buffer via DMA mapping API on Odroid-XU3 board.

Fixes: b70045167815 ("ARM: dts: add sysmmu nodes for exynos5420")
Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: <stable@vger.kernel.org> # v4.2
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
Changes for v2:
- Update the commit message
- Add Fixes: and Reviewed-by: tags

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
