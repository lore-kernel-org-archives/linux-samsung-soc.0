From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH RESEND 3/7] ARM: dts: exynos4: add hdmi related nodes
Date: Mon, 24 Nov 2014 08:30:52 +0100
Message-ID: <1416814256-24288-4-git-send-email-a.hajda@samsung.com>
References: <1416814256-24288-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:8934 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752532AbaKXHbo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 02:31:44 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFJ00K1991M6Z80@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Nov 2014 07:34:34 +0000 (GMT)
In-reply-to: <1416814256-24288-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

From: Marek Szyprowski <m.szyprowski@samsung.com>

This patch adds entries for HDMI, Mixer and i2c with hdmi-phy modules
found in Exynos 4210 and 4x12 SoCs.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi    | 40 +++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4210.dtsi |  8 ++++++++
 arch/arm/boot/dts/exynos4x12.dtsi | 11 +++++++++++
 3 files changed, 59 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index e0278ec..4ed5868 100644
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
@@ -537,6 +538,22 @@
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
@@ -645,4 +662,27 @@
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
index 807bb5b..1c97784 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -175,4 +175,12 @@
 			samsung,lcd-wb;
 		};
 	};
+
+	mixer: mixer@12C10000 {
+		clock-names = "mixer", "sclk_hdmi", "vp", "mout_mixer",
+			"sclk_mixer";
+		clocks = <&clock CLK_MIXER>, <&clock CLK_SCLK_HDMI>,
+			<&clock CLK_VP>, <&clock CLK_MOUT_MIXER>,
+			<&clock CLK_SCLK_MIXER>;
+	};
 };
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 861bb91..d6789a0 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -271,4 +271,15 @@
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
+		clocks = <&clock CLK_MIXER>, <&clock CLK_SCLK_HDMI>,
+			<&clock CLK_VP>;
+	};
 };
-- 
1.9.1
