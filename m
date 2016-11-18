From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [PATCH] [V2] ARM: dts: exynos: Add ADCs on 4412 and 5422 based odroid
 boards.
Date: Fri, 18 Nov 2016 10:55:04 +0100
Message-ID: <26f50ea7-9737-23dd-7d3c-92f5b4002860@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:46452 "EHLO
        wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751613AbcKRJzN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 04:55:13 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Odroid-X, -X2, -XU3 and -XU4 have SOC-ADC routed to an external connector.
Enable the ADC for use as iio-device.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
---
Changes in V2:
	move ADC node from exynos4412-odroid-common.dtsi to
	exynos4412-odroidx.dts to exclude U3 as pointed to by Marek.

Tested on U3, X, XU3 and XU4.
---
 arch/arm/boot/dts/exynos4412-odroidx.dts           |  5 +++++
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 61906b3..153a75f 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -64,6 +64,11 @@
 	};
 };
 
+&adc {
+	vdd-supply = <&ldo10_reg>;
+	status = "okay";
+};
+
 /* VDDQ for MSHC (eMMC card) */
 &buck8_reg {
 	regulator-name = "BUCK8_VDDQ_MMC4_2.8V";
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 246d298..9e63328 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -147,6 +147,11 @@
 	};
 };
 
+&adc {
+	vdd-supply = <&ldo4_reg>;
+	status = "okay";
+};
+
 &bus_wcore {
 	devfreq-events = <&nocp_mem0_0>, <&nocp_mem0_1>,
 			<&nocp_mem1_0>, <&nocp_mem1_1>;
@@ -293,6 +298,12 @@
 				regulator-max-microvolt = <1800000>;
 			};
 
+			ldo4_reg: LDO4 {
+				regulator-name = "vdd_adc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
 			ldo5_reg: LDO5 {
 				regulator-name = "vdd_ldo5";
 				regulator-min-microvolt = <1800000>;
-- 
2.1.4
