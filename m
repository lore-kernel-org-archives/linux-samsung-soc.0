From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFC PATCH 03/12] ARM: dts: exynos: Re-order alphabetically Exynos5420 SD0/SD1 pinctrl nodes
Date: Tue,  3 May 2016 19:52:20 +0200
Message-ID: <1462297949-13824-4-git-send-email-krzk@kernel.org>
References: <1462297949-13824-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462297949-13824-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

The 'sd0_rclk' was put in the middle of SD1 nodes. Remove the confusion.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
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
