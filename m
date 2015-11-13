From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 4/4] ARM: dts: exynos542x: add rotator node
Date: Fri, 13 Nov 2015 14:29:46 +0100
Message-ID: <1447421386-8084-4-git-send-email-m.szyprowski@samsung.com>
References: <5645A0C5.3090006@samsung.com>
 <1447421386-8084-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:47862 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753524AbbKMNav (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Nov 2015 08:30:51 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXR00K6A9JBK230@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Nov 2015 13:30:47 +0000 (GMT)
In-reply-to: <1447421386-8084-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

This patch adds device node for Rotator device and it's SYSMMU to Exynos
542x device tree file.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 1b3d6c7..48a0a55 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -717,6 +717,15 @@
 		iommus = <&sysmmu_tv>;
 	};
 
+	rotator: rotator@11C00000 {
+		compatible = "samsung,exynos5250-rotator";
+		reg = <0x11C00000 0x64>;
+		interrupts = <0 84 0>;
+		clocks = <&clock CLK_ROTATOR>;
+		clock-names = "rotator";
+		iommus = <&sysmmu_rotator>;
+	};
+
 	gsc_0: video-scaler@13e00000 {
 		compatible = "samsung,exynos5-gsc";
 		reg = <0x13e00000 0x1000>;
@@ -1059,6 +1068,16 @@
 		#iommu-cells = <0>;
 	};
 
+	sysmmu_rotator: sysmmu@0x11D40000 {
+		compatible = "samsung,exynos-sysmmu";
+		reg = <0x11D40000 0x1000>;
+		interrupt-parent = <&combiner>;
+		interrupts = <4 0>;
+		clock-names = "sysmmu", "master";
+		clocks = <&clock CLK_SMMU_ROTATOR>, <&clock CLK_ROTATOR>;
+		#iommu-cells = <0>;
+	};
+
 	sysmmu_jpeg0: sysmmu@0x11F10000 {
 		compatible = "samsung,exynos-sysmmu";
 		reg = <0x11F10000 0x1000>;
-- 
1.9.2
