From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v2 3/4] dt: exynos5420: Enable support for USB 3.0 PHY
 controller
Date: Wed, 04 Dec 2013 15:39:06 +0530
Message-ID: <1386151747-3209-4-git-send-email-gautam.vivek@samsung.com>
References: <1386151747-3209-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1386151747-3209-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, balbi@ti.com, rob.herring@calxeda.com, kgene.kim@samsung.com, kishon@ti.com, jg1.han@samsung.com, s.nawrocki@samsung.com, t.figa@samsung.com, jwerner@chromium.org, k.debski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Add device tree nodes for USB 3.0 PHY present alongwith
USB 3.0 controller Exynos 5420 SoC. This phy driver is
based on generic phy framework.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 09aa06c..a88ab00 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -31,6 +31,8 @@
 		i2c1 = &i2c_1;
 		i2c2 = &i2c_2;
 		i2c3 = &i2c_3;
+		usb3phy0 = &usb3_phy0;
+		usb3phy1 = &usb3_phy1;
 	};
 
 	cpus {
@@ -310,4 +312,22 @@
 		clocks = <&clock 431>, <&clock 143>;
 		clock-names = "mixer", "sclk_hdmi";
 	};
+
+	usbphy@12100000 {
+		compatible = "samsung,exynos5420-usb3phy";
+		reg = <0x12100000 0x100>;
+		clocks = <&clock 366>, <&clock 1>, <&clock 152>;
+		clock-names = "phy", "usb3phy_refclk", "usb30_sclk_100m";
+		samsung,syscon-phandle = <&pmu_syscon>;
+		#phy-cells = <0>;
+	};
+
+	usbphy@12500000 {
+		compatible = "samsung,exynos5420-usb3phy";
+		reg = <0x12500000 0x100>;
+		clocks = <&clock 367>, <&clock 1>, <&clock 153>;
+		clock-names = "phy", "usb3phy_refclk", "usb30_sclk_100m";
+		samsung,syscon-phandle = <&pmu_syscon>;
+		#phy-cells = <0>;
+	};
 };
-- 
1.7.6.5
