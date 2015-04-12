From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 5/7] ARM: dts: Use phandle notation for overriding nodes in Exynos5420
Date: Sun, 12 Apr 2015 21:24:52 +0900
Message-ID: <1428841494-20769-6-git-send-email-k.kozlowski.k@gmail.com>
References: <1428841494-20769-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428841494-20769-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

The phandle notation reduces possible mistakes when overriding nodes.
Additionally remove duplicated serial and uart labels for serial.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts |  2 +-
 arch/arm/boot/dts/exynos5420.dtsi          | 80 +++++++++++++++---------------
 arch/arm/boot/dts/exynos5800-peach-pi.dts  |  2 +-
 3 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 3f4e2feaa927..9d199ce01314 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -1024,7 +1024,7 @@
 	};
 };
 
-&uart_3 {
+&serial_3 {
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index c7a44ee0ce06..25228527294c 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -328,13 +328,6 @@
 		interrupts = <0 47 0>;
 	};
 
-	rtc: rtc@101E0000 {
-		clocks = <&clock CLK_RTC>;
-		clock-names = "rtc";
-		interrupt-parent = <&pmu_system_controller>;
-		status = "disabled";
-	};
-
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -496,26 +489,6 @@
 		status = "disabled";
 	};
 
-	uart_0: serial@12C00000 {
-		clocks = <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
-		clock-names = "uart", "clk_uart_baud0";
-	};
-
-	uart_1: serial@12C10000 {
-		clocks = <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
-		clock-names = "uart", "clk_uart_baud0";
-	};
-
-	uart_2: serial@12C20000 {
-		clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
-		clock-names = "uart", "clk_uart_baud0";
-	};
-
-	uart_3: serial@12C30000 {
-		clocks = <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
-		clock-names = "uart", "clk_uart_baud0";
-	};
-
 	pwm: pwm@12dd0000 {
 		compatible = "samsung,exynos4210-pwm";
 		reg = <0x12dd0000 0x100>;
@@ -531,13 +504,6 @@
 		#phy-cells = <0>;
 	};
 
-	dp: dp-controller@145B0000 {
-		clocks = <&clock CLK_DP1>;
-		clock-names = "dp";
-		phys = <&dp_phy>;
-		phy-names = "dp";
-	};
-
 	mipi_phy: video-phy@10040714 {
 		compatible = "samsung,s5pv210-mipi-video-phy";
 		reg = <0x10040714 12>;
@@ -557,12 +523,6 @@
 		status = "disabled";
 	};
 
-	fimd: fimd@14400000 {
-		clocks = <&clock CLK_SCLK_FIMD1>, <&clock CLK_FIMD1>;
-		clock-names = "sclk_fimd", "fimd";
-		power-domains = <&disp_pd>;
-	};
-
 	adc: adc@12D10000 {
 		compatible = "samsung,exynos-adc-v2";
 		reg = <0x12D10000 0x100>;
@@ -962,3 +922,43 @@
 		samsung,pmureg-phandle = <&pmu_system_controller>;
 	};
 };
+
+&dp {
+	clocks = <&clock CLK_DP1>;
+	clock-names = "dp";
+	phys = <&dp_phy>;
+	phy-names = "dp";
+};
+
+&fimd {
+	clocks = <&clock CLK_SCLK_FIMD1>, <&clock CLK_FIMD1>;
+	clock-names = "sclk_fimd", "fimd";
+	power-domains = <&disp_pd>;
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
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index c833bacf873b..9d26abd88dfd 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -986,7 +986,7 @@
 	};
 };
 
-&uart_3 {
+&serial_3 {
 	status = "okay";
 };
 
-- 
2.1.0
