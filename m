From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v3 3/9] ARM: dts: exynos5250: move common i2c properties to
 exynos5 dtsi
Date: Thu, 25 Jul 2013 13:04:31 +0530
Message-ID: <1374737677-3215-4-git-send-email-rahul.sharma@samsung.com>
References: <1374737677-3215-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43559 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752573Ab3GYHMA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Jul 2013 03:12:00 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQH00HOKDAQIAI0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 25 Jul 2013 16:11:59 +0900 (KST)
In-reply-to: <1374737677-3215-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

I2C nodes shares many properties across exynos5 SoCs (exynos5250
and exyno5420). Common code is moved to exynos5.dtsi which is
included in exyno5250 and exynos5420 SoC files.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5.dtsi            |   36 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5250-arndale.dts  |    1 +
 arch/arm/boot/dts/exynos5250-smdk5250.dts |    3 +++
 arch/arm/boot/dts/exynos5250.dtsi         |   20 ----------------
 4 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index f65e124..1ae179e 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -108,4 +108,40 @@
 		interrupts = <0 42 0>;
 		status = "disabled";
 	};
+
+	i2c_0: i2c@12C60000 {
+		compatible = "samsung,s3c2440-i2c";
+		reg = <0x12C60000 0x100>;
+		interrupts = <0 56 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c_1: i2c@12C70000 {
+		compatible = "samsung,s3c2440-i2c";
+		reg = <0x12C70000 0x100>;
+		interrupts = <0 57 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c_2: i2c@12C80000 {
+		compatible = "samsung,s3c2440-i2c";
+		reg = <0x12C80000 0x100>;
+		interrupts = <0 58 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c_3: i2c@12C90000 {
+		compatible = "samsung,s3c2440-i2c";
+		reg = <0x12C90000 0x100>;
+		interrupts = <0 59 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 96d528d..83ab780 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -31,6 +31,7 @@
 	};
 
 	i2c@12C60000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <20000>;
 		samsung,i2c-slave-addr = <0x66>;
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 49f18c2..945e6cc 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -28,6 +28,7 @@
 	};
 
 	i2c@12C60000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <20000>;
 
@@ -62,6 +63,7 @@
 	};
 
 	i2c@12C70000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <20000>;
 
@@ -101,6 +103,7 @@
 	};
 
 	i2c@12C80000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <66000>;
 
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 93d6cc5..de54b38 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -217,11 +217,6 @@
 	};
 
 	i2c_0: i2c@12C60000 {
-		compatible = "samsung,s3c2440-i2c";
-		reg = <0x12C60000 0x100>;
-		interrupts = <0 56 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		clocks = <&clock 294>;
 		clock-names = "i2c";
 		pinctrl-names = "default";
@@ -229,11 +224,6 @@
 	};
 
 	i2c_1: i2c@12C70000 {
-		compatible = "samsung,s3c2440-i2c";
-		reg = <0x12C70000 0x100>;
-		interrupts = <0 57 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		clocks = <&clock 295>;
 		clock-names = "i2c";
 		pinctrl-names = "default";
@@ -241,11 +231,6 @@
 	};
 
 	i2c_2: i2c@12C80000 {
-		compatible = "samsung,s3c2440-i2c";
-		reg = <0x12C80000 0x100>;
-		interrupts = <0 58 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		clocks = <&clock 296>;
 		clock-names = "i2c";
 		pinctrl-names = "default";
@@ -253,11 +238,6 @@
 	};
 
 	i2c_3: i2c@12C90000 {
-		compatible = "samsung,s3c2440-i2c";
-		reg = <0x12C90000 0x100>;
-		interrupts = <0 59 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		clocks = <&clock 297>;
 		clock-names = "i2c";
 		pinctrl-names = "default";
-- 
1.7.10.4
