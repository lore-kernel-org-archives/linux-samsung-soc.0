From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 5/7] ARM: dts: exynos4: add hdmi related nodes
Date: Tue, 01 Jul 2014 10:10:09 +0200
Message-ID: <1404202211-15788-6-git-send-email-m.szyprowski@samsung.com>
References: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:27046 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753150AbaGAIKf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 04:10:35 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N80007XEXDB5T80@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 01 Jul 2014 09:10:23 +0100 (BST)
In-reply-to: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This patch adds entries for HDMI, Mixer and i2c with hdmi-phy modules
found in Exynos 4210 and 4x12 SoCs.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi    | 37 +++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4210.dtsi |  5 +++++
 arch/arm/boot/dts/exynos4x12.dtsi | 10 ++++++++++
 3 files changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 933bd2141601..5b55c4de7e6f 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -38,6 +38,7 @@
 		i2c5 = &i2c_5;
 		i2c6 = &i2c_6;
 		i2c7 = &i2c_7;
+		i2c8 = &i2c_8;
 		csis0 = &csis_0;
 		csis1 = &csis_1;
 		fimc0 = &fimc_0;
@@ -527,6 +528,22 @@
 		status = "disabled";
 	};
 
+	i2c_8: i2c@138E0000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "samsung,s3c2440-hdmiphy-i2c";
+		reg = <0x138E0000 0x100>;
+		interrupts = <0 93 0>;
+		clocks = <&clock CLK_I2C_HDMI>;
+		clock-names = "i2c";
+		status = "disabled";
+
+		hdmi_i2c_phy: hdmiphy@38 {
+			compatible = "exynos4210-hdmiphy";
+			reg = <0x38>;
+		};
+	};
+
 	spi_0: spi@13920000 {
 		compatible = "samsung,exynos4210-spi";
 		reg = <0x13920000 0x100>;
@@ -634,4 +651,24 @@
 		samsung,power-domain = <&pd_lcd0>;
 		status = "disabled";
 	};
+
+	hdmi: hdmi@12D00000 {
+		compatible = "samsung,exynos4210-hdmi";
+		reg = <0x12D00000 0x70000>;
+		interrupts = <0 92 0>;
+		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel", "sclk_hdmiphy", "mout_hdmi";
+		clocks = <&clock CLK_HDMI>, <&clock CLK_SCLK_HDMI>, <&clock CLK_SCLK_PIXEL>, <&clock CLK_SCLK_HDMIPHY>, <&clock CLK_MOUT_HDMI>;
+		phy = <&hdmi_i2c_phy>;
+		samsung,power-domain = <&pd_tv>;
+		samsung,syscon-phandle = <&pmu_system_controller>;
+		status = "disabled";
+	};
+
+	mixer: mixer@12C10000 {
+		compatible = "samsung,exynos4210-mixer";
+		interrupts = <0 91 0>;
+		reg = <0x12C10000 0x2100>, <0x12c00000 0x300>;
+		samsung,power-domain = <&pd_tv>;
+		status = "disabled";
+	};
 };
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index ee3001f38821..d32063d00ad7 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -171,4 +171,9 @@
 			samsung,lcd-wb;
 		};
 	};
+
+	mixer: mixer@12C10000 {
+		clock-names = "mixer", "sclk_hdmi", "vp", "mout_mixer", "sclk_mixer";
+		clocks = <&clock CLK_MIXER>, <&clock CLK_SCLK_HDMI>, <&clock CLK_VP>, <&clock CLK_MOUT_MIXER>, <&clock CLK_SCLK_MIXER>;
+	};
 };
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index c5a943df1cd7..856cd45b696b 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -270,4 +270,14 @@
 		compatible = "samsung,exynos4x12-usb2-phy";
 		samsung,sysreg-phandle = <&sys_reg>;
 	};
+
+	hdmi: hdmi@12D00000 {
+		compatible = "samsung,exynos4212-hdmi";
+	};
+
+	mixer: mixer@12C10000 {
+		compatible = "samsung,exynos4212-mixer";
+		clock-names = "mixer", "sclk_hdmi", "vp";
+		clocks = <&clock CLK_MIXER>, <&clock CLK_SCLK_HDMI>, <&clock CLK_VP>;
+	};
 };
-- 
1.9.2
