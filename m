From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ARM: dts: Add CODEC MCLK for SMDK5250
Date: Wed, 11 Dec 2013 21:39:38 +0000
Message-ID: <1386797978-12394-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:50463 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750873Ab3LKVjt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Dec 2013 16:39:49 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

There is a 16.934MHz fixed rate clock connected to MCLK1 on the CODEC, add
this to the device tree bindings.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index aaacfc833ccc..00b57faf977e 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -79,6 +79,9 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 
+			clocks = <&codec_mclk>;
+			clock-names = "MCLK1";
+
 			AVDD2-supply = <&vdd>;
 			CPVDD-supply = <&vdd>;
 			DBVDD-supply = <&dbvdd>;
@@ -250,5 +253,11 @@
 			compatible = "samsung,clock-xxti";
 			clock-frequency = <24000000>;
 		};
+
+		codec_mclk: codec-mclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <16934000>;
+		};
 	};
 };
-- 
1.8.5.1
