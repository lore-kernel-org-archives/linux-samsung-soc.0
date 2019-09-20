From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/2] arm64: dts: exynos: split phandle in dmas property
Date: Fri, 20 Sep 2019 14:14:31 +0200
Message-ID: <20190920121431.31678-2-m.szyprowski@samsung.com>
References: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
        <20190920121431.31678-1-m.szyprowski@samsung.com>
        <CGME20190920121526eucas1p2e2165c088519094752066db49aa8ae51@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190920121431.31678-1-m.szyprowski@samsung.com>
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
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index ba66ea906f60..ba1800c6aaf1 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1452,7 +1452,7 @@
 		i2s1: i2s@14d60000 {
 			compatible = "samsung,exynos7-i2s";
 			reg = <0x14d60000 0x100>;
-			dmas = <&pdma0 31 &pdma0 30>;
+			dmas = <&pdma0 31>, <&pdma0 30>;
 			dma-names = "tx", "rx";
 			interrupts = <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peric CLK_PCLK_I2S1>,
@@ -1811,7 +1811,7 @@
 			i2s0: i2s@11440000 {
 				compatible = "samsung,exynos7-i2s";
 				reg = <0x11440000 0x100>;
-				dmas = <&adma 0 &adma 2>;
+				dmas = <&adma 0>, <&adma 2>;
 				dma-names = "tx", "rx";
 				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
-- 
2.17.1
