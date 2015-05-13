From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv5 3/5] ARM: dts: define default thermal-zones for exynos5422
Date: Wed, 13 May 2015 16:06:58 +0930
Message-ID: <1431499020-3912-4-git-send-email-linux.amoon@gmail.com>
References: <1431499020-3912-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:33774 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752124AbbEMGjN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 02:39:13 -0400
In-Reply-To: <1431499020-3912-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Markus Reichl <m.reichl@fivetechno.de>, Eduardo Valentin <edubezval@gmail.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>

Trip points corresponding to the one defined in the exynos_tmu_data.c
for Exynos5 have been included.
This thermal-zones attribute is afterwards reused for Exynos5422.

Tested-by: Markus Reichl <m.reichl@fivetechno.de>
Acked-by: Lukasz Majewski <l.majewski@samsung.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/exynos5-cpu-thermal.dtsi | 59 ++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos5-cpu-thermal.dtsi

diff --git a/arch/arm/boot/dts/exynos5-cpu-thermal.dtsi b/arch/arm/boot/dts/exynos5-cpu-thermal.dtsi
new file mode 100644
index 0000000..508375d
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
+					temperature = <120000>; /* millicelsius */
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
