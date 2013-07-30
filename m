From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 6/7] ARM: dts: Add DP controller DT node to exynos5420 SoC
Date: Tue, 30 Jul 2013 16:49:37 +0530
Message-ID: <1375183178-8201-7-git-send-email-vikas.sajjan@linaro.org>
References: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:36510 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258Ab3G3LUY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Jul 2013 07:20:24 -0400
Received: by mail-pd0-f182.google.com with SMTP id r10so632825pdi.41
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2013 04:20:24 -0700 (PDT)
In-Reply-To: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree@vger.kernel.org, jg1.han@samsung.com, inki.dae@samsung.com, ajaynumb@gmail.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Adds DP controller DT node to exynos5420 SoC

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |   10 ++++++++++
 arch/arm/boot/dts/exynos5420.dtsi         |   13 +++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 0c0249c..80aa3d4 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -31,6 +31,16 @@
 		};
 	};
 
+	dp-controller@145b0000 {
+		samsung,color-space = <0>;
+		samsung,dynamic-range = <0>;
+		samsung,ycbcr-coeff = <0>;
+		samsung,color-depth = <1>;
+		samsung,link-rate = <0x0a>;
+		samsung,lane-count = <4>;
+		status = "okay";
+	};
+
 	fimd@14400000 {
 		status = "okay";
 		display-timings {
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 2f98c89..8255db2 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -181,6 +181,19 @@
 		clock-names = "uart", "clk_uart_baud0";
 	};
 
+	dp_phy: video-phy@10040728 {
+		compatible = "samsung,exynos5250-dp-video-phy";
+		reg = <0x10040728 4>;
+		#phy-cells = <0>;
+	};
+
+	dp-controller@145b0000 {
+		clocks = <&clock 412>;
+		clock-names = "dp";
+		phys = <&dp_phy>;
+		phy-names = "dp";
+	};
+
 	fimd@14400000 {
 		samsung,power-domain = <&disp_pd>;
 		clocks = <&clock 147>, <&clock 421>;
-- 
1.7.9.5
