From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] ARM: dts: Leave Exynos5250 SPI controller disabled by default
Date: Tue, 10 Dec 2013 11:07:26 +0000
Message-ID: <1386673649-15181-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:46430 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751687Ab3LJLHs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Dec 2013 06:07:48 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Rather than requiring each board to explicitly disable the SPI controllers
it is not using instead require boards to enable those that they are using.
This is less work overall since normally at most one of the controllers is
in use and avoids issues caused by inappropriate pinmuxing.

Signed-off-by: Mark Brown <broonie@linaro.org>
Acked-by: Tomasz Figa <t.figa@samsung.com>
Reviewed-by: Doug Anderson <dianders@chromium.org>
---
 arch/arm/boot/dts/cros5250-common.dtsi    |  9 +--------
 arch/arm/boot/dts/exynos5250-arndale.dts  | 12 ------------
 arch/arm/boot/dts/exynos5250-smdk5250.dts | 10 ++--------
 arch/arm/boot/dts/exynos5250.dtsi         |  3 +++
 4 files changed, 6 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
index 42cef0a8ce95..d32ec0fb7f39 100644
--- a/arch/arm/boot/dts/cros5250-common.dtsi
+++ b/arch/arm/boot/dts/cros5250-common.dtsi
@@ -298,19 +298,12 @@
 		};
 	};
 
-	spi_0: spi@12d20000 {
-		status = "disabled";
-	};
-
 	spi_1: spi@12d30000 {
+		status = "okay";
 		samsung,spi-src-clk = <0>;
 		num-cs = <1>;
 	};
 
-	spi_2: spi@12d40000 {
-		status = "disabled";
-	};
-
 	hdmi {
 		hpd-gpio = <&gpx3 7 0>;
 	};
diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index b77a37ec81c2..de9508b100d9 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -426,18 +426,6 @@
 		status = "okay";
 	};
 
-	spi_0: spi@12d20000 {
-		status = "disabled";
-	};
-
-	spi_1: spi@12d30000 {
-		status = "disabled";
-	};
-
-	spi_2: spi@12d40000 {
-		status = "disabled";
-	};
-
 	gpio_keys {
 		compatible = "gpio-keys";
 
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 13746dfb20aa..87b55f0edda4 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -176,11 +176,9 @@
 		};
 	};
 
-	spi_0: spi@12d20000 {
-		status = "disabled";
-	};
-
 	spi_1: spi@12d30000 {
+		status = "okay";
+
 		w25q80bw@0 {
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -206,10 +204,6 @@
 		};
 	};
 
-	spi_2: spi@12d40000 {
-		status = "disabled";
-	};
-
 	hdmi {
 		hpd-gpio = <&gpx3 7 0>;
 	};
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index b98ffc3a5fe2..9831b5650a05 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -349,6 +349,7 @@
 
 	spi_0: spi@12d20000 {
 		compatible = "samsung,exynos4210-spi";
+		status = "disabled";
 		reg = <0x12d20000 0x100>;
 		interrupts = <0 66 0>;
 		dmas = <&pdma0 5
@@ -364,6 +365,7 @@
 
 	spi_1: spi@12d30000 {
 		compatible = "samsung,exynos4210-spi";
+		status = "disabled";
 		reg = <0x12d30000 0x100>;
 		interrupts = <0 67 0>;
 		dmas = <&pdma1 5
@@ -379,6 +381,7 @@
 
 	spi_2: spi@12d40000 {
 		compatible = "samsung,exynos4210-spi";
+		status = "disabled";
 		reg = <0x12d40000 0x100>;
 		interrupts = <0 68 0>;
 		dmas = <&pdma0 7
-- 
1.8.5.1
