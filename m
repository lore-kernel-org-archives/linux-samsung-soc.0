From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 05/22] ARM: dts: exynos: Switch MCT node to a new fin_pll clock
Date: Sun,  8 May 2016 21:05:50 +0200
Message-ID: <1462734367-5619-6-git-send-email-krzk@kernel.org>
References: <1462734367-5619-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462734367-5619-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

The clk-exynos5410 driver now provides the "fin_pll" external fixed
clock. Switch the Multi-Core Timer to this clock.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5410.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 7a56aec2c5ba..233149abfb62 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -125,7 +125,7 @@
 			interrupts = <0>, <1>, <2>, <3>,
 				<4>, <5>, <6>, <7>,
 				<8>, <9>, <10>, <11>;
-			clocks = <&fin_pll>, <&clock CLK_MCT>;
+			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
 			clock-names = "fin_pll", "mct";
 
 			interrupt_map: interrupt-map {
-- 
2.5.0
