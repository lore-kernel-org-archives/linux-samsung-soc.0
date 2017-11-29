From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ARM: dts: exynos: Add missing interrupt-controller properties to Exynos5410 PMU
Date: Wed, 29 Nov 2017 19:36:10 +0100
Message-ID: <20171129183610.26305-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751111AbdK2Sgj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 13:36:39 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

PMU (system-controller@10040000) is used as interrupt-parent for certain
nodes thus it should be marked as interrupt-controller to silence
warnings when building Exynos5410-based DTBs:

  arch/arm/boot/dts/exynos5410-odroidxu.dtb: Warning (interrupts_property):
    Missing interrupt-controller or interrupt-map property in /soc/system-controller@10040000
  arch/arm/boot/dts/exynos5410-odroidxu.dtb: Warning (interrupts_property):
    Missing #interrupt-cells in interrupt-parent /soc/system-controller@10040000

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5410.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 06713ec86f0d..e234219fe8f1 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -75,6 +75,9 @@
 			clock-names = "clkout16";
 			clocks = <&fin_pll>;
 			#clock-cells = <1>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
 		};
 
 		clock: clock-controller@10010000 {
-- 
2.11.0
