From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 04/10] ARM: dts: Add MSHC2 dt node for Exynos3250 SoC
Date: Mon, 14 Mar 2016 11:04:09 +0900
Message-ID: <1457921056-21257-5-git-send-email-cw00.choi@samsung.com>
References: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58147 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932533AbcCNCE2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Mar 2016 22:04:28 -0400
In-reply-to: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: k.kozlowski@samsung.com, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

This patch adds the MSHC2 (Mobile Storage Host Controller) Device Tree node for
Exynos3250 SoC.

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi | 35 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos3250.dtsi         | 13 ++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-pinctrl.dtsi b/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
index 54c587f27265..40ea7de44933 100644
--- a/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
@@ -490,6 +490,41 @@
 		samsung,pin-drv = <3>;
 	};
 
+	sd2_clk: sd2-clk {
+		samsung,pins = "gpk2-0";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd2_cmd: sd2-cmd {
+		samsung,pins = "gpk2-1";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd2_cd: sd2-cd {
+		samsung,pins = "gpk2-2";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd2_bus1: sd2-bus-width1 {
+		samsung,pins = "gpk2-3";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd2_bus4: sd2-bus-width4 {
+		samsung,pins = "gpk2-4", "gpk2-5", "gpk2-6";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <3>;
+	};
+
 	cam_port_b_io: cam-port-b-io {
 		samsung,pins = "gpm0-0", "gpm0-1", "gpm0-2", "gpm0-3",
 				"gpm0-4", "gpm0-5", "gpm0-6", "gpm0-7",
diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 076677384d20..2fead5730879 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -30,6 +30,7 @@
 		pinctrl1 = &pinctrl_1;
 		mshc0 = &mshc_0;
 		mshc1 = &mshc_1;
+		mshc2 = &mshc_2;
 		spi0 = &spi_0;
 		spi1 = &spi_1;
 		i2c0 = &i2c_0;
@@ -371,6 +372,18 @@
 			status = "disabled";
 		};
 
+		mshc_2: mshc@12530000 {
+			compatible = "samsung,exynos5250-dw-mshc";
+			reg = <0x12530000 0x1000>;
+			interrupts = <0 144 0>;
+			clocks = <&cmu CLK_SDMMC2>, <&cmu CLK_SCLK_MMC2>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x80>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		exynos_usbphy: exynos-usbphy@125B0000 {
 			compatible = "samsung,exynos3250-usb2-phy";
 			reg = <0x125B0000 0x100>;
-- 
1.9.1
