From: Simon Shields <simon@lineageos.org>
Subject: [PATCH v2 3/4] ARM: dts: add Samsung's exynos4412-based midas boards
Date: Thu, 14 Dec 2017 23:50:14 +1100
Message-ID: <20171214125015.2611-4-simon@lineageos.org>
References: <20171214125015.2611-1-simon@lineageos.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:42160 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752320AbdLNMvS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 07:51:18 -0500
In-Reply-To: <20171214125015.2611-1-simon@lineageos.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?q?Bart=C5=82omiej=20=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Simon Shields <simon@lineageos.org>

"midas" is the codename for a family of smartphones released by Samsung
Mobile. It includes the Galaxy S3 (GT-I9300/I9305) and the Galaxy
Note 2 (GT-N7100/N7105). The boards largely have the same peripherals:
the main differences are touchscreen, display panel and cellular modem.

Signed-off-by: Simon Shields <simon@lineageos.org>
---
 arch/arm/boot/dts/Makefile          |  3 +++
 arch/arm/boot/dts/exynos4412-m0.dts | 14 +++++++++++
 arch/arm/boot/dts/exynos4412-m3.dts | 19 ++++++++++++++
 arch/arm/boot/dts/exynos4412-t0.dts | 50 +++++++++++++++++++++++++++++++++++++
 4 files changed, 86 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos4412-m0.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-m3.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-t0.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d0381e9caf21..b7efaeba78cb 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -164,11 +164,14 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
 	exynos4210-trats.dtb \
 	exynos4210-universal_c210.dtb \
 	exynos4412-itop-elite.dtb \
+	exynos4412-m0.dtb \
+	exynos4412-m3.dtb \
 	exynos4412-odroidu3.dtb \
 	exynos4412-odroidx.dtb \
 	exynos4412-odroidx2.dtb \
 	exynos4412-origen.dtb \
 	exynos4412-smdk4412.dtb \
+	exynos4412-t0.dtb \
 	exynos4412-tiny4412.dtb \
 	exynos4412-trats2.dtb
 dtb-$(CONFIG_ARCH_EXYNOS5) += \
diff --git a/arch/arm/boot/dts/exynos4412-m0.dts b/arch/arm/boot/dts/exynos4412-m0.dts
new file mode 100644
index 000000000000..18aff81682a9
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4412-m0.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+#include "exynos4412-galaxy-s3.dtsi"
+
+/ {
+	compatible = "samsung,m0", "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
+	model = "Samsung M0 (GT-I9300) based on Exynos4412";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg =  <0x40000000 0x40000000>;
+	};
+};
+
diff --git a/arch/arm/boot/dts/exynos4412-m3.dts b/arch/arm/boot/dts/exynos4412-m3.dts
new file mode 100644
index 000000000000..fb8997b5fdb5
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4412-m3.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+#include "exynos4412-galaxy-s3.dtsi"
+
+/ {
+	compatible = "samsung,m3", "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
+	model = "Samsung M3 (GT-I9305) based on Exynos4412";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg =  <0x40000000 0x80000000>;
+	};
+};
+
+&i2c0_bus {
+	/* SCL and SDA pins are swapped */
+	samsung,pins = "gpd1-1", "gpd1-0";
+};
+
diff --git a/arch/arm/boot/dts/exynos4412-t0.dts b/arch/arm/boot/dts/exynos4412-t0.dts
new file mode 100644
index 000000000000..2d5117e6323b
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4412-t0.dts
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+#include "exynos4412-midas.dtsi"
+
+/ {
+	compatible = "samsung,t0", "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
+	model = "Samsung T0 (GT-N7100, GT-N7105) based on Exynos4412";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg =  <0x40000000 0x80000000>;
+	};
+};
+
+&buck9_reg {
+	maxim,ena-gpios = <&gpm1 0 GPIO_ACTIVE_HIGH>;
+};
+
+&cam_io_reg {
+	gpio = <&gpm0 7 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&cam_af_reg {
+	gpio = <&gpm1 1 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&ldo13_reg {
+	regulator-name = "VCC_1.8V_LCD";
+	regulator-min-microvolt = <18000000>;
+	regulator-max-microvolt = <18000000>;
+	regulator-always-on;
+	status = "okay";
+};
+
+&ldo23_reg {
+	regulator-always-on;
+};
+
+&ldo24_reg {
+	regulator-always-on;
+};
+
+&ldo25_reg {
+	regulator-name = "VCI_3.0V_LCD";
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	status = "okay";
+};
-- 
2.15.1
