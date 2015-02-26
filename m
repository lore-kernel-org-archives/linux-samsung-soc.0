From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 1/3] ARM: dts: Mux XMMCnDATA[0] pad correctly for Exynos5420 boards.
Date: Thu, 26 Feb 2015 16:49:34 +0100
Message-ID: <1424965776-4381-2-git-send-email-javier.martinez@collabora.co.uk>
References: <1424965776-4381-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424965776-4381-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Tushar Behera <tushar.b@samsung.com>, Kevin Hilman <khilman@linaro.org>, Andreas Faerber <afaerber@suse.de>, Tyler Baker <tyler.baker@linaro.org>, Steve Capper <steve.capper@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

The Exynos5420 SoC has 3 sets of 8 pads used as data lines for the 3
MMC/SD/SDIO slots. These needs to be muxed as SD_n_DATA instead of a
GPIO or external interrupt to allow the MMC controller to communicate
with the attached cards or SDIO devices.

Which data lines needs to be muxed as SD_n_DATA depends on the bus
width used for data transfer:

* bus-width = <1> needs SD_n_DATA[0]
* bus-width = <4> needs SD_n_DATA[0-3]
* bus-width = <8> needs SD_n_DATA[0-7]

The Exynos5250-pinctrl.dtsi file that defines the groups of pins has
SD_n_DATA[0] muxed for both sdn_bus1 and sdn_bus4 so just one of them
needs to be included in the device node's pinctrl property.

But Exynos5420-pinctrl has a different definition and only includes
SD_n_DATA[1-3] for sdn_bus4. So for a bus-width = <4>, both sdn_bus1
and sdn_bus4 have to be in the dev pinctrl to mux all the needed pads.

It seems all Exynos5420 boards had just cargo cult the pinctrl lines
assuming that sdn_bus4 also included SD_n_DATA[0] and it only works
because the bootloader muxes the pads correctly. But that is not the
case for the devices not used by the bootloader such as WiFi modules.

Add sdn_bus1 too in the nodes pinctrl to not rely on the bootloader.

Suggested-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 4 ++--
 arch/arm/boot/dts/exynos5420-peach-pit.dts    | 4 ++--
 arch/arm/boot/dts/exynos5420-smdk5420.dts     | 4 ++--
 arch/arm/boot/dts/exynos5422-odroidxu3.dts    | 4 ++--
 arch/arm/boot/dts/exynos5800-peach-pi.dts     | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index db2c1c4cd900..b82b6fa15f48 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -55,7 +55,7 @@
 		samsung,dw-mshc-sdr-timing = <0 4>;
 		samsung,dw-mshc-ddr-timing = <0 2>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
+		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
 		vmmc-supply = <&ldo10_reg>;
 		bus-width = <8>;
 		cap-mmc-highspeed;
@@ -68,7 +68,7 @@
 		samsung,dw-mshc-sdr-timing = <2 3>;
 		samsung,dw-mshc-ddr-timing = <1 2>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
+		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus1 &sd2_bus4>;
 		vmmc-supply = <&ldo19_reg>;
 		vqmmc-supply = <&ldo13_reg>;
 		bus-width = <4>;
diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index ec86d9523935..c4db5aed8a8c 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -687,7 +687,7 @@
 	samsung,dw-mshc-sdr-timing = <0 4>;
 	samsung,dw-mshc-ddr-timing = <0 2>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
+	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
 	bus-width = <8>;
 };
 
@@ -701,7 +701,7 @@
 	samsung,dw-mshc-sdr-timing = <2 3>;
 	samsung,dw-mshc-ddr-timing = <1 2>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus1 &sd2_bus4>;
 	bus-width = <4>;
 };
 
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 8be3d7b489ff..7a56852efada 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -81,7 +81,7 @@
 		samsung,dw-mshc-sdr-timing = <0 4>;
 		samsung,dw-mshc-ddr-timing = <0 2>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
+		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
 		bus-width = <8>;
 		cap-mmc-highspeed;
 	};
@@ -93,7 +93,7 @@
 		samsung,dw-mshc-sdr-timing = <2 3>;
 		samsung,dw-mshc-ddr-timing = <1 2>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
+		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus1 &sd2_bus4>;
 		bus-width = <4>;
 		cap-sd-highspeed;
 	};
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index 790fb4ce295d..edc25cf1d717 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -312,7 +312,7 @@
 	samsung,dw-mshc-sdr-timing = <0 4>;
 	samsung,dw-mshc-ddr-timing = <0 2>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
+	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
 	bus-width = <8>;
 	cap-mmc-highspeed;
 };
@@ -324,7 +324,7 @@
 	samsung,dw-mshc-sdr-timing = <0 4>;
 	samsung,dw-mshc-ddr-timing = <0 2>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus1 &sd2_bus4>;
 	bus-width = <4>;
 	cap-sd-highspeed;
 };
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 06737c60d333..ca73fb2d2da5 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -649,7 +649,7 @@
 	samsung,dw-mshc-sdr-timing = <0 4>;
 	samsung,dw-mshc-ddr-timing = <0 2>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
+	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
 	bus-width = <8>;
 };
 
@@ -663,7 +663,7 @@
 	samsung,dw-mshc-sdr-timing = <2 3>;
 	samsung,dw-mshc-ddr-timing = <1 2>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus1 &sd2_bus4>;
 	bus-width = <4>;
 };
 
-- 
2.1.3
