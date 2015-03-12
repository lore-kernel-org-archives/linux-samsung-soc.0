From: Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH] ARM: dts: remove usb2-phy on Exynos5 series SoC
Date: Thu, 12 Mar 2015 19:10:07 +0900
Message-ID: <1426155007-22189-1-git-send-email-jaewon02.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31483 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752539AbbCLKKV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Mar 2015 06:10:21 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Vivek Gautam <gautam.vivek@samsung.com>, Felipe Balbi <balbi@ti.com>
Cc: Inki Dae <inki.dae@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Jaewon Kim <jaewon02.kim@samsung.com>

Exynos5 series SoC does not have usb2-phy on USB3.0 Controller.
It is controlled by only usb3-phy. So, this patch remove usb2-phy
property.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    4 ++--
 arch/arm/boot/dts/exynos5420.dtsi |    8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 9bb1b0b..b58b169 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -565,8 +565,8 @@
 			compatible = "synopsys,dwc3";
 			reg = <0x12000000 0x10000>;
 			interrupts = <0 72 0>;
-			phys = <&usbdrd_phy 0>, <&usbdrd_phy 1>;
-			phy-names = "usb2-phy", "usb3-phy";
+			phys = <&usbdrd_phy 0>;
+			phy-names = "usb3-phy";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 9dc2e97..0df14bb 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -845,8 +845,8 @@
 			compatible = "snps,dwc3";
 			reg = <0x12000000 0x10000>;
 			interrupts = <0 72 0>;
-			phys = <&usbdrd_phy0 0>, <&usbdrd_phy0 1>;
-			phy-names = "usb2-phy", "usb3-phy";
+			phys = <&usbdrd_phy0 0>;
+			phy-names = "usb3-phy";
 		};
 	};
 
@@ -871,8 +871,8 @@
 			compatible = "snps,dwc3";
 			reg = <0x12400000 0x10000>;
 			interrupts = <0 73 0>;
-			phys = <&usbdrd_phy1 0>, <&usbdrd_phy1 1>;
-			phy-names = "usb2-phy", "usb3-phy";
+			phys = <&usbdrd_phy1 1>;
+			phy-names = "usb3-phy";
 		};
 	};
 
-- 
1.7.9.5
