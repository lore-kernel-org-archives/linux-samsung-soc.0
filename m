From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/5] ARM: dts: exynos: Add status property to Exynos 5250
 HDMI and Mixer nodes
Date: Fri, 15 Sep 2017 11:11:22 +0200
Message-ID: <1505466683-32148-5-git-send-email-m.szyprowski@samsung.com>
References: <1505466683-32148-1-git-send-email-m.szyprowski@samsung.com>
        <CGME20170915091140eucas1p25c1c554f07c2fd0e4326a432ed23f587@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33486 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751278AbdIOJLn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 05:11:43 -0400
In-reply-to: <1505466683-32148-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

HDMI support requires some additional off-SoC logic, so HDMI and Mixer
devices should be disabled by default in  SoC dtsi and enabled then
in each board dts. This patch unifies HDMI and Mixer handling with other
Exynos SoCs.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts      | 5 +++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts     | 5 +++++
 arch/arm/boot/dts/exynos5250-snow-common.dtsi | 5 +++++
 arch/arm/boot/dts/exynos5250-spring.dts       | 5 +++++
 arch/arm/boot/dts/exynos5250.dtsi             | 4 +++-
 5 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index a380cff466ae..0efd678b8251 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -152,6 +152,7 @@
 };
 
 &hdmi {
+	status = "okay";
 	ddc = <&i2c_2>;
 	hpd-gpios = <&gpx3 7 GPIO_ACTIVE_LOW>;
 	vdd_osc-supply = <&ldo10_reg>;
@@ -505,6 +506,10 @@
 	status = "okay";
 };
 
+&mixer {
+	status = "okay";
+};
+
 &mmc_0 {
 	status = "okay";
 	broken-cd;
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 1330ded91445..e98e62c1216c 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -116,6 +116,7 @@
 };
 
 &hdmi {
+	status = "okay";
 	ddc = <&i2c_2>;
 	hpd-gpios = <&gpx3 7 GPIO_ACTIVE_HIGH>;
 };
@@ -337,6 +338,10 @@
 	status = "okay";
 };
 
+&mixer {
+	status = "okay";
+};
+
 &mmc_0 {
 	status = "okay";
 	broken-cd;
diff --git a/arch/arm/boot/dts/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
index 88a8656ca7b3..11e6cfdc0f68 100644
--- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
@@ -261,6 +261,7 @@
 };
 
 &hdmi {
+	status = "okay";
 	hpd-gpios = <&gpx3 7 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_hpd_irq>;
@@ -518,6 +519,10 @@
 	status = "okay";
 };
 
+&mixer {
+	status = "okay";
+};
+
 /* eMMC flash */
 &mmc_0 {
 	status = "okay";
diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dts/exynos5250-spring.dts
index b3cc22568033..47dbc50546c1 100644
--- a/arch/arm/boot/dts/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/exynos5250-spring.dts
@@ -91,6 +91,7 @@
 };
 
 &hdmi {
+	status = "okay";
 	hpd-gpios = <&gpx3 7 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_hpd_irq>;
@@ -416,6 +417,10 @@
 	status = "okay";
 };
 
+&mixer {
+	status = "okay";
+};
+
 &mmc_0 {
 	status = "okay";
 	broken-cd;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 995230685ac8..f371f929d700 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -693,6 +693,7 @@
 					"sclk_hdmiphy", "mout_hdmi";
 			samsung,syscon-phandle = <&pmu_system_controller>;
 			phy = <&hdmiphy>;
+			status = "disabled";
 		};
 
 		hdmicec: cec@101B0000 {
@@ -708,7 +709,7 @@
 			status = "disabled";
 		};
 
-		mixer@14450000 {
+		mixer: mixer@14450000 {
 			compatible = "samsung,exynos5250-mixer";
 			reg = <0x14450000 0x10000>;
 			power-domains = <&pd_disp1>;
@@ -717,6 +718,7 @@
 				 <&clock CLK_SCLK_HDMI>;
 			clock-names = "mixer", "hdmi", "sclk_hdmi";
 			iommus = <&sysmmu_tv>;
+			status = "disabled";
 		};
 
 		dp_phy: video-phy {
-- 
1.9.1
