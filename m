From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 3/4] ARM: dts: exynos5250: add rotator node
Date: Fri, 13 Nov 2015 14:29:45 +0100
Message-ID: <1447421386-8084-3-git-send-email-m.szyprowski@samsung.com>
References: <5645A0C5.3090006@samsung.com>
 <1447421386-8084-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:47862 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754355AbbKMNau (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Nov 2015 08:30:50 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXR00L5C9JB2V30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Nov 2015 13:30:47 +0000 (GMT)
In-reply-to: <1447421386-8084-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

This patch adds device node for Rotator device to Exynos 5250 device
tree file.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 88b9cf5..33e2d5f 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -269,6 +269,15 @@
 		iommu-names = "left", "right";
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
 	tmu: tmu@10060000 {
 		compatible = "samsung,exynos5250-tmu";
 		reg = <0x10060000 0x100>;
-- 
1.9.2
