From: Chanho Park <parkch98@gmail.com>
Subject: [PATCHv3] ARM: dts: add exynos5422-cpus.dtsi to correct cpu order
Date: Mon,  1 Jun 2015 21:24:19 +0900
Message-ID: <1433161459-10901-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:36607 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751750AbbFAMYe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jun 2015 08:24:34 -0400
Received: by pdjm12 with SMTP id m12so23713585pdj.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Jun 2015 05:24:34 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org, k.kozlowski@samsung.com
Cc: jy0922.shim@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, javier.martinez@collabora.co.uk, khilman@linaro.org, sjoerd.simons@collabora.co.uk, heesub.shin@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, Chanho Park <chanho61.park@samsung.com>

The odroid-xu3 board which is based on exynos5422 not exynos5800 is
booted from cortex-a7 core unlike exynos5800. The odroid-xu3's cpu order
is quite strange. cpu0 and cpu5-7 are cortex-a7 cores and cpu1-4 are
cortex-a15 cores. To correct this mis-odering, I added exynos5422.dtsi
and reversing cpu orders from exynos5420. Now, cpu0-3 are cortex-a7 and
cpu4-7 are cortex-a15.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
Change from v2:
 - drop inclusion of exynos5420.dtsi from exynos5422-cpus.dtsi
 - drop compatibles from exynos5422-cpus.dtsi

Changes from v1:
 - rename exynos5422.dtsi to exynos5422-cpus.dtsi
 - include the dtsi file top of the exynos5422-odroidxu3.dts

 arch/arm/boot/dts/exynos5422-cpus.dtsi     | 81 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5422-odroidxu3.dts |  4 +-
 2 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/exynos5422-cpus.dtsi

diff --git a/arch/arm/boot/dts/exynos5422-cpus.dtsi b/arch/arm/boot/dts/exynos5422-cpus.dtsi
new file mode 100644
index 0000000..b7f60c8
--- /dev/null
+++ b/arch/arm/boot/dts/exynos5422-cpus.dtsi
@@ -0,0 +1,81 @@
+/*
+ * SAMSUNG EXYNOS5422 SoC cpu device tree source
+ *
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * The only difference between EXYNOS5422 and EXYNOS5800 is cpu ordering. The
+ * EXYNOS5422 is booting from Cortex-A7 core while the EXYNOS5800 is booting
+ * from Cortex-A15 core.
+ *
+ * EXYNOS5422 based board files can include this file to provide cpu ordering
+ * which could boot a cortex-a7 from cpu0.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
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
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index edc25cf..00f45c9 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -12,10 +12,12 @@
 
 /dts-v1/;
 #include "exynos5800.dtsi"
+#include "exynos5422-cpus.dtsi"
 
 / {
 	model = "Hardkernel Odroid XU3";
-	compatible = "hardkernel,odroid-xu3", "samsung,exynos5800", "samsung,exynos5";
+	compatible = "hardkernel,odroid-xu3", "samsung,exynos5800",
+		     "samsung,exynos5422", "samsung,exynos5";
 
 	memory {
 		reg = <0x40000000 0x7EA00000>;
-- 
2.1.0
