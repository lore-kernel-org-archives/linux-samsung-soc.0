From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: dts: Add l2x0 device node for Exynos4-based boards
Date: Tue,  7 Jan 2014 14:23:46 +0530
Message-ID: <1389084826-19827-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:50631 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751383AbaAGI5n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 03:57:43 -0500
Received: by mail-pa0-f41.google.com with SMTP id lf10so112379pab.28
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jan 2014 00:57:42 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, arnd@arndb.de, tomasz.figa@gmail.com

For Exynos4 platform, L2 cache initialization is done only if
a device node for l2x0 device exists.

L2 cache initialization path is different when a board boots with
secure firmware. Since there are many Exynos4 based SoCs that boot
in secure mode, enabling this only for boards that don't boot with
secure firmware.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---

Tested on Exynos4210-Origen board.

 arch/arm/boot/dts/exynos4.dtsi                  |    8 ++++++++
 arch/arm/boot/dts/exynos4210-origen.dts         |    4 ++++
 arch/arm/boot/dts/exynos4210-smdkv310.dts       |    4 ++++
 arch/arm/boot/dts/exynos4210-trats.dts          |    4 ++++
 arch/arm/boot/dts/exynos4210-universal_c210.dts |    4 ++++
 arch/arm/boot/dts/exynos4412-odroidx.dts        |    4 ++++
 arch/arm/boot/dts/exynos4412-smdk4412.dts       |    4 ++++
 arch/arm/boot/dts/exynos4412-tiny4412.dts       |    4 ++++
 8 files changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 08452e1..e0ddbd2 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -49,6 +49,14 @@
 		reg = <0x10000000 0x100>;
 	};
 
+	l2-cache-controller@10502000 {
+		compatible = "arm,pl310-cache";
+		reg = <0x10502000 0x1000>;
+		cache-unified;
+		cache-level = <2>;
+		status = "disabled";
+	};
+
 	mipi_phy: video-phy@10020710 {
 		compatible = "samsung,s5pv210-mipi-video-phy";
 		reg = <0x10020710 8>;
diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 2aa13cb..eea1286 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -32,6 +32,10 @@
 		bootargs ="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc";
 	};
 
+	l2-cache-controller@10502000 {
+		status = "okay";
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index 9c01b71..5ce2869 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -29,6 +29,10 @@
 		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";
 	};
 
+	l2-cache-controller@10502000 {
+		status = "okay";
+	};
+
 	sdhci@12530000 {
 		bus-width = <4>;
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 63cc571..00dbc6c 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -30,6 +30,10 @@
 		bootargs = "console=ttySAC2,115200N8 root=/dev/mmcblk0p5 rootwait earlyprintk panic=5";
 	};
 
+	l2-cache-controller@10502000 {
+		status = "okay";
+	};
+
 	regulators {
 		compatible = "simple-bus";
 
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index d2e3f5f..e732afe 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -28,6 +28,10 @@
 		bootargs = "console=ttySAC2,115200N8 root=/dev/mmcblk0p5 rw rootwait earlyprintk panic=5 maxcpus=1";
 	};
 
+	l2-cache-controller@10502000 {
+		status = "okay";
+	};
+
 	mct@10050000 {
 		compatible = "none";
 	};
diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 8aad5f7..6fb9e84 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -22,6 +22,10 @@
 		reg = <0x40000000 0x40000000>;
 	};
 
+	l2-cache-controller@10502000 {
+		status = "okay";
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		led1 {
diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
index ad316a1..f72d425 100644
--- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -27,6 +27,10 @@
 		bootargs ="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";
 	};
 
+	l2-cache-controller@10502000 {
+		status = "okay";
+	};
+
 	g2d@10800000 {
 		status = "okay";
 	};
diff --git a/arch/arm/boot/dts/exynos4412-tiny4412.dts b/arch/arm/boot/dts/exynos4412-tiny4412.dts
index 0a98312..33a3cb89 100644
--- a/arch/arm/boot/dts/exynos4412-tiny4412.dts
+++ b/arch/arm/boot/dts/exynos4412-tiny4412.dts
@@ -22,6 +22,10 @@
 		reg = <0x40000000 0x40000000>;
 	};
 
+	l2-cache-controller@10502000 {
+		status = "okay";
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
-- 
1.7.9.5
