From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] arm: dts: exynos: Enable DMA support for UART modules on
 Exynos5 SoCs
Date: Fri, 16 Dec 2016 13:39:00 +0100
Message-ID: <1481891940-10385-1-git-send-email-m.szyprowski@samsung.com>
References: <1481891254-7992-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49907 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759775AbcLPMjO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Dec 2016 07:39:14 -0500
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OIA01VAZ35AE200@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Dec 2016 21:39:12 +0900 (KST)
In-reply-to: <1481891254-7992-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

UART modules can use DMA for offloading data transfers and reducing
interrupts, so enable this feature for Exynos5 boards. Tested on
Google ChromeBook Snow (Exynos5250) and Odroid XU3 (Exynos5422) boards.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- added Exynos5250
- fixed copy/paste typo for serial 2 and 3
---
 arch/arm/boot/dts/exynos5250.dtsi | 8 ++++++++
 arch/arm/boot/dts/exynos5420.dtsi | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 255b7c891d59..fc7ae8e557cc 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -1047,21 +1047,29 @@
 &serial_0 {
 	clocks = <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
 	clock-names = "uart", "clk_uart_baud0";
+	dmas = <&pdma0 13>, <&pdma0 14>;
+	dma-names = "rx", "tx";
 };
 
 &serial_1 {
 	clocks = <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
 	clock-names = "uart", "clk_uart_baud0";
+	dmas = <&pdma0 15>, <&pdma0 16>;
+	dma-names = "rx", "tx";
 };
 
 &serial_2 {
 	clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
 	clock-names = "uart", "clk_uart_baud0";
+	dmas = <&pdma1 15>, <&pdma1 16>;
+	dma-names = "rx", "tx";
 };
 
 &serial_3 {
 	clocks = <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
 	clock-names = "uart", "clk_uart_baud0";
+	dmas = <&pdma1 17>, <&pdma1 18>;
+	dma-names = "rx", "tx";
 };
 
 #include "exynos5250-pinctrl.dtsi"
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index bb90326e53d2..f5468bbe8f13 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1422,21 +1422,29 @@
 &serial_0 {
 	clocks = <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
 	clock-names = "uart", "clk_uart_baud0";
+	dmas = <&pdma0 13>, <&pdma0 14>;
+	dma-names = "rx", "tx";
 };
 
 &serial_1 {
 	clocks = <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
 	clock-names = "uart", "clk_uart_baud0";
+	dmas = <&pdma0 15>, <&pdma0 16>;
+	dma-names = "rx", "tx";
 };
 
 &serial_2 {
 	clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
 	clock-names = "uart", "clk_uart_baud0";
+	dmas = <&pdma1 15>, <&pdma1 16>;
+	dma-names = "rx", "tx";
 };
 
 &serial_3 {
 	clocks = <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
 	clock-names = "uart", "clk_uart_baud0";
+	dmas = <&pdma1 17>, <&pdma1 18>;
+	dma-names = "rx", "tx";
 };
 
 &sss {
-- 
1.9.1
