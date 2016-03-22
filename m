From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 1/2] ARM: dts: exynos: Add Security SubSystem node to Exynos4
Date: Tue, 22 Mar 2016 11:00:02 +0900
Message-ID: <1458612003-30284-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:36380 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755260AbcCVCAf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Mar 2016 22:00:35 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Vladimir Zapolskiy <vz@mleia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Add Security SubSystem (SSS) node to Exynos4 which provides hardware
acceleration of AES operations.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index c679b3cc3c48..39000f9c6b86 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -969,6 +969,15 @@
 		#iommu-cells = <0>;
 	};
 
+	sss: sss@10830000 {
+		compatible = "samsung,exynos4210-secss";
+		reg = <0x10830000 0x300>;
+		interrupts = <0 112 0>;
+		clocks = <&clock CLK_SSS>;
+		clock-names = "secss";
+		status = "disabled";
+	};
+
 	prng: rng@10830400 {
 		compatible = "samsung,exynos4-rng";
 		reg = <0x10830400 0x200>;
-- 
2.5.0
