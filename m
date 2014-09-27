From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 2/2] arm: dts: exynos3250: add device node support for serial2
 and serial3
Date: Sat, 27 Sep 2014 10:28:48 +0530
Message-ID: <1411793928-32692-3-git-send-email-pankaj.dubey@samsung.com>
References: <1411793928-32692-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56607 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751156AbaI0FDp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 27 Sep 2014 01:03:45 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCJ00I5XNE81TD0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 27 Sep 2014 14:03:44 +0900 (KST)
In-reply-to: <1411793928-32692-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, robh+dt@kernel.org, linux@arm.linux.org.uk, naushad@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi |   21 +++++++++++++++++++++
 arch/arm/boot/dts/exynos3250.dtsi         |   24 ++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-pinctrl.dtsi b/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
index 47b92c1..9887bba 100644
--- a/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
@@ -97,6 +97,27 @@
 		samsung,pin-drv = <0>;
 	};
 
+	uart2_data: uart2-data {
+		samsung,pins = "gpa1-0", "gpa1-1";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
+	uart2_fctl: uart2-fctl {
+		samsung,pins = "gpa1-2", "gpa1-3";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
+	uart3_data: uart3-data {
+		samsung,pins = "gpa1-4", "gpa1-5";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
 	i2c2_bus: i2c2-bus {
 		samsung,pins = "gpa0-6", "gpa0-7";
 		samsung,pin-function = <3>;
diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 9de1252..aaeb321 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -41,6 +41,8 @@
 		i2c7 = &i2c_7;
 		serial0 = &serial_0;
 		serial1 = &serial_1;
+		serial2 = &serial_2;
+		serial3 = &serial_3;
 	};
 
 	cpus {
@@ -346,6 +348,28 @@
 			status = "disabled";
 		};
 
+		serial_2: serial@13820000 {
+			compatible = "samsung,exynos4210-uart";
+			reg = <0x13820000 0x100>;
+			interrupts = <0 111 0>;
+			clocks = <&cmu CLK_UART2>, <&cmu CLK_SCLK_UART2>;
+			clock-names = "uart", "clk_uart_baud0";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart2_data &uart2_fctl>;
+			status = "disabled";
+		};
+
+		serial_3: serial@13830000 {
+			compatible = "samsung,exynos4210-uart";
+			reg = <0x13830000 0x100>;
+			interrupts = <0 112 0>;
+			clocks = <&cmu CLK_UART3>, <&cmu CLK_SCLK_UART3>;
+			clock-names = "uart", "clk_uart_baud0";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart3_data>;
+			status = "disabled";
+		};
+
 		i2c_0: i2c@13860000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
1.7.9.5
