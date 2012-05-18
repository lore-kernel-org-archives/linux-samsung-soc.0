From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 5/6] ARM: dts: Add nodes for spi controllers for Samsung
 Exynos4 platforms
Date: Fri, 18 May 2012 15:16:31 +0530
Message-ID: <1337334392-6441-6-git-send-email-thomas.abraham@linaro.org>
References: <1337334392-6441-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14058 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S967899Ab2ERJcz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 May 2012 05:32:55 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M47002F3P67QHP0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 May 2012 18:32:55 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4700FF3P67SH60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 May 2012 18:32:54 +0900 (KST)
In-reply-to: <1337334392-6441-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, jaswinder.singh@linaro.org

Add device nodes for the three instances of spi controllers in Exynos4
platforms. Enable instance spi 2 for smdkv310 board and disable all
spi instances for origen board.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts   |   12 ++++++++
 arch/arm/boot/dts/exynos4210-smdkv310.dts |   44 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4210.dtsi         |   30 +++++++++++++++++++
 3 files changed, 86 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index b8c4763..f27d367 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -134,4 +134,16 @@
 	i2c@138D0000 {
 		status = "disabled";
 	};
+
+	spi_0: spi@13920000 {
+		status = "disabled";
+	};
+
+	spi_1: spi@13930000 {
+		status = "disabled";
+	};
+
+	spi_2: spi@13940000 {
+		status = "disabled";
+	};
 };
diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index 27afc8e..411ac8e 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -21,6 +21,12 @@
 	model = "Samsung smdkv310 evaluation board based on Exynos4210";
 	compatible = "samsung,smdkv310", "samsung,exynos4210";
 
+	aliases {
+		spi0 = &spi_0;
+		spi1 = &spi_1;
+		spi2 = &spi_2;
+	};
+
 	memory {
 		reg = <0x40000000 0x80000000>;
 	};
@@ -42,6 +48,36 @@
 			<&gpk2 6 2 3 3>;
 	};
 
+	spi_2: spi@13940000 {
+		gpios = <&gpc1 1 5 3 0>,
+			<&gpc1 3 5 3 0>,
+			<&gpc1 4 5 3 0>;
+
+		w25x80@0 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "w25x80";
+			reg = <0>;
+			spi-max-frequency = <10000>;
+
+			controller-data {
+				cs-gpio = <&gpc1 2 1 0 3>;
+				samsung,spi-feedback-delay = <0>;
+			};
+
+			partition@0 {
+				label = "U-Boot";
+				reg = <0x0 0x40000>;
+				read-only;
+			};
+
+			partition@40000 {
+				label = "Kernel";
+				reg = <0x40000 0xc0000>;
+			};
+		};
+	};
+
 	keypad@100A0000 {
 		samsung,keypad-num-rows = <2>;
 		samsung,keypad-num-columns = <8>;
@@ -179,4 +215,12 @@
 	i2c@138D0000 {
 		status = "disabled";
 	};
+
+	spi_0: spi@13920000 {
+		status = "disabled";
+	};
+
+	spi_1: spi@13930000 {
+		status = "disabled";
+	};
 };
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index a1dd2ee..f107c5d 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -147,6 +147,36 @@
 		interrupts = <0 65 0>;
 	};
 
+	spi_0: spi@13920000 {
+		compatible = "samsung,exynos4210-spi";
+		reg = <0x13920000 0x100>;
+		interrupts = <0 66 0>;
+		tx-dma-channel = <&pdma0 7>;
+		rx-dma-channel = <&pdma0 6>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	spi_1: spi@13930000 {
+		compatible = "samsung,exynos4210-spi";
+		reg = <0x13930000 0x100>;
+		interrupts = <0 67 0>;
+		tx-dma-channel = <&pdma1 7>;
+		rx-dma-channel = <&pdma1 6>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	spi_2: spi@13940000 {
+		compatible = "samsung,exynos4210-spi";
+		reg = <0x13940000 0x100>;
+		interrupts = <0 68 0>;
+		tx-dma-channel = <&pdma0 9>;
+		rx-dma-channel = <&pdma0 8>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.6.6.rc2
