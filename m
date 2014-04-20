From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 7/7] ARM: dts: enable hdmi for exynos5420 based peach-pit board
Date: Sun, 20 Apr 2014 16:54:04 +0530
Message-ID: <1397993044-14564-8-git-send-email-rahul.sharma@samsung.com>
References: <1397993044-14564-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28378 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755201AbaDTLZj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Apr 2014 07:25:39 -0400
In-reply-to: <1397993044-14564-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Enable hdmi for exynos5420 based peach-pit board.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts |   26 ++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi          |    5 +++++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 4d61a5e..5b70522 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -54,6 +54,13 @@
 			samsung,pin-pud = <0>;
 			samsung,pin-drv = <0>;
 		};
+
+		hdmi_hpd_irq: hdmi-hpd-irq {
+		        samsung,pins = "gpx3-7";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <1>;
+			samsung,pin-drv = <0>;
+		};
 	};
 
 	pinctrl@14010000 {
@@ -222,4 +229,23 @@
 	watchdog@101D0000 {
 		timeout-sec = <32>;
 	};
+
+	i2c@12C80000 {
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <66000>;
+		samsung,i2c-slave-addr = <0x50>;
+		status = "okay";
+
+		hdmiddc@50 {
+			reg = <0x50>;
+		};
+	};
+
+	hdmi@14530000 {
+		hpd-gpio = <&gpx3 7 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_hpd_irq>;
+		ddc = <&i2c_2>;
+		status = "okay";
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 663fca9..f474e96 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -642,10 +642,15 @@
 		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
 			"sclk_hdmiphy", "mout_hdmi";
 		status = "disabled";
+		phy = <&hdmiphy>;
 		phys = <&simple_phys 0>;
 		phy-names = "hdmiphy";
 	};
 
+	hdmiphy: hdmiphy@145D0000 {
+		reg = <0x145D0000 0x20>;
+	};
+
 	mixer@14450000 {
 		compatible = "samsung,exynos5420-mixer";
 		reg = <0x14450000 0x10000>;
-- 
1.7.9.5
