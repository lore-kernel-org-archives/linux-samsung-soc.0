From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 2/4] ARM: dts: exynos4: fix power domain for sysmmu-rotator
 device
Date: Fri, 13 Nov 2015 14:29:44 +0100
Message-ID: <1447421386-8084-2-git-send-email-m.szyprowski@samsung.com>
References: <5645A0C5.3090006@samsung.com>
 <1447421386-8084-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36394 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753524AbbKMNat (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Nov 2015 08:30:49 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXR00F4E9JADO30@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Nov 2015 13:30:46 +0000 (GMT)
In-reply-to: <1447421386-8084-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

Rotator device and it's SYSMMU belongs to different power domains
on various Exynos4 SoC revisions: LCD0 for 4210 and TOP for 4x12. This
patch fixes this by moving power-domains property to exynos4210.dtsi. TOP
power domain is always enabled and it is not represented in DTS.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi    | 1 -
 arch/arm/boot/dts/exynos4210.dtsi | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 3e01d4d..f3fe611 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -954,7 +954,6 @@
 		interrupts = <5 0>;
 		clock-names = "sysmmu", "master";
 		clocks = <&clock CLK_SMMU_ROTATOR>, <&clock CLK_ROTATOR>;
-		power-domains = <&pd_lcd0>;
 		#iommu-cells = <0>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index e3048ae..b7474cf2 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -283,3 +283,7 @@
 &rotator {
 	power-domains = <&pd_lcd0>;
 };
+
+&sysmmu_rotator {
+	power-domains = <&pd_lcd0>;
+};
-- 
1.9.2
