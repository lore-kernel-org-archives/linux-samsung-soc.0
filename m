From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/4] ARM: dts: Put Arndale fixed voltage regulators on a simple-bus
Date: Wed, 17 Jul 2013 13:17:26 +0100
Message-ID: <1374063448-20517-2-git-send-email-broonie@kernel.org>
References: <1374063448-20517-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:54782 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753707Ab3GQMR6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Jul 2013 08:17:58 -0400
In-Reply-To: <1374063448-20517-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Fixed voltage regulators (and other similar free standing things) are
supposed to go on a simple-bus for DT correctness reasons.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index dab40ae..fa5969a 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -432,18 +432,24 @@
 		vdd-supply = <&ldo8_reg>;
 	};
 
-	mmc_reg: voltage-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_33ON_2.8V";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-		gpio = <&gpx1 1 1>;
-		enable-active-high;
-	};
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mmc_reg: voltage-regulator {
+			compatible = "regulator-fixed";
+			regulator-name = "VDD_33ON_2.8V";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			gpio = <&gpx1 1 1>;
+			enable-active-high;
+		};
 
-	reg_hdmi_en: fixedregulator@0 {
-		compatible = "regulator-fixed";
-		regulator-name = "hdmi-en";
+		reg_hdmi_en: fixedregulator@0 {
+			compatible = "regulator-fixed";
+			regulator-name = "hdmi-en";
+		};
 	};
 
 	fixed-rate-clocks {
-- 
1.8.3.2
