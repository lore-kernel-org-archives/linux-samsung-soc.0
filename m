From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT 4/4] ARM: dts: exynos: Properly override node to use MDMA0 on Universal C210
Date: Mon, 15 Apr 2019 20:05:10 +0200
Message-ID: <20190415180510.6044-4-krzk@kernel.org>
References: <20190415180510.6044-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415180510.6044-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The Universal C210 (Exynos4210) uses the secure interface of MDMA0,
instead of regular one - non-secure MDMA1.  DTS was overriding MDMA1
node address which caused DTC W=1 warning:

    arch/arm/boot/dts/exynos4.dtsi:707.25-716.6:
        Warning (simple_bus_reg): /soc/amba/mdma@12850000: simple-bus unit address format error, expected "12840000"

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4.dtsi                  |  2 +-
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 1c21627e3c3c..36ccf227434d 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -675,7 +675,7 @@
 			status = "disabled";
 		};
 
-		amba {
+		amba: amba {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-bus";
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 07d64a8f82e3..bf092e97e14f 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -177,6 +177,20 @@
 	};
 };
 
+&amba {
+	mdma0: mdma@12840000 {
+		compatible = "arm,pl330", "arm,primecell";
+		reg = <0x12840000 0x1000>;
+		interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clock CLK_MDMA>;
+		clock-names = "apb_pclk";
+		#dma-cells = <1>;
+		#dma-channels = <8>;
+		#dma-requests = <1>;
+		power-domains = <&pd_lcd0>;
+	};
+};
+
 &camera {
 	status = "okay";
 
@@ -491,7 +505,8 @@
 };
 
 &mdma1 {
-	reg = <0x12840000 0x1000>;
+	/* Use the secure mdma0 */
+	status = "disabled";
 };
 
 &mixer {
-- 
2.17.1
