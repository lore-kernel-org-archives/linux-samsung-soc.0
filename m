From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [PATCH] ARM: dts: exynos: Enable SPI on 4412 based odroid-X and -X2
 boards.
Date: Thu, 24 Nov 2016 15:13:21 +0100
Message-ID: <5ffdcde0-547f-3da6-2371-c0b0cab69b6b@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:39860 "EHLO
        wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965062AbcKXONb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Nov 2016 09:13:31 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Odroid-X and -X2 have SPI_1 routed to an external connector.
Enable SPI_1 on X and -X2.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
---
Tested on X, U3.
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 8 ++++++++
 arch/arm/boot/dts/exynos4412-odroidu3.dts       | 7 -------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 7dc1009..c919405 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -559,6 +559,14 @@
 	status = "okay";
 };
 
+&spi_1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_bus>;
+	num-cs = <1>;
+	cs-gpios = <&gpb 5 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
 &tmu {
 	vtmu-supply = <&ldo10_reg>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index fc14da5..4bd215f 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -124,10 +124,3 @@
 		"Speakers", "SPKL",
 		"Speakers", "SPKR";
 };
-
-&spi_1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&spi1_bus>;
-	cs-gpios = <&gpb 5 GPIO_ACTIVE_HIGH>;
-	status = "okay";
-};
-- 
2.1.4
