From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v5 3/9] arm64: dts: exynos: Add SPI/PDMA dt node for Exynos5433
Date: Thu, 05 Mar 2015 14:38:25 +0900
Message-ID: <1425533911-14800-4-git-send-email-cw00.choi@samsung.com>
References: <1425533911-14800-1-git-send-email-cw00.choi@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1425533911-14800-1-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds SPI (Serial Peripheral Interface) dt node for Exynos5433 SoC.
SPI transfers serial data by using various peripherals. SPI includes
8-bit/16-bit/32-bit shift registers to transmit and receive data. PDMA is used
for SPI communication.

Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 114 +++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 9b96bdf..710566a 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -399,6 +399,35 @@
 			interrupts = <1 9 0xf04>;
 		};
 
+		amba {
+			compatible = "arm,amba-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			pdma0: pdma@15610000 {
+				compatible = "arm,pl330", "arm,primecell";
+				reg = <0x15610000 0x1000>;
+				interrupts = <0 228 0>;
+				clocks = <&cmu_fsys CLK_PDMA0>;
+				clock-names = "apb_pclk";
+				#dma-cells = <1>;
+				#dma-channels = <8>;
+				#dma-requests = <32>;
+			};
+
+			pdma1: pdma@15600000 {
+				compatible = "arm,pl330", "arm,primecell";
+				reg = <0x15600000 0x1000>;
+				interrupts = <0 246 0>;
+				clocks = <&cmu_fsys CLK_PDMA1>;
+				clock-names = "apb_pclk";
+				#dma-cells = <1>;
+				#dma-channels = <8>;
+				#dma-requests = <32>;
+			};
+		};
+
 		serial_0: serial@14c10000 {
 			compatible = "samsung,exynos5433-uart";
 			reg = <0x14c10000 0x100>;
@@ -499,6 +528,91 @@
 			interrupts = <0 442 0>;
 		};
 
+		spi_0: spi@14d20000 {
+			compatible = "samsung,exynos7-spi";
+			reg = <0x14d20000 0x100>;
+			interrupts = <0 432 0>;
+			dmas = <&pdma0 9>, <&pdma0 8>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cmu_peric CLK_PCLK_SPI0>,
+				 <&cmu_top CLK_SCLK_SPI0_PERIC>;
+			clock-names = "spi", "spi_busclk0";
+			samsung,spi-src-clk = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi0_bus>;
+			status = "disabled";
+		};
+
+		spi_1: spi@14d30000 {
+			compatible = "samsung,exynos7-spi";
+			reg = <0x14d30000 0x100>;
+			interrupts = <0 433 0>;
+			dmas = <&pdma0 11>, <&pdma0 10>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cmu_peric CLK_PCLK_SPI1>,
+				 <&cmu_top CLK_SCLK_SPI1_PERIC>;
+			clock-names = "spi", "spi_busclk0";
+			samsung,spi-src-clk = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi1_bus>;
+			status = "disabled";
+		};
+
+		spi_2: spi@14d40000 {
+			compatible = "samsung,exynos7-spi";
+			reg = <0x14d40000 0x100>;
+			interrupts = <0 434 0>;
+			dmas = <&pdma0 13>, <&pdma0 12>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cmu_peric CLK_PCLK_SPI2>,
+				 <&cmu_top CLK_SCLK_SPI2_PERIC>;
+			clock-names = "spi", "spi_busclk0";
+			samsung,spi-src-clk = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi2_bus>;
+			status = "disabled";
+		};
+
+		spi_3: spi@14d50000 {
+			compatible = "samsung,exynos7-spi";
+			reg = <0x14d50000 0x100>;
+			interrupts = <0 447 0>;
+			dmas = <&pdma0 23>, <&pdma0 22>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cmu_peric CLK_PCLK_SPI3>,
+				 <&cmu_top CLK_SCLK_SPI3_PERIC>;
+			clock-names = "spi", "spi_busclk0";
+			samsung,spi-src-clk = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi3_bus>;
+			status = "disabled";
+		};
+
+		spi_4: spi@14d00000 {
+			compatible = "samsung,exynos7-spi";
+			reg = <0x14d00000 0x100>;
+			interrupts = <0 412 0>;
+			dmas = <&pdma0 25>, <&pdma0 24>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cmu_peric CLK_PCLK_SPI4>,
+				 <&cmu_top CLK_SCLK_SPI4_PERIC>;
+			clock-names = "spi", "spi_busclk0";
+			samsung,spi-src-clk = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi4_bus>;
+			status = "disabled";
+		};
+
 		hsi2c_0: hsi2c@14e40000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14e40000 0x1000>;
-- 
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
