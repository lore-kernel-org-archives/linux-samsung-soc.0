From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 5/8] ARM: dts: Add camera nodes for Exynos4 SoCs
Date: Mon, 24 Jun 2013 20:05:48 +0200
Message-ID: <1372097151-18122-6-git-send-email-s.nawrocki@samsung.com>
References: <1372097151-18122-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53585 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752433Ab3FXSGs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Jun 2013 14:06:48 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOW007S7SZBMF80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 Jun 2013 03:06:47 +0900 (KST)
In-reply-to: <1372097151-18122-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch adds common FIMC and MIPI CSIS device nodes for Exynos4 SoCs.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com
---
 arch/arm/boot/dts/exynos4.dtsi |   68 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index bce2254..4d61120 100644
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
@@ -92,6 +98,68 @@
 		reg = <0x10010000 0x400>;
 	};
 
+	camera {
+		compatible = "samsung,fimc", "simple-bus";
+		status = "disabled";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		fimc_0: fimc@11800000 {
+			compatible = "samsung,exynos4210-fimc";
+			reg = <0x11800000 0x1000>;
+			interrupts = <0 84 0>;
+			samsung,power-domain = <&pd_cam>;
+			samsung,sysreg = <&sys_reg>;
+			status = "disabled";
+		};
+
+		fimc_1: fimc@11810000 {
+			compatible = "samsung,exynos4210-fimc";
+			reg = <0x11810000 0x1000>;
+			interrupts = <0 85 0>;
+			samsung,power-domain = <&pd_cam>;
+			samsung,sysreg = <&sys_reg>;
+			status = "disabled";
+		};
+
+		fimc_2: fimc@11820000 {
+			compatible = "samsung,exynos4210-fimc";
+			reg = <0x11820000 0x1000>;
+			interrupts = <0 86 0>;
+			samsung,power-domain = <&pd_cam>;
+			samsung,sysreg = <&sys_reg>;
+			status = "disabled";
+		};
+
+		fimc_3: fimc@11830000 {
+			compatible = "samsung,exynos4210-fimc";
+			reg = <0x11830000 0x1000>;
+			interrupts = <0 87 0>;
+			samsung,power-domain = <&pd_cam>;
+			samsung,sysreg = <&sys_reg>;
+			status = "disabled";
+		};
+
+		csis_0: csis@11880000 {
+			compatible = "samsung,exynos4210-csis";
+			reg = <0x11880000 0x4000>;
+			interrupts = <0 78 0>;
+			bus-width = <4>;
+			samsung,power-domain = <&pd_cam>;
+			status = "disabled";
+		};
+
+		csis_1: csis@11890000 {
+			compatible = "samsung,exynos4210-csis";
+			reg = <0x11890000 0x4000>;
+			interrupts = <0 80 0>;
+			bus-width = <2>;
+			samsung,power-domain = <&pd_cam>;
+			status = "disabled";
+		};
+	};
+
 	watchdog@10060000 {
 		compatible = "samsung,s3c2410-wdt";
 		reg = <0x10060000 0x100>;
-- 
1.7.9.5
