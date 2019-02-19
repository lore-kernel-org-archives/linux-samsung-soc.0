From: Stuart Menefy <stuart.menefy@mathembedded.com>
Subject: [PATCH v2 1/4] ARM: dts: exynos: Use bustop PLL as the source for MMC clocks on Exynos5260
Date: Tue, 19 Feb 2019 13:03:34 +0000
Message-ID: <20190219130337.21353-2-stuart@menefy.org>
References: <20190219130337.21353-1-stuart@menefy.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219130337.21353-1-stuart@menefy.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Stuart Menefy <stuart.menefy@mathembedded.com>

By default the MMC clock will be derived from mediatop PLL, which
usually runs at 666MHz. However as most SD and MMC clocks are multiples
or fractions of 100MHz, it makes more sense to use the bustop PLL
which runs at 800MHz. This matches the behaviour of the Samsung vendor
supplied 3.4 kernel.

Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
---
 arch/arm/boot/dts/exynos5260.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5260.dtsi b/arch/arm/boot/dts/exynos5260.dtsi
index 55167850619c..14b423de9137 100644
--- a/arch/arm/boot/dts/exynos5260.dtsi
+++ b/arch/arm/boot/dts/exynos5260.dtsi
@@ -288,6 +288,14 @@
 			#size-cells = <0>;
 			clocks = <&clock_fsys FSYS_CLK_MMC0>, <&clock_top TOP_SCLK_MMC0>;
 			clock-names = "biu", "ciu";
+			assigned-clocks =
+				<&clock_top TOP_MOUT_SCLK_FSYS_MMC0_SDCLKIN_A>,
+				<&clock_top TOP_MOUT_SCLK_FSYS_MMC0_SDCLKIN_B>,
+				<&clock_top TOP_SCLK_MMC0>;
+			assigned-clock-parents =
+				<&clock_top TOP_MOUT_BUSTOP_PLL_USER>,
+				<&clock_top TOP_MOUT_SCLK_FSYS_MMC0_SDCLKIN_A>;
+			assigned-clock-rates = <0>, <0>, <800000000>;
 			fifo-depth = <64>;
 			status = "disabled";
 		};
@@ -300,6 +308,14 @@
 			#size-cells = <0>;
 			clocks = <&clock_fsys FSYS_CLK_MMC1>, <&clock_top TOP_SCLK_MMC1>;
 			clock-names = "biu", "ciu";
+			assigned-clocks =
+				<&clock_top TOP_MOUT_SCLK_FSYS_MMC1_SDCLKIN_A>,
+				<&clock_top TOP_MOUT_SCLK_FSYS_MMC1_SDCLKIN_B>,
+				<&clock_top TOP_SCLK_MMC1>;
+			assigned-clock-parents =
+				<&clock_top TOP_MOUT_BUSTOP_PLL_USER>,
+				<&clock_top TOP_MOUT_SCLK_FSYS_MMC1_SDCLKIN_A>;
+			assigned-clock-rates = <0>, <0>, <800000000>;
 			fifo-depth = <64>;
 			status = "disabled";
 		};
@@ -312,6 +328,14 @@
 			#size-cells = <0>;
 			clocks = <&clock_fsys FSYS_CLK_MMC2>, <&clock_top TOP_SCLK_MMC2>;
 			clock-names = "biu", "ciu";
+			assigned-clocks =
+				<&clock_top TOP_MOUT_SCLK_FSYS_MMC2_SDCLKIN_A>,
+				<&clock_top TOP_MOUT_SCLK_FSYS_MMC2_SDCLKIN_B>,
+				<&clock_top TOP_SCLK_MMC2>;
+			assigned-clock-parents =
+				<&clock_top TOP_MOUT_BUSTOP_PLL_USER>,
+				<&clock_top TOP_MOUT_SCLK_FSYS_MMC2_SDCLKIN_A>;
+			assigned-clock-rates = <0>, <0>, <800000000>;
 			fifo-depth = <64>;
 			status = "disabled";
 		};
-- 
2.13.6
