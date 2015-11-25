From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos4: unify g2d device node with other devices
Date: Wed, 25 Nov 2015 13:59:58 +0100
Message-ID: <1448456398-32027-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:60830 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752907AbbKYNAJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Nov 2015 08:00:09 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYD00I0XG464YC0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Nov 2015 13:00:06 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

G2D device is always available and doesn't depend on any external (board
specific) peripherals, so it can be unconditionally enabled.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4210-origen.dts         | 4 ----
 arch/arm/boot/dts/exynos4210-smdkv310.dts       | 4 ----
 arch/arm/boot/dts/exynos4210.dtsi               | 1 -
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 4 ----
 arch/arm/boot/dts/exynos4412-origen.dts         | 4 ----
 arch/arm/boot/dts/exynos4412-smdk4412.dts       | 4 ----
 arch/arm/boot/dts/exynos4x12.dtsi               | 1 -
 7 files changed, 22 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index b8f8669..5821ad8 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -138,10 +138,6 @@
 	status = "okay";
 };
 
-&g2d {
-	status = "okay";
-};
-
 &i2c_0 {
 	status = "okay";
 	samsung,i2c-sda-delay = <100>;
diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index bc1448b..104cbb3 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -44,10 +44,6 @@
 	};
 };
 
-&g2d {
-	status = "okay";
-};
-
 &i2c_0 {
 	#address-cells = <1>;
 	#size-cells = <0>;
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index d254200..c1cb8df 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -187,7 +187,6 @@
 		clock-names = "sclk_fimg2d", "fimg2d";
 		power-domains = <&pd_lcd0>;
 		iommus = <&sysmmu_g2d>;
-		status = "disabled";
 	};
 
 	camera {
diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index edf0fc8..395c3ca 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -177,10 +177,6 @@
 	assigned-clock-rates = <0>, <176000000>;
 };
 
-&g2d {
-	status = "okay";
-};
-
 &hdmi {
 	hpd-gpio = <&gpx3 7 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index c8d86af..9e2e24c 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -89,10 +89,6 @@
 	status = "okay";
 };
 
-&g2d {
-	status = "okay";
-};
-
 &i2c_0 {
 	#address-cells = <1>;
 	#size-cells = <0>;
diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
index c2421df..a130ab3 100644
--- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -41,10 +41,6 @@
 	};
 };
 
-&g2d {
-	status = "okay";
-};
-
 &keypad {
 	samsung,keypad-num-rows = <3>;
 	samsung,keypad-num-columns = <8>;
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 148b47a..84a23f9 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -116,7 +116,6 @@
 		clocks = <&clock CLK_SCLK_FIMG2D>, <&clock CLK_G2D>;
 		clock-names = "sclk_fimg2d", "fimg2d";
 		iommus = <&sysmmu_g2d>;
-		status = "disabled";
 	};
 
 	camera {
-- 
1.9.2
