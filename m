From: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 3/3] ARM: dts: add dts files for xyref5260 board
Date: Thu, 03 Apr 2014 10:47:57 +0530
Message-ID: <1396502277-19588-4-git-send-email-rahul.sharma@samsung.com>
References: <1396502277-19588-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1396502277-19588-1-git-send-email-rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

The patch adds the dts files for xyref5260 board which
is based on Exynos5260 Evt0 sample.

Signed-off-by: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                      |    1 +
 arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts |  103 +++++++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b9d6a8b..5a391bf 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -72,6 +72,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
 	exynos5250-arndale.dtb \
 	exynos5250-smdk5250.dtb \
 	exynos5250-snow.dtb \
+	exynos5260-xyref5260-evt0.dtb \
 	exynos5420-arndale-octa.dtb \
 	exynos5420-smdk5420.dtb \
 	exynos5440-sd5v1.dtb \
diff --git a/arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts b/arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts
new file mode 100644
index 0000000..fb1b0ee
--- /dev/null
+++ b/arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts
@@ -0,0 +1,103 @@
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
+	fin_pll: xxti {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "fin_pll";
+		#clock-cells = <0>;
+	};
+
+	xrtcxti: xrtcxti {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "xrtcxti";
+		#clock-cells = <0>;
+	};
+};
+
+&pinctrl_0 {
+	hdmi_hpd_irq: hdmi-hpd-irq {
+		samsung,pins = "gpx3-7";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <1>;
+		samsung,pin-drv = <0>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&mmc_0 {
+	status = "okay";
+	num-slots = <1>;
+	broken-cd;
+	bypass-smu;
+	supports-highspeed;
+	supports-hs200-mode; /* 200 Mhz */
+	card-detect-delay = <200>;
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 4>;
+	samsung,dw-mshc-ddr-timing = <0 2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd0_rdqs &sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+
+	slot@0 {
+		reg = <0>;
+		bus-width = <8>;
+	};
+};
+
+&mmc_2 {
+	status = "okay";
+	num-slots = <1>;
+	supports-highspeed;
+	card-detect-delay = <200>;
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <2 3>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus1 &sd2_bus4>;
+
+	slot@0 {
+		reg = <0>;
+		bus-width = <4>;
+		disable-wp;
+	};
+};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
