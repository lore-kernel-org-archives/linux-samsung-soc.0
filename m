From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 6/7] ARM: dts: exynos4412-odroid: enable hdmi support
Date: Tue, 01 Jul 2014 10:10:10 +0200
Message-ID: <1404202211-15788-7-git-send-email-m.szyprowski@samsung.com>
References: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58779 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757405AbaGAIKh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 04:10:37 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N80006GXXDE7580@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 01 Jul 2014 09:10:26 +0100 (BST)
In-reply-to: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This patch adds nodes specific to Exynos4412 based Odroid X/X2/U2/U3
boards required for enabling HDMI display.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 52 +++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index d1b33a8efa9d..2856242d640a 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -52,6 +52,14 @@
 		};
 	};
 
+	lcd0-power-domain@10023C80 {
+		domain-always-on;
+	};
+
+	tv-power-domain@10023C20 {
+		domain-always-on;
+	};
+
 	watchdog@10060000 {
 		status = "okay";
 	};
@@ -186,6 +194,20 @@
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
@@ -332,6 +354,31 @@
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
@@ -339,4 +386,9 @@
 		samsung,pins = "gpx1-3";
 		samsung,pin-pud = <0>;
 	};
+
+	hdmi_hpd: hdmi-hpd {
+		samsung,pins = "gpx3-7";
+		samsung,pin-pud = <1>;
+	};
 };
-- 
1.9.2
