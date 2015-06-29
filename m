From: Robert Baldyga <r.baldyga@samsung.com>
Subject: [PATCH] ARM: dts: exynos4: add DMA support for serial ports
Date: Mon, 29 Jun 2015 15:22:34 +0200
Message-ID: <1435584154-4969-1-git-send-email-r.baldyga@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56249 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752644AbbF2NWz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jun 2015 09:22:55 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux@arm.linux.org.uk, kgene@kernel.org
Cc: k.kozlowski@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, Robert Baldyga <r.baldyga@samsung.com>

Enable DMA transfers for serial ports.

Signed-off-by: Robert Baldyga <r.baldyga@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index e20cdc2..21b839b 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -426,6 +426,8 @@
 		interrupts = <0 52 0>;
 		clocks = <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
 		clock-names = "uart", "clk_uart_baud0";
+		dmas = <&pdma0 15>, <&pdma0 16>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -435,6 +437,8 @@
 		interrupts = <0 53 0>;
 		clocks = <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
 		clock-names = "uart", "clk_uart_baud0";
+		dmas = <&pdma1 15>, <&pdma1 16>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -444,6 +448,8 @@
 		interrupts = <0 54 0>;
 		clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
 		clock-names = "uart", "clk_uart_baud0";
+		dmas = <&pdma0 17>, <&pdma0 18>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -453,6 +459,8 @@
 		interrupts = <0 55 0>;
 		clocks = <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
 		clock-names = "uart", "clk_uart_baud0";
+		dmas = <&pdma1 17>, <&pdma1 18>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
-- 
1.9.1
