From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 2/7] ARM: dts: Use phandle notation for overriding nodes in Exynos5250
Date: Sun, 12 Apr 2015 21:24:49 +0900
Message-ID: <1428841494-20769-3-git-send-email-k.kozlowski.k@gmail.com>
References: <1428841494-20769-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428841494-20769-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

The phandle notation reduces possible mistakes when overriding nodes.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 82 +++++++++++++++++++--------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 77f656eb8e6b..4bd737ead680 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -241,13 +241,6 @@
 		clock-names = "mfc";
 	};
 
-	rtc: rtc@101E0000 {
-		clocks = <&clock CLK_RTC>;
-		clock-names = "rtc";
-		interrupt-parent = <&pmu_system_controller>;
-		status = "disabled";
-	};
-
 	tmu: tmu@10060000 {
 		compatible = "samsung,exynos5250-tmu";
 		reg = <0x10060000 0x100>;
@@ -276,26 +269,6 @@
 		};
 	};
 
-	serial@12C00000 {
-		clocks = <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
-		clock-names = "uart", "clk_uart_baud0";
-	};
-
-	serial@12C10000 {
-		clocks = <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
-		clock-names = "uart", "clk_uart_baud0";
-	};
-
-	serial@12C20000 {
-		clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
-		clock-names = "uart", "clk_uart_baud0";
-	};
-
-	serial@12C30000 {
-		clocks = <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
-		clock-names = "uart", "clk_uart_baud0";
-	};
-
 	sata: sata@122F0000 {
 		compatible = "snps,dwc-ahci";
 		samsung,sata-freq = <66>;
@@ -778,20 +751,6 @@
 		#phy-cells = <0>;
 	};
 
-	dp: dp-controller@145B0000 {
-		power-domains = <&pd_disp1>;
-		clocks = <&clock CLK_DP>;
-		clock-names = "dp";
-		phys = <&dp_phy>;
-		phy-names = "dp";
-	};
-
-	fimd: fimd@14400000 {
-		power-domains = <&pd_disp1>;
-		clocks = <&clock CLK_SCLK_FIMD1>, <&clock CLK_FIMD1>;
-		clock-names = "sclk_fimd", "fimd";
-	};
-
 	adc: adc@12D10000 {
 		compatible = "samsung,exynos-adc-v1";
 		reg = <0x12D10000 0x100>;
@@ -812,3 +771,44 @@
 		clock-names = "secss";
 	};
 };
+
+&dp {
+	power-domains = <&pd_disp1>;
+	clocks = <&clock CLK_DP>;
+	clock-names = "dp";
+	phys = <&dp_phy>;
+	phy-names = "dp";
+};
+
+&fimd {
+	power-domains = <&pd_disp1>;
+	clocks = <&clock CLK_SCLK_FIMD1>, <&clock CLK_FIMD1>;
+	clock-names = "sclk_fimd", "fimd";
+};
+
+&rtc {
+	clocks = <&clock CLK_RTC>;
+	clock-names = "rtc";
+	interrupt-parent = <&pmu_system_controller>;
+	status = "disabled";
+};
+
+&serial_0 {
+	clocks = <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
+	clock-names = "uart", "clk_uart_baud0";
+};
+
+&serial_1 {
+	clocks = <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
+	clock-names = "uart", "clk_uart_baud0";
+};
+
+&serial_2 {
+	clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
+	clock-names = "uart", "clk_uart_baud0";
+};
+
+&serial_3 {
+	clocks = <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
+	clock-names = "uart", "clk_uart_baud0";
+};
-- 
2.1.0
