From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 6/6] ARM: dts: Add nodes for spi controllers for Samsung
 Exynos5 platforms
Date: Sun, 03 Jun 2012 18:12:49 +0530
Message-ID: <1338727369-18241-7-git-send-email-thomas.abraham@linaro.org>
References: <1338727369-18241-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:30668 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752614Ab2FCM1z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Jun 2012 08:27:55 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M51008O7JYB3OB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 03 Jun 2012 21:27:54 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5100119JY60A40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 03 Jun 2012 21:27:54 +0900 (KST)
In-reply-to: <1338727369-18241-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, jaswinder.singh@linaro.org

Add device nodes for the three instances of spi controllers in Exynos5
platforms and enable instance spi 1 for smdk5250 board.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   38 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |   36 +++++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 49945cc..8a5e348 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -71,4 +71,42 @@
 	i2c@12CD0000 {
 		status = "disabled";
 	};
+
+	spi_0: spi@12d20000 {
+		status = "disabled";
+	};
+
+	spi_1: spi@12d30000 {
+		gpios = <&gpa2 4 2 3 0>,
+			<&gpa2 6 2 3 0>,
+			<&gpa2 7 2 3 0>;
+
+		w25q80bw@0 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "w25x80";
+			reg = <0>;
+			spi-max-frequency = <1000000>;
+
+			controller-data {
+				cs-gpio = <&gpa2 5 1 0 3>;
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
+	spi_2: spi@12d40000 {
+		status = "disabled";
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 4272b29..a3a2eb2 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -23,6 +23,12 @@
 	compatible = "samsung,exynos5250";
 	interrupt-parent = <&gic>;
 
+	aliases {
+		spi0 = &spi_0;
+		spi1 = &spi_1;
+		spi2 = &spi_2;
+	};
+
 	gic:interrupt-controller@10481000 {
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
@@ -146,6 +152,36 @@
 		#size-cells = <0>;
 	};
 
+	spi_0: spi@12d20000 {
+		compatible = "samsung,exynos4210-spi";
+		reg = <0x12d20000 0x100>;
+		interrupts = <0 66 0>;
+		tx-dma-channel = <&pdma0 5>;
+		rx-dma-channel = <&pdma0 4>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	spi_1: spi@12d30000 {
+		compatible = "samsung,exynos4210-spi";
+		reg = <0x12d30000 0x100>;
+		interrupts = <0 67 0>;
+		tx-dma-channel = <&pdma1 5>;
+		rx-dma-channel = <&pdma1 4>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	spi_2: spi@12d40000 {
+		compatible = "samsung,exynos4210-spi";
+		reg = <0x12d40000 0x100>;
+		interrupts = <0 68 0>;
+		tx-dma-channel = <&pdma0 7>;
+		rx-dma-channel = <&pdma0 6>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.6.6.rc2
