From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 5/9] ARM: dts: Add UART2 dt node for Exynos3250 SoC
Date: Thu, 31 Mar 2016 11:48:01 +0900
Message-ID: <1459392485-11327-6-git-send-email-cw00.choi@samsung.com>
References: <1459392485-11327-1-git-send-email-cw00.choi@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1459392485-11327-1-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

This patch add the uart2 devicetree node for Exynos3250 SoC.

Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi |  7 +++++++
 arch/arm/boot/dts/exynos3250.dtsi         | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-pinctrl.dtsi b/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
index ecf79386e891..54c587f27265 100644
--- a/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
@@ -158,6 +158,13 @@
 		samsung,pin-drv = <0>;
 	};
 
+	uart2_data: uart2-data {
+		samsung,pins = "gpa1-0", "gpa1-1";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
 	i2c3_bus: i2c3-bus {
 		samsung,pins = "gpa1-2", "gpa1-3";
 		samsung,pin-function = <3>;
diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 137f9015d4e8..030ce800f748 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -43,6 +43,7 @@
 		i2c7 = &i2c_7;
 		serial0 = &serial_0;
 		serial1 = &serial_1;
+		serial2 = &serial_2;
 	};
 
 	cpus {
@@ -452,6 +453,17 @@
 			status = "disabled";
 		};
 
+		serial_2: serial@13820000 {
+			compatible = "samsung,exynos4210-uart";
+			reg = <0x13820000 0x100>;
+			interrupts = <0 111 0>;
+			clocks = <&cmu CLK_UART2>, <&cmu CLK_SCLK_UART2>;
+			clock-names = "uart", "clk_uart_baud0";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart2_data>;
+			status = "disabled";
+		};
+
 		i2c_0: i2c@13860000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
