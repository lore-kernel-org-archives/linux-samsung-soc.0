From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 33/50] ARM: dts: exynos: set parent clocks to UARTs in
 Exynos5420
Date: Mon, 15 Jul 2019 14:44:00 +0200
Message-ID: <20190715124417.4787-34-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124501eucas1p17382ca9cead8bfe1dc938e6fb583b7c5@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Change the parents of UART clocks to the CPLL which has 666MHz.
The UARTs' dividers use /10 rate so they would have 66.6MHz.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 18c5273091bd..79f635043247 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1486,6 +1486,8 @@
 &serial_0 {
 	clocks = <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
 	clock-names = "uart", "clk_uart_baud0";
+	assigned-clocks = <&clock CLK_MOUT_UART0>;
+	assigned-clock-parents = <&clock CLK_MOUT_SCLK_CPLL>;
 	dmas = <&pdma0 13>, <&pdma0 14>;
 	dma-names = "rx", "tx";
 };
@@ -1493,6 +1495,8 @@
 &serial_1 {
 	clocks = <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
 	clock-names = "uart", "clk_uart_baud0";
+	assigned-clocks = <&clock CLK_MOUT_UART1>;
+	assigned-clock-parents = <&clock CLK_MOUT_SCLK_CPLL>;
 	dmas = <&pdma1 15>, <&pdma1 16>;
 	dma-names = "rx", "tx";
 };
@@ -1500,6 +1504,8 @@
 &serial_2 {
 	clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
 	clock-names = "uart", "clk_uart_baud0";
+	assigned-clocks = <&clock CLK_MOUT_UART2>;
+	assigned-clock-parents = <&clock CLK_MOUT_SCLK_CPLL>;
 	dmas = <&pdma0 15>, <&pdma0 16>;
 	dma-names = "rx", "tx";
 };
@@ -1507,6 +1513,8 @@
 &serial_3 {
 	clocks = <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
 	clock-names = "uart", "clk_uart_baud0";
+	assigned-clocks = <&clock CLK_MOUT_UART3>;
+	assigned-clock-parents = <&clock CLK_MOUT_SCLK_CPLL>;
 	dmas = <&pdma1 17>, <&pdma1 18>;
 	dma-names = "rx", "tx";
 };
-- 
2.17.1
