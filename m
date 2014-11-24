From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH RESEND 5/7] ARM: dts: exynos4412-odroid: enable hdmi support
Date: Mon, 24 Nov 2014 08:30:54 +0100
Message-ID: <1416814256-24288-6-git-send-email-a.hajda@samsung.com>
References: <1416814256-24288-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:8934 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752652AbaKXHbq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 02:31:46 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFJ00K1B91O6Z80@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Nov 2014 07:34:36 +0000 (GMT)
In-reply-to: <1416814256-24288-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

From: Marek Szyprowski <m.szyprowski@samsung.com>

This patch adds nodes specific to Exynos4412 based Odroid X/X2/U2/U3
boards required for enabling HDMI display.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 44 +++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index c697ff0..4ebb557 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -205,6 +205,20 @@
 					regulator-always-on;
 				};
 
+				ldo8_reg: ldo@8 {
+					regulator-compatible = "LDO8";
+					regulator-name = "VDD10_HDMI_1.0V";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+				};
+
+				ldo10_reg: ldo@10 {
+					regulator-compatible = "LDO10";
+					regulator-name = "VDDQ_MIPIHSI_1.8V";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
 				ldo11_reg: LDO11 {
 					regulator-name = "VDD18_ABB1_1.8V";
 					regulator-min-microvolt = <1800000>;
@@ -363,6 +377,31 @@
 	ehci: ehci@12580000 {
 		status = "okay";
 	};
+
+	mixer: mixer@12C10000 {
+		status = "okay";
+	};
+
+	hdmi@12D00000 {
+		hpd-gpio = <&gpx3 7 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_hpd>;
+		vdd-supply = <&ldo8_reg>;
+		vdd_osc-supply = <&ldo10_reg>;
+		vdd_pll-supply = <&ldo8_reg>;
+		ddc = <&hdmi_ddc>;
+		status = "okay";
+	};
+
+	hdmi_ddc: i2c@13880000 {
+		status = "okay";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c2_bus>;
+	};
+
+	i2c@138E0000 {
+		status = "okay";
+	};
 };
 
 &pinctrl_1 {
@@ -377,4 +416,9 @@
 		samsung,pin-pud = <0>;
 		samsung,pin-drv = <0>;
 	};
+
+	hdmi_hpd: hdmi-hpd {
+		samsung,pins = "gpx3-7";
+		samsung,pin-pud = <1>;
+	};
 };
-- 
1.9.1
