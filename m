From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/5] ARM: dts: Leave Exynos5250 SPI controller disabled by default
Date: Tue,  8 Oct 2013 12:20:06 +0100
Message-ID: <1381231209-9273-2-git-send-email-broonie@kernel.org>
References: <1381231209-9273-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:52046 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752050Ab3JHLUp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Oct 2013 07:20:45 -0400
In-Reply-To: <1381231209-9273-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Rather than requiring each board to explicitly disable the SPI controllers
it is not using instead require boards to enable those that they are using.
This is less work overall since normally at most one of the controllers is
in use and avoids issues caused by inappropriate pinmuxing.

Signed-off-by: Mark Brown <broonie@linaro.org>
Acked-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/cros5250-common.dtsi    |  9 +--------
 arch/arm/boot/dts/exynos5250-arndale.dts  | 12 ------------
 arch/arm/boot/dts/exynos5250-smdk5250.dts | 10 ++--------
 arch/arm/boot/dts/exynos5250.dtsi         |  3 +++
 4 files changed, 6 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
index dc259e8b..0fcca29 100644
--- a/arch/arm/boot/dts/cros5250-common.dtsi
+++ b/arch/arm/boot/dts/cros5250-common.dtsi
@@ -286,19 +286,12 @@
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
index 4687fa0..1141939 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -416,18 +416,6 @@
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
index f86d567..67d3c43 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -184,11 +184,9 @@
 		status = "disabled";
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
@@ -214,10 +212,6 @@
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
index c863113..a886ee4 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -344,6 +344,7 @@
 
 	spi_0: spi@12d20000 {
 		compatible = "samsung,exynos4210-spi";
+		status = "disabled";
 		reg = <0x12d20000 0x100>;
 		interrupts = <0 66 0>;
 		dmas = <&pdma0 5
@@ -359,6 +360,7 @@
 
 	spi_1: spi@12d30000 {
 		compatible = "samsung,exynos4210-spi";
+		status = "disabled";
 		reg = <0x12d30000 0x100>;
 		interrupts = <0 67 0>;
 		dmas = <&pdma1 5
@@ -374,6 +376,7 @@
 
 	spi_2: spi@12d40000 {
 		compatible = "samsung,exynos4210-spi";
+		status = "disabled";
 		reg = <0x12d40000 0x100>;
 		interrupts = <0 68 0>;
 		dmas = <&pdma0 7
-- 
1.8.4.rc3
