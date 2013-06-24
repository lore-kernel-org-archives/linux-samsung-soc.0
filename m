From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 4/8] ARM: dts: Use generic DMA bindings for Exynos4 SPI
 devices
Date: Mon, 24 Jun 2013 20:05:47 +0200
Message-ID: <1372097151-18122-5-git-send-email-s.nawrocki@samsung.com>
References: <1372097151-18122-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44089 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752433Ab3FXSGh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Jun 2013 14:06:37 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOW00G33SZ0VQK0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 Jun 2013 03:06:36 +0900 (KST)
In-reply-to: <1372097151-18122-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

The Exynos4 SPI controller uses the PL330 DMA controller which has
migrated to the generic DMA bindings since commit b5be04d35dbb2e00
"spi: s3c64xx: Modify SPI driver to use generic DMA DT support".
Use the generic bindings to specify the corresponding DMA to make
the SPI usable again on Exynos4x12 SOCs.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 3f94fe8..bce2254 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -297,8 +297,8 @@
 		compatible = "samsung,exynos4210-spi";
 		reg = <0x13920000 0x100>;
 		interrupts = <0 66 0>;
-		tx-dma-channel = <&pdma0 7>; /* preliminary */
-		rx-dma-channel = <&pdma0 6>; /* preliminary */
+		dmas = <&pdma0 7>, <&pdma0 6>;
+		dma-names = "tx", "rx";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		clocks = <&clock 327>, <&clock 159>;
@@ -312,8 +312,8 @@
 		compatible = "samsung,exynos4210-spi";
 		reg = <0x13930000 0x100>;
 		interrupts = <0 67 0>;
-		tx-dma-channel = <&pdma1 7>; /* preliminary */
-		rx-dma-channel = <&pdma1 6>; /* preliminary */
+		dmas = <&pdma1 7>, <&pdma1 6>;
+		dma-names = "tx", "rx";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		clocks = <&clock 328>, <&clock 160>;
@@ -327,8 +327,8 @@
 		compatible = "samsung,exynos4210-spi";
 		reg = <0x13940000 0x100>;
 		interrupts = <0 68 0>;
-		tx-dma-channel = <&pdma0 9>; /* preliminary */
-		rx-dma-channel = <&pdma0 8>; /* preliminary */
+		dmas = <&pdma0 9>, <&pdma0 8>;
+		dma-names = "tx", "rx";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		clocks = <&clock 329>, <&clock 161>;
-- 
1.7.9.5
