From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH] ARM: dts: Exynos5420: Add dt support for gscaler
Date: Wed, 16 Oct 2013 16:26:26 +0530
Message-ID: <1381920987-11095-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49024 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760602Ab3JPKft (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Oct 2013 06:35:49 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree@vger.kernel.org, khw0178.kim@samsung.com, cpgs@samsung.com

Adds G-Scaler devices to the DT device list

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 09aa06c..c4210dc 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -31,6 +31,8 @@
 		i2c1 = &i2c_1;
 		i2c2 = &i2c_2;
 		i2c3 = &i2c_3;
+		gsc0 = &gsc_0;
+		gsc1 = &gsc_1;
 	};
 
 	cpus {
@@ -310,4 +312,22 @@
 		clocks = <&clock 431>, <&clock 143>;
 		clock-names = "mixer", "sclk_hdmi";
 	};
+
+	gsc_0:  g-scaler@13e00000 {
+		compatible = "samsung,exynos5-gsc";
+		reg = <0x13e00000 0x1000>;
+		interrupts = <0 85 0>;
+		clocks = <&clock 465>;
+		clock-names = "gscl";
+		samsung,power-domain = <&gsc_pd>;
+	};
+
+	gsc_1:  g-scaler@13e10000 {
+		compatible = "samsung,exynos5-gsc";
+		reg = <0x13e10000 0x1000>;
+		interrupts = <0 86 0>;
+		clocks = <&clock 466>;
+		clock-names = "gscl";
+		samsung,power-domain = <&gsc_pd>;
+	};
 };
-- 
1.7.9.5
