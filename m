From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH v4 5/8] ARM: dts: Use labels for overriding nodes in exynos542x
Date: Sun, 17 May 2015 17:26:12 +0900
Message-ID: <1431851175-32624-6-git-send-email-k.kozlowski.k@gmail.com>
References: <1431851175-32624-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:32991 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752586AbbEQI0n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 May 2015 04:26:43 -0400
In-Reply-To: <1431851175-32624-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Usage of labels instead of full paths reduces possible mistakes when
overriding nodes. Additionally remove duplicated serial and uart labels
for serial.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts |  2 +-
 arch/arm/boot/dts/exynos5420.dtsi          | 82 +++++++++++++++---------------
 arch/arm/boot/dts/exynos5800-peach-pi.dts  |  2 +-
 3 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 146e71118a72..8f4d76c5e11c 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -1027,7 +1027,7 @@
 	};
 };
 
-&uart_3 {
+&serial_3 {
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index db6cd6302667..487d2176605f 100644
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
@@ -505,26 +498,6 @@
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
@@ -540,14 +513,6 @@
 		#phy-cells = <0>;
 	};
 
-	dp: dp-controller@145B0000 {
-		clocks = <&clock CLK_DP1>;
-		clock-names = "dp";
-		phys = <&dp_phy>;
-		phy-names = "dp";
-		power-domains = <&disp_pd>;
-	};
-
 	mipi_phy: video-phy@10040714 {
 		compatible = "samsung,s5pv210-mipi-video-phy";
 		syscon = <&pmu_system_controller>;
@@ -567,12 +532,6 @@
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
@@ -972,3 +931,44 @@
 		samsung,pmureg-phandle = <&pmu_system_controller>;
 	};
 };
+
+&dp {
+	clocks = <&clock CLK_DP1>;
+	clock-names = "dp";
+	phys = <&dp_phy>;
+	phy-names = "dp";
+	power-domains = <&disp_pd>;
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
index 02eb8b15374f..7d5b386b5ae6 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -990,7 +990,7 @@
 	};
 };
 
-&uart_3 {
+&serial_3 {
 	status = "okay";
 };
 
-- 
2.1.4
