From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 5/6] ARM: dts: exynos4210-universal_c210: enable hdmi support
Date: Tue, 13 Jan 2015 10:41:29 +0100
Message-ID: <1421142089-15214-1-git-send-email-m.szyprowski@samsung.com>
References: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:18293 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751241AbbAMJlh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Jan 2015 04:41:37 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NI400A1U0G70J20@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Jan 2015 09:45:43 +0000 (GMT)
In-reply-to: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, kyungmin.park@samsung.com

From: Tomasz Stanislawski <t.stanislaws@samsung.com>

This patch adds configuration of hw modules required to enable HDMI
support on Universal C210 board.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 57 +++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index aaf0cae..01f7d3c 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -503,6 +503,63 @@
 			assigned-clock-rates = <0>, <160000000>;
 		};
 	};
+
+	hdmi_en: voltage-regulator-hdmi-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "HDMI_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpe0 1 0>;
+		enable-active-high;
+	};
+
+	hdmi_ddc: i2c-ddc {
+		compatible = "i2c-gpio";
+		gpios = <&gpe4 2 0 &gpe4 3 0>;
+		i2c-gpio,delay-us = <100>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pinctrl-0 = <&i2c_ddc_bus>;
+		pinctrl-names = "default";
+		status = "okay";
+	};
+
+	mixer@12C10000 {
+		status = "okay";
+	};
+
+	hdmi@12D00000 {
+		hpd-gpio = <&gpx3 7 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_hpd>;
+		hdmi-en-supply = <&hdmi_en>;
+		vdd-supply = <&ldo3_reg>;
+		vdd_osc-supply = <&ldo4_reg>;
+		vdd_pll-supply = <&ldo3_reg>;
+		ddc = <&hdmi_ddc>;
+		status = "okay";
+	};
+
+	i2c@138E0000 {
+		status = "okay";
+	};
+};
+
+&pinctrl_1 {
+	hdmi_hpd: hdmi-hpd {
+		samsung,pins = "gpx3-7";
+		samsung,pin-pud = <0>;
+	};
+};
+
+&pinctrl_0 {
+	i2c_ddc_bus: i2c-ddc-bus {
+		samsung,pins = "gpe4-2", "gpe4-3";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <0>;
+	};
 };
 
 &mdma1 {
-- 
1.9.2
