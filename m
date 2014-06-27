From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH] ARM: dts: Remove outdated usb2 phy entry from exynos5250.dtsi
Date: Fri, 27 Jun 2014 17:04:35 +0200
Message-ID: <1403881475-2001-1-git-send-email-sjoerd.simons@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cube.luon.net ([37.72.100.20]:55262 "EHLO cube.luon.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753892AbaF0PMt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 11:12:49 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Sjoerd Simons <sjoerd.simons@collabora.co.uk>

The exynos5250.dtsi has two entries for describing the usb2 phy. One for
the newer driver using the generic PHY framework and one for its
predecessor. The older node is only referenced by the arndale dts, which
seems redundant given starting from dba2f05880c the common dtsi also
includes the phy entries.

Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |  4 ----
 arch/arm/boot/dts/exynos5250.dtsi        | 15 ---------------
 2 files changed, 19 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index d0de1f5..dad8f9b 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -570,8 +570,4 @@
 			connect-gpios = <&gpd1 7 1>;
 		};
 	};
-
-	usb@12110000 {
-		usb-phy = <&usb2_phy>;
-	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 834fb5a..7c545d50 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -600,21 +600,6 @@
 		};
 	};
 
-	usb2_phy: usbphy@12130000 {
-		compatible = "samsung,exynos5250-usb2phy";
-		reg = <0x12130000 0x100>;
-		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_USB2>;
-		clock-names = "ext_xtal", "usbhost";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		usbphy-sys {
-			reg = <0x10040704 0x8>,
-			      <0x10050230 0x4>;
-		};
-	};
-
 	usb2_phy_gen: phy@12130000 {
 		compatible = "samsung,exynos5250-usb2-phy";
 		reg = <0x12130000 0x100>;
-- 
2.0.0
