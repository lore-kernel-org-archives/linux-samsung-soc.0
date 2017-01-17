From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 1/2] arm64: dts: exynos: Add USB 3.0 controller node for
 Exynos7
Date: Tue, 17 Jan 2017 20:34:03 +0530
Message-ID: <1484665444-23365-2-git-send-email-pankaj.dubey@samsung.com>
References: <1484665444-23365-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170117150121epcas1p102bd1355f780a56e14a0a7a81bd6dfaf@epcas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45552 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751032AbdAQPBf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Jan 2017 10:01:35 -0500
In-reply-to: <1484665444-23365-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: krzk@kernel.org, kgene@kernel.org, robh+dt@kernel.org, sanath@samsung.com, javier@osg.samsung.com, Vivek Gautam <gautamvivek1987@gmail.com>, Pankaj Dubey <pankaj.dubey@samsung.com>

From: Vivek Gautam <gautamvivek1987@gmail.com>

Add USB 3.0 DRD controller device node, with its clock
and phy information to enable the same on Exynos7.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
Signed-off-by: Vivek Gautam <gautamvivek1987@gmail.com>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 9080a11..a2d8d11 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -603,6 +603,40 @@
 				#include "exynos7-trip-points.dtsi"
 			};
 		};
+
+		usbdrd_phy: phy@15500000 {
+			compatible = "samsung,exynos7-usbdrd-phy";
+			reg = <0x15500000 0x100>;
+			clocks = <&clock_fsys0 ACLK_USBDRD300>,
+			       <&clock_fsys0 OSCCLK_PHY_CLKOUT_USB30_PHY>,
+			       <&clock_fsys0 PHYCLK_USBDRD300_UDRD30_PIPE_PCLK_USER>,
+			       <&clock_fsys0 PHYCLK_USBDRD300_UDRD30_PHYCLK_USER>,
+			       <&clock_fsys0 SCLK_USBDRD300_REFCLK>;
+			clock-names = "phy", "ref", "phy_pipe",
+				"phy_utmi", "itp";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <1>;
+		};
+
+		usbdrd3: usb@15400000 {
+			compatible = "samsung,exynos7-dwusb3";
+			clocks = <&clock_fsys0 ACLK_USBDRD300>,
+			       <&clock_fsys0 SCLK_USBDRD300_SUSPENDCLK>,
+			       <&clock_fsys0 ACLK_AXIUS_USBDRD30X_FSYS0X>;
+			clock-names = "usbdrd30", "usbdrd30_susp_clk",
+				"usbdrd30_axius_clk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			dwc3 {
+				compatible = "snps,dwc3";
+				reg = <0x15400000 0x10000>;
+				interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd_phy 0>, <&usbdrd_phy 1>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+		};
 	};
 };
 
-- 
2.7.4
