From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 2/7] ARM: dts: Update FIMD DT node for Exynos5 SoCs
Date: Tue, 30 Jul 2013 16:49:33 +0530
Message-ID: <1375183178-8201-3-git-send-email-vikas.sajjan@linaro.org>
References: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:45567 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753111Ab3G3LUD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Jul 2013 07:20:03 -0400
Received: by mail-pb0-f54.google.com with SMTP id ro12so2675846pbb.41
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2013 04:20:03 -0700 (PDT)
In-Reply-To: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree@vger.kernel.org, jg1.han@samsung.com, inki.dae@samsung.com, ajaynumb@gmail.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Moves the properties of FIMD DT node which are common across Exynos5 based
SoCs like Exynos5250 and Exxynos5420 to exynos5.dtsi

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5.dtsi           |   10 ++++++++++
 arch/arm/boot/dts/exynos5250-arndale.dts |    1 +
 arch/arm/boot/dts/exynos5250.dtsi        |    7 +------
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index f65e124..d464b6c 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -108,4 +108,14 @@
 		interrupts = <0 42 0>;
 		status = "disabled";
 	};
+
+	fimd@14400000 {
+		compatible = "samsung,exynos5250-fimd";
+		interrupt-parent = <&combiner>;
+		reg = <0x14400000 0x40000>;
+		interrupt-names = "fifo", "vsync", "lcd_sys";
+		interrupts = <18 4>, <18 5>, <18 6>;
+		status = "disabled";
+	};
+
 };
diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 96d528d..76825ef 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -519,6 +519,7 @@
 	};
 
 	fimd: fimd@14400000 {
+		status = "okay";
 		display-timings {
 			native-mode = <&timing0>;
 			timing0: timing@0 {
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index ef57277..238bdb2 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -630,12 +630,7 @@
 		};
 	};
 
-	fimd {
-		compatible = "samsung,exynos5250-fimd";
-		interrupt-parent = <&combiner>;
-		reg = <0x14400000 0x40000>;
-		interrupt-names = "fifo", "vsync", "lcd_sys";
-		interrupts = <18 4>, <18 5>, <18 6>;
+	fimd@14400000 {
 		clocks = <&clock 133>, <&clock 339>;
 		clock-names = "sclk_fimd", "fimd";
 	};
-- 
1.7.9.5
