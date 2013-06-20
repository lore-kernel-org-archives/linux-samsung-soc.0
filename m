From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 3/8] ARM: dts: exynos5250: move common hdmi properties to
 exynos5 dtsi
Date: Thu, 20 Jun 2013 18:43:49 +0530
Message-ID: <1371734034-21296-4-git-send-email-rahul.sharma@samsung.com>
References: <1371734034-21296-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:61524 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757686Ab3FTMxu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 08:53:50 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOO006UFZTN2TI0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Jun 2013 21:53:49 +0900 (KST)
In-reply-to: <1371734034-21296-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Hdmi Subsystem nodes shares many properties across exynos5 SoCs
(exynos5250 and exyno5420). Common code is moved to exynos5.dtsi
which is included in exyno5250 and exynos5420 SoC files.

It also renames the hdmi and mixer nodes as per dt naming
convention in the format name@phy_add.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/cros5250-common.dtsi    |    2 +-
 arch/arm/boot/dts/exynos5.dtsi            |   12 ++++++++++++
 arch/arm/boot/dts/exynos5250-arndale.dts  |    7 ++++++-
 arch/arm/boot/dts/exynos5250-smdk5250.dts |    7 ++++++-
 arch/arm/boot/dts/exynos5250-snow.dts     |    8 ++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |    8 ++------
 6 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
index 3f0239e..abda0b9 100644
--- a/arch/arm/boot/dts/cros5250-common.dtsi
+++ b/arch/arm/boot/dts/cros5250-common.dtsi
@@ -299,7 +299,7 @@
 		status = "disabled";
 	};
 
-	hdmi {
+	hdmi@14530000 {
 		hpd-gpio = <&gpx3 7 0>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 1ae179e..dcb4943 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -144,4 +144,16 @@
 		#size-cells = <0>;
 		status = "disabled";
 	};
+
+	hdmi@14530000 {
+		reg = <0x14530000 0x70000>;
+		interrupts = <0 95 0>;
+		status = "disabled";
+	};
+
+	mixer@14450000 {
+		reg = <0x14450000 0x10000>;
+		interrupts = <0 94 0>;
+		status = "disabled";
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 5c7dd6d..c18c346 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -423,13 +423,18 @@
 		};
 	};
 
-	hdmi {
+	hdmi@14530000 {
+		status = "okay";
 		hpd-gpio = <&gpx3 7 2>;
 		vdd_osc-supply = <&ldo10_reg>;
 		vdd_pll-supply = <&ldo8_reg>;
 		vdd-supply = <&ldo8_reg>;
 	};
 
+	mixer@14450000 {
+		status = "okay";
+	};
+
 	mmc_reg: voltage-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_33ON_2.8V";
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index d3da369..c1b8b7f 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -221,10 +221,15 @@
 		status = "disabled";
 	};
 
-	hdmi {
+	hdmi@14530000 {
+		status = "okay";
 		hpd-gpio = <&gpx3 7 0>;
 	};
 
+	mixer@14450000 {
+		status = "okay";
+	};
+
 	codec@11000000 {
 		samsung,mfc-r = <0x43000000 0x800000>;
 		samsung,mfc-l = <0x51000000 0x800000>;
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index e79331d..b1378af 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -196,4 +196,12 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	hdmi@14530000 {
+		status = "okay";
+	};
+
+	mixer@14450000 {
+		status = "okay";
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index baf6f88..0fdbe55 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -578,20 +578,16 @@
 		clock-names = "gscl";
 	};
 
-	hdmi {
+	hdmi@14530000 {
 		compatible = "samsung,exynos5-hdmi";
-		reg = <0x14530000 0x70000>;
-		interrupts = <0 95 0>;
 		clocks = <&clock 333>, <&clock 136>, <&clock 137>,
 				<&clock 333>, <&clock 333>;
 		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
 				"sclk_hdmiphy", "hdmiphy";
 	};
 
-	mixer {
+	mixer@14450000 {
 		compatible = "samsung,exynos5-mixer";
-		reg = <0x14450000 0x10000>;
-		interrupts = <0 94 0>;
 	};
 
 	dp-controller {
-- 
1.7.10.4
