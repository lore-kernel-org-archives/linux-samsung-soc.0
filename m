From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 3/3] ARM: dts: Add missing pinctrl for uart0/1 for Exynos3250
Date: Tue, 29 Jul 2014 11:17:12 +0900
Message-ID: <1406600232-31033-4-git-send-email-cw00.choi@samsung.com>
References: <1406600232-31033-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1406600232-31033-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: kgene.kim@samsung.com
Cc: t.figa@samsung.com, ben-linux@fluff.org, linux@arm.linux.org.uk, kyungmin.park@samsung.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch add missing pinctrl for uart0/1 for Exynos3250. The gpio pin (
uart0_data, uart0_fctl, uart1_data) is only used for UART IP.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 5043178..abd6eb3 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -284,6 +284,8 @@
 			interrupts = <0 109 0>;
 			clocks = <&cmu CLK_UART0>, <&cmu CLK_SCLK_UART0>;
 			clock-names = "uart", "clk_uart_baud0";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_data &uart0_fctl>;
 			status = "disabled";
 		};
 
@@ -293,6 +295,8 @@
 			interrupts = <0 110 0>;
 			clocks = <&cmu CLK_UART1>, <&cmu CLK_SCLK_UART1>;
 			clock-names = "uart", "clk_uart_baud0";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart1_data>;
 			status = "disabled";
 		};
 
-- 
1.8.0

