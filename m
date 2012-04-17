From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 11/12] ARM: Exynos5: Update device tree source files
Date: Tue, 17 Apr 2012 11:16:34 +0530
Message-ID: <1334641595-25301-12-git-send-email-thomas.abraham@linaro.org>
References: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44726 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752369Ab2DQFjB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Apr 2012 01:39:01 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M2L00JU7ZOTYAL0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Apr 2012 14:39:00 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M2L00E01ZNEZ8D2@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Apr 2012 14:39:00 +0900 (KST)
In-reply-to: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

Updated Exynos5 device tree source files to reflect changes in rev1 of
Exynos5 SoC. This includes new additions to the Exynos5 dtsi and SMDK5250 dts
files and few minor fixes.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   52 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |   44 +++++++-----------------
 2 files changed, 65 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 399d17b..bcc4b89 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -23,4 +23,56 @@
 	chosen {
 		bootargs = "root=/dev/ram0 rw ramdisk=8192 console=ttySAC1,115200";
 	};
+
+	i2c@12C60000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <20000>;
+		gpios = <&gpb3 0 2 3 0>,
+			<&gpb3 1 2 3 0>;
+
+		eeprom@50 {
+			compatible = "samsung,s524ad0xd1";
+			reg = <0x50>;
+		};
+	};
+
+	i2c@12C70000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <20000>;
+		gpios = <&gpb3 2 2 3 0>,
+			<&gpb3 3 2 3 0>;
+
+		eeprom@51 {
+			compatible = "samsung,s524ad0xd1";
+			reg = <0x51>;
+		};
+	};
+
+	i2c@12C80000 {
+		status = "disabled";
+	};
+
+	i2c@12C90000 {
+		status = "disabled";
+	};
+
+	i2c@12CA0000 {
+		status = "disabled";
+	};
+
+	i2c@12CB0000 {
+		status = "disabled";
+	};
+
+	i2c@12CC0000 {
+		status = "disabled";
+	};
+
+	i2c@12CD0000 {
+		status = "disabled";
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index dfc4335..76b7dba 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -23,11 +23,11 @@
 	compatible = "samsung,exynos5250";
 	interrupt-parent = <&gic>;
 
-	gic:interrupt-controller@10490000 {
+	gic:interrupt-controller@10481000 {
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
-		reg = <0x10490000 0x1000>, <0x10480000 0x100>;
+		reg = <0x10481000 0x1000>, <0x10482000 0x2000>;
 	};
 
 	watchdog {
@@ -42,30 +42,6 @@
 		interrupts = <0 43 0>, <0 44 0>;
 	};
 
-	sdhci@12200000 {
-		compatible = "samsung,exynos4210-sdhci";
-		reg = <0x12200000 0x100>;
-		interrupts = <0 75 0>;
-	};
-
-	sdhci@12210000 {
-		compatible = "samsung,exynos4210-sdhci";
-		reg = <0x12210000 0x100>;
-		interrupts = <0 76 0>;
-	};
-
-	sdhci@12220000 {
-		compatible = "samsung,exynos4210-sdhci";
-		reg = <0x12220000 0x100>;
-		interrupts = <0 77 0>;
-	};
-
-	sdhci@12230000 {
-		compatible = "samsung,exynos4210-sdhci";
-		reg = <0x12230000 0x100>;
-		interrupts = <0 78 0>;
-	};
-
 	serial@12C00000 {
 		compatible = "samsung,exynos4210-uart";
 		reg = <0x12C00000 0x100>;
@@ -157,13 +133,13 @@
 			interrupts = <0 35 0>;
 		};
 
-		mdma0: pdma@10800000 {
+		mdma0: mdma@10800000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x10800000 0x1000>;
 			interrupts = <0 33 0>;
 		};
 
-		mdma1: pdma@11C10000 {
+		mdma1: mdma@11C10000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x11C10000 0x1000>;
 			interrupts = <0 124 0>;
@@ -242,6 +218,12 @@
 			#gpio-cells = <4>;
 		};
 
+		gpc4: gpio-controller@114002E0 {
+			compatible = "samsung,exynos4-gpio";
+			reg = <0x114002E0 0x20>;
+			#gpio-cells = <4>;
+		};
+
 		gpd0: gpio-controller@11400160 {
 			compatible = "samsung,exynos4-gpio";
 			reg = <0x11400160 0x20>;
@@ -388,19 +370,19 @@
 
 		gpv2: gpio-controller@10D10040 {
 			compatible = "samsung,exynos4-gpio";
-			reg = <0x10D10040 0x20>;
+			reg = <0x10D10060 0x20>;
 			#gpio-cells = <4>;
 		};
 
 		gpv3: gpio-controller@10D10060 {
 			compatible = "samsung,exynos4-gpio";
-			reg = <0x10D10060 0x20>;
+			reg = <0x10D10080 0x20>;
 			#gpio-cells = <4>;
 		};
 
 		gpv4: gpio-controller@10D10080 {
 			compatible = "samsung,exynos4-gpio";
-			reg = <0x10D10080 0x20>;
+			reg = <0x10D100C0 0x20>;
 			#gpio-cells = <4>;
 		};
 
-- 
1.6.6.rc2
