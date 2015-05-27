From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH] ARM: dts: add exynos5422.dtsi to correct cpu order
Date: Thu, 28 May 2015 00:15:54 +0900
Message-ID: <1432739754-19511-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14756 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751358AbbE0PQH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 May 2015 11:16:07 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NP000A19L2T7A20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 28 May 2015 00:16:05 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org, k.kozlowski@samsung.com
Cc: jy0922.shim@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, javier.martinez@collabora.co.uk, khilman@linaro.org, sjoerd.simons@collabora.co.uk, heesub.shin@samsung.com, Chanho Park <chanho61.park@samsung.com>

The odroid-xu3 board which is based on exynos5422 not exynos5800 is
booted from cortex-a7 core unlike exynos5800. The odroid-xu3's cpu order
is quite strange. cpu0 and cpu5-7 are cortex-a7 cores and cpu1-4 are
cortex-a15 cores. To correct this mis-odering, I added exynos5422.dtsi
and reversing cpu orders from exynos5420. Now, cpu0-3 are cortex-a7 and
cpu4-7 are cortex-a15.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts |  5 +-
 arch/arm/boot/dts/exynos5422.dtsi          | 88 ++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos5422.dtsi

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index edc25cf..0f0784b 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -11,11 +11,12 @@
 */
 
 /dts-v1/;
-#include "exynos5800.dtsi"
+#include "exynos5422.dtsi"
 
 / {
 	model = "Hardkernel Odroid XU3";
-	compatible = "hardkernel,odroid-xu3", "samsung,exynos5800", "samsung,exynos5";
+	compatible = "hardkernel,odroid-xu3", "samsung,exynos5800",
+		     "samsung,exynos5422", "samsung,exynos5";
 
 	memory {
 		reg = <0x40000000 0x7EA00000>;
diff --git a/arch/arm/boot/dts/exynos5422.dtsi b/arch/arm/boot/dts/exynos5422.dtsi
new file mode 100644
index 0000000..3ac12bc
--- /dev/null
+++ b/arch/arm/boot/dts/exynos5422.dtsi
@@ -0,0 +1,88 @@
+/*
+ * SAMSUNG EXYNOS5422 SoC device tree source
+ *
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * The only difference between EXYNOS5422 and EXYNOS5800 is cpu ordering. The
+ * EXYNOS5422 is booting from Cortex-A7 core while the EXYNOS5800 is booting
+ * from Cortex-A15 core.
+ *
+ * EXYNOS5422 based board files can include this file and provide
+ * values for board specfic bindings.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include "exynos5800.dtsi"
+
+/ {
+	compatible = "samsung,exynos5800", "samsung,exynos5422",
+		     "samsung,exynos5";
+};
+
+&cpu0 {
+	device_type = "cpu";
+	compatible = "arm,cortex-a7";
+	reg = <0x100>;
+	clock-frequency = <1000000000>;
+	cci-control-port = <&cci_control0>;
+};
+
+&cpu1 {
+	device_type = "cpu";
+	compatible = "arm,cortex-a7";
+	reg = <0x101>;
+	clock-frequency = <1000000000>;
+	cci-control-port = <&cci_control0>;
+};
+
+&cpu2 {
+	device_type = "cpu";
+	compatible = "arm,cortex-a7";
+	reg = <0x102>;
+	clock-frequency = <1000000000>;
+	cci-control-port = <&cci_control0>;
+};
+
+&cpu3 {
+	device_type = "cpu";
+	compatible = "arm,cortex-a7";
+	reg = <0x103>;
+	clock-frequency = <1000000000>;
+	cci-control-port = <&cci_control0>;
+};
+
+&cpu4 {
+	device_type = "cpu";
+	compatible = "arm,cortex-a15";
+	reg = <0x0>;
+	clock-frequency = <1800000000>;
+	cci-control-port = <&cci_control1>;
+};
+
+&cpu5 {
+	device_type = "cpu";
+	compatible = "arm,cortex-a15";
+	reg = <0x1>;
+	clock-frequency = <1800000000>;
+	cci-control-port = <&cci_control1>;
+};
+
+&cpu6 {
+	device_type = "cpu";
+	compatible = "arm,cortex-a15";
+	reg = <0x2>;
+	clock-frequency = <1800000000>;
+	cci-control-port = <&cci_control1>;
+};
+
+&cpu7 {
+	device_type = "cpu";
+	compatible = "arm,cortex-a15";
+	reg = <0x3>;
+	clock-frequency = <1800000000>;
+	cci-control-port = <&cci_control1>;
+};
-- 
1.9.1
