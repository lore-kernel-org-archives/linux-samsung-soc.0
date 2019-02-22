From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH] ARM: dts: exynos: Add pin configuration for read strobe for Odroid XU3/XU4 eMMC
Date: Fri, 22 Feb 2019 10:19:48 +0000
Message-ID: <20190222101948.848-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Add Read Strobe RDQS pin configuration for eMMC to support higher data rate read/write.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi          | 6 ++++++
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
index b82af7c89654..4fb3865e082a 100644
--- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
@@ -206,6 +206,12 @@
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
 	};
 
+	sd0_rdqs: sd0-rdqs {
+		samsung,pins = "gpc0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
 	sd1_clk: sd1-clk {
 		samsung,pins = "gpc1-0";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index b299e541cac0..d41397748ed2 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -411,7 +411,7 @@
 	samsung,dw-mshc-hs400-timing = <0 2>;
 	samsung,read-strobe-delay = <90>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8 &sd0_cd &sd0_rclk>;
+	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_rdqs &sd0_bus1 &sd0_bus4 &sd0_bus8 &sd0_cd &sd0_rclk>;
 	bus-width = <8>;
 	cap-mmc-highspeed;
 	mmc-hs200-1_8v;
-- 
2.20.1
