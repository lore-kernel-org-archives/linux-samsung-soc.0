From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [PATCH] ARM: dts: exynos-5422-odroid: Remove always_on for eMMC and
 SD regulators
Date: Fri, 1 Apr 2016 16:45:35 +0200
Message-ID: <56FE898F.4050404@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:38101 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752118AbcDAOpp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Apr 2016 10:45:45 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Allow these suplies to be switched off if not used.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
---
Tested with eMMC only on XU4.
SD still needs testing.
---
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index a761d3f..6f2f364 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -141,7 +141,6 @@
                                regulator-name = "vddq_mmc0";
                                regulator-min-microvolt = <1800000>;
                                regulator-max-microvolt = <1800000>;
-                               regulator-always-on;
                        };
 
                        ldo5_reg: LDO5 {
@@ -204,7 +203,6 @@
                                regulator-name = "vddq_mmc2";
                                regulator-min-microvolt = <2800000>;
                                regulator-max-microvolt = <2800000>;
-                               regulator-always-on;
                        };
 
                        ldo15_reg: LDO15 {
@@ -232,14 +230,12 @@
                                regulator-name = "vdd_emmc_1V8";
                                regulator-min-microvolt = <1800000>;
                                regulator-max-microvolt = <1800000>;
-                               regulator-always-on;
                        };
 
                        ldo19_reg: LDO19 {
                                regulator-name = "vdd_sd";
                                regulator-min-microvolt = <2800000>;
                                regulator-max-microvolt = <2800000>;
-                               regulator-always-on;
                        };
 
                        ldo24_reg: LDO24 {
-- 
2.1.4
