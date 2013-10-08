From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 5/5] ARM: dts: Add CODEC MCLK for SMDK5250
Date: Tue,  8 Oct 2013 12:20:09 +0100
Message-ID: <1381231209-9273-5-git-send-email-broonie@kernel.org>
References: <1381231209-9273-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:52042 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751958Ab3JHLUp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Oct 2013 07:20:45 -0400
In-Reply-To: <1381231209-9273-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

There is a 16.934MHz fixed rate clock connected to MCLK1 on the CODEC, add
this to the device tree bindings.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index f594dd7..51078e2 100644
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
@@ -258,5 +261,11 @@
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
1.8.4.rc3
