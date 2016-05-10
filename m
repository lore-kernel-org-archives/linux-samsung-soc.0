From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 06/27] ARM: dts: exynos: Remove old fixed-clock provider on SMDK5410
Date: Tue, 10 May 2016 22:09:09 +0200
Message-ID: <1462910970-1812-7-git-send-email-krzk@kernel.org>
References: <1462910970-1812-1-git-send-email-krzk@kernel.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1462910970-1812-1-git-send-email-krzk@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

All "fin_pll" clock users were switched to the new one, provided by
Exynos5410 clock driver. Remove old DT node.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
 arch/arm/boot/dts/exynos5410-smdk5410.dts | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5410-smdk5410.dts b/arch/arm/boot/dts/exynos5410-smdk5410.dts
index d7d658deeff4..377a679b454b 100644
--- a/arch/arm/boot/dts/exynos5410-smdk5410.dts
+++ b/arch/arm/boot/dts/exynos5410-smdk5410.dts
@@ -24,13 +24,6 @@
 		bootargs = "console=ttySAC2,115200";
 	};
 
-	fin_pll: xxti {
-		compatible = "fixed-clock";
-		clock-frequency = <24000000>;
-		clock-output-names = "fin_pll";
-		#clock-cells = <0>;
-	};
-
 	fixed-rate-clocks {
 		oscclk {
 			compatible = "samsung,exynos5420-oscclk";
-- 
2.5.0

