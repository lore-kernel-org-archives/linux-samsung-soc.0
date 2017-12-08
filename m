From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/3] ARM: dts: exynos: Add G3D power domain to Exynos5250
Date: Fri, 08 Dec 2017 15:53:56 +0100
Message-ID: <20171208145356.24152-4-m.szyprowski@samsung.com>
References: <20171208145356.24152-1-m.szyprowski@samsung.com>
        <CGME20171208145403eucas1p1b6551d47d2a498afd25847821e1d685a@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50882 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754190AbdLHOyG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Dec 2017 09:54:06 -0500
In-reply-to: <20171208145356.24152-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Add support for G3D power domain, which contains ARM Mali-600MP
graphics accelerator device (not yet instantiated).

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 709a54743d73..232d8801d9e0 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -125,6 +125,13 @@
 			label = "MFC";
 		};
 
+		pd_g3d: power-domain@10044060 {
+			compatible = "samsung,exynos4210-pd";
+			reg = <0x10044060 0x20>;
+			#power-domain-cells = <0>;
+			label = "G3D";
+		};
+
 		pd_disp1: power-domain@100440A0 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x100440A0 0x20>;
-- 
2.15.0
