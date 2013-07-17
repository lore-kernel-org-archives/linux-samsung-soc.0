From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/4] ARM: dts: Hook up IRQ for PMIC on Arndale
Date: Wed, 17 Jul 2013 13:17:25 +0100
Message-ID: <1374063448-20517-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:54775 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753499Ab3GQMRh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Jul 2013 08:17:37 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

The out of tree code configures a pullup on the line indicating that it
is an active low interrupt.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index abc7272..dab40ae 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 #include "exynos5250.dtsi"
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Insignal Arndale evaluation board based on EXYNOS5250";
@@ -37,6 +38,8 @@
 		s5m8767_pmic@66 {
 			compatible = "samsung,s5m8767-pmic";
 			reg = <0x66>;
+			interrupt-parent = <&gpx3>;
+			interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 
 			s5m8767,pmic-buck2-dvs-voltage = <1300000>;
 			s5m8767,pmic-buck3-dvs-voltage = <1100000>;
-- 
1.8.3.2
