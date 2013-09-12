From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] ARM: dts: Leave Exynos5250 SPI controller disabled by default
Date: Thu, 12 Sep 2013 11:40:26 +0100
Message-ID: <1378982427-5802-2-git-send-email-broonie@kernel.org>
References: <1378982427-5802-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:42045 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750901Ab3ILKlB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 06:41:01 -0400
In-Reply-To: <1378982427-5802-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@vger.kernel.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Rather than requiring each board to explicitly disable the SPI controllers
it is not using instead require boards to enable those that they are using.
This is less work overall since normally at most one of the controllers is
in use and avoids issues caused by inappropriate pinmuxing.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts | 10 ++--------
 arch/arm/boot/dts/exynos5250.dtsi         |  3 +++
 2 files changed, 5 insertions(+), 8 deletions(-)

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
