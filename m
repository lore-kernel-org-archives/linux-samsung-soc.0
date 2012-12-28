From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 2/2] arm: exynos5: Add HS-I2C device tree platform information
Date: Fri, 28 Dec 2012 17:10:51 +0530
Message-ID: <1356694851-1345-2-git-send-email-ch.naveen@samsung.com>
References: <1356694851-1345-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35832 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752604Ab2L1LnW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Dec 2012 06:43:22 -0500
In-reply-to: <1356694851-1345-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: w.sang@pengutronix.de, linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, naveenkrishna.ch@gmail.com, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

This patch adds HS-I2C device tree platform information in
exynos5.dtsi and exynos5-smdk5250.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   16 +++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |   32 +++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 942d576..b7fba59 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -108,6 +108,22 @@
 		};
 	};
 
+	hsi2c@12C50000 {
+		status = "disabled";
+	};
+
+	hsi2c@12D00000 {
+		status = "disabled";
+	};
+
+	hsi2c@12D50000 {
+		status = "disabled";
+	};
+
+	hsi2c@12DE0000 {
+		status = "disabled";
+	};
+
 	dwmmc0@12200000 {
 		num-slots = <1>;
 		supports-highspeed;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 45799e8..a10c089 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -213,6 +213,38 @@
                 #size-cells = <0>;
 	};
 
+	hsi2c@12C50000 {
+		compatible = "samsung,exynos5-hsi2c";
+		reg = <0x12C50000 0x1000>;
+		interrupts = <0 56 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	hsi2c@12D00000 {
+		compatible = "samsung,exynos5-hsi2c";
+		reg = <0x12D00000 0x1000>;
+		interrupts = <0 57 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	hsi2c@12D50000 {
+		compatible = "samsung,exynos5-hsi2c";
+		reg = <0x12D50000 0x1000>;
+		interrupts = <0 58 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	hsi2c@12DE0000 {
+		compatible = "samsung,exynos5-hsi2c";
+		reg = <0x12DE0000 0x1000>;
+		interrupts = <0 59 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
 	spi_0: spi@12d20000 {
 		compatible = "samsung,exynos4210-spi";
 		reg = <0x12d20000 0x100>;
-- 
1.7.9.5
