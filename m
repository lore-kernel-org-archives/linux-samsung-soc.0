From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 1/5] arm64: dts: exynos: Fix FSYS CMU parent clocks in
 Exynos 5433 SoC
Date: Thu, 17 Nov 2016 09:57:57 +0100
Message-ID: <1479373081-11586-2-git-send-email-m.szyprowski@samsung.com>
References: <1479373081-11586-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161117085810eucas1p2e6cfa6b12c7505e4d6a39fe7423b796b@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52162 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751127AbcKQI6O (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 03:58:14 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGS00B5A3L0V780@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Nov 2016 08:58:12 +0000 (GMT)
In-reply-to: <1479373081-11586-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

This patch corrects FSYS CMU parent clocks specified in clock controller
node to let improved Exynos 5433 clocks driver to control proper clocks
on FSYS<->TOP CMU boundary.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 1188630823a7..6564875344fa 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -312,7 +312,7 @@
 
 			clock-names = "oscclk",
 				"sclk_ufs_mphy",
-				"div_aclk_fsys_200",
+				"aclk_fsys_200",
 				"sclk_pcie_100_fsys",
 				"sclk_ufsunipro_fsys",
 				"sclk_mmc2_fsys",
@@ -322,7 +322,7 @@
 				"sclk_usbdrd30_fsys";
 			clocks = <&xxti>,
 				<&cmu_cpif CLK_SCLK_UFS_MPHY>,
-				<&cmu_top CLK_DIV_ACLK_FSYS_200>,
+				<&cmu_top CLK_ACLK_FSYS_200>,
 				<&cmu_top CLK_SCLK_PCIE_100_FSYS>,
 				<&cmu_top CLK_SCLK_UFSUNIPRO_FSYS>,
 				<&cmu_top CLK_SCLK_MMC2_FSYS>,
-- 
1.9.1
