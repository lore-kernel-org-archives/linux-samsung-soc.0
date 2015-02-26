From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 2/3] ARM: dts: Add WiFi module support for Peach boards
Date: Thu, 26 Feb 2015 16:49:35 +0100
Message-ID: <1424965776-4381-3-git-send-email-javier.martinez@collabora.co.uk>
References: <1424965776-4381-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424965776-4381-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Tushar Behera <tushar.b@samsung.com>, Kevin Hilman <khilman@linaro.org>, Andreas Faerber <afaerber@suse.de>, Tyler Baker <tyler.baker@linaro.org>, Steve Capper <steve.capper@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Peach Pit and Pi boards have a WiFi module that is always powered
but needs toggling an enable pin and ungating a 32kHz reference
clock as part of their power sequencing.

Add a dev node for the SDIO slot and a MMC power sequence provider.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 56 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 56 ++++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index c4db5aed8a8c..80db9137abdd 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -125,6 +125,13 @@
 			};
 		};
 	};
+
+	mmc1_pwrseq: mmc1_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpx0 0 GPIO_ACTIVE_LOW>; /* WIFI_EN */
+		clocks = <&max77802 MAX77802_CLK_32K_CP>;
+		clock-names = "ext_clock";
+	};
 };
 
 &adc {
@@ -691,6 +698,25 @@
 	bus-width = <8>;
 };
 
+&mmc_1 {
+	status = "okay";
+	num-slots = <1>;
+	broken-cd;
+	cap-sdio-irq;
+	card-detect-delay = <200>;
+	clock-frequency = <400000000>;
+	samsung,dw-mshc-ciu-div = <1>;
+	samsung,dw-mshc-sdr-timing = <0 1>;
+	samsung,dw-mshc-ddr-timing = <0 2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd1_clk>, <&sd1_cmd>, <&sd1_int>, <&sd1_bus1>,
+		    <&sd1_bus4>, <&sd1_bus8>, <&wifi_en>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	mmc-pwrseq = <&mmc1_pwrseq>;
+	vqmmc-supply = <&buck10_reg>;
+};
+
 &mmc_2 {
 	status = "okay";
 	num-slots = <1>;
@@ -710,6 +736,13 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&mask_tpm_reset>;
 
+	wifi_en: wifi-en {
+		samsung,pins = "gpx0-0";
+		samsung,pin-function = <1>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
 	max98090_irq: max98090-irq {
 		samsung,pins = "gpx0-2";
 		samsung,pin-function = <0>;
@@ -797,6 +830,29 @@
 	};
 };
 
+&pinctrl_1 {
+	/* Adjust WiFi drive strengths lower for EMI */
+	sd1_clk: sd1-clk {
+		samsung,pin-drv = <2>;
+	};
+
+	sd1_cmd: sd1-cmd {
+		samsung,pin-drv = <2>;
+	};
+
+	sd1_bus1: sd1-bus-width1 {
+		samsung,pin-drv = <2>;
+	};
+
+	sd1_bus4: sd1-bus-width4 {
+		samsung,pin-drv = <2>;
+	};
+
+	sd1_bus8: sd1-bus-width8 {
+		samsung,pin-drv = <2>;
+	};
+};
+
 &pinctrl_2 {
 	pmic_dvs_2: pmic-dvs-2 {
 		samsung,pins = "gpj4-2";
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index ca73fb2d2da5..9db2b5927821 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -119,6 +119,13 @@
 		power-supply = <&tps65090_fet6>;
 		backlight = <&backlight>;
 	};
+
+	mmc1_pwrseq: mmc1_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpx0 0 GPIO_ACTIVE_LOW>; /* WIFI_EN */
+		clocks = <&max77802 MAX77802_CLK_32K_CP>;
+		clock-names = "ext_clock";
+	};
 };
 
 &adc {
@@ -653,6 +660,25 @@
 	bus-width = <8>;
 };
 
+&mmc_1 {
+	status = "okay";
+	num-slots = <1>;
+	broken-cd;
+	cap-sdio-irq;
+	card-detect-delay = <200>;
+	clock-frequency = <400000000>;
+	samsung,dw-mshc-ciu-div = <1>;
+	samsung,dw-mshc-sdr-timing = <0 1>;
+	samsung,dw-mshc-ddr-timing = <0 2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd1_clk>, <&sd1_cmd>, <&sd1_int>, <&sd1_bus1>,
+		    <&sd1_bus4>, <&sd1_bus8>, <&wifi_en>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	mmc-pwrseq = <&mmc1_pwrseq>;
+	vqmmc-supply = <&buck10_reg>;
+};
+
 &mmc_2 {
 	status = "okay";
 	num-slots = <1>;
@@ -672,6 +698,13 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&mask_tpm_reset>;
 
+	wifi_en: wifi-en {
+		samsung,pins = "gpx0-0";
+		samsung,pin-function = <1>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
 	max98091_irq: max98091-irq {
 		samsung,pins = "gpx0-2";
 		samsung,pin-function = <0>;
@@ -759,6 +792,29 @@
 	};
 };
 
+&pinctrl_1 {
+	/* Adjust WiFi drive strengths lower for EMI */
+	sd1_clk: sd1-clk {
+		samsung,pin-drv = <2>;
+	};
+
+	sd1_cmd: sd1-cmd {
+		samsung,pin-drv = <2>;
+	};
+
+	sd1_bus1: sd1-bus-width1 {
+		samsung,pin-drv = <2>;
+	};
+
+	sd1_bus4: sd1-bus-width4 {
+		samsung,pin-drv = <2>;
+	};
+
+	sd1_bus8: sd1-bus-width8 {
+		samsung,pin-drv = <2>;
+	};
+};
+
 &pinctrl_2 {
 	pmic_dvs_2: pmic-dvs-2 {
 		samsung,pins = "gpj4-2";
-- 
2.1.3
