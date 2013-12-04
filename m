From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v2 2/4] dt: exynos5250: Enable support for generic USB 3.0 phy
Date: Wed, 04 Dec 2013 15:39:05 +0530
Message-ID: <1386151747-3209-3-git-send-email-gautam.vivek@samsung.com>
References: <1386151747-3209-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1386151747-3209-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, balbi@ti.com, rob.herring@calxeda.com, kgene.kim@samsung.com, kishon@ti.com, jg1.han@samsung.com, s.nawrocki@samsung.com, t.figa@samsung.com, jwerner@chromium.org, k.debski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Update device tree bindings for DWC3 controller and
USB 3.0 phy present on Exynos 5250 SoC, to start using
the phy driver based on generic phy framework.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |   16 ++++++----------
 1 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 9db5047..7444717 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -475,22 +475,18 @@
 			compatible = "synopsys,dwc3";
 			reg = <0x12000000 0x10000>;
 			interrupts = <0 72 0>;
-			usb-phy = <&usb2_phy &usb3_phy>;
+			phys = <&usb3_phy>;
+			phy-names = "usb3-phy";
 		};
 	};
 
 	usb3_phy: usbphy@12100000 {
 		compatible = "samsung,exynos5250-usb3phy";
 		reg = <0x12100000 0x100>;
-		clocks = <&clock 1>, <&clock 286>;
-		clock-names = "ext_xtal", "usbdrd30";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		usbphy-sys {
-			reg = <0x10040704 0x8>;
-		};
+		clocks = <&clock 286>, <&clock 1>;
+		clock-names = "phy", "usb3phy_refclk";
+		samsung,syscon-phandle = <&pmu_syscon>;
+		#phy-cells = <0>;
 	};
 
 	usb@12110000 {
-- 
1.7.6.5
