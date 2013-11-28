From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: dts: Add initial support for Arndale Octa board
Date: Thu, 28 Nov 2013 16:08:01 +0530
Message-ID: <1385635081-21072-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:49056 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752306Ab3K1Kk3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Nov 2013 05:40:29 -0500
Received: by mail-pb0-f51.google.com with SMTP id up15so12311156pbc.24
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Nov 2013 02:40:27 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org

Arndale Octa board is based on Exynos5420 SoC. This patch
adds the basic support required for booting it through DT.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/Makefile                    |    1 +
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |   66 +++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos5420-arndale-octa.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b14bb117fc3a..602a317ad5dc 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -63,6 +63,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
 	exynos5250-arndale.dtb \
 	exynos5250-smdk5250.dtb \
 	exynos5250-snow.dtb \
+	exynos5420-arndale-octa.dtb \
 	exynos5420-smdk5420.dtb \
 	exynos5440-sd5v1.dtb \
 	exynos5440-ssdk5440.dtb
diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
new file mode 100644
index 000000000000..7340745ff979
--- /dev/null
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -0,0 +1,66 @@
+/*
+ * Samsung's Exynos5420 based Arndale Octa board device tree source
+ *
+ * Copyright (c) 2013 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+/dts-v1/;
+#include "exynos5420.dtsi"
+
+/ {
+	model = "Insignal Arndale Octa evaluation board based on EXYNOS5420";
+	compatible = "insignal,arndale-octa", "samsung,exynos5420";
+
+	memory {
+		reg = <0x20000000 0x80000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttySAC3,115200";
+	};
+
+	fixed-rate-clocks {
+		oscclk {
+			compatible = "samsung,exynos5420-oscclk";
+			clock-frequency = <24000000>;
+		};
+	};
+
+	mmc@12200000 {
+		status = "okay";
+		broken-cd;
+		supports-highspeed;
+		card-detect-delay = <200>;
+		samsung,dw-mshc-ciu-div = <3>;
+		samsung,dw-mshc-sdr-timing = <0 4>;
+		samsung,dw-mshc-ddr-timing = <0 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <8>;
+		};
+	};
+
+	mmc@12220000 {
+		status = "okay";
+		supports-highspeed;
+		card-detect-delay = <200>;
+		samsung,dw-mshc-ciu-div = <3>;
+		samsung,dw-mshc-sdr-timing = <2 3>;
+		samsung,dw-mshc-ddr-timing = <1 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <4>;
+		};
+	};
+};
-- 
1.7.9.5
