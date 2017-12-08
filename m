From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/3] ARM: dts: exynos: Fix power domain node names for
 Exynos5250
Date: Fri, 08 Dec 2017 15:53:54 +0100
Message-ID: <20171208145356.24152-2-m.szyprowski@samsung.com>
References: <20171208145356.24152-1-m.szyprowski@samsung.com>
        <CGME20171208145403eucas1p1c20d4373468b3a506ea0e2925526acdd@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50874 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753940AbdLHOyG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Dec 2017 09:54:06 -0500
In-reply-to: <20171208145356.24152-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Device nodes in device tree should use generic names, so rename
all existing domains to "power-domain".

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index f7ca2b689a46..a4168aa926f9 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -111,21 +111,21 @@
 			};
 		};
 
-		pd_gsc: gsc-power-domain@10044000 {
+		pd_gsc: power-domain@10044000 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10044000 0x20>;
 			#power-domain-cells = <0>;
 			label = "GSC";
 		};
 
-		pd_mfc: mfc-power-domain@10044040 {
+		pd_mfc: power-domain@10044040 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10044040 0x20>;
 			#power-domain-cells = <0>;
 			label = "MFC";
 		};
 
-		pd_disp1: disp1-power-domain@100440A0 {
+		pd_disp1: power-domain@100440A0 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x100440A0 0x20>;
 			#power-domain-cells = <0>;
-- 
2.15.0
