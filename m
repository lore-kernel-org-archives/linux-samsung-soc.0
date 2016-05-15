From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v4 04/22] ARM: dts: exynos: Re-order alphabetically Exynos5420 SD0/SD1 pinctrl nodes
Date: Sun, 15 May 2016 22:13:45 +0200
Message-ID: <1463343243-26429-5-git-send-email-krzk@kernel.org>
References: <1463343243-26429-1-git-send-email-krzk@kernel.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1463343243-26429-1-git-send-email-krzk@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

The 'sd0_rclk' was put in the middle of SD1 nodes. Remove the confusion.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
index 130563b2ca95..14beb7e07323 100644
--- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
@@ -193,17 +193,17 @@
 		samsung,pin-drv = <3>;
 	};
 
-	sd1_clk: sd1-clk {
-		samsung,pins = "gpc1-0";
+	sd0_rclk: sd0-rclk {
+		samsung,pins = "gpc0-7";
 		samsung,pin-function = <2>;
-		samsung,pin-pud = <0>;
+		samsung,pin-pud = <1>;
 		samsung,pin-drv = <3>;
 	};
 
-	sd0_rclk: sd0-rclk {
-		samsung,pins = "gpc0-7";
+	sd1_clk: sd1-clk {
+		samsung,pins = "gpc1-0";
 		samsung,pin-function = <2>;
-		samsung,pin-pud = <1>;
+		samsung,pin-pud = <0>;
 		samsung,pin-drv = <3>;
 	};
 
-- 
2.5.0

