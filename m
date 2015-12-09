From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 2/2] ARM: dts: exynos542x: add GSCL block parent clock
 management to pm domain
Date: Wed, 09 Dec 2015 09:07:35 +0100
Message-ID: <1449648455-18279-1-git-send-email-m.szyprowski@samsung.com>
References: <5667B38E.5020207@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40903 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751354AbbLIIHt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Dec 2015 03:07:49 -0500
In-reply-to: <5667B38E.5020207@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>

Add support for restoring GScaler parent clocks configuration when GSCL
power domain is turned on.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 1b3d6c7..5d00c18 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -252,8 +252,10 @@
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044000 0x20>;
 		#power-domain-cells = <0>;
-		clocks = <&clock CLK_GSCL0>, <&clock CLK_GSCL1>;
-		clock-names = "asb0", "asb1";
+		clocks = <&clock CLK_FIN_PLL>,
+			 <&clock CLK_MOUT_USER_ACLK300_GSCL>,
+			 <&clock CLK_GSCL0>, <&clock CLK_GSCL1>;
+		clock-names = "oscclk", "clk0", "asb0", "asb1";
 	};
 
 	isp_pd: power-domain@10044020 {
-- 
1.9.2
