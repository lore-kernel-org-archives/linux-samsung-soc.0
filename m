From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/2] ARM: dts: exynos: split phandle in dmas property
Date: Fri, 20 Sep 2019 14:14:30 +0200
Message-ID: <20190920121431.31678-1-m.szyprowski@samsung.com>
References: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
        <CGME20190920121525eucas1p27562c205c41200221540b720c9084fb4@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc: Maciej Falkowski <m.falkowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Maciej Falkowski <m.falkowski@samsung.com>

Change representation of phandle array as then
dt-schema counts number of its items properly.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 14 +++++++-------
 arch/arm/boot/dts/exynos5410.dtsi |  6 +++---
 arch/arm/boot/dts/exynos5420.dtsi | 14 +++++++-------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index fc966c10cf49..44fdaad68f7c 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -586,9 +586,9 @@
 			compatible = "samsung,s5pv210-i2s";
 			status = "disabled";
 			reg = <0x03830000 0x100>;
-			dmas = <&pdma0 10
-				&pdma0 9
-				&pdma0 8>;
+			dmas = <&pdma0 10>,
+				<&pdma0 9>,
+				<&pdma0 8>;
 			dma-names = "tx", "rx", "tx-sec";
 			clocks = <&clock_audss EXYNOS_I2S_BUS>,
 				<&clock_audss EXYNOS_I2S_BUS>,
@@ -606,8 +606,8 @@
 			compatible = "samsung,s3c6410-i2s";
 			status = "disabled";
 			reg = <0x12D60000 0x100>;
-			dmas = <&pdma1 12
-				&pdma1 11>;
+			dmas = <&pdma1 12>,
+				<&pdma1 11>;
 			dma-names = "tx", "rx";
 			clocks = <&clock CLK_I2S1>, <&clock CLK_DIV_I2S1>;
 			clock-names = "iis", "i2s_opclk0";
@@ -621,8 +621,8 @@
 			compatible = "samsung,s3c6410-i2s";
 			status = "disabled";
 			reg = <0x12D70000 0x100>;
-			dmas = <&pdma0 12
-				&pdma0 11>;
+			dmas = <&pdma0 12>,
+				<&pdma0 11>;
 			dma-names = "tx", "rx";
 			clocks = <&clock CLK_I2S2>, <&clock CLK_DIV_I2S2>;
 			clock-names = "iis", "i2s_opclk0";
diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index e6f78b1cee7c..a4b03d4c3de5 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -222,9 +222,9 @@
 		audi2s0: i2s@3830000 {
 			compatible = "samsung,exynos5420-i2s";
 			reg = <0x03830000 0x100>;
-			dmas = <&pdma0 10
-				&pdma0 9
-				&pdma0 8>;
+			dmas = <&pdma0 10>,
+				<&pdma0 9>,
+				<&pdma0 8>;
 			dma-names = "tx", "rx", "tx-sec";
 			clocks = <&clock_audss EXYNOS_I2S_BUS>,
 				<&clock_audss EXYNOS_I2S_BUS>,
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 7d51e0f4ab79..2c131ad78c09 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -434,9 +434,9 @@
 		i2s0: i2s@3830000 {
 			compatible = "samsung,exynos5420-i2s";
 			reg = <0x03830000 0x100>;
-			dmas = <&adma 0
-				&adma 2
-				&adma 1>;
+			dmas = <&adma 0>,
+				<&adma 2>,
+				<&adma 1>;
 			dma-names = "tx", "rx", "tx-sec";
 			clocks = <&clock_audss EXYNOS_I2S_BUS>,
 				<&clock_audss EXYNOS_I2S_BUS>,
@@ -455,8 +455,8 @@
 		i2s1: i2s@12d60000 {
 			compatible = "samsung,exynos5420-i2s";
 			reg = <0x12D60000 0x100>;
-			dmas = <&pdma1 12
-				&pdma1 11>;
+			dmas = <&pdma1 12>,
+				<&pdma1 11>;
 			dma-names = "tx", "rx";
 			clocks = <&clock CLK_I2S1>, <&clock CLK_SCLK_I2S1>;
 			clock-names = "iis", "i2s_opclk0";
@@ -471,8 +471,8 @@
 		i2s2: i2s@12d70000 {
 			compatible = "samsung,exynos5420-i2s";
 			reg = <0x12D70000 0x100>;
-			dmas = <&pdma0 12
-				&pdma0 11>;
+			dmas = <&pdma0 12>,
+				<&pdma0 11>;
 			dma-names = "tx", "rx";
 			clocks = <&clock CLK_I2S2>, <&clock CLK_SCLK_I2S2>;
 			clock-names = "iis", "i2s_opclk0";
-- 
2.17.1
