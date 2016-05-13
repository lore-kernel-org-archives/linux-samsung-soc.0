From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] arm64: dts: exynos: Use human-friendly symbols for timer
 interrupt flags
Date: Fri, 13 May 2016 15:44:26 +0200
Message-ID: <1463147066-8902-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56439 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751104AbcEMNol (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 May 2016 09:44:41 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Replace hex flags with human-readable symbols from arm-gic.h header
which makes it easier to recognize what is configured.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index ca663dfe5189..8d7ce97c0ddb 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/clock/exynos7-clk.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
 	compatible = "samsung,exynos7";
@@ -473,10 +474,14 @@
 
 		timer {
 			compatible = "arm,armv8-timer";
-			interrupts = <1 13 0xff01>,
-				     <1 14 0xff01>,
-				     <1 11 0xff01>,
-				     <1 10 0xff01>;
+			interrupts = <GIC_PPI 13
+					(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_EDGE_RISING)>,
+				     <GIC_PPI 14
+					(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_EDGE_RISING)>,
+				     <GIC_PPI 11
+					(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_EDGE_RISING)>,
+				     <GIC_PPI 10
+					(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_EDGE_RISING)>;
 		};
 
 		pmu_system_controller: system-controller@105c0000 {
-- 
1.9.1
