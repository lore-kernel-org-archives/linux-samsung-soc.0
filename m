From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/3] ARM64: dts: exynos: Add CPU performance counters to
 Exynos5433 boards
Date: Thu, 23 Nov 2017 15:34:31 +0100
Message-ID: <20171123143431.12434-4-m.szyprowski@samsung.com>
References: <20171123143431.12434-1-m.szyprowski@samsung.com>
        <CGME20171123143446eucas1p1cf930dedd38c700671b27c845c4969ba@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:52825 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751816AbdKWOeu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Nov 2017 09:34:50 -0500
In-reply-to: <20171123143431.12434-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marian Mihailescu <mihailescu2m@gmail.com>

Enable support for ARM Performance Monitoring Units available in
Cortex-A53 and Cortex-A57 CPU cores for Exynos5433 SoCs.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 7fe994b750da..9484d2f867dc 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -247,6 +247,24 @@
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x18000000>;
 
+		arm_a53_pmu {
+			compatible = "arm,cortex-a53-pmu", "arm,armv8-pmuv3";
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+		};
+
+		arm_a57_pmu {
+			compatible = "arm,cortex-a57-pmu", "arm,armv8-pmuv3";
+			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-affinity = <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+		};
+
 		chipid@10000000 {
 			compatible = "samsung,exynos4210-chipid";
 			reg = <0x10000000 0x100>;
-- 
2.14.2
