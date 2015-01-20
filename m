From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 3/9] ARM: dts: exynos4: add hdmi related nodes
Date: Tue, 20 Jan 2015 13:16:53 +0100
Message-ID: <1421756219-21037-4-git-send-email-m.szyprowski@samsung.com>
References: <1421756219-21037-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40504 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753769AbbATMRJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jan 2015 07:17:09 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NIH00EZV6BBBL60@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Jan 2015 12:21:11 +0000 (GMT)
In-reply-to: <1421756219-21037-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, jy0922.shim@samsung.com, kyungmin.park@samsung.com

This patch adds entries for HDMI, Mixer and i2c with hdmi-phy modules
found in Exynos 4210 and 4x12 SoCs.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi    | 40 +++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4210.dtsi |  8 ++++++++
 arch/arm/boot/dts/exynos4x12.dtsi | 11 +++++++++++
 3 files changed, 59 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index c5dc2efb99ed..d9516471c41e 100644
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
@@ -544,6 +545,22 @@
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
@@ -652,4 +669,27 @@
 		samsung,sysreg = <&sys_reg>;
 		status = "disabled";
 	};
+
+	hdmi: hdmi@12D00000 {
+		compatible = "samsung,exynos4210-hdmi";
+		reg = <0x12D00000 0x70000>;
+		interrupts = <0 92 0>;
+		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel", "sclk_hdmiphy",
+			"mout_hdmi";
+		clocks = <&clock CLK_HDMI>, <&clock CLK_SCLK_HDMI>,
+			<&clock CLK_SCLK_PIXEL>, <&clock CLK_SCLK_HDMIPHY>,
+			<&clock CLK_MOUT_HDMI>;
+		phy = <&hdmi_i2c_phy>;
+		power-domains = <&pd_tv>;
+		samsung,syscon-phandle = <&pmu_system_controller>;
+		status = "disabled";
+	};
+
+	mixer: mixer@12C10000 {
+		compatible = "samsung,exynos4210-mixer";
+		interrupts = <0 91 0>;
+		reg = <0x12C10000 0x2100>, <0x12c00000 0x300>;
+		power-domains = <&pd_tv>;
+		status = "disabled";
+	};
 };
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 6728aaa2af9d..1b410027bbc8 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -193,4 +193,12 @@
 			samsung,lcd-wb;
 		};
 	};
+
+	mixer: mixer@12C10000 {
+		clock-names = "mixer", "hdmi", "sclk_hdmi", "vp", "mout_mixer",
+			"sclk_mixer";
+		clocks = <&clock CLK_MIXER>, <&clock CLK_HDMI>,
+			<&clock CLK_SCLK_HDMI>, <&clock CLK_VP>,
+			<&clock CLK_MOUT_MIXER>, <&clock CLK_SCLK_MIXER>;
+	};
 };
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index da8734e25f50..a26503826363 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -283,4 +283,15 @@
 		clock-names = "tmu_apbif";
 		status = "disabled";
 	};
+
+	hdmi: hdmi@12D00000 {
+		compatible = "samsung,exynos4212-hdmi";
+	};
+
+	mixer: mixer@12C10000 {
+		compatible = "samsung,exynos4212-mixer";
+		clock-names = "mixer", "hdmi", "sclk_hdmi", "vp";
+		clocks = <&clock CLK_MIXER>, <&clock CLK_HDMI>,
+			 <&clock CLK_SCLK_HDMI>, <&clock CLK_VP>;
+	};
 };
-- 
1.9.2
