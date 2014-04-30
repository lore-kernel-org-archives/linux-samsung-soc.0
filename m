From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v3 1/2] ARM: dts: Add node references to 5420
Date: Wed, 30 Apr 2014 16:38:57 +0530
Message-ID: <1398856138-18837-2-git-send-email-arun.kk@samsung.com>
References: <1398856138-18837-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:60135 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751271AbaD3LJh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Apr 2014 07:09:37 -0400
In-Reply-To: <1398856138-18837-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, olofj@google.com, t.figa@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org, arunkk.samsung@gmail.com

Adding references to nodes which do not have it yet
in exynos5420.dtsi. This is done so as to use reference
based node updation in board files.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index c3a9a66..2058276 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -125,7 +125,7 @@
 		clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in";
 	};
 
-	codec@11000000 {
+	codec: codec@11000000 {
 		compatible = "samsung,mfc-v7";
 		reg = <0x11000000 0x10000>;
 		interrupts = <0 96 0>;
@@ -169,7 +169,7 @@
 		status = "disabled";
 	};
 
-	mct@101C0000 {
+	mct: mct@101C0000 {
 		compatible = "samsung,exynos4210-mct";
 		reg = <0x101C0000 0x800>;
 		interrupt-controller;
@@ -270,7 +270,7 @@
 		interrupts = <0 47 0>;
 	};
 
-	rtc@101E0000 {
+	rtc: rtc@101E0000 {
 		clocks = <&clock CLK_RTC>;
 		clock-names = "rtc";
 		status = "disabled";
@@ -430,22 +430,22 @@
 		status = "disabled";
 	};
 
-	serial@12C00000 {
+	serial_0: serial@12C00000 {
 		clocks = <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
 		clock-names = "uart", "clk_uart_baud0";
 	};
 
-	serial@12C10000 {
+	serial_1: serial@12C10000 {
 		clocks = <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
 		clock-names = "uart", "clk_uart_baud0";
 	};
 
-	serial@12C20000 {
+	serial_2: serial@12C20000 {
 		clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
 		clock-names = "uart", "clk_uart_baud0";
 	};
 
-	serial@12C30000 {
+	serial_3: serial@12C30000 {
 		clocks = <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
 		clock-names = "uart", "clk_uart_baud0";
 	};
@@ -465,14 +465,14 @@
 		#phy-cells = <0>;
 	};
 
-	dp-controller@145B0000 {
+	dp: dp-controller@145B0000 {
 		clocks = <&clock CLK_DP1>;
 		clock-names = "dp";
 		phys = <&dp_phy>;
 		phy-names = "dp";
 	};
 
-	fimd@14400000 {
+	fimd: fimd@14400000 {
 		samsung,power-domain = <&disp_pd>;
 		clocks = <&clock CLK_SCLK_FIMD1>, <&clock CLK_FIMD1>;
 		clock-names = "sclk_fimd", "fimd";
@@ -632,7 +632,7 @@
 		status = "disabled";
 	};
 
-	hdmi@14530000 {
+	hdmi: hdmi@14530000 {
 		compatible = "samsung,exynos4212-hdmi";
 		reg = <0x14530000 0x70000>;
 		interrupts = <0 95 0>;
@@ -644,7 +644,7 @@
 		status = "disabled";
 	};
 
-	mixer@14450000 {
+	mixer: mixer@14450000 {
 		compatible = "samsung,exynos5420-mixer";
 		reg = <0x14450000 0x10000>;
 		interrupts = <0 94 0>;
@@ -715,7 +715,7 @@
 		clock-names = "tmu_apbif", "tmu_triminfo_apbif";
 	};
 
-        watchdog@101D0000 {
+        watchdog: watchdog@101D0000 {
 		compatible = "samsung,exynos5420-wdt";
 		reg = <0x101D0000 0x100>;
 		interrupts = <0 42 0>;
@@ -724,7 +724,7 @@
 		samsung,syscon-phandle = <&pmu_system_controller>;
         };
 
-	sss@10830000 {
+	sss: sss@10830000 {
 		compatible = "samsung,exynos4210-secss";
 		reg = <0x10830000 0x10000>;
 		interrupts = <0 112 0>;
-- 
1.7.9.5
