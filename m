From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT] ARM: dts: exynos: Fix invalid GIC interrupt flags in audio block of Exynos5410
Date: Fri, 18 Nov 2016 14:59:24 +0200
Message-ID: <1479473964-9085-1-git-send-email-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:32862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752452AbcKRM7l (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 07:59:41 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

Recently added audio block of Exynos5410 missed global fixup of GIC
interrupt flags.  Interrupt of type IRQ_TYPE_NONE is not allowed for GIC
interrupts so use level high.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5410.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index bb90bbdbe2d9..2b6adafe18e2 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -203,7 +203,7 @@
 			pdma0: pdma@12680000 {
 				compatible = "arm,pl330", "arm,primecell";
 				reg = <0x121A0000 0x1000>;
-				interrupts = <GIC_SPI 34 IRQ_TYPE_NONE>;
+				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clock CLK_PDMA0>;
 				clock-names = "apb_pclk";
 				#dma-cells = <1>;
@@ -214,7 +214,7 @@
 			pdma1: pdma@12690000 {
 				compatible = "arm,pl330", "arm,primecell";
 				reg = <0x121B0000 0x1000>;
-				interrupts = <GIC_SPI 35 IRQ_TYPE_NONE>;
+				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clock CLK_PDMA1>;
 				clock-names = "apb_pclk";
 				#dma-cells = <1>;
-- 
2.7.4
