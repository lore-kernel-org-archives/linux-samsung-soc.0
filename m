From: juergen@kreuzholzen.de
Subject: (unknown)
Date: Sun, 16 Nov 2014 18:29:36 +0100
Message-ID: <E1Xq3do-0006lG-S3@sslproxy02.your-server.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from www291.your-server.de ([78.46.156.197]:51642 "EHLO
	www291.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755386AbaKPR3l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Nov 2014 12:29:41 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

>From 21541bcd5d7c2c6062548c462ada36f4c47436ea Mon Sep 17 00:00:00 2001
Message-Id: <21541bcd5d7c2c6062548c462ada36f4c47436ea.1416158605.git.juergen@kreuzholzen.de>
In-Reply-To: <cover.1416158605.git.juergen@kreuzholzen.de>
References: <cover.1416158605.git.juergen@kreuzholzen.de>
From: Juergen Borleis <juergen@kreuzholzen.de>
Date: Sun, 9 Nov 2014 19:58:25 +0100
Subject: [PATCH 6/8] ARM/DTS/S3C64XX: add an OTG phy driver for the S3C6410
 SoC
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org

The S3C6410 SoC has an OTG phy which also provides the 48 MHz clock for
the OTG device and the OHCI device.

Signed-off-by: Juergen Borleis <juergen@kreuzholzen.de>
---
 Documentation/devicetree/bindings/phy/samsung-phy.txt |  2 ++
 arch/arm/boot/dts/s3c6410.dtsi                        |  4 ++++
 arch/arm/boot/dts/s3c64xx.dtsi                        | 10 ++++++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
index 15e0f2c..5fa7e50 100644
--- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
+++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
@@ -34,6 +34,7 @@ Required properties:
 	- "samsung,exynos4x12-usb2-phy"
 	- "samsung,exynos5250-usb2-phy"
 	- "samsung,s5pv210-usb2-phy"
+	- "samsung,s3c6410-usb2-phy"
 - reg : a list of registers used by phy driver
 	- first and obligatory is the location of phy modules registers
 - samsung,sysreg-phandle - handle to syscon used to control the system registers
@@ -52,6 +53,7 @@ and Exynos 4212) it is as follows:
   2 - HSIC0 ("hsic0"),
   3 - HSIC1 ("hsic1"),
 Exynos3250 has only USB device phy available as phy 0.
+S3C6410 has only USB device phy 0 and 1 available
 
 Exynos 4210 and Exynos 4212 use mode switching and require that mode switch
 register is supplied.
diff --git a/arch/arm/boot/dts/s3c6410.dtsi b/arch/arm/boot/dts/s3c6410.dtsi
index 3c35c94..fcdcad8 100644
--- a/arch/arm/boot/dts/s3c6410.dtsi
+++ b/arch/arm/boot/dts/s3c6410.dtsi
@@ -36,6 +36,10 @@
 	valid-wakeup-mask = <0x53020000>;
 };
 
+&usbphy {
+	compatible = "samsung,s3c6410-usb2-phy";
+};
+
 &rtc {
 	compatible = "samsung,s3c6410-rtc";
 };
diff --git a/arch/arm/boot/dts/s3c64xx.dtsi b/arch/arm/boot/dts/s3c64xx.dtsi
index 48de957..4ee518c 100644
--- a/arch/arm/boot/dts/s3c64xx.dtsi
+++ b/arch/arm/boot/dts/s3c64xx.dtsi
@@ -60,6 +60,16 @@
 			#interrupt-cells = <1>;
 		};
 
+		usbphy: otgphy@ec100000 {
+			compatible = "samsung,s3c6400-usb2-phy";
+			reg = <0x7c100000 0x100000>;
+			samsung,pmureg-phandle = <&pmu_syscon>;
+			clocks = <&clocks HCLK_USB>, <&xusbxti>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
 		sdhci0: sdhci@7c200000 {
 			compatible = "samsung,s3c6410-sdhci";
 			reg = <0x7c200000 0x100>;
-- 
1.8.1
