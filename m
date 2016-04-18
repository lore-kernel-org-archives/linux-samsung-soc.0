From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Remove unsupported s2mps11 regulator
 bindings from Exynos5420 boards
Date: Mon, 18 Apr 2016 09:44:13 +0200
Message-ID: <1460965453-5337-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:30096 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751649AbcDRHon (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Apr 2016 03:44:43 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

The bindings like s2mps11,buck6-ramp-enable or s2mps11,buck2-ramp-delay
where ignored. They were never parse by s2mps11 regulator driver. Also
the values used in these bindings were equal to default reset values of
S2MPS11 device. It is safe to remove them.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      | 7 -------
 arch/arm/boot/dts/exynos5420-smdk5420.dts          | 7 -------
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 7 -------
 3 files changed, 21 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index a103ce8c3985..60bc861d0f9d 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -75,13 +75,6 @@
 	s2mps11_pmic@66 {
 		compatible = "samsung,s2mps11-pmic";
 		reg = <0x66>;
-		s2mps11,buck2-ramp-delay = <12>;
-		s2mps11,buck34-ramp-delay = <12>;
-		s2mps11,buck16-ramp-delay = <12>;
-		s2mps11,buck6-ramp-enable = <1>;
-		s2mps11,buck2-ramp-enable = <1>;
-		s2mps11,buck3-ramp-enable = <1>;
-		s2mps11,buck4-ramp-enable = <1>;
 
 		interrupt-parent = <&gpx3>;
 		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 49920b4330ed..2e748d19322f 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -140,13 +140,6 @@
 	s2mps11_pmic@66 {
 		compatible = "samsung,s2mps11-pmic";
 		reg = <0x66>;
-		s2mps11,buck2-ramp-delay = <12>;
-		s2mps11,buck34-ramp-delay = <12>;
-		s2mps11,buck16-ramp-delay = <12>;
-		s2mps11,buck6-ramp-enable = <1>;
-		s2mps11,buck2-ramp-enable = <1>;
-		s2mps11,buck3-ramp-enable = <1>;
-		s2mps11,buck4-ramp-enable = <1>;
 
 		s2mps11_osc: clocks {
 			#clock-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 0e71d4253205..20fa7612080d 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -92,13 +92,6 @@
 	s2mps11_pmic@66 {
 		compatible = "samsung,s2mps11-pmic";
 		reg = <0x66>;
-		s2mps11,buck2-ramp-delay = <12>;
-		s2mps11,buck34-ramp-delay = <12>;
-		s2mps11,buck16-ramp-delay = <12>;
-		s2mps11,buck6-ramp-enable = <1>;
-		s2mps11,buck2-ramp-enable = <1>;
-		s2mps11,buck3-ramp-enable = <1>;
-		s2mps11,buck4-ramp-enable = <1>;
 		samsung,s2mps11-acokb-ground;
 
 		interrupt-parent = <&gpx0>;
-- 
1.9.1
