From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Enable DMA support for UART modules on
 Exynos542x SoCs
Date: Fri, 16 Dec 2016 13:27:34 +0100
Message-ID: <1481891254-7992-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41467 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756602AbcLPM1s (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Dec 2016 07:27:48 -0500
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OIA01NEK2LT4L10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Dec 2016 21:27:46 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

UART modules can use DMA for offloading data transfers and reducing
interrupts, so enable this feature for Exynos542x boards. Tested on
Odroid XU3.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 906a1a4..99c9336 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1406,21 +1406,29 @@
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
+	dmas = <&pdma0 15>, <&pdma0 16>;
+	dma-names = "rx", "tx";
 };
 
 &serial_3 {
 	clocks = <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
 	clock-names = "uart", "clk_uart_baud0";
+	dmas = <&pdma0 17>, <&pdma0 18>;
+	dma-names = "rx", "tx";
 };
 
 &sss {
-- 
1.9.1
