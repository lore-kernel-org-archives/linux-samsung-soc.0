From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 5/6] ARM: dts: Add nodes for spi controllers for Samsung
 Exynos4 platforms
Date: Sun, 03 Jun 2012 18:12:48 +0530
Message-ID: <1338727369-18241-6-git-send-email-thomas.abraham@linaro.org>
References: <1338727369-18241-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:30664 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752910Ab2FCM1y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Jun 2012 08:27:54 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M51008O7JYB3OB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 03 Jun 2012 21:27:53 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5100119JY60A40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 03 Jun 2012 21:27:53 +0900 (KST)
In-reply-to: <1338727369-18241-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, jaswinder.singh@linaro.org

Add device nodes for the three instances of spi controllers in Exynos4
platforms. Enable instance spi 2 for smdkv310 board and disable all
spi instances for origen board.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts   |   12 +++++++++
 arch/arm/boot/dts/exynos4210-smdkv310.dts |   38 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4210.dtsi         |   36 +++++++++++++++++++++++++++
 3 files changed, 86 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index b8c4763..0c49caa 100644
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
index 27afc8e..1beccc8 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -179,4 +179,42 @@
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
+		gpios = <&gpc1 1 5 3 0>,
+			<&gpc1 3 5 3 0>,
+			<&gpc1 4 5 3 0>;
+
+		w25x80@0 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "w25x80";
+			reg = <0>;
+			spi-max-frequency = <1000000>;
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
 };
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index a1dd2ee..61be174 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -25,6 +25,12 @@
 	compatible = "samsung,exynos4210";
 	interrupt-parent = <&gic>;
 
+	aliases {
+		spi0 = &spi_0;
+		spi1 = &spi_1;
+		spi2 = &spi_2;
+	};
+
 	gic:interrupt-controller@10490000 {
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
@@ -147,6 +153,36 @@
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
