From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos4: add missing clock to MFC device
Date: Wed, 19 Nov 2014 12:43:56 +0100
Message-ID: <1416397436-13503-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:25386 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750759AbaKSLoM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 06:44:12 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFA00JKZBEERH50@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Nov 2014 11:47:02 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kamil Debski <k.debski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

sclk_mfc is required for MFC device since commit
0c2272170d78f826f6e97f99fb8a67fc17feef07 ("media: s5p-mfc: rename
special clock to sclk_mfc"), so add it to exynos4 dts.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 0b5e46cd449f..c790a746b9c8 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -398,8 +398,8 @@
 		reg = <0x13400000 0x10000>;
 		interrupts = <0 94 0>;
 		samsung,power-domain = <&pd_mfc>;
-		clocks = <&clock CLK_MFC>;
-		clock-names = "mfc";
+		clocks = <&clock CLK_MFC>, <&clock CLK_SCLK_MFC>;
+		clock-names = "mfc", "sclk_mfc";
 		status = "disabled";
 		iommus = <&sysmmu_mfc_l>, <&sysmmu_mfc_r>;
 		iommu-names = "left", "right";
-- 
1.9.2
