From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/5] arm64: dts: exynos: Fix FSYS CMU parent clocks in Exynos
 5433 SoC
Date: Wed, 16 Nov 2016 14:06:51 +0100
Message-ID: <1479301615-11240-2-git-send-email-m.szyprowski@samsung.com>
References: <1479301615-11240-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161116130707eucas1p20f49e19c746905f858ca7c7b1e7c0e37@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:26673 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752492AbcKPNHM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 08:07:12 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGQ001IIKFX0W60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Nov 2016 13:07:09 +0000 (GMT)
In-reply-to: <1479301615-11240-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

This patch corrects FSYS CMU parent clocks specified in clock controller
node to let improved Exynos 5433 clocks driver to control proper clocks
on FSYS<->TOP CMU boundary.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 1188630..6564875 100644
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
