From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH v6 4/5] ARM: dts: exynos5420: add CCI node
Date: Tue, 13 May 2014 17:28:43 +0530
Message-ID: <1399982324-27879-5-git-send-email-a.kesavan@samsung.com>
References: <1399982324-27879-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:8736 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760251AbaEML7w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 May 2014 07:59:52 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5I003OOHBRYHC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 May 2014 20:59:51 +0900 (KST)
In-reply-to: <1399982324-27879-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, abrestic@chromium.org, thomas.ab@samsung.com, inderpal.s@samsung.com, lorenzo.pieralisi@arm.com, nicolas.pitre@linaro.org, Dave.Martin@arm.com, t.figa@samsung.com
Cc: kesavan.abhilash@gmail.com, Abhilash Kesavan <a.kesavan@samsung.com>

From: Andrew Bresticker <abrestic@chromium.org>

Add device-tree bindings for the ARM CCI-400 on Exynos5420.  There
are two slave interfaces: one for the A15 cluster and one for the
A7 cluster.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 0cd65a7..e170c3c 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -58,6 +58,7 @@
 			compatible = "arm,cortex-a15";
 			reg = <0x0>;
 			clock-frequency = <1800000000>;
+			cci-control-port = <&cci_control1>;
 		};
 
 		cpu1: cpu@1 {
@@ -65,6 +66,7 @@
 			compatible = "arm,cortex-a15";
 			reg = <0x1>;
 			clock-frequency = <1800000000>;
+			cci-control-port = <&cci_control1>;
 		};
 
 		cpu2: cpu@2 {
@@ -72,6 +74,7 @@
 			compatible = "arm,cortex-a15";
 			reg = <0x2>;
 			clock-frequency = <1800000000>;
+			cci-control-port = <&cci_control1>;
 		};
 
 		cpu3: cpu@3 {
@@ -79,6 +82,7 @@
 			compatible = "arm,cortex-a15";
 			reg = <0x3>;
 			clock-frequency = <1800000000>;
+			cci-control-port = <&cci_control1>;
 		};
 
 		cpu4: cpu@100 {
@@ -86,6 +90,7 @@
 			compatible = "arm,cortex-a7";
 			reg = <0x100>;
 			clock-frequency = <1000000000>;
+			cci-control-port = <&cci_control0>;
 		};
 
 		cpu5: cpu@101 {
@@ -93,6 +98,7 @@
 			compatible = "arm,cortex-a7";
 			reg = <0x101>;
 			clock-frequency = <1000000000>;
+			cci-control-port = <&cci_control0>;
 		};
 
 		cpu6: cpu@102 {
@@ -100,6 +106,7 @@
 			compatible = "arm,cortex-a7";
 			reg = <0x102>;
 			clock-frequency = <1000000000>;
+			cci-control-port = <&cci_control0>;
 		};
 
 		cpu7: cpu@103 {
@@ -107,6 +114,26 @@
 			compatible = "arm,cortex-a7";
 			reg = <0x103>;
 			clock-frequency = <1000000000>;
+			cci-control-port = <&cci_control0>;
+		};
+	};
+
+	cci@10d20000 {
+		compatible = "arm,cci-400";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x10d20000 0x1000>;
+		ranges = <0x0 0x10d20000 0x6000>;
+
+		cci_control0: slave-if@4000 {
+			compatible = "arm,cci-400-ctrl-if";
+			interface-type = "ace";
+			reg = <0x4000 0x1000>;
+		};
+		cci_control1: slave-if@5000 {
+			compatible = "arm,cci-400-ctrl-if";
+			interface-type = "ace";
+			reg = <0x5000 0x1000>;
 		};
 	};
 
-- 
1.7.9.5
