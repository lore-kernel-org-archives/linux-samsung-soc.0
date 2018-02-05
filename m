From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: exynos: Add I2S1 device node to
 exynos5433.dtsi
Date: Mon, 05 Feb 2018 18:21:09 +0100
Message-ID: <20180205172110.9897-1-s.nawrocki@samsung.com>
References: <CGME20180205172146epcas1p1cd7a5027e673fc17fb64d8841c47175a@epcas1p1.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jcsing.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add DT node for the second I2S controller available on Exynos 5433
SoC. While at it the i2s0 node name is changed to a more generic
"i2s" and missing properties are added to that node.

Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 62f276970174..2b73bd86bc56 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1311,6 +1311,25 @@
 			status = "disabled";
 		};
 
+		i2s1: i2s@14d60000 {
+			compatible = "samsung,exynos7-i2s";
+			reg = <0x14d60000 0x100>;
+			dmas = <&pdma0 31 &pdma0 30>;
+			dma-names = "tx", "rx";
+			interrupts = <GIC_SPI 435 IRQ_TYPE_NONE>;
+			clocks = <&cmu_peric CLK_PCLK_I2S1>,
+				 <&cmu_peric CLK_PCLK_I2S1>,
+				 <&cmu_peric CLK_SCLK_I2S1>;
+			clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+			#clock-cells = <1>;
+			samsung,supports-6ch;
+			samsung,supports-rstclr;
+			samsung,supports-tdm;
+			samsung,supports-low-rfs;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		pwm: pwm@14dd0000 {
 			compatible = "samsung,exynos4210-pwm";
 			reg = <0x14dd0000 0x100>;
@@ -1639,7 +1658,7 @@
 				power-domains = <&pd_aud>;
 			};
 
-			i2s0: i2s0@11440000 {
+			i2s0: i2s@11440000 {
 				compatible = "samsung,exynos7-i2s";
 				reg = <0x11440000 0x100>;
 				dmas = <&adma 0 &adma 2>;
@@ -1651,9 +1670,11 @@
 					<&cmu_aud CLK_SCLK_AUD_I2S>,
 					<&cmu_aud CLK_SCLK_I2S_BCLK>;
 				clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+				#clock-cells = <1>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&i2s0_bus>;
 				power-domains = <&pd_aud>;
+				#sound-dai-cells = <1>;
 				status = "disabled";
 			};
 
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
