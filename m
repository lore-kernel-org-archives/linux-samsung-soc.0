From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3] arm: dts: exynos: Enable DMA support for UART modules on
 Exynos5 SoCs
Date: Mon, 19 Dec 2016 11:00:48 +0100
Message-ID: <1482141648-21294-1-git-send-email-m.szyprowski@samsung.com>
References: <1481891940-10385-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33288 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932235AbcLSKBJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Dec 2016 05:01:09 -0500
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OIF01NGLFTJ1K30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Dec 2016 19:01:07 +0900 (KST)
In-reply-to: <1481891940-10385-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

UART modules can use DMA for offloading data transfers and reducing
interrupts, so enable this feature for Exynos5 boards. Tested on
Google ChromeBook Snow (Exynos5250), Odroid XU (Exynos5410) and Odroid
XU3 (Exynos5422) boards.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v3:
- added Exynos5410
- fixed serial 1/2 again, in v2 they were incorrectly swaped as a result
  of my hurry in patch posting

v2:
- added Exynos5250
- fixed copy/paste typo for serial 2 and 3
---
 arch/arm/boot/dts/exynos5250.dtsi | 8 ++++++++
 arch/arm/boot/dts/exynos5410.dtsi | 8 ++++++++
 arch/arm/boot/dts/exynos5420.dtsi | 8 ++++++++
 3 files changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index b6d7444..0e04460 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -1043,21 +1043,29 @@
 &serial_0 {
 	clocks = <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
 	clock-names = "uart", "clk_uart_baud0";
+	dmas = <&pdma0 13>, <&pdma0 14>;
+	dma-names = "rx", "tx";
 };
 
 &serial_1 {
 	clocks = <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
 	clock-names = "uart", "clk_uart_baud0";
+	dmas = <&pdma1 15>, <&pdma1 16>;
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
+	dmas = <&pdma1 17>, <&pdma1 18>;
+	dma-names = "rx", "tx";
 };
 
 #include "exynos5250-pinctrl.dtsi"
diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 2b6adaf..7eab4bc 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -340,21 +340,29 @@
 &serial_0 {
 	clocks = <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
 	clock-names = "uart", "clk_uart_baud0";
+	dmas = <&pdma0 13>, <&pdma0 14>;
+	dma-names = "rx", "tx";
 };
 
 &serial_1 {
 	clocks = <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
 	clock-names = "uart", "clk_uart_baud0";
+	dmas = <&pdma1 15>, <&pdma1 16>;
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
+	dmas = <&pdma1 17>, <&pdma1 18>;
+	dma-names = "rx", "tx";
 };
 
 &sss {
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 906a1a4..0154c2e 100644
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
+	dmas = <&pdma1 15>, <&pdma1 16>;
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
+	dmas = <&pdma1 17>, <&pdma1 18>;
+	dma-names = "rx", "tx";
 };
 
 &sss {
-- 
1.9.1
