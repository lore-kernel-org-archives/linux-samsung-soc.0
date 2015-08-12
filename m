From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos4*: add iommu property to JPEG device
Date: Wed, 12 Aug 2015 11:39:59 +0200
Message-ID: <1439372399-20033-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:39885 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754442AbbHLJkH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Aug 2015 05:40:07 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NSY00CMDQUTDP10@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Aug 2015 10:40:05 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

JPEG codec node has been added in parallel to the patch, which added
support for IOMMU to Exynos platform, so JPEG device for Exynos4 series
lacked IOMMU property. This patch fixes this issue.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index b0d52b1..98c0a36 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -702,6 +702,7 @@
 		clocks = <&clock CLK_JPEG>;
 		clock-names = "jpeg";
 		power-domains = <&pd_cam>;
+		iommus = <&sysmmu_jpeg>;
 	};
 
 	hdmi: hdmi@12D00000 {
-- 
1.9.2
