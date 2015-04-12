From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v4 3/6] ARM: dts: define default thermal-zones for exynos5
Date: Mon, 13 Apr 2015 04:14:08 +0930
Message-ID: <1428864251-31780-4-git-send-email-linux.amoon@gmail.com>
References: <1428864251-31780-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:34776 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752140AbbDLSpC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 Apr 2015 14:45:02 -0400
In-Reply-To: <1428864251-31780-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Eduardo Valentin <edubezval@gmail.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Markus Reichl <m.reichl@fivetechno.de>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>

Trip points corresponding to the one defined in the exynos_tmu_data.c
for Exynos5 have been included.
This thermal-zones attribute is afterwards reused for Exynos5422.

Changes since v1 : Fixed the thernal_sensor registration of the sensors tmu_cpu0
Changes since v2 : None
Changes since v3 : None

Tested-by: Markus Reichl <m.reichl@fivetechno.de>
Acked-by: Lukasz Majewski <l.majewski@samsung.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/exynos5-cpu-thermal.dtsi | 59 ++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos5-cpu-thermal.dtsi

diff --git a/arch/arm/boot/dts/exynos5-cpu-thermal.dtsi b/arch/arm/boot/dts/exynos5-cpu-thermal.dtsi
new file mode 100644
index 0000000..3ce8872
--- /dev/null
+++ b/arch/arm/boot/dts/exynos5-cpu-thermal.dtsi
@@ -0,0 +1,59 @@
+/*
+ * Device tree sources for Exynos5 thermal zone
+ *
+ * Copyright (c) 2015 Lukasz Majewski <l.majewski@samsung.com>
+ *			Anand Moon <linux.amoon@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <dt-bindings/thermal/thermal.h>
+
+/ {
+	thermal-zones {
+		cpu0_thermal: cpu0-thermal {
+			thermal-sensors = <&tmu_cpu0 0>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			trips {
+				cpu_alert0: cpu-alert-0 {
+					temperature = <50000>; /* millicelsius */
+					hysteresis = <5000>; /* millicelsius */
+					type = "active";
+				};
+				cpu_alert1: cpu-alert-1 {
+					temperature = <60000>; /* millicelsius */
+					hysteresis = <5000>; /* millicelsius */
+					type = "active";
+				};
+				cpu_alert2: cpu-alert-2 {
+					temperature = <70000>; /* millicelsius */
+					hysteresis = <5000>; /* millicelsius */
+					type = "active";
+				};
+				cpu_crit0: cpu-crit-0 {
+					temperature = <100000>; /* millicelsius */
+					hysteresis = <0>; /* millicelsius */
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+				     trip = <&cpu_alert0>;
+				     cooling-device = <&fan0 0 1>;
+				};
+				map1 {
+				     trip = <&cpu_alert1>;
+				     cooling-device = <&fan0 1 2>;
+				};
+				map2 {
+				     trip = <&cpu_alert2>;
+				     cooling-device = <&fan0 2 3>;
+				};
+			};
+		};
+	};
+};
-- 
1.9.1
