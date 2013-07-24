From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v4 05/13] ARM: dts: Add camera subsystem device nodes to
 exynos4.dtsi
Date: Wed, 24 Jul 2013 15:17:17 +0200
Message-ID: <1374671845-30373-6-git-send-email-s.nawrocki@samsung.com>
References: <1374671845-30373-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18358 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750902Ab3GXNTX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 09:19:23 -0400
In-reply-to: <1374671845-30373-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch adds common Exynos4 SoC series FIMC and MIPI CSIS
device nodes.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---

Changes since v3:
 - added #address-cells/#size-cells properties to csis nodes,
 - added clock provider node to the camera node.
---
 arch/arm/boot/dts/exynos4.dtsi |   88 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index bce2254..597cfcf 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -36,6 +36,12 @@
 		i2c5 = &i2c_5;
 		i2c6 = &i2c_6;
 		i2c7 = &i2c_7;
+		csis0 = &csis_0;
+		csis1 = &csis_1;
+		fimc0 = &fimc_0;
+		fimc1 = &fimc_1;
+		fimc2 = &fimc_2;
+		fimc3 = &fimc_3;
 	};
 
 	chipid@10000000 {
@@ -92,6 +98,88 @@
 		reg = <0x10010000 0x400>;
 	};
 
+	camera {
+		compatible = "samsung,fimc", "simple-bus";
+		status = "disabled";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		clock_cam: clock-controller {
+			 #clock-cells = <1>;
+		};
+
+		fimc_0: fimc@11800000 {
+			compatible = "samsung,exynos4210-fimc";
+			reg = <0x11800000 0x1000>;
+			interrupts = <0 84 0>;
+			clocks = <&clock 256>, <&clock 128>;
+			clock-names = "fimc", "sclk_fimc";
+			samsung,power-domain = <&pd_cam>;
+			samsung,sysreg = <&sys_reg>;
+			status = "disabled";
+		};
+
+		fimc_1: fimc@11810000 {
+			compatible = "samsung,exynos4210-fimc";
+			reg = <0x11810000 0x1000>;
+			interrupts = <0 85 0>;
+			clocks = <&clock 257>, <&clock 129>;
+			clock-names = "fimc", "sclk_fimc";
+			samsung,power-domain = <&pd_cam>;
+			samsung,sysreg = <&sys_reg>;
+			status = "disabled";
+		};
+
+		fimc_2: fimc@11820000 {
+			compatible = "samsung,exynos4210-fimc";
+			reg = <0x11820000 0x1000>;
+			interrupts = <0 86 0>;
+			clocks = <&clock 258>, <&clock 130>;
+			clock-names = "fimc", "sclk_fimc";
+			samsung,power-domain = <&pd_cam>;
+			samsung,sysreg = <&sys_reg>;
+			status = "disabled";
+		};
+
+		fimc_3: fimc@11830000 {
+			compatible = "samsung,exynos4210-fimc";
+			reg = <0x11830000 0x1000>;
+			interrupts = <0 87 0>;
+			clocks = <&clock 259>, <&clock 131>;
+			clock-names = "fimc", "sclk_fimc";
+			samsung,power-domain = <&pd_cam>;
+			samsung,sysreg = <&sys_reg>;
+			status = "disabled";
+		};
+
+		csis_0: csis@11880000 {
+			compatible = "samsung,exynos4210-csis";
+			reg = <0x11880000 0x4000>;
+			interrupts = <0 78 0>;
+			clocks = <&clock 260>, <&clock 134>;
+			clock-names = "csis", "sclk_csis";
+			bus-width = <4>;
+			samsung,power-domain = <&pd_cam>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		csis_1: csis@11890000 {
+			compatible = "samsung,exynos4210-csis";
+			reg = <0x11890000 0x4000>;
+			interrupts = <0 80 0>;
+			clocks = <&clock 261>, <&clock 135>;
+			clock-names = "csis", "sclk_csis";
+			bus-width = <2>;
+			samsung,power-domain = <&pd_cam>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
 	watchdog@10060000 {
 		compatible = "samsung,s3c2410-wdt";
 		reg = <0x10060000 0x100>;
-- 
1.7.9.5
