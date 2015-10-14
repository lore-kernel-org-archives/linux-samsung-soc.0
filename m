From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] dt-bindings: Correct the example for Exynos power domain clocks
Date: Wed, 14 Oct 2015 15:02:06 +0900
Message-ID: <1444802526-18518-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:33700 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750852AbbJNGCs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Oct 2015 02:02:48 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Since commit 29e5eea06bc1 ("ARM: EXYNOS: Get current parent clock for
power domain on/off") the "pclkN" names of "clock-names" property is not
parsed any more. The bindings and driver were updated but the example
was not. Fix the example now.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 Documentation/devicetree/bindings/arm/exynos/power_domain.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
index e151057d92f0..4e947372a693 100644
--- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
+++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
@@ -43,9 +43,8 @@ Example:
 	mfc_pd: power-domain@10044060 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044060 0x20>;
-		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MOUT_SW_ACLK333>,
-			<&clock CLK_MOUT_USER_ACLK333>;
-		clock-names = "oscclk", "pclk0", "clk0";
+		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MOUT_USER_ACLK333>;
+		clock-names = "oscclk", "clk0";
 		#power-domain-cells = <0>;
 	};
 
-- 
1.9.1
