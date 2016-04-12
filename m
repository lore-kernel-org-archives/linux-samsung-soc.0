From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] arm64: dts: Add nodes for pdma0 and pdam1 for exynos7
Date: Tue, 12 Apr 2016 18:19:38 +0530
Message-ID: <1460465378-23486-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54795 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932523AbcDLMt1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Apr 2016 08:49:27 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will.deacon@arm.com, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, thomas.ab@samsung.com

This patch adds device tree nodes for pdma0 and pdma1 controllers
found on exynos7 SoCs.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 93108f1..cfecbd4 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -538,6 +538,35 @@
 			clocks = <&clock_peric0 PCLK_PWM>;
 			clock-names = "timers";
 		};
+
+		amba {
+			compatible = "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			pdma0: pdma@10E10000 {
+				compatible = "arm,pl330", "arm,primecell";
+				reg = <0x10E10000 0x1000>;
+				interrupts = <0 225 0>;
+				clocks = <&clock_fsys0 ACLK_PDMA0>;
+				clock-names = "apb_pclk";
+				#dma-cells = <1>;
+				#dma-channels = <8>;
+				#dma-requests = <32>;
+			};
+
+			pdma1: pdma@10EB0000 {
+				compatible = "arm,pl330", "arm,primecell";
+				reg = <0x10EB0000 0x1000>;
+				interrupts = <0 226 0>;
+				clocks = <&clock_fsys0 ACLK_PDMA1>;
+				clock-names = "apb_pclk";
+				#dma-cells = <1>;
+				#dma-channels = <8>;
+				#dma-requests = <32>;
+			};
+		};
 	};
 };
 
-- 
1.7.10.4
