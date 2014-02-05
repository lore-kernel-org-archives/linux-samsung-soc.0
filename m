From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 3/3] ARM: dts: add dts files for xyref5260 board
Date: Wed, 05 Feb 2014 11:47:59 +0530
Message-ID: <1391581079-20086-4-git-send-email-rahul.sharma@samsung.com>
References: <1391581079-20086-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62701 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751463AbaBEGSz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Feb 2014 01:18:55 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0I00MSXEVHVG30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Feb 2014 15:18:53 +0900 (KST)
In-reply-to: <1391581079-20086-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

The patch adds the dts files for xyref5260 board which
is based on Exynos5260 Evt0 sample.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/Makefile                      |    1 +
 arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts |  105 +++++++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index fa70ea2..c513a69 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -64,6 +64,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
 	exynos5250-arndale.dtb \
 	exynos5250-smdk5250.dtb \
 	exynos5250-snow.dtb \
+	exynos5260-xyref5260-evt0.dtb \
 	exynos5420-arndale-octa.dtb \
 	exynos5420-smdk5420.dtb \
 	exynos5440-sd5v1.dtb \
diff --git a/arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts b/arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts
new file mode 100644
index 0000000..b4c9c35
--- /dev/null
+++ b/arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts
@@ -0,0 +1,105 @@
+/*
+ * SAMSUNG XYREF5260 EVT0 board device tree source
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
+#include "exynos5260.dtsi"
+
+/ {
+	model = "SAMSUNG XYREF5260 EVT0 board based on EXYNOS5260";
+	compatible = "samsung,xyref5260", "samsung,exynos5260";
+
+	memory {
+		reg = <0x20000000 0x80000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttySAC2,115200";
+	};
+
+	clocks {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		fin_pll: oscillator@0 {
+			compatible = "fixed-clock";
+			reg = <0>;
+			clock-frequency = <24000000>;
+			clock-output-names = "fin_pll";
+			#clock-cells = <0>;
+		};
+	};
+
+	pinctrl@11600000 {
+		hdmi_hpd_irq: hdmi-hpd-irq {
+			samsung,pins = "gpx3-7";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <1>;
+			samsung,pin-drv = <0>;
+		};
+	};
+
+	serial@12C00000 {
+		status = "okay";
+	};
+
+	serial@12C10000 {
+		status = "okay";
+	};
+
+	serial@12C20000 {
+		status = "okay";
+	};
+
+	serial@12860000 {
+		status = "okay";
+	};
+
+	mmc0@12140000 {
+		status = "okay";
+		num-slots = <1>;
+		broken-cd;
+		bypass-smu;
+		supports-highspeed;
+		supports-hs200-mode; /* 200 Mhz */
+		fifo-depth = <0x40>;
+		card-detect-delay = <200>;
+		samsung,dw-mshc-ciu-div = <3>;
+		samsung,dw-mshc-sdr-timing = <0 4>;
+		samsung,dw-mshc-ddr-timing = <0 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd0_rdqs &sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <8>;
+		};
+	};
+
+	mmc2@12160000 {
+		status = "okay";
+		num-slots = <1>;
+		supports-highspeed;
+		fifo-depth = <0x40>;
+		card-detect-delay = <200>;
+		samsung,dw-mshc-ciu-div = <3>;
+		samsung,dw-mshc-sdr-timing = <2 3>;
+		samsung,dw-mshc-ddr-timing = <1 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus1 &sd2_bus4>;
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <4>;
+			disable-wp;
+		};
+	};
+};
-- 
1.7.9.5
