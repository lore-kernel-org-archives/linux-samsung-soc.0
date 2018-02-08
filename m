From: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
Subject: [PATCH v5 3/4] ARM: dts: add Samsung's exynos4412-based midas boards
Date: Thu,  8 Feb 2018 11:01:36 +1100
Message-ID: <20180208000137.11264-4-simon@lineageos.org>
References: <20180208000137.11264-1-simon@lineageos.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180208000137.11264-1-simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?q?Bart=C5=82omiej=20=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

"midas" is the codename for a family of smartphones released by Samsung
Mobile. It includes the Galaxy S3 (GT-I9300/I9305) and the Galaxy
Note 2 (GT-N7100/N7105). The boards largely have the same peripherals:
the main differences are touchscreen, display panel and cellular modem.

Signed-off-by: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
---
 arch/arm/boot/dts/Makefile             |  3 ++
 arch/arm/boot/dts/exynos4412-i9300.dts | 22 +++++++++++++
 arch/arm/boot/dts/exynos4412-i9305.dts | 20 ++++++++++++
 arch/arm/boot/dts/exynos4412-n710x.dts | 57 ++++++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos4412-i9300.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-i9305.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-n710x.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 66e28af289da..955ef9df1b6b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -163,7 +163,10 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
 	exynos4210-smdkv310.dtb \
 	exynos4210-trats.dtb \
 	exynos4210-universal_c210.dtb \
+	exynos4412-i9300.dtb \
+	exynos4412-i9305.dtb \
 	exynos4412-itop-elite.dtb \
+	exynos4412-n710x.dtb \
 	exynos4412-odroidu3.dtb \
 	exynos4412-odroidx.dtb \
 	exynos4412-odroidx2.dtb \
diff --git a/arch/arm/boot/dts/exynos4412-i9300.dts b/arch/arm/boot/dts/exynos4412-i9300.dts
new file mode 100644
index 000000000000..f8125a945f8d
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4412-i9300.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung's Exynos4412 based M0 (GT-I9300) board device tree source
+ *
+ * Copyright (c) 2013 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ */
+
+/dts-v1/;
+#include "exynos4412-galaxy-s3.dtsi"
+
+/ {
+	model = "Samsung Galaxy S3 (GT-I9300) based on Exynos4412";
+	compatible = "samsung,i9300", "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
+
+	/* bootargs are passed in by bootloader */
+
+	memory@40000000 {
+		device_type = "memory";
+		reg =  <0x40000000 0x40000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/exynos4412-i9305.dts b/arch/arm/boot/dts/exynos4412-i9305.dts
new file mode 100644
index 000000000000..54a2a55dbf70
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4412-i9305.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+#include "exynos4412-galaxy-s3.dtsi"
+
+/ {
+	model = "Samsung Galaxy S3 (GT-I9305) based on Exynos4412";
+	compatible = "samsung,i9305", "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
+
+	/* bootargs are passed in by bootloader */
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
diff --git a/arch/arm/boot/dts/exynos4412-n710x.dts b/arch/arm/boot/dts/exynos4412-n710x.dts
new file mode 100644
index 000000000000..7d289c257920
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4412-n710x.dts
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+#include "exynos4412-midas.dtsi"
+
+/ {
+	compatible = "samsung,n710x", "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
+	model = "Samsung Galaxy Note 2 (GT-N7100, GT-N7105) based on Exynos4412";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg =  <0x40000000 0x80000000>;
+	};
+
+	/* bootargs are passed in by bootloader */
+
+	regulators {
+		cam_vdda_reg: voltage-regulator-9 {
+			compatible = "regulator-fixed";
+			regulator-name = "CAM_SENSOR_CORE_1.2V";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			gpio = <&gpm4 1 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+	};
+};
+
+&buck9_reg {
+	maxim,ena-gpios = <&gpm1 0 GPIO_ACTIVE_HIGH>;
+};
+
+&cam_af_reg {
+	gpio = <&gpm1 1 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&cam_io_reg {
+	gpio = <&gpm0 7 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&ldo13_reg {
+	regulator-name = "VCC_1.8V_LCD";
+	regulator-always-on;
+};
+
+&ldo25_reg {
+	regulator-name = "VCI_3.0V_LCD";
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+};
+
+&s5c73m3 {
+	standby-gpios = <&gpm0 6 GPIO_ACTIVE_LOW>;   /* ISP_STANDBY */
+	vdda-supply = <&cam_vdda_reg>;
+	status = "okay";
+};
-- 
2.16.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
