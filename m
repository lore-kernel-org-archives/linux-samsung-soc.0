From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 2/2] ARM: dts: exynos4415: Add syscon property to the MIPI DPHY
Date: Thu, 21 May 2015 11:18:33 +0900
Message-ID: <1432174713-23368-2-git-send-email-k.kozlowski@samsung.com>
References: <1432174713-23368-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:48847 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753452AbbEUCSw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 May 2015 22:18:52 -0400
In-reply-to: <1432174713-23368-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Since e4b3d38088df ("phy: exynos-video-mipi: Fix regression by adding
support for PMU regmap") the Exynos PMU driver provides regmap to access
the MIPI DPHY registers. The MIPI DPHY driver accesses this regmap
through syscon phandle.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos4415.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4415.dtsi b/arch/arm/boot/dts/exynos4415.dtsi
index 186cb8465683..6a83d7999d8a 100644
--- a/arch/arm/boot/dts/exynos4415.dtsi
+++ b/arch/arm/boot/dts/exynos4415.dtsi
@@ -124,8 +124,8 @@
 
 		mipi_phy: video-phy@10020710 {
 			compatible = "samsung,s5pv210-mipi-video-phy";
-			reg = <0x10020710 8>;
 			#phy-cells = <1>;
+			syscon = <&pmu_system_controller>;
 		};
 
 		pd_cam: cam-power-domain@10024000 {
-- 
1.9.1
