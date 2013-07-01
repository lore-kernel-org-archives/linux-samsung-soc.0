From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] ARM: dts: Add WM1811A audio CODEC to Arndale bindings
Date: Mon,  1 Jul 2013 22:36:39 +0100
Message-ID: <1372714599-17588-3-git-send-email-broonie@kernel.org>
References: <1372714599-17588-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:49458 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754998Ab3GAVhK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jul 2013 17:37:10 -0400
In-Reply-To: <1372714599-17588-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

The default audio module for the Arndale has a WM811A on it. Add this to
the device tree bindings.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 482f275..75c3065 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -325,7 +325,22 @@
 	};
 
 	i2c@12C90000 {
-		status = "disabled";
+		wm1811a@11 {
+			compatible = "wlf,wm1811";
+			reg = <0x1a>;
+
+			AVDD2-supply = <&main_dc_reg>;
+			CPVDD-supply = <&main_dc_reg>;
+			DBVDD1-supply = <&main_dc_reg>;
+			DBVDD2-supply = <&main_dc_reg>;
+			DBVDD3-supply = <&main_dc_reg>;
+			LDO1VDD-supply = <&main_dc_reg>;
+			SPKVDD1-supply = <&main_dc_reg>;
+			SPKVDD2-supply = <&main_dc_reg>;
+
+			wlf,ldo1ena = <&gpb0 0 0>;
+			wlf,ldo2ena = <&gpb0 1 0>;
+		};
 	};
 
 	i2c@12CA0000 {
-- 
1.8.3.1
