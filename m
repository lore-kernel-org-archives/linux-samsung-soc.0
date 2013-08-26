From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v5 4/6] ARM: dts: add dt nodes for exynos5420 hdmi subsystem
Date: Mon, 26 Aug 2013 15:08:19 +0530
Message-ID: <1377509901-9467-5-git-send-email-rahul.sharma@samsung.com>
References: <1377509901-9467-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64298 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756677Ab3HZJQk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 05:16:40 -0400
In-reply-to: <1377509901-9467-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add hdmi, mixer, ddc device tree nodes for Exynos 5420 SoC.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |   15 +++++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi         |   19 +++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index bafba25..140565f 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -61,4 +61,19 @@
 		};
 	};
 
+	hdmi@14530000 {
+		status = "okay";
+		hpd-gpio = <&gpx3 7 0>;
+	};
+
+	i2c_2: i2c@12C80000 {
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <66000>;
+		status = "okay";
+
+		hdmiddc@50 {
+			compatible = "samsung,exynos4210-hdmiddc";
+			reg = <0x50>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 05dee86..aff1679 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -274,4 +274,23 @@
 		pinctrl-0 = <&i2c3_bus>;
 		status = "disabled";
 	};
+
+	hdmi@14530000 {
+		compatible = "samsung,exynos4212-hdmi";
+		reg = <0x14530000 0x70000>;
+		interrupts = <0 95 0>;
+		clocks = <&clock 413>, <&clock 143>, <&clock 2048>,
+			<&clock 158>, <&clock 1024>;
+		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
+			"sclk_hdmiphy", "mout_hdmi";
+		status = "disabled";
+	};
+
+	mixer@14450000 {
+		compatible = "samsung,exynos5420-mixer";
+		reg = <0x14450000 0x10000>;
+		interrupts = <0 94 0>;
+		clocks = <&clock 431>, <&clock 143>;
+		clock-names = "mixer", "sclk_hdmi";
+	};
 };
-- 
1.7.10.4
