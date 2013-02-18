From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v6 15/16] ARM: dts: add clock provider information for all controllers in Exynos5440 SoC
Date: Mon, 18 Feb 2013 13:51:25 +0530
Message-ID: <1361175686-19400-16-git-send-email-thomas.abraham@linaro.org>
References: <1361175686-19400-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f47.google.com ([209.85.210.47]:60789 "EHLO
	mail-da0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756663Ab3BRIWt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Feb 2013 03:22:49 -0500
Received: by mail-da0-f47.google.com with SMTP id s35so2319389dak.20
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Feb 2013 00:22:48 -0800 (PST)
In-Reply-To: <1361175686-19400-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com

For all supported peripheral controllers on Exynos5440, add clock lookup
information.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos5440.dtsi |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index f5834d0..a54c4ab 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -65,12 +65,16 @@
 		compatible = "samsung,exynos4210-uart";
 		reg = <0xB0000 0x1000>;
 		interrupts = <0 2 0>;
+		clocks = <&clock 21>, <&clock 21>;
+		clock-names = "uart", "clk_uart_baud0";
 	};
 
 	serial@C0000 {
 		compatible = "samsung,exynos4210-uart";
 		reg = <0xC0000 0x1000>;
 		interrupts = <0 3 0>;
+		clocks = <&clock 21>, <&clock 21>;
+		clock-names = "uart", "clk_uart_baud0";
 	};
 
 	spi {
@@ -81,6 +85,8 @@
 		rx-dma-channel = <&pdma0 4>; /* preliminary */
 		#address-cells = <1>;
 		#size-cells = <0>;
+		clocks = <&clock 21>, <&clock 16>;
+		clock-names = "spi", "spi_busclk0";
 	};
 
 	pinctrl {
@@ -113,6 +119,8 @@
 		interrupts = <0 5 0>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		clocks = <&clock 21>;
+		clock-names = "i2c";
 	};
 
 	i2c@100000 {
@@ -121,12 +129,16 @@
 		interrupts = <0 6 0>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		clocks = <&clock 21>;
+		clock-names = "i2c";
 	};
 
 	watchdog {
 		compatible = "samsung,s3c2410-wdt";
 		reg = <0x110000 0x1000>;
 		interrupts = <0 1 0>;
+		clocks = <&clock 21>;
+		clock-names = "watchdog";
 	};
 
 	amba {
@@ -140,12 +152,16 @@
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x120000 0x1000>;
 			interrupts = <0 34 0>;
+			clocks = <&clock 21>;
+			clock-names = "apb_pclk";
 		};
 
 		pdma1: pdma@121B0000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x121000 0x1000>;
 			interrupts = <0 35 0>;
+			clocks = <&clock 21>;
+			clock-names = "apb_pclk";
 		};
 	};
 
@@ -153,5 +169,7 @@
 		compatible = "samsung,s3c6410-rtc";
 		reg = <0x130000 0x1000>;
 		interrupts = <0 17 0>, <0 16 0>;
+		clocks = <&clock 21>;
+		clock-names = "rtc";
 	};
 };
-- 
1.7.5.4
