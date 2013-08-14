From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V2] ARM: dts: Add DMA controller node info on Exynos5420.
Date: Wed, 14 Aug 2013 17:34:22 +0530
Message-ID: <1376481862-9578-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50748 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759580Ab3HNMDO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 08:03:14 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: broonie@kernel.org, kgene.kim@samsung.com, vinod.koul@intel.com

This patch adds dma controller node info on Exynos5420.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---

Changes since V1:
	- In V1, dma node common stuff was added in common exynos5.dtsi file. 
	  This was removed as per Kukjin comment and added in exynos5420.dtsi.

This patch is dependent on audss clk controller patches that were
posted in the below link.
http://www.spinics.net/lists/linux-samsung-soc/msg20253.html

 arch/arm/boot/dts/exynos5420.dtsi |   63 +++++++++++++++++++++++++++++++++++++
 1 files changed, 63 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 9e90d1e..23cfea4 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -126,6 +126,69 @@
 		interrupts = <0 47 0>;
 	};
 
+	amba {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "arm,amba-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		pdma0: pdma@121A0000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x121A0000 0x1000>;
+			interrupts = <0 34 0>;
+			clocks = <&clock 362>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+			#dma-channels = <8>;
+			#dma-requests = <32>;
+		};
+
+		pdma1: pdma@121B0000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x121B0000 0x1000>;
+			interrupts = <0 35 0>;
+			clocks = <&clock 363>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+			#dma-channels = <8>;
+			#dma-requests = <32>;
+		};
+
+		mdma0: mdma@10800000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x10800000 0x1000>;
+			interrupts = <0 33 0>;
+			clocks = <&clock 473>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+			#dma-channels = <8>;
+			#dma-requests = <1>;
+		};
+
+		mdma1: mdma@11C10000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x11C10000 0x1000>;
+			interrupts = <0 124 0>;
+			clocks = <&clock 442>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+			#dma-channels = <8>;
+			#dma-requests = <1>;
+		};
+
+		adma: adma@03880000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x03880000 0x1000>;
+			interrupts = <0 110 0>;
+			clocks = <&clock_audss EXYNOS_ADMA>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+			#dma-channels = <6>;
+			#dma-requests = <16>;
+		};
+	};
+
 	serial@12C00000 {
 		clocks = <&clock 257>, <&clock 128>;
 		clock-names = "uart", "clk_uart_baud0";
-- 
1.7.4.4
