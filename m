From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 09/10] ARM: dts: exynos: Fix invalid GIC interrupt flags in exynos5260
Date: Fri, 16 Sep 2016 21:42:50 +0200
Message-ID: <1474054971-16831-10-git-send-email-krzk@kernel.org>
References: <1474054971-16831-1-git-send-email-krzk@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474054971-16831-1-git-send-email-krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alban Browaeys <alban.browaeys-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Interrupt of type IRQ_TYPE_NONE is not allowed for GIC interrupts and
generates an error:
	genirq: Setting trigger mode 0 for irq 16 failed (gic_set_type+0x0/0x68)

The GIC requires shared interrupts to be edge rising or level high.
Platform declares support for both.  Choose level high everywhere.

Reported-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reported-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Reported-by: Alban Browaeys <alban.browaeys-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/exynos5260.dtsi | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5260.dtsi b/arch/arm/boot/dts/exynos5260.dtsi
index a86a4898d077..b0848a3d3d88 100644
--- a/arch/arm/boot/dts/exynos5260.dtsi
+++ b/arch/arm/boot/dts/exynos5260.dtsi
@@ -10,6 +10,7 @@
 */
 
 #include <dt-bindings/clock/exynos5260-clk.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	compatible = "samsung,exynos5260", "samsung,exynos5";
@@ -181,10 +182,18 @@
 			reg = <0x100B0000 0x1000>;
 			clocks = <&fin_pll>, <&clock_peri PERI_CLK_MCT>;
 			clock-names = "fin_pll", "mct";
-			interrupts = <0 104 0>, <0 105 0>, <0 106 0>,
-					<0 107 0>, <0 122 0>, <0 123 0>,
-					<0 124 0>, <0 125 0>, <0 126 0>,
-					<0 127 0>, <0 128 0>, <0 129 0>;
+			interrupts = <0 104 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 105 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 106 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 107 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 122 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 127 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 129 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		cci: cci@10F00000 {
@@ -210,25 +219,25 @@
 		pinctrl_0: pinctrl@11600000 {
 			compatible = "samsung,exynos5260-pinctrl";
 			reg = <0x11600000 0x1000>;
-			interrupts = <0 79 0>;
+			interrupts = <0 79 IRQ_TYPE_LEVEL_HIGH>;
 
 			wakeup-interrupt-controller {
 				compatible = "samsung,exynos4210-wakeup-eint";
 				interrupt-parent = <&gic>;
-				interrupts = <0 32 0>;
+				interrupts = <0 32 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
 		pinctrl_1: pinctrl@12290000 {
 			compatible = "samsung,exynos5260-pinctrl";
 			reg = <0x12290000 0x1000>;
-			interrupts = <0 157 0>;
+			interrupts = <0 157 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pinctrl_2: pinctrl@128B0000 {
 			compatible = "samsung,exynos5260-pinctrl";
 			reg = <0x128B0000 0x1000>;
-			interrupts = <0 243 0>;
+			interrupts = <0 243 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pmu_system_controller: system-controller@10D50000 {
@@ -239,7 +248,7 @@
 		uart0: serial@12C00000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x12C00000 0x100>;
-			interrupts = <0 146 0>;
+			interrupts = <0 146 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock_peri PERI_CLK_UART0>, <&clock_peri PERI_SCLK_UART0>;
 			clock-names = "uart", "clk_uart_baud0";
 			status = "disabled";
@@ -248,7 +257,7 @@
 		uart1: serial@12C10000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x12C10000 0x100>;
-			interrupts = <0 147 0>;
+			interrupts = <0 147 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock_peri PERI_CLK_UART1>, <&clock_peri PERI_SCLK_UART1>;
 			clock-names = "uart", "clk_uart_baud0";
 			status = "disabled";
@@ -257,7 +266,7 @@
 		uart2: serial@12C20000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x12C20000 0x100>;
-			interrupts = <0 148 0>;
+			interrupts = <0 148 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock_peri PERI_CLK_UART2>, <&clock_peri PERI_SCLK_UART2>;
 			clock-names = "uart", "clk_uart_baud0";
 			status = "disabled";
@@ -266,7 +275,7 @@
 		uart3: serial@12860000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x12860000 0x100>;
-			interrupts = <0 145 0>;
+			interrupts = <0 145 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock_aud AUD_CLK_AUD_UART>, <&clock_aud AUD_SCLK_AUD_UART>;
 			clock-names = "uart", "clk_uart_baud0";
 			status = "disabled";
@@ -275,7 +284,7 @@
 		mmc_0: mmc@12140000 {
 			compatible = "samsung,exynos5250-dw-mshc";
 			reg = <0x12140000 0x2000>;
-			interrupts = <0 156 0>;
+			interrupts = <0 156 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clock_fsys FSYS_CLK_MMC0>, <&clock_top TOP_SCLK_MMC0>;
@@ -287,7 +296,7 @@
 		mmc_1: mmc@12150000 {
 			compatible = "samsung,exynos5250-dw-mshc";
 			reg = <0x12150000 0x2000>;
-			interrupts = <0 158 0>;
+			interrupts = <0 158 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clock_fsys FSYS_CLK_MMC1>, <&clock_top TOP_SCLK_MMC1>;
@@ -299,7 +308,7 @@
 		mmc_2: mmc@12160000 {
 			compatible = "samsung,exynos5250-dw-mshc";
 			reg = <0x12160000 0x2000>;
-			interrupts = <0 159 0>;
+			interrupts = <0 159 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clock_fsys FSYS_CLK_MMC2>, <&clock_top TOP_SCLK_MMC2>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
